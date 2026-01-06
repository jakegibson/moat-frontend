//
//  Generated code. Do not modify.
//  source: moat/v1/notification.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/struct.pb.dart' as $1;
import '../../google/protobuf/timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Notification extends $pb.GeneratedMessage {
  factory Notification({
    $core.String? id,
    $core.String? notificationType,
    $core.String? title,
    $core.String? message,
    $core.String? entityType,
    $core.String? taskId,
    $core.String? assetId,
    $1.Struct? data,
    $0.Timestamp? readAt,
    $0.Timestamp? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (notificationType != null) {
      $result.notificationType = notificationType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (message != null) {
      $result.message = message;
    }
    if (entityType != null) {
      $result.entityType = entityType;
    }
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (data != null) {
      $result.data = data;
    }
    if (readAt != null) {
      $result.readAt = readAt;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  Notification._() : super();
  factory Notification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'notificationType')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..aOS(5, _omitFieldNames ? '' : 'entityType')
    ..aOS(6, _omitFieldNames ? '' : 'taskId')
    ..aOS(7, _omitFieldNames ? '' : 'assetId')
    ..aOM<$1.Struct>(8, _omitFieldNames ? '' : 'data', subBuilder: $1.Struct.create)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'readAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification clone() => Notification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification copyWith(void Function(Notification) updates) => super.copyWith((message) => updates(message as Notification)) as Notification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification create() => Notification._();
  Notification createEmptyInstance() => create();
  static $pb.PbList<Notification> createRepeated() => $pb.PbList<Notification>();
  @$core.pragma('dart2js:noInline')
  static Notification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification>(create);
  static Notification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get notificationType => $_getSZ(1);
  @$pb.TagNumber(2)
  set notificationType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNotificationType() => $_has(1);
  @$pb.TagNumber(2)
  void clearNotificationType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get entityType => $_getSZ(4);
  @$pb.TagNumber(5)
  set entityType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEntityType() => $_has(4);
  @$pb.TagNumber(5)
  void clearEntityType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get taskId => $_getSZ(5);
  @$pb.TagNumber(6)
  set taskId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTaskId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTaskId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get assetId => $_getSZ(6);
  @$pb.TagNumber(7)
  set assetId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAssetId() => $_has(6);
  @$pb.TagNumber(7)
  void clearAssetId() => $_clearField(7);

  @$pb.TagNumber(8)
  $1.Struct get data => $_getN(7);
  @$pb.TagNumber(8)
  set data($1.Struct v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasData() => $_has(7);
  @$pb.TagNumber(8)
  void clearData() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Struct ensureData() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Timestamp get readAt => $_getN(8);
  @$pb.TagNumber(9)
  set readAt($0.Timestamp v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasReadAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearReadAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureReadAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(10)
  set createdAt($0.Timestamp v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureCreatedAt() => $_ensure(9);
}

class GetNotificationsRequest extends $pb.GeneratedMessage {
  factory GetNotificationsRequest({
    $core.bool? unreadOnly,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (unreadOnly != null) {
      $result.unreadOnly = unreadOnly;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetNotificationsRequest._() : super();
  factory GetNotificationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'unreadOnly')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationsRequest clone() => GetNotificationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationsRequest copyWith(void Function(GetNotificationsRequest) updates) => super.copyWith((message) => updates(message as GetNotificationsRequest)) as GetNotificationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationsRequest create() => GetNotificationsRequest._();
  GetNotificationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetNotificationsRequest> createRepeated() => $pb.PbList<GetNotificationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationsRequest>(create);
  static GetNotificationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get unreadOnly => $_getBF(0);
  @$pb.TagNumber(1)
  set unreadOnly($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnreadOnly() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnreadOnly() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);
}

class GetNotificationsResponse extends $pb.GeneratedMessage {
  factory GetNotificationsResponse({
    $core.Iterable<Notification>? notifications,
    $core.int? totalCount,
    $core.int? unreadCount,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (notifications != null) {
      $result.notifications.addAll(notifications);
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    if (unreadCount != null) {
      $result.unreadCount = unreadCount;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetNotificationsResponse._() : super();
  factory GetNotificationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<Notification>(1, _omitFieldNames ? '' : 'notifications', $pb.PbFieldType.PM, subBuilder: Notification.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'unreadCount', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationsResponse clone() => GetNotificationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationsResponse copyWith(void Function(GetNotificationsResponse) updates) => super.copyWith((message) => updates(message as GetNotificationsResponse)) as GetNotificationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationsResponse create() => GetNotificationsResponse._();
  GetNotificationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetNotificationsResponse> createRepeated() => $pb.PbList<GetNotificationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationsResponse>(create);
  static GetNotificationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Notification> get notifications => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get unreadCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set unreadCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUnreadCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnreadCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get offset => $_getIZ(4);
  @$pb.TagNumber(5)
  set offset($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOffset() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffset() => $_clearField(5);
}

class GetUnreadCountRequest extends $pb.GeneratedMessage {
  factory GetUnreadCountRequest() => create();
  GetUnreadCountRequest._() : super();
  factory GetUnreadCountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUnreadCountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUnreadCountRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUnreadCountRequest clone() => GetUnreadCountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUnreadCountRequest copyWith(void Function(GetUnreadCountRequest) updates) => super.copyWith((message) => updates(message as GetUnreadCountRequest)) as GetUnreadCountRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUnreadCountRequest create() => GetUnreadCountRequest._();
  GetUnreadCountRequest createEmptyInstance() => create();
  static $pb.PbList<GetUnreadCountRequest> createRepeated() => $pb.PbList<GetUnreadCountRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUnreadCountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUnreadCountRequest>(create);
  static GetUnreadCountRequest? _defaultInstance;
}

class GetUnreadCountResponse extends $pb.GeneratedMessage {
  factory GetUnreadCountResponse({
    $core.int? unreadCount,
  }) {
    final $result = create();
    if (unreadCount != null) {
      $result.unreadCount = unreadCount;
    }
    return $result;
  }
  GetUnreadCountResponse._() : super();
  factory GetUnreadCountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUnreadCountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUnreadCountResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'unreadCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUnreadCountResponse clone() => GetUnreadCountResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUnreadCountResponse copyWith(void Function(GetUnreadCountResponse) updates) => super.copyWith((message) => updates(message as GetUnreadCountResponse)) as GetUnreadCountResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUnreadCountResponse create() => GetUnreadCountResponse._();
  GetUnreadCountResponse createEmptyInstance() => create();
  static $pb.PbList<GetUnreadCountResponse> createRepeated() => $pb.PbList<GetUnreadCountResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUnreadCountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUnreadCountResponse>(create);
  static GetUnreadCountResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unreadCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set unreadCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnreadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnreadCount() => $_clearField(1);
}

class MarkAsReadRequest extends $pb.GeneratedMessage {
  factory MarkAsReadRequest({
    $core.String? notificationId,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    return $result;
  }
  MarkAsReadRequest._() : super();
  factory MarkAsReadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkAsReadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkAsReadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'notificationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkAsReadRequest clone() => MarkAsReadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkAsReadRequest copyWith(void Function(MarkAsReadRequest) updates) => super.copyWith((message) => updates(message as MarkAsReadRequest)) as MarkAsReadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkAsReadRequest create() => MarkAsReadRequest._();
  MarkAsReadRequest createEmptyInstance() => create();
  static $pb.PbList<MarkAsReadRequest> createRepeated() => $pb.PbList<MarkAsReadRequest>();
  @$core.pragma('dart2js:noInline')
  static MarkAsReadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkAsReadRequest>(create);
  static MarkAsReadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get notificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => $_clearField(1);
}

class MarkAsReadResponse extends $pb.GeneratedMessage {
  factory MarkAsReadResponse() => create();
  MarkAsReadResponse._() : super();
  factory MarkAsReadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkAsReadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkAsReadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkAsReadResponse clone() => MarkAsReadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkAsReadResponse copyWith(void Function(MarkAsReadResponse) updates) => super.copyWith((message) => updates(message as MarkAsReadResponse)) as MarkAsReadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkAsReadResponse create() => MarkAsReadResponse._();
  MarkAsReadResponse createEmptyInstance() => create();
  static $pb.PbList<MarkAsReadResponse> createRepeated() => $pb.PbList<MarkAsReadResponse>();
  @$core.pragma('dart2js:noInline')
  static MarkAsReadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkAsReadResponse>(create);
  static MarkAsReadResponse? _defaultInstance;
}

class MarkAllAsReadRequest extends $pb.GeneratedMessage {
  factory MarkAllAsReadRequest() => create();
  MarkAllAsReadRequest._() : super();
  factory MarkAllAsReadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkAllAsReadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkAllAsReadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkAllAsReadRequest clone() => MarkAllAsReadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkAllAsReadRequest copyWith(void Function(MarkAllAsReadRequest) updates) => super.copyWith((message) => updates(message as MarkAllAsReadRequest)) as MarkAllAsReadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkAllAsReadRequest create() => MarkAllAsReadRequest._();
  MarkAllAsReadRequest createEmptyInstance() => create();
  static $pb.PbList<MarkAllAsReadRequest> createRepeated() => $pb.PbList<MarkAllAsReadRequest>();
  @$core.pragma('dart2js:noInline')
  static MarkAllAsReadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkAllAsReadRequest>(create);
  static MarkAllAsReadRequest? _defaultInstance;
}

class MarkAllAsReadResponse extends $pb.GeneratedMessage {
  factory MarkAllAsReadResponse({
    $core.int? markedReadCount,
  }) {
    final $result = create();
    if (markedReadCount != null) {
      $result.markedReadCount = markedReadCount;
    }
    return $result;
  }
  MarkAllAsReadResponse._() : super();
  factory MarkAllAsReadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkAllAsReadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkAllAsReadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'markedReadCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkAllAsReadResponse clone() => MarkAllAsReadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkAllAsReadResponse copyWith(void Function(MarkAllAsReadResponse) updates) => super.copyWith((message) => updates(message as MarkAllAsReadResponse)) as MarkAllAsReadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkAllAsReadResponse create() => MarkAllAsReadResponse._();
  MarkAllAsReadResponse createEmptyInstance() => create();
  static $pb.PbList<MarkAllAsReadResponse> createRepeated() => $pb.PbList<MarkAllAsReadResponse>();
  @$core.pragma('dart2js:noInline')
  static MarkAllAsReadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkAllAsReadResponse>(create);
  static MarkAllAsReadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get markedReadCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set markedReadCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarkedReadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarkedReadCount() => $_clearField(1);
}

class DeleteNotificationRequest extends $pb.GeneratedMessage {
  factory DeleteNotificationRequest({
    $core.String? notificationId,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    return $result;
  }
  DeleteNotificationRequest._() : super();
  factory DeleteNotificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteNotificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteNotificationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'notificationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteNotificationRequest clone() => DeleteNotificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteNotificationRequest copyWith(void Function(DeleteNotificationRequest) updates) => super.copyWith((message) => updates(message as DeleteNotificationRequest)) as DeleteNotificationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteNotificationRequest create() => DeleteNotificationRequest._();
  DeleteNotificationRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteNotificationRequest> createRepeated() => $pb.PbList<DeleteNotificationRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteNotificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteNotificationRequest>(create);
  static DeleteNotificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get notificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => $_clearField(1);
}

class DeleteNotificationResponse extends $pb.GeneratedMessage {
  factory DeleteNotificationResponse() => create();
  DeleteNotificationResponse._() : super();
  factory DeleteNotificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteNotificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteNotificationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteNotificationResponse clone() => DeleteNotificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteNotificationResponse copyWith(void Function(DeleteNotificationResponse) updates) => super.copyWith((message) => updates(message as DeleteNotificationResponse)) as DeleteNotificationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteNotificationResponse create() => DeleteNotificationResponse._();
  DeleteNotificationResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteNotificationResponse> createRepeated() => $pb.PbList<DeleteNotificationResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteNotificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteNotificationResponse>(create);
  static DeleteNotificationResponse? _defaultInstance;
}

class NotificationPreference extends $pb.GeneratedMessage {
  factory NotificationPreference({
    $core.String? id,
    $core.String? notificationType,
    $core.bool? inAppEnabled,
    $core.bool? emailEnabled,
    $core.bool? pushEnabled,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (notificationType != null) {
      $result.notificationType = notificationType;
    }
    if (inAppEnabled != null) {
      $result.inAppEnabled = inAppEnabled;
    }
    if (emailEnabled != null) {
      $result.emailEnabled = emailEnabled;
    }
    if (pushEnabled != null) {
      $result.pushEnabled = pushEnabled;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  NotificationPreference._() : super();
  factory NotificationPreference.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationPreference.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationPreference', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'notificationType')
    ..aOB(3, _omitFieldNames ? '' : 'inAppEnabled')
    ..aOB(4, _omitFieldNames ? '' : 'emailEnabled')
    ..aOB(5, _omitFieldNames ? '' : 'pushEnabled')
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationPreference clone() => NotificationPreference()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationPreference copyWith(void Function(NotificationPreference) updates) => super.copyWith((message) => updates(message as NotificationPreference)) as NotificationPreference;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationPreference create() => NotificationPreference._();
  NotificationPreference createEmptyInstance() => create();
  static $pb.PbList<NotificationPreference> createRepeated() => $pb.PbList<NotificationPreference>();
  @$core.pragma('dart2js:noInline')
  static NotificationPreference getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationPreference>(create);
  static NotificationPreference? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get notificationType => $_getSZ(1);
  @$pb.TagNumber(2)
  set notificationType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNotificationType() => $_has(1);
  @$pb.TagNumber(2)
  void clearNotificationType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get inAppEnabled => $_getBF(2);
  @$pb.TagNumber(3)
  set inAppEnabled($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInAppEnabled() => $_has(2);
  @$pb.TagNumber(3)
  void clearInAppEnabled() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get emailEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set emailEnabled($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmailEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmailEnabled() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get pushEnabled => $_getBF(4);
  @$pb.TagNumber(5)
  set pushEnabled($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPushEnabled() => $_has(4);
  @$pb.TagNumber(5)
  void clearPushEnabled() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($0.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($0.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureUpdatedAt() => $_ensure(6);
}

class GetNotificationPreferencesRequest extends $pb.GeneratedMessage {
  factory GetNotificationPreferencesRequest() => create();
  GetNotificationPreferencesRequest._() : super();
  factory GetNotificationPreferencesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationPreferencesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationPreferencesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationPreferencesRequest clone() => GetNotificationPreferencesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationPreferencesRequest copyWith(void Function(GetNotificationPreferencesRequest) updates) => super.copyWith((message) => updates(message as GetNotificationPreferencesRequest)) as GetNotificationPreferencesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationPreferencesRequest create() => GetNotificationPreferencesRequest._();
  GetNotificationPreferencesRequest createEmptyInstance() => create();
  static $pb.PbList<GetNotificationPreferencesRequest> createRepeated() => $pb.PbList<GetNotificationPreferencesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationPreferencesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationPreferencesRequest>(create);
  static GetNotificationPreferencesRequest? _defaultInstance;
}

class GetNotificationPreferencesResponse extends $pb.GeneratedMessage {
  factory GetNotificationPreferencesResponse({
    $core.Iterable<NotificationPreference>? preferences,
  }) {
    final $result = create();
    if (preferences != null) {
      $result.preferences.addAll(preferences);
    }
    return $result;
  }
  GetNotificationPreferencesResponse._() : super();
  factory GetNotificationPreferencesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationPreferencesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationPreferencesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<NotificationPreference>(1, _omitFieldNames ? '' : 'preferences', $pb.PbFieldType.PM, subBuilder: NotificationPreference.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationPreferencesResponse clone() => GetNotificationPreferencesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationPreferencesResponse copyWith(void Function(GetNotificationPreferencesResponse) updates) => super.copyWith((message) => updates(message as GetNotificationPreferencesResponse)) as GetNotificationPreferencesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationPreferencesResponse create() => GetNotificationPreferencesResponse._();
  GetNotificationPreferencesResponse createEmptyInstance() => create();
  static $pb.PbList<GetNotificationPreferencesResponse> createRepeated() => $pb.PbList<GetNotificationPreferencesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationPreferencesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationPreferencesResponse>(create);
  static GetNotificationPreferencesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NotificationPreference> get preferences => $_getList(0);
}

class NotificationPreferenceUpdate extends $pb.GeneratedMessage {
  factory NotificationPreferenceUpdate({
    $core.String? notificationType,
    $core.bool? inAppEnabled,
    $core.bool? emailEnabled,
    $core.bool? pushEnabled,
  }) {
    final $result = create();
    if (notificationType != null) {
      $result.notificationType = notificationType;
    }
    if (inAppEnabled != null) {
      $result.inAppEnabled = inAppEnabled;
    }
    if (emailEnabled != null) {
      $result.emailEnabled = emailEnabled;
    }
    if (pushEnabled != null) {
      $result.pushEnabled = pushEnabled;
    }
    return $result;
  }
  NotificationPreferenceUpdate._() : super();
  factory NotificationPreferenceUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationPreferenceUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationPreferenceUpdate', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'notificationType')
    ..aOB(2, _omitFieldNames ? '' : 'inAppEnabled')
    ..aOB(3, _omitFieldNames ? '' : 'emailEnabled')
    ..aOB(4, _omitFieldNames ? '' : 'pushEnabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationPreferenceUpdate clone() => NotificationPreferenceUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationPreferenceUpdate copyWith(void Function(NotificationPreferenceUpdate) updates) => super.copyWith((message) => updates(message as NotificationPreferenceUpdate)) as NotificationPreferenceUpdate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationPreferenceUpdate create() => NotificationPreferenceUpdate._();
  NotificationPreferenceUpdate createEmptyInstance() => create();
  static $pb.PbList<NotificationPreferenceUpdate> createRepeated() => $pb.PbList<NotificationPreferenceUpdate>();
  @$core.pragma('dart2js:noInline')
  static NotificationPreferenceUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationPreferenceUpdate>(create);
  static NotificationPreferenceUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get notificationType => $_getSZ(0);
  @$pb.TagNumber(1)
  set notificationType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get inAppEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set inAppEnabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInAppEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearInAppEnabled() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get emailEnabled => $_getBF(2);
  @$pb.TagNumber(3)
  set emailEnabled($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmailEnabled() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmailEnabled() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get pushEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set pushEnabled($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPushEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearPushEnabled() => $_clearField(4);
}

class UpdateNotificationPreferencesRequest extends $pb.GeneratedMessage {
  factory UpdateNotificationPreferencesRequest({
    $core.Iterable<NotificationPreferenceUpdate>? preferences,
  }) {
    final $result = create();
    if (preferences != null) {
      $result.preferences.addAll(preferences);
    }
    return $result;
  }
  UpdateNotificationPreferencesRequest._() : super();
  factory UpdateNotificationPreferencesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNotificationPreferencesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNotificationPreferencesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<NotificationPreferenceUpdate>(1, _omitFieldNames ? '' : 'preferences', $pb.PbFieldType.PM, subBuilder: NotificationPreferenceUpdate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNotificationPreferencesRequest clone() => UpdateNotificationPreferencesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNotificationPreferencesRequest copyWith(void Function(UpdateNotificationPreferencesRequest) updates) => super.copyWith((message) => updates(message as UpdateNotificationPreferencesRequest)) as UpdateNotificationPreferencesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNotificationPreferencesRequest create() => UpdateNotificationPreferencesRequest._();
  UpdateNotificationPreferencesRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateNotificationPreferencesRequest> createRepeated() => $pb.PbList<UpdateNotificationPreferencesRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateNotificationPreferencesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNotificationPreferencesRequest>(create);
  static UpdateNotificationPreferencesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NotificationPreferenceUpdate> get preferences => $_getList(0);
}

class UpdateNotificationPreferencesResponse extends $pb.GeneratedMessage {
  factory UpdateNotificationPreferencesResponse() => create();
  UpdateNotificationPreferencesResponse._() : super();
  factory UpdateNotificationPreferencesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNotificationPreferencesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNotificationPreferencesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNotificationPreferencesResponse clone() => UpdateNotificationPreferencesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNotificationPreferencesResponse copyWith(void Function(UpdateNotificationPreferencesResponse) updates) => super.copyWith((message) => updates(message as UpdateNotificationPreferencesResponse)) as UpdateNotificationPreferencesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNotificationPreferencesResponse create() => UpdateNotificationPreferencesResponse._();
  UpdateNotificationPreferencesResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateNotificationPreferencesResponse> createRepeated() => $pb.PbList<UpdateNotificationPreferencesResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateNotificationPreferencesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNotificationPreferencesResponse>(create);
  static UpdateNotificationPreferencesResponse? _defaultInstance;
}

/// NotificationService handles user notifications.
class NotificationServiceApi {
  $pb.RpcClient _client;
  NotificationServiceApi(this._client);

  /// GetNotifications returns paginated list of notifications for the current user.
  $async.Future<GetNotificationsResponse> getNotifications($pb.ClientContext? ctx, GetNotificationsRequest request) =>
    _client.invoke<GetNotificationsResponse>(ctx, 'NotificationService', 'GetNotifications', request, GetNotificationsResponse())
  ;
  /// GetUnreadCount returns the count of unread notifications (for badge display).
  $async.Future<GetUnreadCountResponse> getUnreadCount($pb.ClientContext? ctx, GetUnreadCountRequest request) =>
    _client.invoke<GetUnreadCountResponse>(ctx, 'NotificationService', 'GetUnreadCount', request, GetUnreadCountResponse())
  ;
  /// MarkAsRead marks a notification as read.
  $async.Future<MarkAsReadResponse> markAsRead($pb.ClientContext? ctx, MarkAsReadRequest request) =>
    _client.invoke<MarkAsReadResponse>(ctx, 'NotificationService', 'MarkAsRead', request, MarkAsReadResponse())
  ;
  /// MarkAllAsRead marks all notifications as read for the current user.
  $async.Future<MarkAllAsReadResponse> markAllAsRead($pb.ClientContext? ctx, MarkAllAsReadRequest request) =>
    _client.invoke<MarkAllAsReadResponse>(ctx, 'NotificationService', 'MarkAllAsRead', request, MarkAllAsReadResponse())
  ;
  /// DeleteNotification deletes a notification.
  $async.Future<DeleteNotificationResponse> deleteNotification($pb.ClientContext? ctx, DeleteNotificationRequest request) =>
    _client.invoke<DeleteNotificationResponse>(ctx, 'NotificationService', 'DeleteNotification', request, DeleteNotificationResponse())
  ;
  /// GetNotificationPreferences returns the user's notification preferences.
  $async.Future<GetNotificationPreferencesResponse> getNotificationPreferences($pb.ClientContext? ctx, GetNotificationPreferencesRequest request) =>
    _client.invoke<GetNotificationPreferencesResponse>(ctx, 'NotificationService', 'GetNotificationPreferences', request, GetNotificationPreferencesResponse())
  ;
  /// UpdateNotificationPreferences updates the user's notification preferences.
  $async.Future<UpdateNotificationPreferencesResponse> updateNotificationPreferences($pb.ClientContext? ctx, UpdateNotificationPreferencesRequest request) =>
    _client.invoke<UpdateNotificationPreferencesResponse>(ctx, 'NotificationService', 'UpdateNotificationPreferences', request, UpdateNotificationPreferencesResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
