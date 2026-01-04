import 'package:injectable/injectable.dart';

import '../../../core/transport/notification_service_client.dart';
import '../../../gen/moat/v1/notification.pb.dart';

/// Notification model for the UI layer
class AppNotification {
  final String id;
  final String notificationType;
  final String title;
  final String message;
  final String? subtitle; // Location info like "Classroom 14 • Hill Valley High"
  final String? entityType;
  final String? taskId;
  final String? assetId;
  final DateTime? readAt;
  final DateTime createdAt;

  const AppNotification({
    required this.id,
    required this.notificationType,
    required this.title,
    required this.message,
    this.subtitle,
    this.entityType,
    this.taskId,
    this.assetId,
    this.readAt,
    required this.createdAt,
  });

  bool get isUnread => readAt == null;

  factory AppNotification.fromProto(Notification proto) {
    // Extract subtitle from data struct if available
    String? subtitle;
    if (proto.hasData()) {
      final data = proto.data;
      final fields = data.fields;

      // Try to build subtitle from location/asset info
      final parts = <String>[];

      if (fields.containsKey('asset_name')) {
        final assetName = fields['asset_name']?.stringValue;
        if (assetName != null && assetName.isNotEmpty) {
          parts.add(assetName);
        }
      }

      if (fields.containsKey('location_name')) {
        final locationName = fields['location_name']?.stringValue;
        if (locationName != null && locationName.isNotEmpty) {
          parts.add(locationName);
        }
      }

      if (parts.isNotEmpty) {
        subtitle = parts.join(' • ');
      }
    }

    return AppNotification(
      id: proto.id,
      notificationType: proto.notificationType,
      title: proto.title,
      message: proto.message,
      subtitle: subtitle,
      entityType: proto.hasEntityType() ? proto.entityType : null,
      taskId: proto.hasTaskId() ? proto.taskId : null,
      assetId: proto.hasAssetId() ? proto.assetId : null,
      readAt: proto.hasReadAt() ? proto.readAt.toDateTime() : null,
      createdAt: proto.hasCreatedAt()
          ? proto.createdAt.toDateTime()
          : DateTime.now(),
    );
  }
}

/// Client wrapper for notification operations
@lazySingleton
class NotificationClient {
  final NotificationServiceClient _rpc;

  NotificationClient(this._rpc);

  /// Get notifications for the current user
  Future<List<AppNotification>> getNotifications({
    int limit = 50,
    int offset = 0,
    bool? unreadOnly,
  }) async {
    final request = GetNotificationsRequest(
      limit: limit,
      offset: offset,
    );
    if (unreadOnly != null) {
      request.unreadOnly = unreadOnly;
    }

    final response = await _rpc.getNotifications(request);
    return response.notifications.map(AppNotification.fromProto).toList();
  }

  /// Get unread notification count
  Future<int> getUnreadCount() async {
    final response = await _rpc.getUnreadCount(GetUnreadCountRequest());
    return response.unreadCount;
  }

  /// Mark a notification as read
  Future<void> markAsRead(String notificationId) async {
    await _rpc.markAsRead(MarkAsReadRequest(notificationId: notificationId));
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead() async {
    await _rpc.markAllAsRead(MarkAllAsReadRequest());
  }

  /// Delete a notification
  Future<void> deleteNotification(String notificationId) async {
    await _rpc.deleteNotification(DeleteNotificationRequest(notificationId: notificationId));
  }
}
