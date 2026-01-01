import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../data/task_client.dart';
import '../data/task_models.dart';
import '../widgets/assignee_dropdown.dart';

class CreateTicketDrawer extends StatefulWidget {
  final VoidCallback? onCreated;

  const CreateTicketDrawer({super.key, this.onCreated});

  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => CreateTicketDrawer(
        onCreated: () => Navigator.of(context).pop(true),
      ),
    );
  }

  @override
  State<CreateTicketDrawer> createState() => _CreateTicketDrawerState();
}

class _CreateTicketDrawerState extends State<CreateTicketDrawer> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _specificLocationController = TextEditingController();
  final _client = getIt<TaskClient>();

  bool _isLoading = false;
  String? _error;
  Timer? _titleDebounce;

  TicketLocation? _selectedLocation;
  List<TicketLocation> _locations = [];
  bool _loadingLocations = true;

  AssignmentSelection? _assignmentSelection;

  @override
  void initState() {
    super.initState();
    _loadLocations();
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _specificLocationController.dispose();
    _titleDebounce?.cancel();
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

  void _onDescriptionChanged() {
    _titleDebounce?.cancel();
    final description = _descriptionController.text.trim();

    if (description.length > 20 && _titleController.text.isEmpty) {
      _titleDebounce = Timer(const Duration(milliseconds: 1500), () {
        _generateTitle(description);
      });
    }
  }

  Future<void> _generateTitle(String description) async {
    try {
      final title = await _client.generateTaskTitle(
        description,
        specificLocation: _specificLocationController.text.isNotEmpty
            ? _specificLocationController.text
            : null,
      );
      if (mounted && _titleController.text.isEmpty) {
        _titleController.text = title;
      }
    } catch (_) {}
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final taskDef = await _client.createTaskDef(
        locationId: _selectedLocation!.id,
        title: _titleController.text.trim(),
        taskType: TaskType.serviceRequest,
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        specificLocation: _specificLocationController.text.trim().isNotEmpty
            ? _specificLocationController.text.trim()
            : null,
        isEnabled: true,
      );

      await _client.createTask(
        taskDefId: taskDef.id,
        assigneeId: _assignmentSelection?.memberId,
        assignedRoleId: _assignmentSelection?.roleId,
      );

      if (mounted) {
        widget.onCreated?.call();
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
            'Create Ticket',
            style: theme.textTheme.titleLarge,
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
        borderRadius: BorderRadius.circular(8),
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
              style: TextStyle(color: theme.colorScheme.onErrorContainer),
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
          : const Icon(Icons.add),
      label: Text(_isLoading ? 'Creating...' : 'Create Ticket'),
    );
  }
}
