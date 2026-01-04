import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../tickets/data/task_client.dart';
import '../../tickets/data/task_models.dart';

/// Drawer for completing a maintenance task.
class CompleteMaintenanceDrawer extends StatefulWidget {
  final TaskDef taskDef;
  final VoidCallback onCompleted;
  final VoidCallback onClose;

  const CompleteMaintenanceDrawer({
    required this.taskDef,
    required this.onCompleted,
    required this.onClose,
    super.key,
  });

  @override
  State<CompleteMaintenanceDrawer> createState() => _CompleteMaintenanceDrawerState();
}

class _CompleteMaintenanceDrawerState extends State<CompleteMaintenanceDrawer> {
  final _taskClient = getIt<TaskClient>();
  final _descriptionController = TextEditingController();

  DateTime _completionDate = DateTime.now();
  bool _isLoading = false;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _completeTask() async {
    setState(() => _isLoading = true);

    try {
      // Build completion notes
      String notes = 'Task completed';
      if (_descriptionController.text.isNotEmpty) {
        notes = _descriptionController.text;
      }

      // Check if there's an existing task to complete
      if (widget.taskDef.taskId != null) {
        // Complete the existing task
        await _taskClient.updateTaskStatus(
          id: widget.taskDef.taskId!,
          status: TaskStatus.resolved,
          resolutionType: ResolutionType.completed,
          notes: notes,
        );
      } else {
        // Create a new task instance and complete it immediately
        final task = await _taskClient.createTask(
          taskDefId: widget.taskDef.id,
          scheduledDate: _completionDate,
        );

        // Mark it as resolved
        await _taskClient.updateTaskStatus(
          id: task.id,
          status: TaskStatus.resolved,
          resolutionType: ResolutionType.completed,
          notes: notes,
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task completed successfully'),
            backgroundColor: AppColors.success,
          ),
        );
        widget.onCompleted();
        widget.onClose();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to complete task: ${e.toString()}'),
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
      initialDate: _completionDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _completionDate = picked);
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
                  'Complete Maintenance',
                  style: AppTextStyles.textLGSemibold,
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Task info
                    Text(
                      widget.taskDef.title,
                      style: AppTextStyles.textLGSemibold,
                    ),
                    if (widget.taskDef.description != null &&
                        widget.taskDef.description!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        widget.taskDef.description!,
                        style: AppTextStyles.textSMSecondary,
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Date completed
                    Text('Date Completed', style: AppTextStyles.textSMMedium),
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
                              '${_completionDate.month}/${_completionDate.day}/${_completionDate.year}',
                              style: AppTextStyles.textMD,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Description (optional)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Description', style: AppTextStyles.textSMMedium),
                        Text(
                          '*optional',
                          style: AppTextStyles.textXS.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Describe what was done',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ],
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
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onClose,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _completeTask,
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
                        : const Text('Complete'),
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
