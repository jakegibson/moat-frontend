//
//  Generated code. Do not modify.
//  source: moat/v1/notification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/struct.pbjson.dart' as $3;
import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use notificationDescriptor instead')
const Notification$json = {
  '1': 'Notification',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'notification_type', '3': 2, '4': 1, '5': 9, '10': 'notificationType'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    {'1': 'entity_type', '3': 5, '4': 1, '5': 9, '10': 'entityType'},
    {'1': 'task_id', '3': 6, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'asset_id', '3': 7, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'data', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'data'},
    {'1': 'read_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'readAt'},
    {'1': 'created_at', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `Notification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationDescriptor = $convert.base64Decode(
    'CgxOb3RpZmljYXRpb24SDgoCaWQYASABKAlSAmlkEisKEW5vdGlmaWNhdGlvbl90eXBlGAIgAS'
    'gJUhBub3RpZmljYXRpb25UeXBlEhQKBXRpdGxlGAMgASgJUgV0aXRsZRIYCgdtZXNzYWdlGAQg'
    'ASgJUgdtZXNzYWdlEh8KC2VudGl0eV90eXBlGAUgASgJUgplbnRpdHlUeXBlEhcKB3Rhc2tfaW'
    'QYBiABKAlSBnRhc2tJZBIZCghhc3NldF9pZBgHIAEoCVIHYXNzZXRJZBIrCgRkYXRhGAggASgL'
    'MhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFIEZGF0YRIzCgdyZWFkX2F0GAkgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIGcmVhZEF0EjkKCmNyZWF0ZWRfYXQYCiABKAsyGi5nb29n'
    'bGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use getNotificationsRequestDescriptor instead')
const GetNotificationsRequest$json = {
  '1': 'GetNotificationsRequest',
  '2': [
    {'1': 'unread_only', '3': 1, '4': 1, '5': 8, '10': 'unreadOnly'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetNotificationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationsRequestDescriptor = $convert.base64Decode(
    'ChdHZXROb3RpZmljYXRpb25zUmVxdWVzdBIfCgt1bnJlYWRfb25seRgBIAEoCFIKdW5yZWFkT2'
    '5seRIUCgVsaW1pdBgCIAEoBVIFbGltaXQSFgoGb2Zmc2V0GAMgASgFUgZvZmZzZXQ=');

@$core.Deprecated('Use getNotificationsResponseDescriptor instead')
const GetNotificationsResponse$json = {
  '1': 'GetNotificationsResponse',
  '2': [
    {'1': 'notifications', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.Notification', '10': 'notifications'},
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'unread_count', '3': 3, '4': 1, '5': 5, '10': 'unreadCount'},
    {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetNotificationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationsResponseDescriptor = $convert.base64Decode(
    'ChhHZXROb3RpZmljYXRpb25zUmVzcG9uc2USOwoNbm90aWZpY2F0aW9ucxgBIAMoCzIVLm1vYX'
    'QudjEuTm90aWZpY2F0aW9uUg1ub3RpZmljYXRpb25zEh8KC3RvdGFsX2NvdW50GAIgASgFUgp0'
    'b3RhbENvdW50EiEKDHVucmVhZF9jb3VudBgDIAEoBVILdW5yZWFkQ291bnQSFAoFbGltaXQYBC'
    'ABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0');

@$core.Deprecated('Use getUnreadCountRequestDescriptor instead')
const GetUnreadCountRequest$json = {
  '1': 'GetUnreadCountRequest',
};

/// Descriptor for `GetUnreadCountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnreadCountRequestDescriptor = $convert.base64Decode(
    'ChVHZXRVbnJlYWRDb3VudFJlcXVlc3Q=');

@$core.Deprecated('Use getUnreadCountResponseDescriptor instead')
const GetUnreadCountResponse$json = {
  '1': 'GetUnreadCountResponse',
  '2': [
    {'1': 'unread_count', '3': 1, '4': 1, '5': 5, '10': 'unreadCount'},
  ],
};

/// Descriptor for `GetUnreadCountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnreadCountResponseDescriptor = $convert.base64Decode(
    'ChZHZXRVbnJlYWRDb3VudFJlc3BvbnNlEiEKDHVucmVhZF9jb3VudBgBIAEoBVILdW5yZWFkQ2'
    '91bnQ=');

@$core.Deprecated('Use markAsReadRequestDescriptor instead')
const MarkAsReadRequest$json = {
  '1': 'MarkAsReadRequest',
  '2': [
    {'1': 'notification_id', '3': 1, '4': 1, '5': 9, '10': 'notificationId'},
  ],
};

/// Descriptor for `MarkAsReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAsReadRequestDescriptor = $convert.base64Decode(
    'ChFNYXJrQXNSZWFkUmVxdWVzdBInCg9ub3RpZmljYXRpb25faWQYASABKAlSDm5vdGlmaWNhdG'
    'lvbklk');

@$core.Deprecated('Use markAsReadResponseDescriptor instead')
const MarkAsReadResponse$json = {
  '1': 'MarkAsReadResponse',
};

/// Descriptor for `MarkAsReadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAsReadResponseDescriptor = $convert.base64Decode(
    'ChJNYXJrQXNSZWFkUmVzcG9uc2U=');

@$core.Deprecated('Use markAllAsReadRequestDescriptor instead')
const MarkAllAsReadRequest$json = {
  '1': 'MarkAllAsReadRequest',
};

/// Descriptor for `MarkAllAsReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAllAsReadRequestDescriptor = $convert.base64Decode(
    'ChRNYXJrQWxsQXNSZWFkUmVxdWVzdA==');

@$core.Deprecated('Use markAllAsReadResponseDescriptor instead')
const MarkAllAsReadResponse$json = {
  '1': 'MarkAllAsReadResponse',
  '2': [
    {'1': 'marked_read_count', '3': 1, '4': 1, '5': 5, '10': 'markedReadCount'},
  ],
};

/// Descriptor for `MarkAllAsReadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAllAsReadResponseDescriptor = $convert.base64Decode(
    'ChVNYXJrQWxsQXNSZWFkUmVzcG9uc2USKgoRbWFya2VkX3JlYWRfY291bnQYASABKAVSD21hcm'
    'tlZFJlYWRDb3VudA==');

@$core.Deprecated('Use deleteNotificationRequestDescriptor instead')
const DeleteNotificationRequest$json = {
  '1': 'DeleteNotificationRequest',
  '2': [
    {'1': 'notification_id', '3': 1, '4': 1, '5': 9, '10': 'notificationId'},
  ],
};

/// Descriptor for `DeleteNotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteNotificationRequestDescriptor = $convert.base64Decode(
    'ChlEZWxldGVOb3RpZmljYXRpb25SZXF1ZXN0EicKD25vdGlmaWNhdGlvbl9pZBgBIAEoCVIObm'
    '90aWZpY2F0aW9uSWQ=');

@$core.Deprecated('Use deleteNotificationResponseDescriptor instead')
const DeleteNotificationResponse$json = {
  '1': 'DeleteNotificationResponse',
};

/// Descriptor for `DeleteNotificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteNotificationResponseDescriptor = $convert.base64Decode(
    'ChpEZWxldGVOb3RpZmljYXRpb25SZXNwb25zZQ==');

@$core.Deprecated('Use notificationPreferenceDescriptor instead')
const NotificationPreference$json = {
  '1': 'NotificationPreference',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'notification_type', '3': 2, '4': 1, '5': 9, '10': 'notificationType'},
    {'1': 'in_app_enabled', '3': 3, '4': 1, '5': 8, '10': 'inAppEnabled'},
    {'1': 'email_enabled', '3': 4, '4': 1, '5': 8, '10': 'emailEnabled'},
    {'1': 'push_enabled', '3': 5, '4': 1, '5': 8, '10': 'pushEnabled'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `NotificationPreference`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationPreferenceDescriptor = $convert.base64Decode(
    'ChZOb3RpZmljYXRpb25QcmVmZXJlbmNlEg4KAmlkGAEgASgJUgJpZBIrChFub3RpZmljYXRpb2'
    '5fdHlwZRgCIAEoCVIQbm90aWZpY2F0aW9uVHlwZRIkCg5pbl9hcHBfZW5hYmxlZBgDIAEoCFIM'
    'aW5BcHBFbmFibGVkEiMKDWVtYWlsX2VuYWJsZWQYBCABKAhSDGVtYWlsRW5hYmxlZBIhCgxwdX'
    'NoX2VuYWJsZWQYBSABKAhSC3B1c2hFbmFibGVkEjkKCmNyZWF0ZWRfYXQYBiABKAsyGi5nb29n'
    'bGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgHIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use getNotificationPreferencesRequestDescriptor instead')
const GetNotificationPreferencesRequest$json = {
  '1': 'GetNotificationPreferencesRequest',
};

/// Descriptor for `GetNotificationPreferencesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationPreferencesRequestDescriptor = $convert.base64Decode(
    'CiFHZXROb3RpZmljYXRpb25QcmVmZXJlbmNlc1JlcXVlc3Q=');

@$core.Deprecated('Use getNotificationPreferencesResponseDescriptor instead')
const GetNotificationPreferencesResponse$json = {
  '1': 'GetNotificationPreferencesResponse',
  '2': [
    {'1': 'preferences', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.NotificationPreference', '10': 'preferences'},
  ],
};

/// Descriptor for `GetNotificationPreferencesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationPreferencesResponseDescriptor = $convert.base64Decode(
    'CiJHZXROb3RpZmljYXRpb25QcmVmZXJlbmNlc1Jlc3BvbnNlEkEKC3ByZWZlcmVuY2VzGAEgAy'
    'gLMh8ubW9hdC52MS5Ob3RpZmljYXRpb25QcmVmZXJlbmNlUgtwcmVmZXJlbmNlcw==');

@$core.Deprecated('Use notificationPreferenceUpdateDescriptor instead')
const NotificationPreferenceUpdate$json = {
  '1': 'NotificationPreferenceUpdate',
  '2': [
    {'1': 'notification_type', '3': 1, '4': 1, '5': 9, '10': 'notificationType'},
    {'1': 'in_app_enabled', '3': 2, '4': 1, '5': 8, '10': 'inAppEnabled'},
    {'1': 'email_enabled', '3': 3, '4': 1, '5': 8, '10': 'emailEnabled'},
    {'1': 'push_enabled', '3': 4, '4': 1, '5': 8, '10': 'pushEnabled'},
  ],
};

/// Descriptor for `NotificationPreferenceUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationPreferenceUpdateDescriptor = $convert.base64Decode(
    'ChxOb3RpZmljYXRpb25QcmVmZXJlbmNlVXBkYXRlEisKEW5vdGlmaWNhdGlvbl90eXBlGAEgAS'
    'gJUhBub3RpZmljYXRpb25UeXBlEiQKDmluX2FwcF9lbmFibGVkGAIgASgIUgxpbkFwcEVuYWJs'
    'ZWQSIwoNZW1haWxfZW5hYmxlZBgDIAEoCFIMZW1haWxFbmFibGVkEiEKDHB1c2hfZW5hYmxlZB'
    'gEIAEoCFILcHVzaEVuYWJsZWQ=');

@$core.Deprecated('Use updateNotificationPreferencesRequestDescriptor instead')
const UpdateNotificationPreferencesRequest$json = {
  '1': 'UpdateNotificationPreferencesRequest',
  '2': [
    {'1': 'preferences', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.NotificationPreferenceUpdate', '10': 'preferences'},
  ],
};

/// Descriptor for `UpdateNotificationPreferencesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNotificationPreferencesRequestDescriptor = $convert.base64Decode(
    'CiRVcGRhdGVOb3RpZmljYXRpb25QcmVmZXJlbmNlc1JlcXVlc3QSRwoLcHJlZmVyZW5jZXMYAS'
    'ADKAsyJS5tb2F0LnYxLk5vdGlmaWNhdGlvblByZWZlcmVuY2VVcGRhdGVSC3ByZWZlcmVuY2Vz');

@$core.Deprecated('Use updateNotificationPreferencesResponseDescriptor instead')
const UpdateNotificationPreferencesResponse$json = {
  '1': 'UpdateNotificationPreferencesResponse',
};

/// Descriptor for `UpdateNotificationPreferencesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNotificationPreferencesResponseDescriptor = $convert.base64Decode(
    'CiVVcGRhdGVOb3RpZmljYXRpb25QcmVmZXJlbmNlc1Jlc3BvbnNl');

const $core.Map<$core.String, $core.dynamic> NotificationServiceBase$json = {
  '1': 'NotificationService',
  '2': [
    {'1': 'GetNotifications', '2': '.moat.v1.GetNotificationsRequest', '3': '.moat.v1.GetNotificationsResponse'},
    {'1': 'GetUnreadCount', '2': '.moat.v1.GetUnreadCountRequest', '3': '.moat.v1.GetUnreadCountResponse'},
    {'1': 'MarkAsRead', '2': '.moat.v1.MarkAsReadRequest', '3': '.moat.v1.MarkAsReadResponse'},
    {'1': 'MarkAllAsRead', '2': '.moat.v1.MarkAllAsReadRequest', '3': '.moat.v1.MarkAllAsReadResponse'},
    {'1': 'DeleteNotification', '2': '.moat.v1.DeleteNotificationRequest', '3': '.moat.v1.DeleteNotificationResponse'},
    {'1': 'GetNotificationPreferences', '2': '.moat.v1.GetNotificationPreferencesRequest', '3': '.moat.v1.GetNotificationPreferencesResponse'},
    {'1': 'UpdateNotificationPreferences', '2': '.moat.v1.UpdateNotificationPreferencesRequest', '3': '.moat.v1.UpdateNotificationPreferencesResponse'},
  ],
};

@$core.Deprecated('Use notificationServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> NotificationServiceBase$messageJson = {
  '.moat.v1.GetNotificationsRequest': GetNotificationsRequest$json,
  '.moat.v1.GetNotificationsResponse': GetNotificationsResponse$json,
  '.moat.v1.Notification': Notification$json,
  '.google.protobuf.Struct': $3.Struct$json,
  '.google.protobuf.Struct.FieldsEntry': $3.Struct_FieldsEntry$json,
  '.google.protobuf.Value': $3.Value$json,
  '.google.protobuf.ListValue': $3.ListValue$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.moat.v1.GetUnreadCountRequest': GetUnreadCountRequest$json,
  '.moat.v1.GetUnreadCountResponse': GetUnreadCountResponse$json,
  '.moat.v1.MarkAsReadRequest': MarkAsReadRequest$json,
  '.moat.v1.MarkAsReadResponse': MarkAsReadResponse$json,
  '.moat.v1.MarkAllAsReadRequest': MarkAllAsReadRequest$json,
  '.moat.v1.MarkAllAsReadResponse': MarkAllAsReadResponse$json,
  '.moat.v1.DeleteNotificationRequest': DeleteNotificationRequest$json,
  '.moat.v1.DeleteNotificationResponse': DeleteNotificationResponse$json,
  '.moat.v1.GetNotificationPreferencesRequest': GetNotificationPreferencesRequest$json,
  '.moat.v1.GetNotificationPreferencesResponse': GetNotificationPreferencesResponse$json,
  '.moat.v1.NotificationPreference': NotificationPreference$json,
  '.moat.v1.UpdateNotificationPreferencesRequest': UpdateNotificationPreferencesRequest$json,
  '.moat.v1.NotificationPreferenceUpdate': NotificationPreferenceUpdate$json,
  '.moat.v1.UpdateNotificationPreferencesResponse': UpdateNotificationPreferencesResponse$json,
};

/// Descriptor for `NotificationService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List notificationServiceDescriptor = $convert.base64Decode(
    'ChNOb3RpZmljYXRpb25TZXJ2aWNlElcKEEdldE5vdGlmaWNhdGlvbnMSIC5tb2F0LnYxLkdldE'
    '5vdGlmaWNhdGlvbnNSZXF1ZXN0GiEubW9hdC52MS5HZXROb3RpZmljYXRpb25zUmVzcG9uc2US'
    'UQoOR2V0VW5yZWFkQ291bnQSHi5tb2F0LnYxLkdldFVucmVhZENvdW50UmVxdWVzdBofLm1vYX'
    'QudjEuR2V0VW5yZWFkQ291bnRSZXNwb25zZRJFCgpNYXJrQXNSZWFkEhoubW9hdC52MS5NYXJr'
    'QXNSZWFkUmVxdWVzdBobLm1vYXQudjEuTWFya0FzUmVhZFJlc3BvbnNlEk4KDU1hcmtBbGxBc1'
    'JlYWQSHS5tb2F0LnYxLk1hcmtBbGxBc1JlYWRSZXF1ZXN0Gh4ubW9hdC52MS5NYXJrQWxsQXNS'
    'ZWFkUmVzcG9uc2USXQoSRGVsZXRlTm90aWZpY2F0aW9uEiIubW9hdC52MS5EZWxldGVOb3RpZm'
    'ljYXRpb25SZXF1ZXN0GiMubW9hdC52MS5EZWxldGVOb3RpZmljYXRpb25SZXNwb25zZRJ1ChpH'
    'ZXROb3RpZmljYXRpb25QcmVmZXJlbmNlcxIqLm1vYXQudjEuR2V0Tm90aWZpY2F0aW9uUHJlZm'
    'VyZW5jZXNSZXF1ZXN0GisubW9hdC52MS5HZXROb3RpZmljYXRpb25QcmVmZXJlbmNlc1Jlc3Bv'
    'bnNlEn4KHVVwZGF0ZU5vdGlmaWNhdGlvblByZWZlcmVuY2VzEi0ubW9hdC52MS5VcGRhdGVOb3'
    'RpZmljYXRpb25QcmVmZXJlbmNlc1JlcXVlc3QaLi5tb2F0LnYxLlVwZGF0ZU5vdGlmaWNhdGlv'
    'blByZWZlcmVuY2VzUmVzcG9uc2U=');

