import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../common_widgets/attachment_upload_widget.dart';
import '../../../common_widgets/drawer_shell.dart';
import '../../../core/config/app_config.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../auth/state/auth_state.dart';
import '../data/task_client.dart';
import '../data/task_models.dart';

class CreateTicketDrawer extends StatefulWidget {
  final VoidCallback? onCreated;
  final VoidCallback? onClose;

  const CreateTicketDrawer({super.key, this.onCreated, this.onClose});

  static Future<bool?> show(BuildContext context) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close drawer',
      barrierColor: Colors.black26,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: AppColors.transparent,
            child: CreateTicketDrawer(
              onCreated: () => Navigator.of(context).pop(true),
              onClose: () => Navigator.of(context).pop(),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ));
        return SlideTransition(position: slideAnimation, child: child);
      },
    );
  }

  @override
  State<CreateTicketDrawer> createState() => _CreateTicketDrawerState();
}

class _CreateTicketDrawerState extends State<CreateTicketDrawer> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _floorLocationController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionFocusNode = FocusNode();
  final _client = getIt<TaskClient>();
  final _authState = getIt<AuthState>();

  bool _isLoading = false;
  bool _showSuccess = false;
  String? _error;

  // Location state
  TicketLocation? _selectedLocation;
  List<TicketLocation> _locations = [];
  bool _loadingLocations = true;

  // Attachments
  List<AttachmentUploadState> _pendingAttachments = [];

  // Title generation state
  String? _generatedTitle;
  bool _isTitleGenerating = false;
  bool _titleGenerationFailed = false;
  Timer? _debounceTimer;
  String _currentDescription = '';

  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _descriptionController.dispose();
    _floorLocationController.dispose();
    _titleController.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadLocations() async {
    try {
      final locations = await _client.getTicketLocations();
      if (mounted) {
        setState(() {
          _locations = locations;
          _loadingLocations = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loadingLocations = false;
          _error = 'Failed to load locations';
        });
      }
    }
  }

  Future<void> _generateTitle(String description, [String? specificLocation]) async {
    specificLocation ??= _floorLocationController.text;

    if (description.trim().isEmpty) return;

    setState(() {
      _isTitleGenerating = true;
      _titleGenerationFailed = false;
    });

    try {
      final generatedTitle = await _client.generateTaskTitle(
        description,
        specificLocation: specificLocation,
      );

      if (mounted) {
        setState(() {
          _generatedTitle = generatedTitle;
          _isTitleGenerating = false;
        });
      }
    } catch (e) {
      debugPrint('Error generating title: $e');
      if (mounted) {
        setState(() {
          _isTitleGenerating = false;
          _titleGenerationFailed = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not generate title. Please enter manually.'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  void _handleDescriptionChanged(String value) {
    _debounceTimer?.cancel();
    _currentDescription = value;

    if (value.trim().length >= 10 && !_isTitleGenerating) {
      setState(() => _titleGenerationFailed = false);

      _debounceTimer = Timer(const Duration(milliseconds: 1500), () {
        _generateTitle(value);
      });
    }
  }

  void _handleFloorLocationChanged(String value) {
    if (_currentDescription.trim().length >= 10 && !_isTitleGenerating) {
      _debounceTimer?.cancel();
      setState(() => _titleGenerationFailed = false);

      _debounceTimer = Timer(const Duration(milliseconds: 1500), () {
        _generateTitle(_currentDescription, value);
      });
    }
  }

  bool get _canSubmit {
    final hasTitle = _generatedTitle != null || _titleController.text.trim().isNotEmpty;
    final hasDescription = _descriptionController.text.trim().isNotEmpty;
    final hasLocation = _selectedLocation != null;
    final hasFloorLocation = _floorLocationController.text.trim().isNotEmpty;
    return hasTitle && hasDescription && hasLocation && hasFloorLocation && !_isLoading;
  }

  Future<void> _handleSubmit() async {
    // Check uploads in progress
    final hasUploadingFiles = _pendingAttachments.any((a) => a.status == UploadStatus.uploading);
    if (hasUploadingFiles) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please wait for uploads to complete'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Get title
    final title = _generatedTitle ?? _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please provide a task name'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Create the task definition (service request type)
      final taskDef = await _client.createTaskDef(
        locationId: _selectedLocation!.id,
        title: title,
        taskType: TaskType.serviceRequest,
        description: _descriptionController.text.trim(),
        specificLocation: _floorLocationController.text.trim(),
      );

      // Upload attachments if task was created and has an associated task
      // Uses multipart POST like v0 - backend receives file and uploads to GCS
      if (taskDef.taskId != null && _pendingAttachments.isNotEmpty) {
        final attachmentsToUpload =
            _pendingAttachments.where((a) => a.status == UploadStatus.pending).toList();

        // Get Firebase auth token
        final user = _authState.firebaseUser.value;
        if (user == null) {
          throw Exception('Not authenticated');
        }
        final token = await user.getIdToken();
        if (token == null) {
          throw Exception('Failed to get auth token');
        }

        for (final attachment in attachmentsToUpload) {
          try {
            // Build multipart request (like v0's approach)
            final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/tasks/${taskDef.taskId}/attachments');
            final request = http.MultipartRequest('POST', uri);

            // Add auth header
            request.headers['Authorization'] = 'Bearer $token';

            // Add file with proper content type
            request.files.add(http.MultipartFile.fromBytes(
              'file',
              attachment.bytes,
              filename: attachment.fileName,
              contentType: MediaType.parse(attachment.mimeType),
            ));

            // Send request
            final streamedResponse = await request.send();
            final response = await http.Response.fromStream(streamedResponse);

            if (response.statusCode != 201) {
              debugPrint('Upload failed for ${attachment.fileName}: ${response.body}');
            } else {
              debugPrint('Upload succeeded for ${attachment.fileName}');
            }
          } catch (e) {
            debugPrint('Error uploading attachment ${attachment.fileName}: $e');
          }
        }
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
          _showSuccess = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString().replaceFirst('Exception: ', '');
          _isLoading = false;
        });
      }
    }
  }

  void _resetForm() {
    setState(() {
      _descriptionController.clear();
      _floorLocationController.clear();
      _titleController.clear();
      _selectedLocation = null;
      _pendingAttachments = [];
      _generatedTitle = null;
      _isTitleGenerating = false;
      _titleGenerationFailed = false;
      _currentDescription = '';
      _showSuccess = false;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSuccess) {
      return _buildSuccessView();
    }

    return DrawerShell(
      title: 'What needs to be done?',
      onClose: widget.onClose,
      scrollableBody: true,
      bodyPadding: EdgeInsets.all(AppSizes.spacingXL),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI title widget
            _buildTitleWidget(),
            SizedBox(height: AppSizes.spacingXL),

            // Description field
            _buildDescriptionField(),
            SizedBox(height: AppSizes.spacingXL),

            // Building Location dropdown
            _buildLocationDropdown(),
            SizedBox(height: AppSizes.spacingXL),

            // Where is the issue? field
            _buildFloorLocationField(),
            SizedBox(height: AppSizes.spacingXL),

            // Attachment upload
            _buildAttachmentUpload(),

            if (_error != null) ...[
              SizedBox(height: AppSizes.spacingXL),
              _buildErrorBanner(),
            ],
          ],
        ),
      ),
      footer: DrawerShellPillActions(
        onCancel: widget.onClose,
        onSubmit: _canSubmit ? _handleSubmit : null,
        submitText: 'Submit Ticket',
        isSubmitting: _isLoading,
        submitEnabled: _canSubmit,
      ),
    );
  }

  Widget _buildTitleWidget() {
    // Build star icon widget (matching v0 exactly)
    Widget starIcon = SvgPicture.asset(
      'assets/icons/icon-stars.svg',
      width: 20,
      height: 20,
    );

    // Add rotation animation if generating
    if (_isTitleGenerating) {
      starIcon = RotationTransition(
        turns: const AlwaysStoppedAnimation(0.0),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Transform.rotate(angle: value * 2 * 3.14159, child: child);
          },
          onEnd: () {
            // Loop the animation
            if (mounted && _isTitleGenerating) {
              setState(() {});
            }
          },
          child: SvgPicture.asset(
            'assets/icons/icon-stars.svg',
            width: 20,
            height: 20,
          ),
        ),
      );
    }

    if (_isTitleGenerating) {
      // Show rotating star in place with generating text
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          starIcon,
          SizedBox(width: AppSizes.spacingMD),
          Text(
            'Generating title...',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: AppColors.textTertiary,
            ),
          ),
        ],
      );
    } else if (_generatedTitle != null) {
      // Show generated title with star icon
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          starIcon,
          SizedBox(width: AppSizes.spacingMD),
          Expanded(
            child: Text(
              _generatedTitle!,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      );
    } else if (_titleGenerationFailed) {
      // Show manual input field with star icon (generation failed)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSizes.spacingMD),
            child: starIcon,
          ),
          SizedBox(width: AppSizes.spacingMD),
          Expanded(
            child: TextFormField(
              controller: _titleController,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                labelText: 'Task Name',
                hintText: 'Task Name',
                labelStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppSizes.spacingXL,
                  vertical: AppSizes.spacingLG,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  borderSide: BorderSide(color: AppColors.borderPrimary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  borderSide: BorderSide(color: AppColors.borderPrimary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  borderSide: BorderSide(color: AppColors.textPrimary),
                ),
              ),
              validator: (value) {
                if (_generatedTitle == null && (value == null || value.trim().length < 3)) {
                  return 'Task name must be at least 3 characters';
                }
                return null;
              },
            ),
          ),
        ],
      );
    } else {
      // Initial state - show only star icon
      return Padding(
        padding: EdgeInsets.only(top: AppSizes.spacingMD),
        child: starIcon,
      );
    }
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      focusNode: _descriptionFocusNode,
      maxLines: 3,
      textInputAction: TextInputAction.done,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      onChanged: _handleDescriptionChanged,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: 'Description',
        hintText: 'Describe the issue...',
        labelStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: AppColors.textTertiary,
        ),
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: AppColors.textTertiary,
        ),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.all(AppSizes.spacingXL),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.textPrimary),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Description is required';
        }
        return null;
      },
    );
  }

  Widget _buildLocationDropdown() {
    return DropdownButtonFormField<TicketLocation>(
      initialValue: _selectedLocation,
      isExpanded: true,
      icon: Icon(Icons.keyboard_arrow_down, color: AppColors.textTertiary),
      dropdownColor: AppColors.white,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacingXL,
          vertical: AppSizes.spacingLG,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.textPrimary),
        ),
      ),
      hint: Text(
        'Building Location',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: AppColors.textTertiary,
        ),
      ),
      items: _locations.map((location) {
        return DropdownMenuItem(
          value: location,
          child: Text(location.name),
        );
      }).toList(),
      onChanged: _loadingLocations
          ? null
          : (value) {
              setState(() => _selectedLocation = value);
            },
      validator: (value) {
        if (value == null) return 'Please select a location';
        return null;
      },
    );
  }

  Widget _buildFloorLocationField() {
    return TextFormField(
      controller: _floorLocationController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      onChanged: _handleFloorLocationChanged,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: 'Where is the issue?',
        hintText: 'e.g. Room 204 or main hallway.',
        labelStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: AppColors.textTertiary,
        ),
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: AppColors.textTertiary,
        ),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacingXL,
          vertical: AppSizes.spacingLG,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          borderSide: BorderSide(color: AppColors.textPrimary),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please specify where the issue is';
        }
        return null;
      },
    );
  }

  Widget _buildAttachmentUpload() {
    // Use the AttachmentUploadWidget matching v0's design
    return AttachmentUploadWidget(
      taskId: null, // No taskId yet when creating
      onAttachmentsChanged: (attachments) {
        setState(() {
          _pendingAttachments = attachments;
        });
      },
    );
  }

  Widget _buildErrorBanner() {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingLG),
      decoration: BoxDecoration(
        color: AppColors.utilityError500.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        border: Border.all(color: AppColors.utilityError500.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.utilityError500, size: 20),
          SizedBox(width: AppSizes.spacingMD),
          Expanded(
            child: Text(
              _error!,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.utilityError500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView() {
    return DrawerShell(
      title: 'What needs to be done?',
      onClose: widget.onClose,
      scrollableBody: false,
      bodyPadding: EdgeInsets.zero,
      body: Container(
        color: AppColors.bgSecondary,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.spacing3XL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Confetti image
                Image.asset(
                  'assets/images/confetti.png',
                  height: 120,
                  errorBuilder: (_, __, ___) => const SizedBox(height: 120),
                ),
                SizedBox(height: AppSizes.spacingXL),
                Text(
                  'Thanks!',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: AppSizes.spacingMD),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.spacingXL),
                  child: Text(
                    "Your request has been submitted! We'll keep you updated as we make progress.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.spacing4XL),
                // Submit Another Request button
                GestureDetector(
                  onTap: _resetForm,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: AppSizes.spacingLG),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back, size: 16, color: AppColors.textPrimary),
                        SizedBox(width: AppSizes.spacingMD),
                        Text(
                          'Submit Another Request',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.spacingLG),
                // View My Requests button
                GestureDetector(
                  onTap: () {
                    widget.onCreated?.call();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: AppSizes.spacingLG),
                    decoration: BoxDecoration(
                      color: AppColors.bgQuaternary,
                      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                    ),
                    child: Text(
                      'View My Requests',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
