import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/notification.pb.dart';

/// ConnectRPC client for NotificationService.
///
/// Uses generated protobuf types and the ConnectRPC transport for type-safe
/// RPC calls.
@lazySingleton
class NotificationServiceClient {
  final Client _client;

  NotificationServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.NotificationService';

  // ============================================================================
  // Notification RPCs
  // ============================================================================

  Future<GetNotificationsResponse> getNotifications(
      GetNotificationsRequest request) {
    return _client.unary(
      Spec<GetNotificationsRequest, GetNotificationsResponse>(
        '$_service/GetNotifications',
        StreamType.unary,
        GetNotificationsRequest.create,
        GetNotificationsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GetUnreadCountResponse> getUnreadCount(GetUnreadCountRequest request) {
    return _client.unary(
      Spec<GetUnreadCountRequest, GetUnreadCountResponse>(
        '$_service/GetUnreadCount',
        StreamType.unary,
        GetUnreadCountRequest.create,
        GetUnreadCountResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<MarkAsReadResponse> markAsRead(MarkAsReadRequest request) {
    return _client.unary(
      Spec<MarkAsReadRequest, MarkAsReadResponse>(
        '$_service/MarkAsRead',
        StreamType.unary,
        MarkAsReadRequest.create,
        MarkAsReadResponse.create,
      ),
      request,
    );
  }

  Future<MarkAllAsReadResponse> markAllAsRead(MarkAllAsReadRequest request) {
    return _client.unary(
      Spec<MarkAllAsReadRequest, MarkAllAsReadResponse>(
        '$_service/MarkAllAsRead',
        StreamType.unary,
        MarkAllAsReadRequest.create,
        MarkAllAsReadResponse.create,
      ),
      request,
    );
  }

  Future<DeleteNotificationResponse> deleteNotification(
      DeleteNotificationRequest request) {
    return _client.unary(
      Spec<DeleteNotificationRequest, DeleteNotificationResponse>(
        '$_service/DeleteNotification',
        StreamType.unary,
        DeleteNotificationRequest.create,
        DeleteNotificationResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Notification Preferences RPCs
  // ============================================================================

  Future<GetNotificationPreferencesResponse> getNotificationPreferences(
      GetNotificationPreferencesRequest request) {
    return _client.unary(
      Spec<GetNotificationPreferencesRequest,
          GetNotificationPreferencesResponse>(
        '$_service/GetNotificationPreferences',
        StreamType.unary,
        GetNotificationPreferencesRequest.create,
        GetNotificationPreferencesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<UpdateNotificationPreferencesResponse> updateNotificationPreferences(
      UpdateNotificationPreferencesRequest request) {
    return _client.unary(
      Spec<UpdateNotificationPreferencesRequest,
          UpdateNotificationPreferencesResponse>(
        '$_service/UpdateNotificationPreferences',
        StreamType.unary,
        UpdateNotificationPreferencesRequest.create,
        UpdateNotificationPreferencesResponse.create,
      ),
      request,
    );
  }
}
