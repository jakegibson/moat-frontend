import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../tickets/data/task_client.dart';
import '../../tickets/data/task_models.dart';
import '../data/maintenance_cadence.dart';

/// Drawer for creating or editing a maintenance task definition.
class MaintenanceTaskDrawer extends StatefulWidget {
  final String assetId;
  final String locationId;
  final TaskDef? existingTask;
  final VoidCallback onSaved;
  final VoidCallback onClose;

  const MaintenanceTaskDrawer({
    required this.assetId,
    required this.locationId,
    required this.onSaved,
    required this.onClose,
    this.existingTask,
    super.key,
  });

  @override
  State<MaintenanceTaskDrawer> createState() => _MaintenanceTaskDrawerState();
}

class _MaintenanceTaskDrawerState extends State<MaintenanceTaskDrawer> {
  final _formKey = GlobalKey<FormState>();
  final _taskClient = getIt<TaskClient>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _cadenceInMonthsController = TextEditingController();

  MaintenanceCadence _selectedCadence = MaintenanceCadence.asNeeded;
  DateTime _startDate = DateTime.now();
  bool _isLoading = false;

  bool get isEditing => widget.existingTask != null;

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      _nameController.text = widget.existingTask!.title;
      _descriptionController.text = widget.existingTask!.description ?? '';

      // Parse cadence from RRULE
      final cadence = RRuleUtils.rruleToCadence(widget.existingTask!.recurrenceRule);
      // Migrate legacy cadences to asNeeded
      if (!cadence.isSelectable) {
        _selectedCadence = MaintenanceCadence.asNeeded;
      } else {
        _selectedCadence = cadence;
      }

      // Get interval in months for periodically
      if (_selectedCadence == MaintenanceCadence.periodically) {
        final months = RRuleUtils.getIntervalInMonths(widget.existingTask!.recurrenceRule);
        if (months != null) {
          _cadenceInMonthsController.text = months.toString();
        }
      }

      if (widget.existingTask!.recurrenceStart != null) {
        _startDate = widget.existingTask!.recurrenceStart!;
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _cadenceInMonthsController.dispose();
    super.dispose();
  }

  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final double? cadenceInMonths = _selectedCadence == MaintenanceCadence.periodically
          ? double.tryParse(_cadenceInMonthsController.text)
          : null;

      final recurrenceRule = RRuleUtils.cadenceToRRule(
        _selectedCadence,
        cadenceInMonths: cadenceInMonths,
      );

      if (isEditing) {
        // Update existing task
        await _taskClient.updateTaskDef(
          id: widget.existingTask!.id,
          title: _nameController.text,
          description: _descriptionController.text,
          recurrenceRule: recurrenceRule,
          recurrenceStart: _startDate,
        );
      } else {
        // Create new task
        await _taskClient.createTaskDef(
          locationId: widget.locationId,
          title: _nameController.text,
          taskType: TaskType.maintenance,
          assetId: widget.assetId,
          description: _descriptionController.text,
          isEnabled: true,
          recurrenceRule: recurrenceRule,
          recurrenceStart: _startDate,
        );
      }

      if (mounted) {
        widget.onSaved();
        widget.onClose();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _deleteTask() async {
    if (!isEditing) return;

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: Text(
          'Are you sure you want to delete "${_nameController.text}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isLoading = true);

    try {
      await _taskClient.deleteTaskDef(widget.existingTask!.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task deleted successfully'),
            backgroundColor: AppColors.success,
          ),
        );
        widget.onSaved();
        widget.onClose();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting task: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _startDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: AppColors.white,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderPrimary),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close, size: 20),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.bgSecondary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  isEditing ? 'Edit Task' : 'Create Task',
                  style: AppTextStyles.textLGSemibold,
                ),
              ],
            ),
          ),

          // Form
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name field
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter task name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a task name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Description field
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Enter task description',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Cadence dropdown
                      DropdownButtonFormField<MaintenanceCadence>(
                        initialValue: _selectedCadence,
                        decoration: InputDecoration(
                          labelText: 'Cadence',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: MaintenanceCadence.selectableValues.map((cadence) {
                          return DropdownMenuItem(
                            value: cadence,
                            child: Text(cadence.displayName),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedCadence = value);
                          }
                        },
                      ),

                      // Custom interval for periodically
                      if (_selectedCadence == MaintenanceCadence.periodically) ...[
                        const SizedBox(height: 20),
                        Text('Months Between Tasks', style: AppTextStyles.textSMMedium),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _cadenceInMonthsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter number of months',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (_selectedCadence == MaintenanceCadence.periodically) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter months between tasks';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Please enter a valid number';
                              }
                            }
                            return null;
                          },
                        ),
                      ],

                      const SizedBox(height: 20),

                      // Start date picker
                      Text('Start Date', style: AppTextStyles.textSMMedium),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: _selectDate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderPrimary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 20),
                              const SizedBox(width: 12),
                              Text(
                                '${_startDate.month}/${_startDate.day}/${_startDate.year}',
                                style: AppTextStyles.textMD,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Actions
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.borderPrimary),
              ),
            ),
            child: Row(
              children: [
                if (isEditing) ...[
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _isLoading ? null : _deleteTask,
                      icon: Icon(Icons.delete_outline, color: AppColors.error),
                      label: Text(
                        'Delete',
                        style: TextStyle(color: AppColors.error),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        side: BorderSide(color: AppColors.error),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _saveTask,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                        : Text(isEditing ? 'Save' : 'Create'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
