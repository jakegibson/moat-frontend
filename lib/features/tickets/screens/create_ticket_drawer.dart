import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../common_widgets/attachment_upload_widget.dart';
import '../../../common_widgets/right_side_drawer.dart';
import '../../../core/config/app_config.dart';
import '../../../core/di/injection.dart';
import '../data/task_client.dart';
import '../data/task_models.dart';

/// Design colors matching v0
class _Colors {
  static const Color bgPrimary = Color(0xFFFFFFFF);
  static const Color bgSecondary = Color(0xFFF1F0EE);
  static const Color bgQuaternary = Color(0xFFE4E3E1);
  static const Color borderPrimary = Color(0xFFD3D1CF);
  static const Color borderSecondary = Color(0xFFE4E3E1);
  static const Color textPrimary = Color(0xFF161616);
  static const Color textTertiary = Color(0xFF848281);
  static const Color fgPrimary = Color(0xFF161616);
  static const Color primary = Color(0xFF161616);
  static const Color error = Color(0xFFDC2626);
}

class CreateTicketDrawer extends StatefulWidget {
  final VoidCallback? onCreated;
  final VoidCallback? onClose;

  const CreateTicketDrawer({super.key, this.onCreated, this.onClose});

  static Future<bool?> show(BuildContext context) {
    return RightSideDrawer.show<bool>(
      context: context,
      width: 420,
      builder: (context) => CreateTicketDrawer(
        onCreated: () => Navigator.of(context).pop(true),
        onClose: () => Navigator.of(context).pop(),
      ),
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
        final user = FirebaseAuth.instance.currentUser;
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

    return Container(
      color: _Colors.bgPrimary,
      child: Column(
        children: [
          // Header with title
          _buildHeader(),

          // Form content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AI title widget
                    _buildTitleWidget(),
                    const SizedBox(height: 16),

                    // Description field
                    _buildDescriptionField(),
                    const SizedBox(height: 16),

                    // Building Location dropdown
                    _buildLocationDropdown(),
                    const SizedBox(height: 16),

                    // Where is the issue? field
                    _buildFloorLocationField(),
                    const SizedBox(height: 16),

                    // Attachment upload
                    _buildAttachmentUpload(),

                    if (_error != null) ...[
                      const SizedBox(height: 16),
                      _buildErrorBanner(),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // Bottom actions
          _buildBottomActions(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: _Colors.bgPrimary,
        border: Border(bottom: BorderSide(color: _Colors.borderSecondary)),
      ),
      child: Row(
        children: [
          // Close button
          IconButton(
            onPressed: widget.onClose ?? () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, size: 20, color: _Colors.fgPrimary),
            style: IconButton.styleFrom(backgroundColor: _Colors.bgSecondary),
          ),
          const SizedBox(width: 16),
          // Title
          const Expanded(
            child: Text(
              'What needs to be done?',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _Colors.textPrimary,
              ),
            ),
          ),
        ],
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
          const SizedBox(width: 8),
          const Text(
            'Generating title...',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: _Colors.textTertiary,
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
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _generatedTitle!,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _Colors.textPrimary,
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
            padding: const EdgeInsets.only(top: 8),
            child: starIcon,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: _titleController,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _Colors.textPrimary,
              ),
              decoration: InputDecoration(
                labelText: 'Task Name',
                hintText: 'Task Name',
                labelStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: _Colors.textTertiary,
                ),
                hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: _Colors.textTertiary,
                ),
                filled: true,
                fillColor: _Colors.bgPrimary,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: _Colors.borderPrimary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: _Colors.borderPrimary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: _Colors.textPrimary),
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
        padding: const EdgeInsets.only(top: 8),
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
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        color: _Colors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: 'Description',
        hintText: 'Describe the issue...',
        labelStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: _Colors.textTertiary,
        ),
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: _Colors.textTertiary,
        ),
        filled: true,
        fillColor: _Colors.bgPrimary,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.textPrimary),
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
      icon: const Icon(Icons.keyboard_arrow_down, color: _Colors.textTertiary),
      dropdownColor: _Colors.bgPrimary,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        color: _Colors.textPrimary,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: _Colors.bgPrimary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.textPrimary),
        ),
      ),
      hint: Text(
        'Building Location',
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: _Colors.textTertiary,
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
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        color: _Colors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: 'Where is the issue?',
        hintText: 'e.g. Room 204 or main hallway.',
        labelStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: _Colors.textTertiary,
        ),
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: _Colors.textTertiary,
        ),
        filled: true,
        fillColor: _Colors.bgPrimary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _Colors.textPrimary),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _Colors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _Colors.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: _Colors.error, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _error!,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _Colors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: _Colors.bgPrimary,
        border: Border(top: BorderSide(color: _Colors.bgSecondary)),
      ),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Cancel button
                GestureDetector(
                  onTap: widget.onClose ?? () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: _Colors.bgPrimary,
                      borderRadius: BorderRadius.circular(9999),
                      border: Border.all(color: _Colors.borderSecondary),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _Colors.textPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Submit button
                GestureDetector(
                  onTap: _canSubmit ? _handleSubmit : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: _canSubmit ? _Colors.primary : _Colors.bgQuaternary,
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Text(
                      'Submit Ticket',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _canSubmit ? Colors.white : _Colors.textTertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSuccessView() {
    return Container(
      color: _Colors.bgSecondary,
      child: Column(
        children: [
          // Header
          _buildHeader(),
          // Success content
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Confetti image
                    Image.asset(
                      'assets/images/confetti.png',
                      height: 120,
                      errorBuilder: (_, __, ___) => const SizedBox(height: 120),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Thanks!',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: _Colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Your request has been submitted! We'll keep you updated as we make progress.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: _Colors.textTertiary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Submit Another Request button
                    GestureDetector(
                      onTap: _resetForm,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _Colors.bgPrimary,
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_back, size: 16, color: _Colors.textPrimary),
                            SizedBox(width: 8),
                            Text(
                              'Submit Another Request',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: _Colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // View My Requests button
                    GestureDetector(
                      onTap: () {
                        widget.onCreated?.call();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _Colors.bgQuaternary,
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: const Text(
                          'View My Requests',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _Colors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
