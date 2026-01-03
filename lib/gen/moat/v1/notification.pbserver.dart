//
//  Generated code. Do not modify.
//  source: moat/v1/notification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'notification.pb.dart' as $4;
import 'notification.pbjson.dart';

export 'notification.pb.dart';

abstract class NotificationServiceBase extends $pb.GeneratedService {
  $async.Future<$4.GetNotificationsResponse> getNotifications($pb.ServerContext ctx, $4.GetNotificationsRequest request);
  $async.Future<$4.GetUnreadCountResponse> getUnreadCount($pb.ServerContext ctx, $4.GetUnreadCountRequest request);
  $async.Future<$4.MarkAsReadResponse> markAsRead($pb.ServerContext ctx, $4.MarkAsReadRequest request);
  $async.Future<$4.MarkAllAsReadResponse> markAllAsRead($pb.ServerContext ctx, $4.MarkAllAsReadRequest request);
  $async.Future<$4.DeleteNotificationResponse> deleteNotification($pb.ServerContext ctx, $4.DeleteNotificationRequest request);
  $async.Future<$4.GetNotificationPreferencesResponse> getNotificationPreferences($pb.ServerContext ctx, $4.GetNotificationPreferencesRequest request);
  $async.Future<$4.UpdateNotificationPreferencesResponse> updateNotificationPreferences($pb.ServerContext ctx, $4.UpdateNotificationPreferencesRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'GetNotifications': return $4.GetNotificationsRequest();
      case 'GetUnreadCount': return $4.GetUnreadCountRequest();
      case 'MarkAsRead': return $4.MarkAsReadRequest();
      case 'MarkAllAsRead': return $4.MarkAllAsReadRequest();
      case 'DeleteNotification': return $4.DeleteNotificationRequest();
      case 'GetNotificationPreferences': return $4.GetNotificationPreferencesRequest();
      case 'UpdateNotificationPreferences': return $4.UpdateNotificationPreferencesRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'GetNotifications': return this.getNotifications(ctx, request as $4.GetNotificationsRequest);
      case 'GetUnreadCount': return this.getUnreadCount(ctx, request as $4.GetUnreadCountRequest);
      case 'MarkAsRead': return this.markAsRead(ctx, request as $4.MarkAsReadRequest);
      case 'MarkAllAsRead': return this.markAllAsRead(ctx, request as $4.MarkAllAsReadRequest);
      case 'DeleteNotification': return this.deleteNotification(ctx, request as $4.DeleteNotificationRequest);
      case 'GetNotificationPreferences': return this.getNotificationPreferences(ctx, request as $4.GetNotificationPreferencesRequest);
      case 'UpdateNotificationPreferences': return this.updateNotificationPreferences(ctx, request as $4.UpdateNotificationPreferencesRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => NotificationServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => NotificationServiceBase$messageJson;
}

