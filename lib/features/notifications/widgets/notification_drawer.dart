import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../tickets/data/task_client.dart';
import '../data/notification_client.dart';
import '../state/notification_state.dart';

/// Notification drawer matching Figma design
class NotificationDrawer extends StatefulWidget {
  const NotificationDrawer({super.key});

  @override
  State<NotificationDrawer> createState() => _NotificationDrawerState();
}

class _NotificationDrawerState extends State<NotificationDrawer> {
  late final NotificationState _state;
  late final TaskClient _taskClient;

  @override
  void initState() {
    super.initState();
    _state = getIt<NotificationState>();
    _taskClient = getIt<TaskClient>();
    _state.fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(-4, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildHeader(context),

          // Content
          Expanded(
            child: Watch((context) {
              final isLoading = _state.isLoading.value;
              final error = _state.error.value;
              final notifications = _state.notifications.value;

              if (isLoading && notifications.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (error != null && notifications.isEmpty) {
                return _buildErrorState(context, error);
              }

              if (notifications.isEmpty) {
                return _buildEmptyState(context);
              }

              return _buildNotificationList(context, notifications);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Close button
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F4F6), // Light gray background
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.close, size: 18, color: Color(0xFF374151)),
              onPressed: () => Navigator.of(context).pop(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          const SizedBox(height: 20),
          // Title
          Text(
            'Notifications',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF111827), // Dark text
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 64,
              color: Color(0xFF9CA3AF),
            ),
            SizedBox(height: 16),
            Text(
              'No notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "You're all caught up!",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Color(0xFFEF4444), // Red
            ),
            const SizedBox(height: 16),
            const Text(
              'Failed to load notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF6B7280),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => _state.fetchNotifications(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(
      BuildContext context, List<AppNotification> notifications) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _NotificationItem(
          notification: notification,
          onTap: () => _handleNotificationTap(context, notification),
          onDismiss: () => _state.deleteNotification(notification.id),
        );
      },
    );
  }

  Future<void> _handleNotificationTap(
      BuildContext context, AppNotification notification) async {
    // Mark as read if unread
    if (notification.isUnread) {
      await _state.markAsRead(notification.id);
    }

    // For task notifications, fetch the task to get its external_id for navigation
    String? taskExternalId;
    if (notification.taskId != null && notification.taskId!.isNotEmpty) {
      try {
        final task = await _taskClient.getTask(notification.taskId!);
        taskExternalId = task.externalId;
      } catch (e) {
        debugPrint('Error fetching task: $e');
      }
    }

    // Close the drawer
    if (context.mounted) {
      Navigator.of(context).pop();
    }

    // Navigate to the related entity
    if (context.mounted) {
      _navigateToEntity(context, notification, taskExternalId: taskExternalId);
    }
  }

  void _navigateToEntity(
    BuildContext context,
    AppNotification notification, {
    String? taskExternalId,
  }) {
    if (notification.taskId != null && notification.taskId!.isNotEmpty) {
      // Navigate to ticket detail page using external_id
      if (taskExternalId != null && taskExternalId.isNotEmpty) {
        context.go('/tickets/$taskExternalId');
      } else {
        // Fallback to tickets list if external_id is not available
        context.go('/tickets/list');
      }
    } else if (notification.assetId != null &&
        notification.assetId!.isNotEmpty) {
      // Navigate to asset detail
      context.go('/assets/${notification.assetId}');
    } else {
      // Default: go to home/assets
      context.go('/assets/list');
    }
  }
}

class _NotificationItem extends StatelessWidget {
  final AppNotification notification;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const _NotificationItem({
    required this.notification,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismiss(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        color: const Color(0xFFEF4444), // Red
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Unread indicator (blue dot)
              if (notification.isUnread)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 6, right: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFF3B82F6), // Blue color from design
                    shape: BoxShape.circle,
                  ),
                )
              else
                const SizedBox(width: 20), // Space for alignment when read

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title row with timestamp
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: notification.isUnread
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: const Color(0xFF111827), // Dark text
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatRelativeTime(notification.createdAt),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280), // Gray text
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    // Subtitle (location info if available)
                    if (notification.subtitle != null &&
                        notification.subtitle!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          notification.subtitle!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6B7280), // Gray text
                          ),
                        ),
                      ),
                    // Message/activity description
                    Text(
                      notification.message,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280), // Gray text
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Format time as relative (e.g., "5 min ago", "2 hours ago", "4 days ago")
  String _formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return '$minutes min ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }
}
