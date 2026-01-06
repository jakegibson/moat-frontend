import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../data/task_client.dart';
import '../data/task_models.dart';
import '../widgets/assignee_dropdown.dart';

class EditTicketDrawer extends StatefulWidget {
  final TaskWithDetails task;
  final VoidCallback? onUpdated;

  const EditTicketDrawer({
    super.key,
    required this.task,
    this.onUpdated,
  });

  static Future<bool?> show(BuildContext context, TaskWithDetails task) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => EditTicketDrawer(
        task: task,
        onUpdated: () => Navigator.of(context).pop(true),
      ),
    );
  }

  @override
  State<EditTicketDrawer> createState() => _EditTicketDrawerState();
}

class _EditTicketDrawerState extends State<EditTicketDrawer> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _specificLocationController = TextEditingController();
  final _client = getIt<TaskClient>();

  bool _isLoading = false;
  String? _error;

  TicketLocation? _selectedLocation;
  List<TicketLocation> _locations = [];
  bool _loadingLocations = true;

  AssignmentSelection? _assignmentSelection;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.task.title;
    _descriptionController.text = widget.task.description ?? '';
    _specificLocationController.text = widget.task.specificLocation ?? '';

    if (widget.task.assigneeId != null) {
      _assignmentSelection = AssignmentSelection(
        memberId: widget.task.assigneeId,
        displayName: widget.task.assigneeName ?? 'Assigned',
        isRole: false,
      );
    } else if (widget.task.assignedRoleId != null) {
      _assignmentSelection = AssignmentSelection(
        roleId: widget.task.assignedRoleId,
        displayName: 'Role',
        isRole: true,
      );
    }

    _loadLocations();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _specificLocationController.dispose();
    super.dispose();
  }

  Future<void> _loadLocations() async {
    try {
      final locations = await _client.getTicketLocations();
      if (mounted) {
        setState(() {
          _locations = locations;
          _loadingLocations = false;
          // Set the current location
          if (widget.task.locationId != null) {
            _selectedLocation = locations.firstWhere(
              (l) => l.id == widget.task.locationId,
              orElse: () => locations.first,
            );
          }
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

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Update task def (title, description, location, specific location)
      await _client.updateTaskDef(
        id: widget.task.taskDefId,
        locationId: _selectedLocation?.id,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        specificLocation: _specificLocationController.text.trim().isNotEmpty
            ? _specificLocationController.text.trim()
            : null,
      );

      // Update task assignment if changed
      final currentAssigneeId = widget.task.assigneeId;
      final currentRoleId = widget.task.assignedRoleId;
      final newAssigneeId = _assignmentSelection?.memberId;
      final newRoleId = _assignmentSelection?.roleId;

      if (currentAssigneeId != newAssigneeId || currentRoleId != newRoleId) {
        await _client.updateTask(
          id: widget.task.id,
          assigneeId: newAssigneeId,
          assignedRoleId: newRoleId,
        );
      }

      if (mounted) {
        widget.onUpdated?.call();
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(theme),
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                Spacing.lg,
                Spacing.md,
                Spacing.lg,
                Spacing.lg + bottomPadding,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (_error != null) ...[
                      _buildErrorBanner(theme),
                      const SizedBox(height: Spacing.md),
                    ],
                    _buildTicketIdBadge(theme),
                    const SizedBox(height: Spacing.md),
                    _buildLocationField(theme),
                    const SizedBox(height: Spacing.md),
                    _buildTitleField(),
                    const SizedBox(height: Spacing.md),
                    _buildDescriptionField(),
                    const SizedBox(height: Spacing.md),
                    _buildSpecificLocationField(),
                    const SizedBox(height: Spacing.md),
                    _buildAssigneeField(theme),
                    const SizedBox(height: Spacing.lg),
                    _buildSubmitButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: theme.dividerColor),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
          const SizedBox(width: Spacing.sm),
          Text(
            'Edit Ticket',
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildTicketIdBadge(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.confirmation_number_outlined,
            size: 16,
            color: theme.colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: Spacing.xs),
          Text(
            widget.task.externalId ?? widget.task.id.substring(0, 8),
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorBanner(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: theme.colorScheme.onErrorContainer,
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(
              _error!,
              style: AppTextStyles.body.copyWith(color: AppColors.utilityError700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location *',
          style: theme.textTheme.labelMedium,
        ),
        const SizedBox(height: Spacing.xs),
        if (_loadingLocations)
          const LinearProgressIndicator()
        else
          DropdownButtonFormField<TicketLocation>(
            value: _selectedLocation,
            decoration: const InputDecoration(
              hintText: 'Select a location',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
            items: _locations.map((location) {
              return DropdownMenuItem(
                value: location,
                child: Text(location.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() => _selectedLocation = value);
            },
            validator: (value) {
              if (value == null) return 'Please select a location';
              return null;
            },
          ),
      ],
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      decoration: const InputDecoration(
        labelText: 'Title *',
        hintText: 'Brief summary of the issue',
        prefixIcon: Icon(Icons.title),
      ),
      textCapitalization: TextCapitalization.sentences,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Title is required';
        }
        if (value.trim().length < 5) {
          return 'Title must be at least 5 characters';
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      decoration: const InputDecoration(
        labelText: 'Description',
        hintText: 'Detailed description of the issue...',
        alignLabelWithHint: true,
      ),
      maxLines: 4,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget _buildSpecificLocationField() {
    return TextFormField(
      controller: _specificLocationController,
      decoration: const InputDecoration(
        labelText: 'Specific Location',
        hintText: 'e.g., Room 101, Near elevator',
        prefixIcon: Icon(Icons.room_outlined),
      ),
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget _buildAssigneeField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assign To',
          style: theme.textTheme.labelMedium,
        ),
        const SizedBox(height: Spacing.xs),
        AssigneeDropdown(
          locationId: _selectedLocation?.id,
          value: _assignmentSelection,
          onChanged: (value) {
            setState(() => _assignmentSelection = value);
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return FilledButton.icon(
      onPressed: _isLoading ? null : _handleSubmit,
      icon: _isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.save),
      label: Text(_isLoading ? 'Saving...' : 'Save Changes'),
    );
  }
}
