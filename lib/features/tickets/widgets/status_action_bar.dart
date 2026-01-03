import 'package:flutter/material.dart';

import '../data/task_models.dart';

/// A bottom action bar for updating task status.
/// Matches the Figma design with status dropdown and Update Status button.
class StatusActionBar extends StatefulWidget {
  final TaskStatus currentStatus;
  final bool isLoading;
  final void Function(TaskStatus status, ResolutionType? resolutionType, String? notes)
      onUpdateStatus;

  const StatusActionBar({
    super.key,
    required this.currentStatus,
    this.isLoading = false,
    required this.onUpdateStatus,
  });

  @override
  State<StatusActionBar> createState() => _StatusActionBarState();
}

class _StatusActionBarState extends State<StatusActionBar> {
  late TaskStatus _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.currentStatus;
  }

  @override
  void didUpdateWidget(StatusActionBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentStatus != widget.currentStatus) {
      _selectedStatus = widget.currentStatus;
    }
  }

  void _handleUpdateStatus() {
    if (_selectedStatus == TaskStatus.resolved) {
      _showResolveDialog();
    } else {
      widget.onUpdateStatus(_selectedStatus, null, null);
    }
  }

  void _showResolveDialog() {
    showDialog(
      context: context,
      builder: (context) => _ResolveDialog(
        onResolve: (resolutionType, notes) {
          Navigator.pop(context);
          widget.onUpdateStatus(TaskStatus.resolved, resolutionType, notes);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasChanged = _selectedStatus != widget.currentStatus;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(color: theme.dividerColor),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Status dropdown
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<TaskStatus>(
                    value: _selectedStatus,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    borderRadius: BorderRadius.circular(12),
                    items: TaskStatus.values
                        .where((s) => s != TaskStatus.unspecified)
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Row(
                                children: [
                                  _StatusIndicator(status: status),
                                  const SizedBox(width: 8),
                                  Text(status.displayName),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: widget.isLoading
                        ? null
                        : (status) {
                            if (status != null) {
                              setState(() => _selectedStatus = status);
                            }
                          },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Update button
            FilledButton(
              onPressed: widget.isLoading || !hasChanged
                  ? null
                  : _handleUpdateStatus,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Update Status'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final TaskStatus status;

  const _StatusIndicator({required this.status});

  Color get _color {
    switch (status) {
      case TaskStatus.created:
        return Colors.blue;
      case TaskStatus.inProgress:
        return Colors.orange;
      case TaskStatus.onHold:
        return Colors.amber;
      case TaskStatus.resolved:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: _color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ResolveDialog extends StatefulWidget {
  final void Function(ResolutionType, String?) onResolve;

  const _ResolveDialog({required this.onResolve});

  @override
  State<_ResolveDialog> createState() => _ResolveDialogState();
}

class _ResolveDialogState extends State<_ResolveDialog> {
  ResolutionType _resolutionType = ResolutionType.completed;
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Resolve Ticket'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Resolution Type'),
          const SizedBox(height: 8),
          ...ResolutionType.values
              .where((r) => r != ResolutionType.unspecified)
              .map(
                (type) => RadioListTile<ResolutionType>(
                  title: Text(type.displayName),
                  value: type,
                  groupValue: _resolutionType,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _resolutionType = value);
                    }
                  },
                ),
              ),
          const SizedBox(height: 16),
          TextField(
            controller: _notesController,
            decoration: const InputDecoration(
              labelText: 'Notes (optional)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            widget.onResolve(
              _resolutionType,
              _notesController.text.isEmpty ? null : _notesController.text,
            );
          },
          child: const Text('Resolve'),
        ),
      ],
    );
  }
}
