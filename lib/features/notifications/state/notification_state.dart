import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../data/notification_client.dart';

/// State management for notifications using Signals
@lazySingleton
class NotificationState {
  final NotificationClient _client;

  NotificationState(this._client);

  // Signals for reactive state
  final notifications = signal<List<AppNotification>>([]);
  final unreadCount = signal<int>(0);
  final isLoading = signal<bool>(false);
  final error = signal<String?>(null);

  /// Fetch notifications from the API
  Future<void> fetchNotifications({bool? unreadOnly}) async {
    isLoading.value = true;
    error.value = null;

    try {
      final items = await _client.getNotifications(unreadOnly: unreadOnly);
      notifications.value = items;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch unread count
  Future<void> fetchUnreadCount() async {
    try {
      unreadCount.value = await _client.getUnreadCount();
    } catch (e) {
      // Silently fail for badge count
    }
  }

  /// Mark a notification as read
  Future<void> markAsRead(String notificationId) async {
    try {
      await _client.markAsRead(notificationId);
      // Update local state
      notifications.value = notifications.value.map((n) {
        if (n.id == notificationId) {
          return AppNotification(
            id: n.id,
            notificationType: n.notificationType,
            title: n.title,
            message: n.message,
            subtitle: n.subtitle,
            entityType: n.entityType,
            taskId: n.taskId,
            assetId: n.assetId,
            readAt: DateTime.now(),
            createdAt: n.createdAt,
          );
        }
        return n;
      }).toList();
      // Update unread count
      unreadCount.value = notifications.value.where((n) => n.isUnread).length;
    } catch (e) {
      // Ignore errors - don't block UI
    }
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead() async {
    try {
      await _client.markAllAsRead();
      // Update local state
      final now = DateTime.now();
      notifications.value = notifications.value.map((n) {
        return AppNotification(
          id: n.id,
          notificationType: n.notificationType,
          title: n.title,
          message: n.message,
          subtitle: n.subtitle,
          entityType: n.entityType,
          taskId: n.taskId,
          assetId: n.assetId,
          readAt: now,
          createdAt: n.createdAt,
        );
      }).toList();
      unreadCount.value = 0;
    } catch (e) {
      error.value = e.toString();
    }
  }

  /// Delete a notification
  Future<void> deleteNotification(String notificationId) async {
    try {
      await _client.deleteNotification(notificationId);
      notifications.value =
          notifications.value.where((n) => n.id != notificationId).toList();
      unreadCount.value = notifications.value.where((n) => n.isUnread).length;
    } catch (e) {
      error.value = e.toString();
    }
  }
}
