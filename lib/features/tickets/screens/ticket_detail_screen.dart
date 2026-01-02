import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:intl/intl.dart';

import '../../../core/di/injection.dart';
import '../data/task_models.dart';
import '../state/task_detail_state.dart';
import '../widgets/ticket_status_badge.dart';
import '../widgets/ticket_activity_view.dart';
import '../widgets/comment_input.dart';
import 'edit_ticket_drawer.dart';

class TicketDetailScreen extends StatefulWidget {
  final String externalId;

  const TicketDetailScreen({required this.externalId, super.key});

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TaskDetailState _state;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _state = getIt<TaskDetailState>();
    _tabController = TabController(length: 2, vsync: this);
    _loadTask();
  }

  void _loadTask() {
    _state.fetchTaskByExternalId(widget.externalId);
    // Comments and activity will be loaded when tabs are selected
  }

  @override
  void dispose() {
    _tabController.dispose();
    _state.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Watch((context) {
        final task = _state.selectedTask.value;
        final isLoading = _state.isLoading.value;
        final error = _state.error.value;

        if (isLoading && task == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error != null && task == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text('Failed to load ticket'),
                const SizedBox(height: 8),
                Text(error.message),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _loadTask,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (task == null) {
          return const Center(child: Text('Ticket not found'));
        }

        return _buildContent(context, task);
      }),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.pop(),
      ),
      title: Watch((context) {
        final task = _state.selectedTask.value;
        return Text(task?.externalId ?? widget.externalId);
      }),
      actions: [
        Watch((context) {
          final task = _state.selectedTask.value;
          if (task == null) return const SizedBox.shrink();

          return Row(
            children: [
              TicketStatusBadge(status: task.status),
              const SizedBox(width: 8),
              if (task.status == TaskStatus.created)
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  tooltip: 'Edit Ticket',
                  onPressed: () => _handleEditTicket(task),
                ),
              PopupMenuButton<String>(
                onSelected: (value) => _handleMenuAction(value, task),
                itemBuilder: (context) => [
                  if (!task.isAssigned)
                    const PopupMenuItem(
                      value: 'claim',
                      child: Row(
                        children: [
                          Icon(Icons.person_add),
                          SizedBox(width: 8),
                          Text('Claim'),
                        ],
                      ),
                    ),
                  if (task.status != TaskStatus.inProgress)
                    const PopupMenuItem(
                      value: 'start',
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow),
                          SizedBox(width: 8),
                          Text('Start'),
                        ],
                      ),
                    ),
                  if (task.status != TaskStatus.onHold)
                    const PopupMenuItem(
                      value: 'hold',
                      child: Row(
                        children: [
                          Icon(Icons.pause),
                          SizedBox(width: 8),
                          Text('Put on Hold'),
                        ],
                      ),
                    ),
                  if (task.status != TaskStatus.resolved)
                    const PopupMenuItem(
                      value: 'resolve',
                      child: Row(
                        children: [
                          Icon(Icons.check_circle),
                          SizedBox(width: 8),
                          Text('Resolve'),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }

  Future<void> _handleEditTicket(TaskWithDetails task) async {
    final result = await EditTicketDrawer.show(context, task);
    if (result == true) {
      _loadTask();
    }
  }

  void _handleMenuAction(String action, TaskWithDetails task) async {
    switch (action) {
      case 'claim':
        await _state.claimTask(task.id);
        break;
      case 'start':
        await _state.updateTaskStatus(
          id: task.id,
          status: TaskStatus.inProgress,
        );
        break;
      case 'hold':
        await _state.updateTaskStatus(
          id: task.id,
          status: TaskStatus.onHold,
        );
        break;
      case 'resolve':
        _showResolveDialog(task);
        break;
    }
  }

  void _showResolveDialog(TaskWithDetails task) {
    showDialog(
      context: context,
      builder: (context) => _ResolveDialog(
        onResolve: (resolutionType, notes) async {
          await _state.updateTaskStatus(
            id: task.id,
            status: TaskStatus.resolved,
            resolutionType: resolutionType,
            notes: notes,
          );
          if (context.mounted) Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, TaskWithDetails task) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main content
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleSection(context, task),
                      const SizedBox(height: 24),
                      _buildDetailsSection(context, task),
                      const SizedBox(height: 24),
                      _buildDescriptionSection(context, task),
                      const SizedBox(height: 24),
                      _buildTabSection(context, task),
                    ],
                  ),
                ),
              ),
              // Sidebar
              Container(
                width: 320,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                child: _buildSidebar(context, task),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleSection(BuildContext context, TaskWithDetails task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                task.taskType.displayName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (task.isOverdue)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.warning, size: 14, color: Colors.red.shade700),
                    const SizedBox(width: 4),
                    Text(
                      'Overdue',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          task.title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(BuildContext context, TaskWithDetails task) {
    final dateFormat = DateFormat.yMMMd();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _DetailRow(
              label: 'Location',
              value: task.fullLocationName.isNotEmpty
                  ? task.fullLocationName
                  : 'Not specified',
            ),
            const Divider(height: 24),
            _DetailRow(
              label: 'Scheduled',
              value: dateFormat.format(task.scheduledDate),
            ),
            if (task.dueDate != null) ...[
              const Divider(height: 24),
              _DetailRow(
                label: 'Due Date',
                value: dateFormat.format(task.dueDate!),
                valueColor: task.isOverdue ? Colors.red : null,
              ),
            ],
            if (task.completedDate != null) ...[
              const Divider(height: 24),
              _DetailRow(
                label: 'Completed',
                value: dateFormat.format(task.completedDate!),
              ),
            ],
            const Divider(height: 24),
            _DetailRow(
              label: 'Created',
              value: dateFormat.format(task.createdAt),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context, TaskWithDetails task) {
    if (task.description == null || task.description!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(task.description!),
          ),
        ),
      ],
    );
  }

  Widget _buildTabSection(BuildContext context, TaskWithDetails task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Activity'),
            Tab(text: 'Comments'),
          ],
          onTap: (index) {
            if (index == 0) {
              _state.fetchTaskActivity(task.id);
            } else if (index == 1) {
              _state.fetchComments(task.id);
            }
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          child: TabBarView(
            controller: _tabController,
            children: [
              TicketActivityView(taskId: task.id),
              _buildCommentsTab(task),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommentsTab(TaskWithDetails task) {
    return Column(
      children: [
        CommentInput(
          onSubmit: (content) {
            _state.createComment(
              taskId: task.id,
              content: content,
            );
          },
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Watch((context) {
            final comments = _state.taskComments.value;

            if (comments.isEmpty) {
              return Center(
                child: Text(
                  'No comments yet',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              );
            }

            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return _CommentCard(
                  comment: comment,
                  onEdit: () {
                    // Show edit dialog
                  },
                  onDelete: () {
                    _state.deleteComment(comment.id);
                  },
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSidebar(BuildContext context, TaskWithDetails task) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),
          _SidebarField(
            label: 'Assignee',
            child: task.assigneeName != null
                ? Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        child: Text(
                          task.assigneeName![0].toUpperCase(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(task.assigneeName!)),
                    ],
                  )
                : Text(
                    'Unassigned',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
          ),
          const SizedBox(height: 16),
          _SidebarField(
            label: 'Requested By',
            child: Text(
              task.requestedByName ?? 'Unknown',
              style: task.requestedByName == null
                  ? TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant)
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          _SidebarField(
            label: 'Status',
            child: TicketStatusBadge(status: task.status),
          ),
          if (task.resolutionType != null) ...[
            const SizedBox(height: 16),
            _SidebarField(
              label: 'Resolution',
              child: Text(task.resolutionType!.displayName),
            ),
          ],
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

class _SidebarField extends StatelessWidget {
  final String label;
  final Widget child;

  const _SidebarField({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}

class _CommentCard extends StatelessWidget {
  final TaskComment comment;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _CommentCard({
    required this.comment,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat.yMMMd().add_jm();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  child: Text(
                    comment.createdBy?.name.isNotEmpty == true
                        ? comment.createdBy!.name[0].toUpperCase()
                        : '?',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.createdBy?.name ?? 'Unknown',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        timeFormat.format(comment.createdAt),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_horiz, size: 20),
                  onSelected: (value) {
                    if (value == 'edit') {
                      onEdit();
                    } else if (value == 'delete') {
                      onDelete();
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'edit', child: Text('Edit')),
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(comment.content),
            if (comment.edited)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '(edited)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ResolveDialog extends StatefulWidget {
  final Future<void> Function(ResolutionType, String?) onResolve;

  const _ResolveDialog({required this.onResolve});

  @override
  State<_ResolveDialog> createState() => _ResolveDialogState();
}

class _ResolveDialogState extends State<_ResolveDialog> {
  ResolutionType _resolutionType = ResolutionType.completed;
  final _notesController = TextEditingController();
  bool _isLoading = false;

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
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _isLoading
              ? null
              : () async {
                  setState(() => _isLoading = true);
                  await widget.onResolve(
                    _resolutionType,
                    _notesController.text.isEmpty
                        ? null
                        : _notesController.text,
                  );
                },
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Resolve'),
        ),
      ],
    );
  }
}
