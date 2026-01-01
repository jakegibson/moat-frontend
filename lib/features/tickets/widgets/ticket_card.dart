import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/task_models.dart';
import 'ticket_status_badge.dart';

class TicketCard extends StatelessWidget {
  final TaskWithDetails task;
  final VoidCallback? onTap;

  const TicketCard({
    required this.task,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // External ID badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      task.externalId ?? task.id.substring(0, 8),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Task type
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      task.taskType.displayName,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TicketStatusBadge(status: task.status, size: TicketStatusBadgeSize.small),
                ],
              ),
              const SizedBox(height: 12),
              // Title
              Text(
                task.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              // Location
              if (task.locationName != null || task.specificLocation != null)
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        task.fullLocationName,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 12),
              // Bottom row
              Row(
                children: [
                  // Assignee
                  if (task.assigneeName != null) ...[
                    CircleAvatar(
                      radius: 12,
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      child: Text(
                        task.assigneeName![0].toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      task.assigneeName!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ] else ...[
                    Icon(
                      Icons.person_outline,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Unassigned',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                  const Spacer(),
                  // Date info
                  if (task.isOverdue) ...[
                    Icon(
                      Icons.warning,
                      size: 14,
                      color: Colors.red.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Overdue',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.red.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ] else if (task.dueDate != null) ...[
                    Icon(
                      Icons.schedule,
                      size: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Due ${dateFormat.format(task.dueDate!)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ] else ...[
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dateFormat.format(task.scheduledDate),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
