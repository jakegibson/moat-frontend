import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:intl/intl.dart';

import '../../../core/di/injection.dart';
import '../data/task_models.dart';
import '../state/task_detail_state.dart';

class TicketActivityView extends StatefulWidget {
  final String taskId;

  const TicketActivityView({required this.taskId, super.key});

  @override
  State<TicketActivityView> createState() => _TicketActivityViewState();
}

class _TicketActivityViewState extends State<TicketActivityView> {
  late final TaskDetailState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<TaskDetailState>();
    _state.fetchTaskActivity(widget.taskId);
  }

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final activity = _state.taskActivity.value;
      final isLoading = _state.isLoading.value;

      if (isLoading && activity.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      if (activity.isEmpty) {
        return Center(
          child: Text(
            'No activity yet',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        );
      }

      return ListView.builder(
        itemCount: activity.length,
        itemBuilder: (context, index) {
          final item = activity[index];
          final isLast = index == activity.length - 1;

          return _ActivityItem(
            activity: item,
            isLast: isLast,
          );
        },
      );
    });
  }
}

class _ActivityItem extends StatelessWidget {
  final TaskActivity activity;
  final bool isLast;

  const _ActivityItem({
    required this.activity,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat.yMMMd().add_jm();

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _getEventColor(context),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getEventIcon(),
                    size: 16,
                    color: Colors.white,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _getEventDescription(),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Text(
                        timeFormat.format(activity.createdAt),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                  if (activity.changedBy != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'by ${activity.changedBy!.name}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                  if (activity.notes != null && activity.notes!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        activity.notes!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                  if (activity.comment != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        activity.comment!.content,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getEventColor(BuildContext context) {
    switch (activity.eventType) {
      case 'created':
        return Colors.blue;
      case 'status_changed':
        return Colors.orange;
      case 'assigned':
      case 'reassigned':
      case 'claimed':
        return Colors.purple;
      case 'comment_added':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getEventIcon() {
    switch (activity.eventType) {
      case 'created':
        return Icons.add;
      case 'status_changed':
        return Icons.swap_horiz;
      case 'assigned':
        return Icons.person_add;
      case 'reassigned':
        return Icons.people;
      case 'claimed':
        return Icons.person;
      case 'comment_added':
        return Icons.comment;
      default:
        return Icons.info;
    }
  }

  String _getEventDescription() {
    switch (activity.eventType) {
      case 'created':
        return 'Ticket created';
      case 'status_changed':
        return 'Status changed';
      case 'assigned':
        return 'Assigned';
      case 'reassigned':
        return 'Reassigned';
      case 'claimed':
        return 'Ticket claimed';
      case 'comment_added':
        return 'Comment added';
      default:
        return activity.eventDisplayName;
    }
  }
}
