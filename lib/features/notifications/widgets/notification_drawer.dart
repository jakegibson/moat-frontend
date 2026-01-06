import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/drawer_shell.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
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
    return DrawerShell(
      title: 'Notifications',
      width: 400,
      scrollableBody: false,
      bodyPadding: EdgeInsets.zero,
      body: Watch((context) {
        final isLoading = _state.isLoading.value;
        final error = _state.error.value;
        final notifications = _state.notifications.value;

        if (isLoading && notifications.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error != null && notifications.isEmpty) {
          return _buildErrorState(context, error.message);
        }

        if (notifications.isEmpty) {
          return _buildEmptyState(context);
        }

        return _buildNotificationList(context, notifications);
      }),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.spacing3XL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 64,
              color: AppColors.textTertiary,
            ),
            SizedBox(height: AppSizes.spacingXL),
            Text(
              'No notifications',
              style: AppTextStyles.textMDSemiBold,
            ),
            SizedBox(height: AppSizes.spacingMD),
            Text(
              "You're all caught up!",
              style: AppTextStyles.textSMSecondary,
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
        padding: EdgeInsets.all(AppSizes.spacing3XL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.utilityError500,
            ),
            SizedBox(height: AppSizes.spacingXL),
            Text(
              'Failed to load notifications',
              style: AppTextStyles.textMDSemiBold,
            ),
            SizedBox(height: AppSizes.spacingMD),
            Text(
              error,
              style: AppTextStyles.textXSSecondary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spacingXL),
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
        padding: EdgeInsets.only(right: AppSizes.spacingXL),
        color: AppColors.utilityError500,
        child: Icon(
          Icons.delete_outline,
          color: AppColors.white,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacing2XL,
            vertical: AppSizes.spacingXL,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Unread indicator (blue dot)
              if (notification.isUnread)
                Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.only(
                    top: AppSizes.spacingSM,
                    right: AppSizes.spacingLG,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                )
              else
                SizedBox(width: AppSizes.spacing2XL), // Space for alignment when read

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
                            style: notification.isUnread
                                ? AppTextStyles.textSMSemibold
                                : AppTextStyles.textSMMedium,
                          ),
                        ),
                        SizedBox(width: AppSizes.spacingMD),
                        Text(
                          _formatRelativeTime(notification.createdAt),
                          style: AppTextStyles.textXSSecondary,
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.spacingXXS),
                    // Subtitle (location info if available)
                    if (notification.subtitle != null &&
                        notification.subtitle!.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.spacingXXS),
                        child: Text(
                          notification.subtitle!,
                          style: AppTextStyles.textXSSecondary,
                        ),
                      ),
                    // Message/activity description
                    Text(
                      notification.message,
                      style: AppTextStyles.textXSSecondary,
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
