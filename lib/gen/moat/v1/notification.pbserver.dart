//
//  Generated code. Do not modify.
//  source: moat/v1/notification.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'notification.pb.dart' as $7;
import 'notification.pbjson.dart';

export 'notification.pb.dart';

abstract class NotificationServiceBase extends $pb.GeneratedService {
  $async.Future<$7.GetNotificationsResponse> getNotifications($pb.ServerContext ctx, $7.GetNotificationsRequest request);
  $async.Future<$7.GetUnreadCountResponse> getUnreadCount($pb.ServerContext ctx, $7.GetUnreadCountRequest request);
  $async.Future<$7.MarkAsReadResponse> markAsRead($pb.ServerContext ctx, $7.MarkAsReadRequest request);
  $async.Future<$7.MarkAllAsReadResponse> markAllAsRead($pb.ServerContext ctx, $7.MarkAllAsReadRequest request);
  $async.Future<$7.DeleteNotificationResponse> deleteNotification($pb.ServerContext ctx, $7.DeleteNotificationRequest request);
  $async.Future<$7.GetNotificationPreferencesResponse> getNotificationPreferences($pb.ServerContext ctx, $7.GetNotificationPreferencesRequest request);
  $async.Future<$7.UpdateNotificationPreferencesResponse> updateNotificationPreferences($pb.ServerContext ctx, $7.UpdateNotificationPreferencesRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'GetNotifications': return $7.GetNotificationsRequest();
      case 'GetUnreadCount': return $7.GetUnreadCountRequest();
      case 'MarkAsRead': return $7.MarkAsReadRequest();
      case 'MarkAllAsRead': return $7.MarkAllAsReadRequest();
      case 'DeleteNotification': return $7.DeleteNotificationRequest();
      case 'GetNotificationPreferences': return $7.GetNotificationPreferencesRequest();
      case 'UpdateNotificationPreferences': return $7.UpdateNotificationPreferencesRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'GetNotifications': return this.getNotifications(ctx, request as $7.GetNotificationsRequest);
      case 'GetUnreadCount': return this.getUnreadCount(ctx, request as $7.GetUnreadCountRequest);
      case 'MarkAsRead': return this.markAsRead(ctx, request as $7.MarkAsReadRequest);
      case 'MarkAllAsRead': return this.markAllAsRead(ctx, request as $7.MarkAllAsReadRequest);
      case 'DeleteNotification': return this.deleteNotification(ctx, request as $7.DeleteNotificationRequest);
      case 'GetNotificationPreferences': return this.getNotificationPreferences(ctx, request as $7.GetNotificationPreferencesRequest);
      case 'UpdateNotificationPreferences': return this.updateNotificationPreferences(ctx, request as $7.UpdateNotificationPreferencesRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => NotificationServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => NotificationServiceBase$messageJson;
}

