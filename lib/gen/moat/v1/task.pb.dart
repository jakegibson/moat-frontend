//
//  Generated code. Do not modify.
//  source: moat/v1/task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/struct.pb.dart' as $2;
import '../../google/protobuf/timestamp.pb.dart' as $1;
import 'task.pbenum.dart';

export 'task.pbenum.dart';

class TaskDef extends $pb.GeneratedMessage {
  factory TaskDef({
    $core.String? id,
    $core.String? companyId,
    $core.String? assetId,
    $core.String? locationId,
    $core.String? fileId,
    TaskType? taskType,
    $core.String? title,
    $core.String? description,
    $core.bool? isEnabled,
    $core.String? recurrenceRule,
    $1.Timestamp? recurrenceStart,
    $1.Timestamp? recurrenceEnd,
    $1.Timestamp? nextRunAt,
    $core.String? taskId,
    $core.String? specificLocation,
    $2.Struct? details,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (recurrenceRule != null) {
      $result.recurrenceRule = recurrenceRule;
    }
    if (recurrenceStart != null) {
      $result.recurrenceStart = recurrenceStart;
    }
    if (recurrenceEnd != null) {
      $result.recurrenceEnd = recurrenceEnd;
    }
    if (nextRunAt != null) {
      $result.nextRunAt = nextRunAt;
    }
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (specificLocation != null) {
      $result.specificLocation = specificLocation;
    }
    if (details != null) {
      $result.details = details;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  TaskDef._() : super();
  factory TaskDef.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskDef.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskDef', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'companyId')
    ..aOS(3, _omitFieldNames ? '' : 'assetId')
    ..aOS(4, _omitFieldNames ? '' : 'locationId')
    ..aOS(5, _omitFieldNames ? '' : 'fileId')
    ..e<TaskType>(6, _omitFieldNames ? '' : 'taskType', $pb.PbFieldType.OE, defaultOrMaker: TaskType.TASK_TYPE_UNSPECIFIED, valueOf: TaskType.valueOf, enumValues: TaskType.values)
    ..aOS(7, _omitFieldNames ? '' : 'title')
    ..aOS(8, _omitFieldNames ? '' : 'description')
    ..aOB(9, _omitFieldNames ? '' : 'isEnabled')
    ..aOS(10, _omitFieldNames ? '' : 'recurrenceRule')
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'recurrenceStart', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(12, _omitFieldNames ? '' : 'recurrenceEnd', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(13, _omitFieldNames ? '' : 'nextRunAt', subBuilder: $1.Timestamp.create)
    ..aOS(14, _omitFieldNames ? '' : 'taskId')
    ..aOS(15, _omitFieldNames ? '' : 'specificLocation')
    ..aOM<$2.Struct>(16, _omitFieldNames ? '' : 'details', subBuilder: $2.Struct.create)
    ..aOM<$1.Timestamp>(17, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(18, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskDef clone() => TaskDef()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskDef copyWith(void Function(TaskDef) updates) => super.copyWith((message) => updates(message as TaskDef)) as TaskDef;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskDef create() => TaskDef._();
  TaskDef createEmptyInstance() => create();
  static $pb.PbList<TaskDef> createRepeated() => $pb.PbList<TaskDef>();
  @$core.pragma('dart2js:noInline')
  static TaskDef getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskDef>(create);
  static TaskDef? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get assetId => $_getSZ(2);
  @$pb.TagNumber(3)
  set assetId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get locationId => $_getSZ(3);
  @$pb.TagNumber(4)
  set locationId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocationId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocationId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get fileId => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileId() => clearField(5);

  @$pb.TagNumber(6)
  TaskType get taskType => $_getN(5);
  @$pb.TagNumber(6)
  set taskType(TaskType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTaskType() => $_has(5);
  @$pb.TagNumber(6)
  void clearTaskType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get title => $_getSZ(6);
  @$pb.TagNumber(7)
  set title($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isEnabled => $_getBF(8);
  @$pb.TagNumber(9)
  set isEnabled($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsEnabled() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsEnabled() => clearField(9);

  /// iCal RRULE format for recurring tasks. NULL/empty for one-time tasks.
  @$pb.TagNumber(10)
  $core.String get recurrenceRule => $_getSZ(9);
  @$pb.TagNumber(10)
  set recurrenceRule($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRecurrenceRule() => $_has(9);
  @$pb.TagNumber(10)
  void clearRecurrenceRule() => clearField(10);

  @$pb.TagNumber(11)
  $1.Timestamp get recurrenceStart => $_getN(10);
  @$pb.TagNumber(11)
  set recurrenceStart($1.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRecurrenceStart() => $_has(10);
  @$pb.TagNumber(11)
  void clearRecurrenceStart() => clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureRecurrenceStart() => $_ensure(10);

  @$pb.TagNumber(12)
  $1.Timestamp get recurrenceEnd => $_getN(11);
  @$pb.TagNumber(12)
  set recurrenceEnd($1.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasRecurrenceEnd() => $_has(11);
  @$pb.TagNumber(12)
  void clearRecurrenceEnd() => clearField(12);
  @$pb.TagNumber(12)
  $1.Timestamp ensureRecurrenceEnd() => $_ensure(11);

  @$pb.TagNumber(13)
  $1.Timestamp get nextRunAt => $_getN(12);
  @$pb.TagNumber(13)
  set nextRunAt($1.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasNextRunAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearNextRunAt() => clearField(13);
  @$pb.TagNumber(13)
  $1.Timestamp ensureNextRunAt() => $_ensure(12);

  /// For one-time tasks, the ID of the immediately created task.
  @$pb.TagNumber(14)
  $core.String get taskId => $_getSZ(13);
  @$pb.TagNumber(14)
  set taskId($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasTaskId() => $_has(13);
  @$pb.TagNumber(14)
  void clearTaskId() => clearField(14);

  /// Specific location text (e.g., "Room 101")
  @$pb.TagNumber(15)
  $core.String get specificLocation => $_getSZ(14);
  @$pb.TagNumber(15)
  set specificLocation($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSpecificLocation() => $_has(14);
  @$pb.TagNumber(15)
  void clearSpecificLocation() => clearField(15);

  /// Task-specific configuration as JSON.
  @$pb.TagNumber(16)
  $2.Struct get details => $_getN(15);
  @$pb.TagNumber(16)
  set details($2.Struct v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasDetails() => $_has(15);
  @$pb.TagNumber(16)
  void clearDetails() => clearField(16);
  @$pb.TagNumber(16)
  $2.Struct ensureDetails() => $_ensure(15);

  @$pb.TagNumber(17)
  $1.Timestamp get createdAt => $_getN(16);
  @$pb.TagNumber(17)
  set createdAt($1.Timestamp v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasCreatedAt() => $_has(16);
  @$pb.TagNumber(17)
  void clearCreatedAt() => clearField(17);
  @$pb.TagNumber(17)
  $1.Timestamp ensureCreatedAt() => $_ensure(16);

  @$pb.TagNumber(18)
  $1.Timestamp get updatedAt => $_getN(17);
  @$pb.TagNumber(18)
  set updatedAt($1.Timestamp v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasUpdatedAt() => $_has(17);
  @$pb.TagNumber(18)
  void clearUpdatedAt() => clearField(18);
  @$pb.TagNumber(18)
  $1.Timestamp ensureUpdatedAt() => $_ensure(17);
}

class CreateTaskDefRequest extends $pb.GeneratedMessage {
  factory CreateTaskDefRequest({
    $core.String? assetId,
    $core.String? locationId,
    $core.String? fileId,
    TaskType? taskType,
    $core.String? title,
    $core.String? description,
    $core.bool? isEnabled,
    $core.String? recurrenceRule,
    $1.Timestamp? recurrenceStart,
    $1.Timestamp? recurrenceEnd,
    $core.String? specificLocation,
    $2.Struct? details,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (recurrenceRule != null) {
      $result.recurrenceRule = recurrenceRule;
    }
    if (recurrenceStart != null) {
      $result.recurrenceStart = recurrenceStart;
    }
    if (recurrenceEnd != null) {
      $result.recurrenceEnd = recurrenceEnd;
    }
    if (specificLocation != null) {
      $result.specificLocation = specificLocation;
    }
    if (details != null) {
      $result.details = details;
    }
    return $result;
  }
  CreateTaskDefRequest._() : super();
  factory CreateTaskDefRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTaskDefRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTaskDefRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..aOS(2, _omitFieldNames ? '' : 'locationId')
    ..aOS(3, _omitFieldNames ? '' : 'fileId')
    ..e<TaskType>(4, _omitFieldNames ? '' : 'taskType', $pb.PbFieldType.OE, defaultOrMaker: TaskType.TASK_TYPE_UNSPECIFIED, valueOf: TaskType.valueOf, enumValues: TaskType.values)
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOB(7, _omitFieldNames ? '' : 'isEnabled')
    ..aOS(8, _omitFieldNames ? '' : 'recurrenceRule')
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'recurrenceStart', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'recurrenceEnd', subBuilder: $1.Timestamp.create)
    ..aOS(11, _omitFieldNames ? '' : 'specificLocation')
    ..aOM<$2.Struct>(12, _omitFieldNames ? '' : 'details', subBuilder: $2.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTaskDefRequest clone() => CreateTaskDefRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTaskDefRequest copyWith(void Function(CreateTaskDefRequest) updates) => super.copyWith((message) => updates(message as CreateTaskDefRequest)) as CreateTaskDefRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTaskDefRequest create() => CreateTaskDefRequest._();
  CreateTaskDefRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTaskDefRequest> createRepeated() => $pb.PbList<CreateTaskDefRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTaskDefRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTaskDefRequest>(create);
  static CreateTaskDefRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get locationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set locationId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocationId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileId() => clearField(3);

  @$pb.TagNumber(4)
  TaskType get taskType => $_getN(3);
  @$pb.TagNumber(4)
  set taskType(TaskType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTaskType() => $_has(3);
  @$pb.TagNumber(4)
  void clearTaskType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isEnabled => $_getBF(6);
  @$pb.TagNumber(7)
  set isEnabled($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsEnabled() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsEnabled() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get recurrenceRule => $_getSZ(7);
  @$pb.TagNumber(8)
  set recurrenceRule($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRecurrenceRule() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecurrenceRule() => clearField(8);

  @$pb.TagNumber(9)
  $1.Timestamp get recurrenceStart => $_getN(8);
  @$pb.TagNumber(9)
  set recurrenceStart($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasRecurrenceStart() => $_has(8);
  @$pb.TagNumber(9)
  void clearRecurrenceStart() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureRecurrenceStart() => $_ensure(8);

  @$pb.TagNumber(10)
  $1.Timestamp get recurrenceEnd => $_getN(9);
  @$pb.TagNumber(10)
  set recurrenceEnd($1.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRecurrenceEnd() => $_has(9);
  @$pb.TagNumber(10)
  void clearRecurrenceEnd() => clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureRecurrenceEnd() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get specificLocation => $_getSZ(10);
  @$pb.TagNumber(11)
  set specificLocation($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSpecificLocation() => $_has(10);
  @$pb.TagNumber(11)
  void clearSpecificLocation() => clearField(11);

  @$pb.TagNumber(12)
  $2.Struct get details => $_getN(11);
  @$pb.TagNumber(12)
  set details($2.Struct v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasDetails() => $_has(11);
  @$pb.TagNumber(12)
  void clearDetails() => clearField(12);
  @$pb.TagNumber(12)
  $2.Struct ensureDetails() => $_ensure(11);
}

class GetTaskDefRequest extends $pb.GeneratedMessage {
  factory GetTaskDefRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetTaskDefRequest._() : super();
  factory GetTaskDefRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskDefRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskDefRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskDefRequest clone() => GetTaskDefRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskDefRequest copyWith(void Function(GetTaskDefRequest) updates) => super.copyWith((message) => updates(message as GetTaskDefRequest)) as GetTaskDefRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskDefRequest create() => GetTaskDefRequest._();
  GetTaskDefRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskDefRequest> createRepeated() => $pb.PbList<GetTaskDefRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskDefRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskDefRequest>(create);
  static GetTaskDefRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class UpdateTaskDefRequest extends $pb.GeneratedMessage {
  factory UpdateTaskDefRequest({
    $core.String? id,
    TaskType? taskType,
    $core.String? title,
    $core.String? description,
    $core.bool? isEnabled,
    $core.String? recurrenceRule,
    $1.Timestamp? recurrenceStart,
    $1.Timestamp? recurrenceEnd,
    $core.String? specificLocation,
    $2.Struct? details,
    $core.String? fileId,
    $core.String? locationId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (recurrenceRule != null) {
      $result.recurrenceRule = recurrenceRule;
    }
    if (recurrenceStart != null) {
      $result.recurrenceStart = recurrenceStart;
    }
    if (recurrenceEnd != null) {
      $result.recurrenceEnd = recurrenceEnd;
    }
    if (specificLocation != null) {
      $result.specificLocation = specificLocation;
    }
    if (details != null) {
      $result.details = details;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    return $result;
  }
  UpdateTaskDefRequest._() : super();
  factory UpdateTaskDefRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTaskDefRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTaskDefRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<TaskType>(2, _omitFieldNames ? '' : 'taskType', $pb.PbFieldType.OE, defaultOrMaker: TaskType.TASK_TYPE_UNSPECIFIED, valueOf: TaskType.valueOf, enumValues: TaskType.values)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOB(5, _omitFieldNames ? '' : 'isEnabled')
    ..aOS(6, _omitFieldNames ? '' : 'recurrenceRule')
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'recurrenceStart', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'recurrenceEnd', subBuilder: $1.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'specificLocation')
    ..aOM<$2.Struct>(10, _omitFieldNames ? '' : 'details', subBuilder: $2.Struct.create)
    ..aOS(11, _omitFieldNames ? '' : 'fileId')
    ..aOS(12, _omitFieldNames ? '' : 'locationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTaskDefRequest clone() => UpdateTaskDefRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTaskDefRequest copyWith(void Function(UpdateTaskDefRequest) updates) => super.copyWith((message) => updates(message as UpdateTaskDefRequest)) as UpdateTaskDefRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTaskDefRequest create() => UpdateTaskDefRequest._();
  UpdateTaskDefRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTaskDefRequest> createRepeated() => $pb.PbList<UpdateTaskDefRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTaskDefRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTaskDefRequest>(create);
  static UpdateTaskDefRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  TaskType get taskType => $_getN(1);
  @$pb.TagNumber(2)
  set taskType(TaskType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isEnabled => $_getBF(4);
  @$pb.TagNumber(5)
  set isEnabled($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsEnabled() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsEnabled() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get recurrenceRule => $_getSZ(5);
  @$pb.TagNumber(6)
  set recurrenceRule($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRecurrenceRule() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecurrenceRule() => clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get recurrenceStart => $_getN(6);
  @$pb.TagNumber(7)
  set recurrenceStart($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasRecurrenceStart() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecurrenceStart() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureRecurrenceStart() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Timestamp get recurrenceEnd => $_getN(7);
  @$pb.TagNumber(8)
  set recurrenceEnd($1.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasRecurrenceEnd() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecurrenceEnd() => clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureRecurrenceEnd() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get specificLocation => $_getSZ(8);
  @$pb.TagNumber(9)
  set specificLocation($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSpecificLocation() => $_has(8);
  @$pb.TagNumber(9)
  void clearSpecificLocation() => clearField(9);

  @$pb.TagNumber(10)
  $2.Struct get details => $_getN(9);
  @$pb.TagNumber(10)
  set details($2.Struct v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDetails() => $_has(9);
  @$pb.TagNumber(10)
  void clearDetails() => clearField(10);
  @$pb.TagNumber(10)
  $2.Struct ensureDetails() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get fileId => $_getSZ(10);
  @$pb.TagNumber(11)
  set fileId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasFileId() => $_has(10);
  @$pb.TagNumber(11)
  void clearFileId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get locationId => $_getSZ(11);
  @$pb.TagNumber(12)
  set locationId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLocationId() => $_has(11);
  @$pb.TagNumber(12)
  void clearLocationId() => clearField(12);
}

class DeleteTaskDefRequest extends $pb.GeneratedMessage {
  factory DeleteTaskDefRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteTaskDefRequest._() : super();
  factory DeleteTaskDefRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTaskDefRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTaskDefRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTaskDefRequest clone() => DeleteTaskDefRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTaskDefRequest copyWith(void Function(DeleteTaskDefRequest) updates) => super.copyWith((message) => updates(message as DeleteTaskDefRequest)) as DeleteTaskDefRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTaskDefRequest create() => DeleteTaskDefRequest._();
  DeleteTaskDefRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskDefRequest> createRepeated() => $pb.PbList<DeleteTaskDefRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskDefRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTaskDefRequest>(create);
  static DeleteTaskDefRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteTaskDefResponse extends $pb.GeneratedMessage {
  factory DeleteTaskDefResponse() => create();
  DeleteTaskDefResponse._() : super();
  factory DeleteTaskDefResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTaskDefResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTaskDefResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTaskDefResponse clone() => DeleteTaskDefResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTaskDefResponse copyWith(void Function(DeleteTaskDefResponse) updates) => super.copyWith((message) => updates(message as DeleteTaskDefResponse)) as DeleteTaskDefResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTaskDefResponse create() => DeleteTaskDefResponse._();
  DeleteTaskDefResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskDefResponse> createRepeated() => $pb.PbList<DeleteTaskDefResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskDefResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTaskDefResponse>(create);
  static DeleteTaskDefResponse? _defaultInstance;
}

class ListTaskDefsRequest extends $pb.GeneratedMessage {
  factory ListTaskDefsRequest({
    $core.String? assetId,
    $core.Iterable<$core.String>? assetIds,
    $core.String? locationId,
    $core.Iterable<$core.String>? locationIds,
    TaskType? taskType,
    $core.bool? isEnabled,
    $core.String? search,
    $core.int? limit,
    $core.int? offset,
    $core.bool? hasActiveTasks,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (assetIds != null) {
      $result.assetIds.addAll(assetIds);
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (locationIds != null) {
      $result.locationIds.addAll(locationIds);
    }
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (search != null) {
      $result.search = search;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (hasActiveTasks != null) {
      $result.hasActiveTasks = hasActiveTasks;
    }
    return $result;
  }
  ListTaskDefsRequest._() : super();
  factory ListTaskDefsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTaskDefsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTaskDefsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..pPS(2, _omitFieldNames ? '' : 'assetIds')
    ..aOS(3, _omitFieldNames ? '' : 'locationId')
    ..pPS(4, _omitFieldNames ? '' : 'locationIds')
    ..e<TaskType>(5, _omitFieldNames ? '' : 'taskType', $pb.PbFieldType.OE, defaultOrMaker: TaskType.TASK_TYPE_UNSPECIFIED, valueOf: TaskType.valueOf, enumValues: TaskType.values)
    ..aOB(6, _omitFieldNames ? '' : 'isEnabled')
    ..aOS(7, _omitFieldNames ? '' : 'search')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..aOB(10, _omitFieldNames ? '' : 'hasActiveTasks')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTaskDefsRequest clone() => ListTaskDefsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTaskDefsRequest copyWith(void Function(ListTaskDefsRequest) updates) => super.copyWith((message) => updates(message as ListTaskDefsRequest)) as ListTaskDefsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTaskDefsRequest create() => ListTaskDefsRequest._();
  ListTaskDefsRequest createEmptyInstance() => create();
  static $pb.PbList<ListTaskDefsRequest> createRepeated() => $pb.PbList<ListTaskDefsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTaskDefsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTaskDefsRequest>(create);
  static ListTaskDefsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get assetIds => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get locationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set locationId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocationId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get locationIds => $_getList(3);

  @$pb.TagNumber(5)
  TaskType get taskType => $_getN(4);
  @$pb.TagNumber(5)
  set taskType(TaskType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTaskType() => $_has(4);
  @$pb.TagNumber(5)
  void clearTaskType() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isEnabled => $_getBF(5);
  @$pb.TagNumber(6)
  set isEnabled($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsEnabled() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get search => $_getSZ(6);
  @$pb.TagNumber(7)
  set search($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSearch() => $_has(6);
  @$pb.TagNumber(7)
  void clearSearch() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get limit => $_getIZ(7);
  @$pb.TagNumber(8)
  set limit($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearLimit() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get offset => $_getIZ(8);
  @$pb.TagNumber(9)
  set offset($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasOffset() => $_has(8);
  @$pb.TagNumber(9)
  void clearOffset() => clearField(9);

  /// Filter to only return task defs with active (non-resolved) tasks
  @$pb.TagNumber(10)
  $core.bool get hasActiveTasks => $_getBF(9);
  @$pb.TagNumber(10)
  set hasActiveTasks($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasHasActiveTasks() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasActiveTasks() => clearField(10);
}

class ListTaskDefsResponse extends $pb.GeneratedMessage {
  factory ListTaskDefsResponse({
    $core.Iterable<TaskDef>? items,
    $core.int? total,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ListTaskDefsResponse._() : super();
  factory ListTaskDefsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTaskDefsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTaskDefsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<TaskDef>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: TaskDef.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTaskDefsResponse clone() => ListTaskDefsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTaskDefsResponse copyWith(void Function(ListTaskDefsResponse) updates) => super.copyWith((message) => updates(message as ListTaskDefsResponse)) as ListTaskDefsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTaskDefsResponse create() => ListTaskDefsResponse._();
  ListTaskDefsResponse createEmptyInstance() => create();
  static $pb.PbList<ListTaskDefsResponse> createRepeated() => $pb.PbList<ListTaskDefsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTaskDefsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTaskDefsResponse>(create);
  static ListTaskDefsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskDef> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

class Task extends $pb.GeneratedMessage {
  factory Task({
    $core.String? id,
    $core.String? taskDefId,
    $core.String? assigneeId,
    $core.String? assignedRoleId,
    $core.String? requestedById,
    $core.String? assignedById,
    $1.Timestamp? scheduledDate,
    $1.Timestamp? dueDate,
    $1.Timestamp? completedDate,
    TaskStatus? status,
    ResolutionType? resolutionType,
    $core.String? externalId,
    $2.Struct? details,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
    $core.String? floorLocation,
    $core.String? serviceArea,
    $core.String? specificLocation,
    $core.String? assigneeFirstName,
    $core.String? assigneeLastName,
    $core.String? requestedByFirstName,
    $core.String? requestedByLastName,
    $core.String? assignedByFirstName,
    $core.String? assignedByLastName,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (taskDefId != null) {
      $result.taskDefId = taskDefId;
    }
    if (assigneeId != null) {
      $result.assigneeId = assigneeId;
    }
    if (assignedRoleId != null) {
      $result.assignedRoleId = assignedRoleId;
    }
    if (requestedById != null) {
      $result.requestedById = requestedById;
    }
    if (assignedById != null) {
      $result.assignedById = assignedById;
    }
    if (scheduledDate != null) {
      $result.scheduledDate = scheduledDate;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (completedDate != null) {
      $result.completedDate = completedDate;
    }
    if (status != null) {
      $result.status = status;
    }
    if (resolutionType != null) {
      $result.resolutionType = resolutionType;
    }
    if (externalId != null) {
      $result.externalId = externalId;
    }
    if (details != null) {
      $result.details = details;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (floorLocation != null) {
      $result.floorLocation = floorLocation;
    }
    if (serviceArea != null) {
      $result.serviceArea = serviceArea;
    }
    if (specificLocation != null) {
      $result.specificLocation = specificLocation;
    }
    if (assigneeFirstName != null) {
      $result.assigneeFirstName = assigneeFirstName;
    }
    if (assigneeLastName != null) {
      $result.assigneeLastName = assigneeLastName;
    }
    if (requestedByFirstName != null) {
      $result.requestedByFirstName = requestedByFirstName;
    }
    if (requestedByLastName != null) {
      $result.requestedByLastName = requestedByLastName;
    }
    if (assignedByFirstName != null) {
      $result.assignedByFirstName = assignedByFirstName;
    }
    if (assignedByLastName != null) {
      $result.assignedByLastName = assignedByLastName;
    }
    return $result;
  }
  Task._() : super();
  factory Task.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Task.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Task', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'taskDefId')
    ..aOS(3, _omitFieldNames ? '' : 'assigneeId')
    ..aOS(4, _omitFieldNames ? '' : 'assignedRoleId')
    ..aOS(5, _omitFieldNames ? '' : 'requestedById')
    ..aOS(6, _omitFieldNames ? '' : 'assignedById')
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'scheduledDate', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'dueDate', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'completedDate', subBuilder: $1.Timestamp.create)
    ..e<TaskStatus>(10, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: TaskStatus.TASK_STATUS_UNSPECIFIED, valueOf: TaskStatus.valueOf, enumValues: TaskStatus.values)
    ..e<ResolutionType>(11, _omitFieldNames ? '' : 'resolutionType', $pb.PbFieldType.OE, defaultOrMaker: ResolutionType.RESOLUTION_TYPE_UNSPECIFIED, valueOf: ResolutionType.valueOf, enumValues: ResolutionType.values)
    ..aOS(12, _omitFieldNames ? '' : 'externalId')
    ..aOM<$2.Struct>(13, _omitFieldNames ? '' : 'details', subBuilder: $2.Struct.create)
    ..aOM<$1.Timestamp>(14, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(15, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..aOS(16, _omitFieldNames ? '' : 'floorLocation')
    ..aOS(17, _omitFieldNames ? '' : 'serviceArea')
    ..aOS(18, _omitFieldNames ? '' : 'specificLocation')
    ..aOS(19, _omitFieldNames ? '' : 'assigneeFirstName')
    ..aOS(20, _omitFieldNames ? '' : 'assigneeLastName')
    ..aOS(21, _omitFieldNames ? '' : 'requestedByFirstName')
    ..aOS(22, _omitFieldNames ? '' : 'requestedByLastName')
    ..aOS(23, _omitFieldNames ? '' : 'assignedByFirstName')
    ..aOS(24, _omitFieldNames ? '' : 'assignedByLastName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Task clone() => Task()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Task copyWith(void Function(Task) updates) => super.copyWith((message) => updates(message as Task)) as Task;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Task create() => Task._();
  Task createEmptyInstance() => create();
  static $pb.PbList<Task> createRepeated() => $pb.PbList<Task>();
  @$core.pragma('dart2js:noInline')
  static Task getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Task>(create);
  static Task? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskDefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskDefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskDefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskDefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get assigneeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set assigneeId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssigneeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssigneeId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get assignedRoleId => $_getSZ(3);
  @$pb.TagNumber(4)
  set assignedRoleId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAssignedRoleId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAssignedRoleId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get requestedById => $_getSZ(4);
  @$pb.TagNumber(5)
  set requestedById($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRequestedById() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequestedById() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get assignedById => $_getSZ(5);
  @$pb.TagNumber(6)
  set assignedById($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAssignedById() => $_has(5);
  @$pb.TagNumber(6)
  void clearAssignedById() => clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get scheduledDate => $_getN(6);
  @$pb.TagNumber(7)
  set scheduledDate($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasScheduledDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearScheduledDate() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureScheduledDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Timestamp get dueDate => $_getN(7);
  @$pb.TagNumber(8)
  set dueDate($1.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDueDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDueDate() => clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureDueDate() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Timestamp get completedDate => $_getN(8);
  @$pb.TagNumber(9)
  set completedDate($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCompletedDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearCompletedDate() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureCompletedDate() => $_ensure(8);

  @$pb.TagNumber(10)
  TaskStatus get status => $_getN(9);
  @$pb.TagNumber(10)
  set status(TaskStatus v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => clearField(10);

  @$pb.TagNumber(11)
  ResolutionType get resolutionType => $_getN(10);
  @$pb.TagNumber(11)
  set resolutionType(ResolutionType v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasResolutionType() => $_has(10);
  @$pb.TagNumber(11)
  void clearResolutionType() => clearField(11);

  /// Human-readable external ID (e.g., PM-1000, SR-1001)
  @$pb.TagNumber(12)
  $core.String get externalId => $_getSZ(11);
  @$pb.TagNumber(12)
  set externalId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasExternalId() => $_has(11);
  @$pb.TagNumber(12)
  void clearExternalId() => clearField(12);

  @$pb.TagNumber(13)
  $2.Struct get details => $_getN(12);
  @$pb.TagNumber(13)
  set details($2.Struct v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasDetails() => $_has(12);
  @$pb.TagNumber(13)
  void clearDetails() => clearField(13);
  @$pb.TagNumber(13)
  $2.Struct ensureDetails() => $_ensure(12);

  @$pb.TagNumber(14)
  $1.Timestamp get createdAt => $_getN(13);
  @$pb.TagNumber(14)
  set createdAt($1.Timestamp v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCreatedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearCreatedAt() => clearField(14);
  @$pb.TagNumber(14)
  $1.Timestamp ensureCreatedAt() => $_ensure(13);

  @$pb.TagNumber(15)
  $1.Timestamp get updatedAt => $_getN(14);
  @$pb.TagNumber(15)
  set updatedAt($1.Timestamp v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasUpdatedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearUpdatedAt() => clearField(15);
  @$pb.TagNumber(15)
  $1.Timestamp ensureUpdatedAt() => $_ensure(14);

  /// Joined fields
  @$pb.TagNumber(16)
  $core.String get floorLocation => $_getSZ(15);
  @$pb.TagNumber(16)
  set floorLocation($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasFloorLocation() => $_has(15);
  @$pb.TagNumber(16)
  void clearFloorLocation() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get serviceArea => $_getSZ(16);
  @$pb.TagNumber(17)
  set serviceArea($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasServiceArea() => $_has(16);
  @$pb.TagNumber(17)
  void clearServiceArea() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get specificLocation => $_getSZ(17);
  @$pb.TagNumber(18)
  set specificLocation($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasSpecificLocation() => $_has(17);
  @$pb.TagNumber(18)
  void clearSpecificLocation() => clearField(18);

  /// Member names from joins
  @$pb.TagNumber(19)
  $core.String get assigneeFirstName => $_getSZ(18);
  @$pb.TagNumber(19)
  set assigneeFirstName($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasAssigneeFirstName() => $_has(18);
  @$pb.TagNumber(19)
  void clearAssigneeFirstName() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get assigneeLastName => $_getSZ(19);
  @$pb.TagNumber(20)
  set assigneeLastName($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasAssigneeLastName() => $_has(19);
  @$pb.TagNumber(20)
  void clearAssigneeLastName() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get requestedByFirstName => $_getSZ(20);
  @$pb.TagNumber(21)
  set requestedByFirstName($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasRequestedByFirstName() => $_has(20);
  @$pb.TagNumber(21)
  void clearRequestedByFirstName() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get requestedByLastName => $_getSZ(21);
  @$pb.TagNumber(22)
  set requestedByLastName($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasRequestedByLastName() => $_has(21);
  @$pb.TagNumber(22)
  void clearRequestedByLastName() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get assignedByFirstName => $_getSZ(22);
  @$pb.TagNumber(23)
  set assignedByFirstName($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasAssignedByFirstName() => $_has(22);
  @$pb.TagNumber(23)
  void clearAssignedByFirstName() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get assignedByLastName => $_getSZ(23);
  @$pb.TagNumber(24)
  set assignedByLastName($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasAssignedByLastName() => $_has(23);
  @$pb.TagNumber(24)
  void clearAssignedByLastName() => clearField(24);
}

/// Task with additional fields from the task definition.
class TaskWithDetails extends $pb.GeneratedMessage {
  factory TaskWithDetails({
    $core.String? id,
    $core.String? taskDefId,
    $core.String? assigneeId,
    $core.String? assignedRoleId,
    $core.String? requestedById,
    $core.String? assignedById,
    $1.Timestamp? scheduledDate,
    $1.Timestamp? dueDate,
    $1.Timestamp? completedDate,
    TaskStatus? status,
    ResolutionType? resolutionType,
    $core.String? externalId,
    $2.Struct? details,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
    $core.String? floorLocation,
    $core.String? serviceArea,
    $core.String? specificLocation,
    $core.String? assigneeFirstName,
    $core.String? assigneeLastName,
    $core.String? requestedByFirstName,
    $core.String? requestedByLastName,
    $core.String? assignedByFirstName,
    $core.String? assignedByLastName,
    TaskType? taskType,
    $core.String? title,
    $core.String? description,
    $core.String? locationId,
    $core.String? locationName,
    $core.String? assetId,
    $1.Timestamp? taskDefCreatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (taskDefId != null) {
      $result.taskDefId = taskDefId;
    }
    if (assigneeId != null) {
      $result.assigneeId = assigneeId;
    }
    if (assignedRoleId != null) {
      $result.assignedRoleId = assignedRoleId;
    }
    if (requestedById != null) {
      $result.requestedById = requestedById;
    }
    if (assignedById != null) {
      $result.assignedById = assignedById;
    }
    if (scheduledDate != null) {
      $result.scheduledDate = scheduledDate;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (completedDate != null) {
      $result.completedDate = completedDate;
    }
    if (status != null) {
      $result.status = status;
    }
    if (resolutionType != null) {
      $result.resolutionType = resolutionType;
    }
    if (externalId != null) {
      $result.externalId = externalId;
    }
    if (details != null) {
      $result.details = details;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (floorLocation != null) {
      $result.floorLocation = floorLocation;
    }
    if (serviceArea != null) {
      $result.serviceArea = serviceArea;
    }
    if (specificLocation != null) {
      $result.specificLocation = specificLocation;
    }
    if (assigneeFirstName != null) {
      $result.assigneeFirstName = assigneeFirstName;
    }
    if (assigneeLastName != null) {
      $result.assigneeLastName = assigneeLastName;
    }
    if (requestedByFirstName != null) {
      $result.requestedByFirstName = requestedByFirstName;
    }
    if (requestedByLastName != null) {
      $result.requestedByLastName = requestedByLastName;
    }
    if (assignedByFirstName != null) {
      $result.assignedByFirstName = assignedByFirstName;
    }
    if (assignedByLastName != null) {
      $result.assignedByLastName = assignedByLastName;
    }
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (locationName != null) {
      $result.locationName = locationName;
    }
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (taskDefCreatedAt != null) {
      $result.taskDefCreatedAt = taskDefCreatedAt;
    }
    return $result;
  }
  TaskWithDetails._() : super();
  factory TaskWithDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskWithDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskWithDetails', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'taskDefId')
    ..aOS(3, _omitFieldNames ? '' : 'assigneeId')
    ..aOS(4, _omitFieldNames ? '' : 'assignedRoleId')
    ..aOS(5, _omitFieldNames ? '' : 'requestedById')
    ..aOS(6, _omitFieldNames ? '' : 'assignedById')
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'scheduledDate', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'dueDate', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'completedDate', subBuilder: $1.Timestamp.create)
    ..e<TaskStatus>(10, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: TaskStatus.TASK_STATUS_UNSPECIFIED, valueOf: TaskStatus.valueOf, enumValues: TaskStatus.values)
    ..e<ResolutionType>(11, _omitFieldNames ? '' : 'resolutionType', $pb.PbFieldType.OE, defaultOrMaker: ResolutionType.RESOLUTION_TYPE_UNSPECIFIED, valueOf: ResolutionType.valueOf, enumValues: ResolutionType.values)
    ..aOS(12, _omitFieldNames ? '' : 'externalId')
    ..aOM<$2.Struct>(13, _omitFieldNames ? '' : 'details', subBuilder: $2.Struct.create)
    ..aOM<$1.Timestamp>(14, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(15, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..aOS(16, _omitFieldNames ? '' : 'floorLocation')
    ..aOS(17, _omitFieldNames ? '' : 'serviceArea')
    ..aOS(18, _omitFieldNames ? '' : 'specificLocation')
    ..aOS(19, _omitFieldNames ? '' : 'assigneeFirstName')
    ..aOS(20, _omitFieldNames ? '' : 'assigneeLastName')
    ..aOS(21, _omitFieldNames ? '' : 'requestedByFirstName')
    ..aOS(22, _omitFieldNames ? '' : 'requestedByLastName')
    ..aOS(23, _omitFieldNames ? '' : 'assignedByFirstName')
    ..aOS(24, _omitFieldNames ? '' : 'assignedByLastName')
    ..e<TaskType>(25, _omitFieldNames ? '' : 'taskType', $pb.PbFieldType.OE, defaultOrMaker: TaskType.TASK_TYPE_UNSPECIFIED, valueOf: TaskType.valueOf, enumValues: TaskType.values)
    ..aOS(26, _omitFieldNames ? '' : 'title')
    ..aOS(27, _omitFieldNames ? '' : 'description')
    ..aOS(28, _omitFieldNames ? '' : 'locationId')
    ..aOS(29, _omitFieldNames ? '' : 'locationName')
    ..aOS(30, _omitFieldNames ? '' : 'assetId')
    ..aOM<$1.Timestamp>(31, _omitFieldNames ? '' : 'taskDefCreatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskWithDetails clone() => TaskWithDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskWithDetails copyWith(void Function(TaskWithDetails) updates) => super.copyWith((message) => updates(message as TaskWithDetails)) as TaskWithDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskWithDetails create() => TaskWithDetails._();
  TaskWithDetails createEmptyInstance() => create();
  static $pb.PbList<TaskWithDetails> createRepeated() => $pb.PbList<TaskWithDetails>();
  @$core.pragma('dart2js:noInline')
  static TaskWithDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskWithDetails>(create);
  static TaskWithDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskDefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskDefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskDefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskDefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get assigneeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set assigneeId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssigneeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssigneeId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get assignedRoleId => $_getSZ(3);
  @$pb.TagNumber(4)
  set assignedRoleId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAssignedRoleId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAssignedRoleId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get requestedById => $_getSZ(4);
  @$pb.TagNumber(5)
  set requestedById($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRequestedById() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequestedById() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get assignedById => $_getSZ(5);
  @$pb.TagNumber(6)
  set assignedById($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAssignedById() => $_has(5);
  @$pb.TagNumber(6)
  void clearAssignedById() => clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get scheduledDate => $_getN(6);
  @$pb.TagNumber(7)
  set scheduledDate($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasScheduledDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearScheduledDate() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureScheduledDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Timestamp get dueDate => $_getN(7);
  @$pb.TagNumber(8)
  set dueDate($1.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDueDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDueDate() => clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureDueDate() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Timestamp get completedDate => $_getN(8);
  @$pb.TagNumber(9)
  set completedDate($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCompletedDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearCompletedDate() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureCompletedDate() => $_ensure(8);

  @$pb.TagNumber(10)
  TaskStatus get status => $_getN(9);
  @$pb.TagNumber(10)
  set status(TaskStatus v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => clearField(10);

  @$pb.TagNumber(11)
  ResolutionType get resolutionType => $_getN(10);
  @$pb.TagNumber(11)
  set resolutionType(ResolutionType v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasResolutionType() => $_has(10);
  @$pb.TagNumber(11)
  void clearResolutionType() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get externalId => $_getSZ(11);
  @$pb.TagNumber(12)
  set externalId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasExternalId() => $_has(11);
  @$pb.TagNumber(12)
  void clearExternalId() => clearField(12);

  @$pb.TagNumber(13)
  $2.Struct get details => $_getN(12);
  @$pb.TagNumber(13)
  set details($2.Struct v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasDetails() => $_has(12);
  @$pb.TagNumber(13)
  void clearDetails() => clearField(13);
  @$pb.TagNumber(13)
  $2.Struct ensureDetails() => $_ensure(12);

  @$pb.TagNumber(14)
  $1.Timestamp get createdAt => $_getN(13);
  @$pb.TagNumber(14)
  set createdAt($1.Timestamp v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCreatedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearCreatedAt() => clearField(14);
  @$pb.TagNumber(14)
  $1.Timestamp ensureCreatedAt() => $_ensure(13);

  @$pb.TagNumber(15)
  $1.Timestamp get updatedAt => $_getN(14);
  @$pb.TagNumber(15)
  set updatedAt($1.Timestamp v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasUpdatedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearUpdatedAt() => clearField(15);
  @$pb.TagNumber(15)
  $1.Timestamp ensureUpdatedAt() => $_ensure(14);

  /// Joined fields
  @$pb.TagNumber(16)
  $core.String get floorLocation => $_getSZ(15);
  @$pb.TagNumber(16)
  set floorLocation($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasFloorLocation() => $_has(15);
  @$pb.TagNumber(16)
  void clearFloorLocation() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get serviceArea => $_getSZ(16);
  @$pb.TagNumber(17)
  set serviceArea($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasServiceArea() => $_has(16);
  @$pb.TagNumber(17)
  void clearServiceArea() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get specificLocation => $_getSZ(17);
  @$pb.TagNumber(18)
  set specificLocation($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasSpecificLocation() => $_has(17);
  @$pb.TagNumber(18)
  void clearSpecificLocation() => clearField(18);

  /// Member names
  @$pb.TagNumber(19)
  $core.String get assigneeFirstName => $_getSZ(18);
  @$pb.TagNumber(19)
  set assigneeFirstName($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasAssigneeFirstName() => $_has(18);
  @$pb.TagNumber(19)
  void clearAssigneeFirstName() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get assigneeLastName => $_getSZ(19);
  @$pb.TagNumber(20)
  set assigneeLastName($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasAssigneeLastName() => $_has(19);
  @$pb.TagNumber(20)
  void clearAssigneeLastName() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get requestedByFirstName => $_getSZ(20);
  @$pb.TagNumber(21)
  set requestedByFirstName($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasRequestedByFirstName() => $_has(20);
  @$pb.TagNumber(21)
  void clearRequestedByFirstName() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get requestedByLastName => $_getSZ(21);
  @$pb.TagNumber(22)
  set requestedByLastName($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasRequestedByLastName() => $_has(21);
  @$pb.TagNumber(22)
  void clearRequestedByLastName() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get assignedByFirstName => $_getSZ(22);
  @$pb.TagNumber(23)
  set assignedByFirstName($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasAssignedByFirstName() => $_has(22);
  @$pb.TagNumber(23)
  void clearAssignedByFirstName() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get assignedByLastName => $_getSZ(23);
  @$pb.TagNumber(24)
  set assignedByLastName($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasAssignedByLastName() => $_has(23);
  @$pb.TagNumber(24)
  void clearAssignedByLastName() => clearField(24);

  /// Fields from TaskDef
  @$pb.TagNumber(25)
  TaskType get taskType => $_getN(24);
  @$pb.TagNumber(25)
  set taskType(TaskType v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasTaskType() => $_has(24);
  @$pb.TagNumber(25)
  void clearTaskType() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get title => $_getSZ(25);
  @$pb.TagNumber(26)
  set title($core.String v) { $_setString(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasTitle() => $_has(25);
  @$pb.TagNumber(26)
  void clearTitle() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get description => $_getSZ(26);
  @$pb.TagNumber(27)
  set description($core.String v) { $_setString(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasDescription() => $_has(26);
  @$pb.TagNumber(27)
  void clearDescription() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get locationId => $_getSZ(27);
  @$pb.TagNumber(28)
  set locationId($core.String v) { $_setString(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasLocationId() => $_has(27);
  @$pb.TagNumber(28)
  void clearLocationId() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get locationName => $_getSZ(28);
  @$pb.TagNumber(29)
  set locationName($core.String v) { $_setString(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasLocationName() => $_has(28);
  @$pb.TagNumber(29)
  void clearLocationName() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get assetId => $_getSZ(29);
  @$pb.TagNumber(30)
  set assetId($core.String v) { $_setString(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasAssetId() => $_has(29);
  @$pb.TagNumber(30)
  void clearAssetId() => clearField(30);

  @$pb.TagNumber(31)
  $1.Timestamp get taskDefCreatedAt => $_getN(30);
  @$pb.TagNumber(31)
  set taskDefCreatedAt($1.Timestamp v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasTaskDefCreatedAt() => $_has(30);
  @$pb.TagNumber(31)
  void clearTaskDefCreatedAt() => clearField(31);
  @$pb.TagNumber(31)
  $1.Timestamp ensureTaskDefCreatedAt() => $_ensure(30);
}

class CreateTaskRequest extends $pb.GeneratedMessage {
  factory CreateTaskRequest({
    $core.String? taskDefId,
    $core.String? assigneeId,
    $core.String? assignedRoleId,
    $core.String? requestedById,
    $1.Timestamp? scheduledDate,
    $1.Timestamp? dueDate,
    $2.Struct? details,
  }) {
    final $result = create();
    if (taskDefId != null) {
      $result.taskDefId = taskDefId;
    }
    if (assigneeId != null) {
      $result.assigneeId = assigneeId;
    }
    if (assignedRoleId != null) {
      $result.assignedRoleId = assignedRoleId;
    }
    if (requestedById != null) {
      $result.requestedById = requestedById;
    }
    if (scheduledDate != null) {
      $result.scheduledDate = scheduledDate;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (details != null) {
      $result.details = details;
    }
    return $result;
  }
  CreateTaskRequest._() : super();
  factory CreateTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskDefId')
    ..aOS(2, _omitFieldNames ? '' : 'assigneeId')
    ..aOS(3, _omitFieldNames ? '' : 'assignedRoleId')
    ..aOS(4, _omitFieldNames ? '' : 'requestedById')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'scheduledDate', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'dueDate', subBuilder: $1.Timestamp.create)
    ..aOM<$2.Struct>(7, _omitFieldNames ? '' : 'details', subBuilder: $2.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTaskRequest clone() => CreateTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTaskRequest copyWith(void Function(CreateTaskRequest) updates) => super.copyWith((message) => updates(message as CreateTaskRequest)) as CreateTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTaskRequest create() => CreateTaskRequest._();
  CreateTaskRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTaskRequest> createRepeated() => $pb.PbList<CreateTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTaskRequest>(create);
  static CreateTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskDefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskDefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskDefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskDefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assigneeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assigneeId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssigneeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssigneeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get assignedRoleId => $_getSZ(2);
  @$pb.TagNumber(3)
  set assignedRoleId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssignedRoleId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssignedRoleId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get requestedById => $_getSZ(3);
  @$pb.TagNumber(4)
  set requestedById($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRequestedById() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestedById() => clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get scheduledDate => $_getN(4);
  @$pb.TagNumber(5)
  set scheduledDate($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasScheduledDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearScheduledDate() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureScheduledDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get dueDate => $_getN(5);
  @$pb.TagNumber(6)
  set dueDate($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDueDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDueDate() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureDueDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $2.Struct get details => $_getN(6);
  @$pb.TagNumber(7)
  set details($2.Struct v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDetails() => $_has(6);
  @$pb.TagNumber(7)
  void clearDetails() => clearField(7);
  @$pb.TagNumber(7)
  $2.Struct ensureDetails() => $_ensure(6);
}

class GetTaskRequest extends $pb.GeneratedMessage {
  factory GetTaskRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetTaskRequest._() : super();
  factory GetTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskRequest clone() => GetTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskRequest copyWith(void Function(GetTaskRequest) updates) => super.copyWith((message) => updates(message as GetTaskRequest)) as GetTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskRequest create() => GetTaskRequest._();
  GetTaskRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskRequest> createRepeated() => $pb.PbList<GetTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskRequest>(create);
  static GetTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetTaskByExternalIdRequest extends $pb.GeneratedMessage {
  factory GetTaskByExternalIdRequest({
    $core.String? externalId,
  }) {
    final $result = create();
    if (externalId != null) {
      $result.externalId = externalId;
    }
    return $result;
  }
  GetTaskByExternalIdRequest._() : super();
  factory GetTaskByExternalIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskByExternalIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskByExternalIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'externalId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskByExternalIdRequest clone() => GetTaskByExternalIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskByExternalIdRequest copyWith(void Function(GetTaskByExternalIdRequest) updates) => super.copyWith((message) => updates(message as GetTaskByExternalIdRequest)) as GetTaskByExternalIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskByExternalIdRequest create() => GetTaskByExternalIdRequest._();
  GetTaskByExternalIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskByExternalIdRequest> createRepeated() => $pb.PbList<GetTaskByExternalIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskByExternalIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskByExternalIdRequest>(create);
  static GetTaskByExternalIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get externalId => $_getSZ(0);
  @$pb.TagNumber(1)
  set externalId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExternalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExternalId() => clearField(1);
}

class UpdateTaskRequest extends $pb.GeneratedMessage {
  factory UpdateTaskRequest({
    $core.String? id,
    $core.String? assigneeId,
    $core.String? assignedRoleId,
    $1.Timestamp? scheduledDate,
    $1.Timestamp? dueDate,
    $2.Struct? details,
    $core.String? notes,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (assigneeId != null) {
      $result.assigneeId = assigneeId;
    }
    if (assignedRoleId != null) {
      $result.assignedRoleId = assignedRoleId;
    }
    if (scheduledDate != null) {
      $result.scheduledDate = scheduledDate;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (details != null) {
      $result.details = details;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  UpdateTaskRequest._() : super();
  factory UpdateTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'assigneeId')
    ..aOS(3, _omitFieldNames ? '' : 'assignedRoleId')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'scheduledDate', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'dueDate', subBuilder: $1.Timestamp.create)
    ..aOM<$2.Struct>(6, _omitFieldNames ? '' : 'details', subBuilder: $2.Struct.create)
    ..aOS(7, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTaskRequest clone() => UpdateTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTaskRequest copyWith(void Function(UpdateTaskRequest) updates) => super.copyWith((message) => updates(message as UpdateTaskRequest)) as UpdateTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTaskRequest create() => UpdateTaskRequest._();
  UpdateTaskRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTaskRequest> createRepeated() => $pb.PbList<UpdateTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTaskRequest>(create);
  static UpdateTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assigneeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assigneeId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssigneeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssigneeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get assignedRoleId => $_getSZ(2);
  @$pb.TagNumber(3)
  set assignedRoleId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssignedRoleId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssignedRoleId() => clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get scheduledDate => $_getN(3);
  @$pb.TagNumber(4)
  set scheduledDate($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasScheduledDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearScheduledDate() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureScheduledDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get dueDate => $_getN(4);
  @$pb.TagNumber(5)
  set dueDate($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDueDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDueDate() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureDueDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.Struct get details => $_getN(5);
  @$pb.TagNumber(6)
  set details($2.Struct v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDetails() => $_has(5);
  @$pb.TagNumber(6)
  void clearDetails() => clearField(6);
  @$pb.TagNumber(6)
  $2.Struct ensureDetails() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => clearField(7);
}

class DeleteTaskRequest extends $pb.GeneratedMessage {
  factory DeleteTaskRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteTaskRequest._() : super();
  factory DeleteTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTaskRequest clone() => DeleteTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTaskRequest copyWith(void Function(DeleteTaskRequest) updates) => super.copyWith((message) => updates(message as DeleteTaskRequest)) as DeleteTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTaskRequest create() => DeleteTaskRequest._();
  DeleteTaskRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskRequest> createRepeated() => $pb.PbList<DeleteTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTaskRequest>(create);
  static DeleteTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteTaskResponse extends $pb.GeneratedMessage {
  factory DeleteTaskResponse() => create();
  DeleteTaskResponse._() : super();
  factory DeleteTaskResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTaskResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTaskResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTaskResponse clone() => DeleteTaskResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTaskResponse copyWith(void Function(DeleteTaskResponse) updates) => super.copyWith((message) => updates(message as DeleteTaskResponse)) as DeleteTaskResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTaskResponse create() => DeleteTaskResponse._();
  DeleteTaskResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskResponse> createRepeated() => $pb.PbList<DeleteTaskResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTaskResponse>(create);
  static DeleteTaskResponse? _defaultInstance;
}

class UpdateTaskStatusRequest extends $pb.GeneratedMessage {
  factory UpdateTaskStatusRequest({
    $core.String? id,
    TaskStatus? status,
    ResolutionType? resolutionType,
    $core.String? notes,
    $core.Iterable<$core.String>? attachmentIds,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (status != null) {
      $result.status = status;
    }
    if (resolutionType != null) {
      $result.resolutionType = resolutionType;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (attachmentIds != null) {
      $result.attachmentIds.addAll(attachmentIds);
    }
    return $result;
  }
  UpdateTaskStatusRequest._() : super();
  factory UpdateTaskStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTaskStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTaskStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<TaskStatus>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: TaskStatus.TASK_STATUS_UNSPECIFIED, valueOf: TaskStatus.valueOf, enumValues: TaskStatus.values)
    ..e<ResolutionType>(3, _omitFieldNames ? '' : 'resolutionType', $pb.PbFieldType.OE, defaultOrMaker: ResolutionType.RESOLUTION_TYPE_UNSPECIFIED, valueOf: ResolutionType.valueOf, enumValues: ResolutionType.values)
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..pPS(5, _omitFieldNames ? '' : 'attachmentIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTaskStatusRequest clone() => UpdateTaskStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTaskStatusRequest copyWith(void Function(UpdateTaskStatusRequest) updates) => super.copyWith((message) => updates(message as UpdateTaskStatusRequest)) as UpdateTaskStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTaskStatusRequest create() => UpdateTaskStatusRequest._();
  UpdateTaskStatusRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTaskStatusRequest> createRepeated() => $pb.PbList<UpdateTaskStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTaskStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTaskStatusRequest>(create);
  static UpdateTaskStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  TaskStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(TaskStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  ResolutionType get resolutionType => $_getN(2);
  @$pb.TagNumber(3)
  set resolutionType(ResolutionType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResolutionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearResolutionType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get attachmentIds => $_getList(4);
}

class ClaimTaskRequest extends $pb.GeneratedMessage {
  factory ClaimTaskRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  ClaimTaskRequest._() : super();
  factory ClaimTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClaimTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClaimTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClaimTaskRequest clone() => ClaimTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClaimTaskRequest copyWith(void Function(ClaimTaskRequest) updates) => super.copyWith((message) => updates(message as ClaimTaskRequest)) as ClaimTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimTaskRequest create() => ClaimTaskRequest._();
  ClaimTaskRequest createEmptyInstance() => create();
  static $pb.PbList<ClaimTaskRequest> createRepeated() => $pb.PbList<ClaimTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static ClaimTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClaimTaskRequest>(create);
  static ClaimTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ListTasksRequest extends $pb.GeneratedMessage {
  factory ListTasksRequest({
    $core.Iterable<$core.String>? assetIds,
    $core.Iterable<$core.String>? taskDefIds,
    $core.Iterable<TaskStatus>? statuses,
    $core.Iterable<$core.String>? assigneeIds,
    $core.Iterable<$core.String>? assignedByIds,
    $core.Iterable<$core.String>? requestedByIds,
    $core.Iterable<$core.String>? locationIds,
    $core.Iterable<TaskType>? taskTypes,
    $core.String? search,
    $1.Timestamp? fromDate,
    $1.Timestamp? toDate,
    $core.bool? isOverdue,
    $core.bool? filterUnassigned,
    $core.String? sortBy,
    $core.String? sortOrder,
    $core.int? limit,
    $core.int? offset,
    $1.Timestamp? scheduledDateFrom,
    $1.Timestamp? scheduledDateTo,
    $1.Timestamp? dueDateFrom,
    $1.Timestamp? dueDateTo,
    $core.bool? filterNoAssigner,
    $core.bool? filterNoRequester,
  }) {
    final $result = create();
    if (assetIds != null) {
      $result.assetIds.addAll(assetIds);
    }
    if (taskDefIds != null) {
      $result.taskDefIds.addAll(taskDefIds);
    }
    if (statuses != null) {
      $result.statuses.addAll(statuses);
    }
    if (assigneeIds != null) {
      $result.assigneeIds.addAll(assigneeIds);
    }
    if (assignedByIds != null) {
      $result.assignedByIds.addAll(assignedByIds);
    }
    if (requestedByIds != null) {
      $result.requestedByIds.addAll(requestedByIds);
    }
    if (locationIds != null) {
      $result.locationIds.addAll(locationIds);
    }
    if (taskTypes != null) {
      $result.taskTypes.addAll(taskTypes);
    }
    if (search != null) {
      $result.search = search;
    }
    if (fromDate != null) {
      $result.fromDate = fromDate;
    }
    if (toDate != null) {
      $result.toDate = toDate;
    }
    if (isOverdue != null) {
      $result.isOverdue = isOverdue;
    }
    if (filterUnassigned != null) {
      $result.filterUnassigned = filterUnassigned;
    }
    if (sortBy != null) {
      $result.sortBy = sortBy;
    }
    if (sortOrder != null) {
      $result.sortOrder = sortOrder;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (scheduledDateFrom != null) {
      $result.scheduledDateFrom = scheduledDateFrom;
    }
    if (scheduledDateTo != null) {
      $result.scheduledDateTo = scheduledDateTo;
    }
    if (dueDateFrom != null) {
      $result.dueDateFrom = dueDateFrom;
    }
    if (dueDateTo != null) {
      $result.dueDateTo = dueDateTo;
    }
    if (filterNoAssigner != null) {
      $result.filterNoAssigner = filterNoAssigner;
    }
    if (filterNoRequester != null) {
      $result.filterNoRequester = filterNoRequester;
    }
    return $result;
  }
  ListTasksRequest._() : super();
  factory ListTasksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTasksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTasksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'assetIds')
    ..pPS(2, _omitFieldNames ? '' : 'taskDefIds')
    ..pc<TaskStatus>(3, _omitFieldNames ? '' : 'statuses', $pb.PbFieldType.KE, valueOf: TaskStatus.valueOf, enumValues: TaskStatus.values, defaultEnumValue: TaskStatus.TASK_STATUS_UNSPECIFIED)
    ..pPS(4, _omitFieldNames ? '' : 'assigneeIds')
    ..pPS(5, _omitFieldNames ? '' : 'assignedByIds')
    ..pPS(6, _omitFieldNames ? '' : 'requestedByIds')
    ..pPS(7, _omitFieldNames ? '' : 'locationIds')
    ..pc<TaskType>(8, _omitFieldNames ? '' : 'taskTypes', $pb.PbFieldType.KE, valueOf: TaskType.valueOf, enumValues: TaskType.values, defaultEnumValue: TaskType.TASK_TYPE_UNSPECIFIED)
    ..aOS(9, _omitFieldNames ? '' : 'search')
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'fromDate', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'toDate', subBuilder: $1.Timestamp.create)
    ..aOB(12, _omitFieldNames ? '' : 'isOverdue')
    ..aOB(13, _omitFieldNames ? '' : 'filterUnassigned')
    ..aOS(14, _omitFieldNames ? '' : 'sortBy')
    ..aOS(15, _omitFieldNames ? '' : 'sortOrder')
    ..a<$core.int>(16, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(17, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(18, _omitFieldNames ? '' : 'scheduledDateFrom', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(19, _omitFieldNames ? '' : 'scheduledDateTo', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(20, _omitFieldNames ? '' : 'dueDateFrom', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(21, _omitFieldNames ? '' : 'dueDateTo', subBuilder: $1.Timestamp.create)
    ..aOB(22, _omitFieldNames ? '' : 'filterNoAssigner')
    ..aOB(23, _omitFieldNames ? '' : 'filterNoRequester')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTasksRequest clone() => ListTasksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTasksRequest copyWith(void Function(ListTasksRequest) updates) => super.copyWith((message) => updates(message as ListTasksRequest)) as ListTasksRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTasksRequest create() => ListTasksRequest._();
  ListTasksRequest createEmptyInstance() => create();
  static $pb.PbList<ListTasksRequest> createRepeated() => $pb.PbList<ListTasksRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTasksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTasksRequest>(create);
  static ListTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get assetIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get taskDefIds => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<TaskStatus> get statuses => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get assigneeIds => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get assignedByIds => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get requestedByIds => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get locationIds => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<TaskType> get taskTypes => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get search => $_getSZ(8);
  @$pb.TagNumber(9)
  set search($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSearch() => $_has(8);
  @$pb.TagNumber(9)
  void clearSearch() => clearField(9);

  @$pb.TagNumber(10)
  $1.Timestamp get fromDate => $_getN(9);
  @$pb.TagNumber(10)
  set fromDate($1.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasFromDate() => $_has(9);
  @$pb.TagNumber(10)
  void clearFromDate() => clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureFromDate() => $_ensure(9);

  @$pb.TagNumber(11)
  $1.Timestamp get toDate => $_getN(10);
  @$pb.TagNumber(11)
  set toDate($1.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasToDate() => $_has(10);
  @$pb.TagNumber(11)
  void clearToDate() => clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureToDate() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.bool get isOverdue => $_getBF(11);
  @$pb.TagNumber(12)
  set isOverdue($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsOverdue() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsOverdue() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get filterUnassigned => $_getBF(12);
  @$pb.TagNumber(13)
  set filterUnassigned($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasFilterUnassigned() => $_has(12);
  @$pb.TagNumber(13)
  void clearFilterUnassigned() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get sortBy => $_getSZ(13);
  @$pb.TagNumber(14)
  set sortBy($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSortBy() => $_has(13);
  @$pb.TagNumber(14)
  void clearSortBy() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get sortOrder => $_getSZ(14);
  @$pb.TagNumber(15)
  set sortOrder($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSortOrder() => $_has(14);
  @$pb.TagNumber(15)
  void clearSortOrder() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get limit => $_getIZ(15);
  @$pb.TagNumber(16)
  set limit($core.int v) { $_setSignedInt32(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasLimit() => $_has(15);
  @$pb.TagNumber(16)
  void clearLimit() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get offset => $_getIZ(16);
  @$pb.TagNumber(17)
  set offset($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasOffset() => $_has(16);
  @$pb.TagNumber(17)
  void clearOffset() => clearField(17);

  /// Additional date range filters
  @$pb.TagNumber(18)
  $1.Timestamp get scheduledDateFrom => $_getN(17);
  @$pb.TagNumber(18)
  set scheduledDateFrom($1.Timestamp v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasScheduledDateFrom() => $_has(17);
  @$pb.TagNumber(18)
  void clearScheduledDateFrom() => clearField(18);
  @$pb.TagNumber(18)
  $1.Timestamp ensureScheduledDateFrom() => $_ensure(17);

  @$pb.TagNumber(19)
  $1.Timestamp get scheduledDateTo => $_getN(18);
  @$pb.TagNumber(19)
  set scheduledDateTo($1.Timestamp v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasScheduledDateTo() => $_has(18);
  @$pb.TagNumber(19)
  void clearScheduledDateTo() => clearField(19);
  @$pb.TagNumber(19)
  $1.Timestamp ensureScheduledDateTo() => $_ensure(18);

  @$pb.TagNumber(20)
  $1.Timestamp get dueDateFrom => $_getN(19);
  @$pb.TagNumber(20)
  set dueDateFrom($1.Timestamp v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasDueDateFrom() => $_has(19);
  @$pb.TagNumber(20)
  void clearDueDateFrom() => clearField(20);
  @$pb.TagNumber(20)
  $1.Timestamp ensureDueDateFrom() => $_ensure(19);

  @$pb.TagNumber(21)
  $1.Timestamp get dueDateTo => $_getN(20);
  @$pb.TagNumber(21)
  set dueDateTo($1.Timestamp v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasDueDateTo() => $_has(20);
  @$pb.TagNumber(21)
  void clearDueDateTo() => clearField(21);
  @$pb.TagNumber(21)
  $1.Timestamp ensureDueDateTo() => $_ensure(20);

  /// Filter for tasks with no assigner
  @$pb.TagNumber(22)
  $core.bool get filterNoAssigner => $_getBF(21);
  @$pb.TagNumber(22)
  set filterNoAssigner($core.bool v) { $_setBool(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasFilterNoAssigner() => $_has(21);
  @$pb.TagNumber(22)
  void clearFilterNoAssigner() => clearField(22);

  /// Filter for tasks with no requester
  @$pb.TagNumber(23)
  $core.bool get filterNoRequester => $_getBF(22);
  @$pb.TagNumber(23)
  set filterNoRequester($core.bool v) { $_setBool(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasFilterNoRequester() => $_has(22);
  @$pb.TagNumber(23)
  void clearFilterNoRequester() => clearField(23);
}

class ListTasksResponse extends $pb.GeneratedMessage {
  factory ListTasksResponse({
    $core.Iterable<TaskWithDetails>? items,
    $core.int? total,
    $core.int? page,
    $core.int? pageSize,
    $core.int? totalPages,
    $core.double? avgTimeToCloseHours,
    $core.double? avgResponseTimeHours,
    $core.double? avgTimeToCloseLastMonthHours,
    $core.double? avgResponseTimeLastMonthHours,
    $core.int? totalTicketsLastMonth,
    $core.Iterable<WeeklyMetricDataPoint>? weeklyTimeToClose,
    $core.Iterable<WeeklyMetricDataPoint>? weeklyResponseTime,
    $core.Iterable<WeeklyCountDataPoint>? weeklyOpenTickets,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (total != null) {
      $result.total = total;
    }
    if (page != null) {
      $result.page = page;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (totalPages != null) {
      $result.totalPages = totalPages;
    }
    if (avgTimeToCloseHours != null) {
      $result.avgTimeToCloseHours = avgTimeToCloseHours;
    }
    if (avgResponseTimeHours != null) {
      $result.avgResponseTimeHours = avgResponseTimeHours;
    }
    if (avgTimeToCloseLastMonthHours != null) {
      $result.avgTimeToCloseLastMonthHours = avgTimeToCloseLastMonthHours;
    }
    if (avgResponseTimeLastMonthHours != null) {
      $result.avgResponseTimeLastMonthHours = avgResponseTimeLastMonthHours;
    }
    if (totalTicketsLastMonth != null) {
      $result.totalTicketsLastMonth = totalTicketsLastMonth;
    }
    if (weeklyTimeToClose != null) {
      $result.weeklyTimeToClose.addAll(weeklyTimeToClose);
    }
    if (weeklyResponseTime != null) {
      $result.weeklyResponseTime.addAll(weeklyResponseTime);
    }
    if (weeklyOpenTickets != null) {
      $result.weeklyOpenTickets.addAll(weeklyOpenTickets);
    }
    return $result;
  }
  ListTasksResponse._() : super();
  factory ListTasksResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTasksResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTasksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<TaskWithDetails>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: TaskWithDetails.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'totalPages', $pb.PbFieldType.O3)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'avgTimeToCloseHours', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'avgResponseTimeHours', $pb.PbFieldType.OD)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'avgTimeToCloseLastMonthHours', $pb.PbFieldType.OD)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'avgResponseTimeLastMonthHours', $pb.PbFieldType.OD)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'totalTicketsLastMonth', $pb.PbFieldType.O3)
    ..pc<WeeklyMetricDataPoint>(11, _omitFieldNames ? '' : 'weeklyTimeToClose', $pb.PbFieldType.PM, subBuilder: WeeklyMetricDataPoint.create)
    ..pc<WeeklyMetricDataPoint>(12, _omitFieldNames ? '' : 'weeklyResponseTime', $pb.PbFieldType.PM, subBuilder: WeeklyMetricDataPoint.create)
    ..pc<WeeklyCountDataPoint>(13, _omitFieldNames ? '' : 'weeklyOpenTickets', $pb.PbFieldType.PM, subBuilder: WeeklyCountDataPoint.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTasksResponse clone() => ListTasksResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTasksResponse copyWith(void Function(ListTasksResponse) updates) => super.copyWith((message) => updates(message as ListTasksResponse)) as ListTasksResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTasksResponse create() => ListTasksResponse._();
  ListTasksResponse createEmptyInstance() => create();
  static $pb.PbList<ListTasksResponse> createRepeated() => $pb.PbList<ListTasksResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTasksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTasksResponse>(create);
  static ListTasksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskWithDetails> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get pageSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set pageSize($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPageSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalPages => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalPages($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalPages() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalPages() => clearField(5);

  /// Aggregate metrics
  @$pb.TagNumber(6)
  $core.double get avgTimeToCloseHours => $_getN(5);
  @$pb.TagNumber(6)
  set avgTimeToCloseHours($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvgTimeToCloseHours() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvgTimeToCloseHours() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get avgResponseTimeHours => $_getN(6);
  @$pb.TagNumber(7)
  set avgResponseTimeHours($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAvgResponseTimeHours() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvgResponseTimeHours() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get avgTimeToCloseLastMonthHours => $_getN(7);
  @$pb.TagNumber(8)
  set avgTimeToCloseLastMonthHours($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAvgTimeToCloseLastMonthHours() => $_has(7);
  @$pb.TagNumber(8)
  void clearAvgTimeToCloseLastMonthHours() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get avgResponseTimeLastMonthHours => $_getN(8);
  @$pb.TagNumber(9)
  set avgResponseTimeLastMonthHours($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAvgResponseTimeLastMonthHours() => $_has(8);
  @$pb.TagNumber(9)
  void clearAvgResponseTimeLastMonthHours() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get totalTicketsLastMonth => $_getIZ(9);
  @$pb.TagNumber(10)
  set totalTicketsLastMonth($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTotalTicketsLastMonth() => $_has(9);
  @$pb.TagNumber(10)
  void clearTotalTicketsLastMonth() => clearField(10);

  /// Weekly breakdown for charts
  @$pb.TagNumber(11)
  $core.List<WeeklyMetricDataPoint> get weeklyTimeToClose => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<WeeklyMetricDataPoint> get weeklyResponseTime => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<WeeklyCountDataPoint> get weeklyOpenTickets => $_getList(12);
}

class WeeklyMetricDataPoint extends $pb.GeneratedMessage {
  factory WeeklyMetricDataPoint({
    $1.Timestamp? weekStart,
    $core.double? averageHours,
    $core.int? taskCount,
  }) {
    final $result = create();
    if (weekStart != null) {
      $result.weekStart = weekStart;
    }
    if (averageHours != null) {
      $result.averageHours = averageHours;
    }
    if (taskCount != null) {
      $result.taskCount = taskCount;
    }
    return $result;
  }
  WeeklyMetricDataPoint._() : super();
  factory WeeklyMetricDataPoint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WeeklyMetricDataPoint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WeeklyMetricDataPoint', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOM<$1.Timestamp>(1, _omitFieldNames ? '' : 'weekStart', subBuilder: $1.Timestamp.create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'averageHours', $pb.PbFieldType.OD)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'taskCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WeeklyMetricDataPoint clone() => WeeklyMetricDataPoint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WeeklyMetricDataPoint copyWith(void Function(WeeklyMetricDataPoint) updates) => super.copyWith((message) => updates(message as WeeklyMetricDataPoint)) as WeeklyMetricDataPoint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WeeklyMetricDataPoint create() => WeeklyMetricDataPoint._();
  WeeklyMetricDataPoint createEmptyInstance() => create();
  static $pb.PbList<WeeklyMetricDataPoint> createRepeated() => $pb.PbList<WeeklyMetricDataPoint>();
  @$core.pragma('dart2js:noInline')
  static WeeklyMetricDataPoint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WeeklyMetricDataPoint>(create);
  static WeeklyMetricDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Timestamp get weekStart => $_getN(0);
  @$pb.TagNumber(1)
  set weekStart($1.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasWeekStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearWeekStart() => clearField(1);
  @$pb.TagNumber(1)
  $1.Timestamp ensureWeekStart() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get averageHours => $_getN(1);
  @$pb.TagNumber(2)
  set averageHours($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAverageHours() => $_has(1);
  @$pb.TagNumber(2)
  void clearAverageHours() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get taskCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set taskCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTaskCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaskCount() => clearField(3);
}

class WeeklyCountDataPoint extends $pb.GeneratedMessage {
  factory WeeklyCountDataPoint({
    $1.Timestamp? weekStart,
    $core.int? count,
  }) {
    final $result = create();
    if (weekStart != null) {
      $result.weekStart = weekStart;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  WeeklyCountDataPoint._() : super();
  factory WeeklyCountDataPoint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WeeklyCountDataPoint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WeeklyCountDataPoint', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOM<$1.Timestamp>(1, _omitFieldNames ? '' : 'weekStart', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WeeklyCountDataPoint clone() => WeeklyCountDataPoint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WeeklyCountDataPoint copyWith(void Function(WeeklyCountDataPoint) updates) => super.copyWith((message) => updates(message as WeeklyCountDataPoint)) as WeeklyCountDataPoint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WeeklyCountDataPoint create() => WeeklyCountDataPoint._();
  WeeklyCountDataPoint createEmptyInstance() => create();
  static $pb.PbList<WeeklyCountDataPoint> createRepeated() => $pb.PbList<WeeklyCountDataPoint>();
  @$core.pragma('dart2js:noInline')
  static WeeklyCountDataPoint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WeeklyCountDataPoint>(create);
  static WeeklyCountDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Timestamp get weekStart => $_getN(0);
  @$pb.TagNumber(1)
  set weekStart($1.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasWeekStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearWeekStart() => clearField(1);
  @$pb.TagNumber(1)
  $1.Timestamp ensureWeekStart() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class TaskComment extends $pb.GeneratedMessage {
  factory TaskComment({
    $core.String? id,
    $core.String? taskId,
    $core.String? content,
    $core.Iterable<MentionedMember>? mentionedMembers,
    CommentAuthor? createdBy,
    $core.Iterable<TaskAttachment>? attachments,
    $core.Iterable<CommentEditHistory>? editHistory,
    $core.bool? edited,
    $1.Timestamp? editedAt,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (content != null) {
      $result.content = content;
    }
    if (mentionedMembers != null) {
      $result.mentionedMembers.addAll(mentionedMembers);
    }
    if (createdBy != null) {
      $result.createdBy = createdBy;
    }
    if (attachments != null) {
      $result.attachments.addAll(attachments);
    }
    if (editHistory != null) {
      $result.editHistory.addAll(editHistory);
    }
    if (edited != null) {
      $result.edited = edited;
    }
    if (editedAt != null) {
      $result.editedAt = editedAt;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  TaskComment._() : super();
  factory TaskComment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskComment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskComment', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'taskId')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..pc<MentionedMember>(4, _omitFieldNames ? '' : 'mentionedMembers', $pb.PbFieldType.PM, subBuilder: MentionedMember.create)
    ..aOM<CommentAuthor>(5, _omitFieldNames ? '' : 'createdBy', subBuilder: CommentAuthor.create)
    ..pc<TaskAttachment>(6, _omitFieldNames ? '' : 'attachments', $pb.PbFieldType.PM, subBuilder: TaskAttachment.create)
    ..pc<CommentEditHistory>(7, _omitFieldNames ? '' : 'editHistory', $pb.PbFieldType.PM, subBuilder: CommentEditHistory.create)
    ..aOB(8, _omitFieldNames ? '' : 'edited')
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'editedAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskComment clone() => TaskComment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskComment copyWith(void Function(TaskComment) updates) => super.copyWith((message) => updates(message as TaskComment)) as TaskComment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskComment create() => TaskComment._();
  TaskComment createEmptyInstance() => create();
  static $pb.PbList<TaskComment> createRepeated() => $pb.PbList<TaskComment>();
  @$core.pragma('dart2js:noInline')
  static TaskComment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskComment>(create);
  static TaskComment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskId => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<MentionedMember> get mentionedMembers => $_getList(3);

  @$pb.TagNumber(5)
  CommentAuthor get createdBy => $_getN(4);
  @$pb.TagNumber(5)
  set createdBy(CommentAuthor v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedBy() => clearField(5);
  @$pb.TagNumber(5)
  CommentAuthor ensureCreatedBy() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<TaskAttachment> get attachments => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<CommentEditHistory> get editHistory => $_getList(6);

  @$pb.TagNumber(8)
  $core.bool get edited => $_getBF(7);
  @$pb.TagNumber(8)
  set edited($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEdited() => $_has(7);
  @$pb.TagNumber(8)
  void clearEdited() => clearField(8);

  @$pb.TagNumber(9)
  $1.Timestamp get editedAt => $_getN(8);
  @$pb.TagNumber(9)
  set editedAt($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasEditedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearEditedAt() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureEditedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $1.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(10)
  set createdAt($1.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureCreatedAt() => $_ensure(9);

  @$pb.TagNumber(11)
  $1.Timestamp get updatedAt => $_getN(10);
  @$pb.TagNumber(11)
  set updatedAt($1.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUpdatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdatedAt() => clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureUpdatedAt() => $_ensure(10);
}

class MentionedMember extends $pb.GeneratedMessage {
  factory MentionedMember({
    $core.String? id,
    $core.String? name,
    $core.String? email,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  MentionedMember._() : super();
  factory MentionedMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MentionedMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MentionedMember', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MentionedMember clone() => MentionedMember()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MentionedMember copyWith(void Function(MentionedMember) updates) => super.copyWith((message) => updates(message as MentionedMember)) as MentionedMember;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentionedMember create() => MentionedMember._();
  MentionedMember createEmptyInstance() => create();
  static $pb.PbList<MentionedMember> createRepeated() => $pb.PbList<MentionedMember>();
  @$core.pragma('dart2js:noInline')
  static MentionedMember getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MentionedMember>(create);
  static MentionedMember? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

class CommentAuthor extends $pb.GeneratedMessage {
  factory CommentAuthor({
    $core.String? id,
    $core.String? name,
    $core.String? email,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  CommentAuthor._() : super();
  factory CommentAuthor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommentAuthor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CommentAuthor', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommentAuthor clone() => CommentAuthor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommentAuthor copyWith(void Function(CommentAuthor) updates) => super.copyWith((message) => updates(message as CommentAuthor)) as CommentAuthor;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommentAuthor create() => CommentAuthor._();
  CommentAuthor createEmptyInstance() => create();
  static $pb.PbList<CommentAuthor> createRepeated() => $pb.PbList<CommentAuthor>();
  @$core.pragma('dart2js:noInline')
  static CommentAuthor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommentAuthor>(create);
  static CommentAuthor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

class CommentEditHistory extends $pb.GeneratedMessage {
  factory CommentEditHistory({
    $core.String? previousContent,
    $1.Timestamp? editedAt,
    $core.String? editedById,
    $core.String? editedByName,
  }) {
    final $result = create();
    if (previousContent != null) {
      $result.previousContent = previousContent;
    }
    if (editedAt != null) {
      $result.editedAt = editedAt;
    }
    if (editedById != null) {
      $result.editedById = editedById;
    }
    if (editedByName != null) {
      $result.editedByName = editedByName;
    }
    return $result;
  }
  CommentEditHistory._() : super();
  factory CommentEditHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommentEditHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CommentEditHistory', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'previousContent')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'editedAt', subBuilder: $1.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'editedById')
    ..aOS(4, _omitFieldNames ? '' : 'editedByName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommentEditHistory clone() => CommentEditHistory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommentEditHistory copyWith(void Function(CommentEditHistory) updates) => super.copyWith((message) => updates(message as CommentEditHistory)) as CommentEditHistory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommentEditHistory create() => CommentEditHistory._();
  CommentEditHistory createEmptyInstance() => create();
  static $pb.PbList<CommentEditHistory> createRepeated() => $pb.PbList<CommentEditHistory>();
  @$core.pragma('dart2js:noInline')
  static CommentEditHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommentEditHistory>(create);
  static CommentEditHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get previousContent => $_getSZ(0);
  @$pb.TagNumber(1)
  set previousContent($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPreviousContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreviousContent() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get editedAt => $_getN(1);
  @$pb.TagNumber(2)
  set editedAt($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEditedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEditedAt() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureEditedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get editedById => $_getSZ(2);
  @$pb.TagNumber(3)
  set editedById($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEditedById() => $_has(2);
  @$pb.TagNumber(3)
  void clearEditedById() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get editedByName => $_getSZ(3);
  @$pb.TagNumber(4)
  set editedByName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEditedByName() => $_has(3);
  @$pb.TagNumber(4)
  void clearEditedByName() => clearField(4);
}

class TaskAttachment extends $pb.GeneratedMessage {
  factory TaskAttachment({
    $core.String? id,
    $core.String? fileName,
    $core.String? contentType,
    $fixnum.Int64? sizeBytes,
    $core.String? url,
    $1.Timestamp? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (sizeBytes != null) {
      $result.sizeBytes = sizeBytes;
    }
    if (url != null) {
      $result.url = url;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  TaskAttachment._() : super();
  factory TaskAttachment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskAttachment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskAttachment', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..aOS(3, _omitFieldNames ? '' : 'contentType')
    ..aInt64(4, _omitFieldNames ? '' : 'sizeBytes')
    ..aOS(5, _omitFieldNames ? '' : 'url')
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskAttachment clone() => TaskAttachment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskAttachment copyWith(void Function(TaskAttachment) updates) => super.copyWith((message) => updates(message as TaskAttachment)) as TaskAttachment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskAttachment create() => TaskAttachment._();
  TaskAttachment createEmptyInstance() => create();
  static $pb.PbList<TaskAttachment> createRepeated() => $pb.PbList<TaskAttachment>();
  @$core.pragma('dart2js:noInline')
  static TaskAttachment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskAttachment>(create);
  static TaskAttachment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get contentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set contentType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearContentType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sizeBytes => $_getI64(3);
  @$pb.TagNumber(4)
  set sizeBytes($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSizeBytes() => $_has(3);
  @$pb.TagNumber(4)
  void clearSizeBytes() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureCreatedAt() => $_ensure(5);
}

class GetAttachmentUploadUrlRequest extends $pb.GeneratedMessage {
  factory GetAttachmentUploadUrlRequest({
    $core.String? taskId,
    $core.String? fileName,
    $core.String? contentType,
    $fixnum.Int64? sizeBytes,
  }) {
    final $result = create();
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (sizeBytes != null) {
      $result.sizeBytes = sizeBytes;
    }
    return $result;
  }
  GetAttachmentUploadUrlRequest._() : super();
  factory GetAttachmentUploadUrlRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAttachmentUploadUrlRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAttachmentUploadUrlRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..aOS(3, _omitFieldNames ? '' : 'contentType')
    ..aInt64(4, _omitFieldNames ? '' : 'sizeBytes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAttachmentUploadUrlRequest clone() => GetAttachmentUploadUrlRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAttachmentUploadUrlRequest copyWith(void Function(GetAttachmentUploadUrlRequest) updates) => super.copyWith((message) => updates(message as GetAttachmentUploadUrlRequest)) as GetAttachmentUploadUrlRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAttachmentUploadUrlRequest create() => GetAttachmentUploadUrlRequest._();
  GetAttachmentUploadUrlRequest createEmptyInstance() => create();
  static $pb.PbList<GetAttachmentUploadUrlRequest> createRepeated() => $pb.PbList<GetAttachmentUploadUrlRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAttachmentUploadUrlRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAttachmentUploadUrlRequest>(create);
  static GetAttachmentUploadUrlRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get contentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set contentType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearContentType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sizeBytes => $_getI64(3);
  @$pb.TagNumber(4)
  set sizeBytes($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSizeBytes() => $_has(3);
  @$pb.TagNumber(4)
  void clearSizeBytes() => clearField(4);
}

class GetAttachmentUploadUrlResponse extends $pb.GeneratedMessage {
  factory GetAttachmentUploadUrlResponse({
    $core.String? uploadUrl,
    $core.String? attachmentId,
    $1.Timestamp? expiresAt,
  }) {
    final $result = create();
    if (uploadUrl != null) {
      $result.uploadUrl = uploadUrl;
    }
    if (attachmentId != null) {
      $result.attachmentId = attachmentId;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    return $result;
  }
  GetAttachmentUploadUrlResponse._() : super();
  factory GetAttachmentUploadUrlResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAttachmentUploadUrlResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAttachmentUploadUrlResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uploadUrl')
    ..aOS(2, _omitFieldNames ? '' : 'attachmentId')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'expiresAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAttachmentUploadUrlResponse clone() => GetAttachmentUploadUrlResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAttachmentUploadUrlResponse copyWith(void Function(GetAttachmentUploadUrlResponse) updates) => super.copyWith((message) => updates(message as GetAttachmentUploadUrlResponse)) as GetAttachmentUploadUrlResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAttachmentUploadUrlResponse create() => GetAttachmentUploadUrlResponse._();
  GetAttachmentUploadUrlResponse createEmptyInstance() => create();
  static $pb.PbList<GetAttachmentUploadUrlResponse> createRepeated() => $pb.PbList<GetAttachmentUploadUrlResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAttachmentUploadUrlResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAttachmentUploadUrlResponse>(create);
  static GetAttachmentUploadUrlResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uploadUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set uploadUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUploadUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUploadUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get attachmentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set attachmentId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAttachmentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAttachmentId() => clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get expiresAt => $_getN(2);
  @$pb.TagNumber(3)
  set expiresAt($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpiresAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresAt() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureExpiresAt() => $_ensure(2);
}

class ConfirmAttachmentUploadRequest extends $pb.GeneratedMessage {
  factory ConfirmAttachmentUploadRequest({
    $core.String? attachmentId,
    $core.String? taskId,
    $core.String? commentId,
  }) {
    final $result = create();
    if (attachmentId != null) {
      $result.attachmentId = attachmentId;
    }
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (commentId != null) {
      $result.commentId = commentId;
    }
    return $result;
  }
  ConfirmAttachmentUploadRequest._() : super();
  factory ConfirmAttachmentUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfirmAttachmentUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfirmAttachmentUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'attachmentId')
    ..aOS(2, _omitFieldNames ? '' : 'taskId')
    ..aOS(3, _omitFieldNames ? '' : 'commentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfirmAttachmentUploadRequest clone() => ConfirmAttachmentUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfirmAttachmentUploadRequest copyWith(void Function(ConfirmAttachmentUploadRequest) updates) => super.copyWith((message) => updates(message as ConfirmAttachmentUploadRequest)) as ConfirmAttachmentUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfirmAttachmentUploadRequest create() => ConfirmAttachmentUploadRequest._();
  ConfirmAttachmentUploadRequest createEmptyInstance() => create();
  static $pb.PbList<ConfirmAttachmentUploadRequest> createRepeated() => $pb.PbList<ConfirmAttachmentUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static ConfirmAttachmentUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfirmAttachmentUploadRequest>(create);
  static ConfirmAttachmentUploadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get attachmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set attachmentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAttachmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttachmentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskId => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get commentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set commentId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCommentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommentId() => clearField(3);
}

class ListTaskAttachmentsRequest extends $pb.GeneratedMessage {
  factory ListTaskAttachmentsRequest({
    $core.String? taskId,
  }) {
    final $result = create();
    if (taskId != null) {
      $result.taskId = taskId;
    }
    return $result;
  }
  ListTaskAttachmentsRequest._() : super();
  factory ListTaskAttachmentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTaskAttachmentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTaskAttachmentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTaskAttachmentsRequest clone() => ListTaskAttachmentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTaskAttachmentsRequest copyWith(void Function(ListTaskAttachmentsRequest) updates) => super.copyWith((message) => updates(message as ListTaskAttachmentsRequest)) as ListTaskAttachmentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTaskAttachmentsRequest create() => ListTaskAttachmentsRequest._();
  ListTaskAttachmentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListTaskAttachmentsRequest> createRepeated() => $pb.PbList<ListTaskAttachmentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTaskAttachmentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTaskAttachmentsRequest>(create);
  static ListTaskAttachmentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => clearField(1);
}

class ListTaskAttachmentsResponse extends $pb.GeneratedMessage {
  factory ListTaskAttachmentsResponse({
    $core.Iterable<TaskAttachment>? attachments,
  }) {
    final $result = create();
    if (attachments != null) {
      $result.attachments.addAll(attachments);
    }
    return $result;
  }
  ListTaskAttachmentsResponse._() : super();
  factory ListTaskAttachmentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTaskAttachmentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTaskAttachmentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<TaskAttachment>(1, _omitFieldNames ? '' : 'attachments', $pb.PbFieldType.PM, subBuilder: TaskAttachment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTaskAttachmentsResponse clone() => ListTaskAttachmentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTaskAttachmentsResponse copyWith(void Function(ListTaskAttachmentsResponse) updates) => super.copyWith((message) => updates(message as ListTaskAttachmentsResponse)) as ListTaskAttachmentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTaskAttachmentsResponse create() => ListTaskAttachmentsResponse._();
  ListTaskAttachmentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListTaskAttachmentsResponse> createRepeated() => $pb.PbList<ListTaskAttachmentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTaskAttachmentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTaskAttachmentsResponse>(create);
  static ListTaskAttachmentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskAttachment> get attachments => $_getList(0);
}

class DeleteAttachmentRequest extends $pb.GeneratedMessage {
  factory DeleteAttachmentRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteAttachmentRequest._() : super();
  factory DeleteAttachmentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAttachmentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAttachmentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAttachmentRequest clone() => DeleteAttachmentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAttachmentRequest copyWith(void Function(DeleteAttachmentRequest) updates) => super.copyWith((message) => updates(message as DeleteAttachmentRequest)) as DeleteAttachmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAttachmentRequest create() => DeleteAttachmentRequest._();
  DeleteAttachmentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAttachmentRequest> createRepeated() => $pb.PbList<DeleteAttachmentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAttachmentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAttachmentRequest>(create);
  static DeleteAttachmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteAttachmentResponse extends $pb.GeneratedMessage {
  factory DeleteAttachmentResponse() => create();
  DeleteAttachmentResponse._() : super();
  factory DeleteAttachmentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAttachmentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAttachmentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAttachmentResponse clone() => DeleteAttachmentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAttachmentResponse copyWith(void Function(DeleteAttachmentResponse) updates) => super.copyWith((message) => updates(message as DeleteAttachmentResponse)) as DeleteAttachmentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAttachmentResponse create() => DeleteAttachmentResponse._();
  DeleteAttachmentResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteAttachmentResponse> createRepeated() => $pb.PbList<DeleteAttachmentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteAttachmentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAttachmentResponse>(create);
  static DeleteAttachmentResponse? _defaultInstance;
}

class CreateCommentRequest extends $pb.GeneratedMessage {
  factory CreateCommentRequest({
    $core.String? taskId,
    $core.String? content,
    $core.Iterable<$core.String>? mentionedMemberIds,
    $core.Iterable<$core.String>? attachmentIds,
  }) {
    final $result = create();
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (content != null) {
      $result.content = content;
    }
    if (mentionedMemberIds != null) {
      $result.mentionedMemberIds.addAll(mentionedMemberIds);
    }
    if (attachmentIds != null) {
      $result.attachmentIds.addAll(attachmentIds);
    }
    return $result;
  }
  CreateCommentRequest._() : super();
  factory CreateCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..pPS(3, _omitFieldNames ? '' : 'mentionedMemberIds')
    ..pPS(4, _omitFieldNames ? '' : 'attachmentIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCommentRequest clone() => CreateCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCommentRequest copyWith(void Function(CreateCommentRequest) updates) => super.copyWith((message) => updates(message as CreateCommentRequest)) as CreateCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCommentRequest create() => CreateCommentRequest._();
  CreateCommentRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCommentRequest> createRepeated() => $pb.PbList<CreateCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCommentRequest>(create);
  static CreateCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get mentionedMemberIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get attachmentIds => $_getList(3);
}

class UpdateCommentRequest extends $pb.GeneratedMessage {
  factory UpdateCommentRequest({
    $core.String? id,
    $core.String? content,
    $core.Iterable<$core.String>? mentionedMemberIds,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (content != null) {
      $result.content = content;
    }
    if (mentionedMemberIds != null) {
      $result.mentionedMemberIds.addAll(mentionedMemberIds);
    }
    return $result;
  }
  UpdateCommentRequest._() : super();
  factory UpdateCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..pPS(3, _omitFieldNames ? '' : 'mentionedMemberIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCommentRequest clone() => UpdateCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCommentRequest copyWith(void Function(UpdateCommentRequest) updates) => super.copyWith((message) => updates(message as UpdateCommentRequest)) as UpdateCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCommentRequest create() => UpdateCommentRequest._();
  UpdateCommentRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateCommentRequest> createRepeated() => $pb.PbList<UpdateCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCommentRequest>(create);
  static UpdateCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get mentionedMemberIds => $_getList(2);
}

class DeleteCommentRequest extends $pb.GeneratedMessage {
  factory DeleteCommentRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteCommentRequest._() : super();
  factory DeleteCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCommentRequest clone() => DeleteCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCommentRequest copyWith(void Function(DeleteCommentRequest) updates) => super.copyWith((message) => updates(message as DeleteCommentRequest)) as DeleteCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCommentRequest create() => DeleteCommentRequest._();
  DeleteCommentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCommentRequest> createRepeated() => $pb.PbList<DeleteCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCommentRequest>(create);
  static DeleteCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteCommentResponse extends $pb.GeneratedMessage {
  factory DeleteCommentResponse() => create();
  DeleteCommentResponse._() : super();
  factory DeleteCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCommentResponse clone() => DeleteCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCommentResponse copyWith(void Function(DeleteCommentResponse) updates) => super.copyWith((message) => updates(message as DeleteCommentResponse)) as DeleteCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCommentResponse create() => DeleteCommentResponse._();
  DeleteCommentResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteCommentResponse> createRepeated() => $pb.PbList<DeleteCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCommentResponse>(create);
  static DeleteCommentResponse? _defaultInstance;
}

class ListCommentsRequest extends $pb.GeneratedMessage {
  factory ListCommentsRequest({
    $core.String? taskId,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  ListCommentsRequest._() : super();
  factory ListCommentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCommentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCommentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCommentsRequest clone() => ListCommentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCommentsRequest copyWith(void Function(ListCommentsRequest) updates) => super.copyWith((message) => updates(message as ListCommentsRequest)) as ListCommentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCommentsRequest create() => ListCommentsRequest._();
  ListCommentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListCommentsRequest> createRepeated() => $pb.PbList<ListCommentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListCommentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCommentsRequest>(create);
  static ListCommentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);
}

class ListCommentsResponse extends $pb.GeneratedMessage {
  factory ListCommentsResponse({
    $core.Iterable<TaskComment>? comments,
    $core.int? total,
  }) {
    final $result = create();
    if (comments != null) {
      $result.comments.addAll(comments);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ListCommentsResponse._() : super();
  factory ListCommentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCommentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCommentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<TaskComment>(1, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: TaskComment.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCommentsResponse clone() => ListCommentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCommentsResponse copyWith(void Function(ListCommentsResponse) updates) => super.copyWith((message) => updates(message as ListCommentsResponse)) as ListCommentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCommentsResponse create() => ListCommentsResponse._();
  ListCommentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListCommentsResponse> createRepeated() => $pb.PbList<ListCommentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListCommentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCommentsResponse>(create);
  static ListCommentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskComment> get comments => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

class TaskActivity extends $pb.GeneratedMessage {
  factory TaskActivity({
    $core.String? id,
    $core.String? taskId,
    $core.String? eventType,
    CommentAuthor? changedBy,
    $core.String? notes,
    $2.Struct? changes,
    $core.Iterable<TaskAttachment>? attachments,
    TaskComment? comment,
    $1.Timestamp? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (changedBy != null) {
      $result.changedBy = changedBy;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (changes != null) {
      $result.changes = changes;
    }
    if (attachments != null) {
      $result.attachments.addAll(attachments);
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  TaskActivity._() : super();
  factory TaskActivity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskActivity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskActivity', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'taskId')
    ..aOS(3, _omitFieldNames ? '' : 'eventType')
    ..aOM<CommentAuthor>(4, _omitFieldNames ? '' : 'changedBy', subBuilder: CommentAuthor.create)
    ..aOS(5, _omitFieldNames ? '' : 'notes')
    ..aOM<$2.Struct>(6, _omitFieldNames ? '' : 'changes', subBuilder: $2.Struct.create)
    ..pc<TaskAttachment>(7, _omitFieldNames ? '' : 'attachments', $pb.PbFieldType.PM, subBuilder: TaskAttachment.create)
    ..aOM<TaskComment>(8, _omitFieldNames ? '' : 'comment', subBuilder: TaskComment.create)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskActivity clone() => TaskActivity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskActivity copyWith(void Function(TaskActivity) updates) => super.copyWith((message) => updates(message as TaskActivity)) as TaskActivity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskActivity create() => TaskActivity._();
  TaskActivity createEmptyInstance() => create();
  static $pb.PbList<TaskActivity> createRepeated() => $pb.PbList<TaskActivity>();
  @$core.pragma('dart2js:noInline')
  static TaskActivity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskActivity>(create);
  static TaskActivity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskId => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get eventType => $_getSZ(2);
  @$pb.TagNumber(3)
  set eventType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEventType() => $_has(2);
  @$pb.TagNumber(3)
  void clearEventType() => clearField(3);

  @$pb.TagNumber(4)
  CommentAuthor get changedBy => $_getN(3);
  @$pb.TagNumber(4)
  set changedBy(CommentAuthor v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasChangedBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearChangedBy() => clearField(4);
  @$pb.TagNumber(4)
  CommentAuthor ensureChangedBy() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get notes => $_getSZ(4);
  @$pb.TagNumber(5)
  set notes($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotes() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotes() => clearField(5);

  @$pb.TagNumber(6)
  $2.Struct get changes => $_getN(5);
  @$pb.TagNumber(6)
  set changes($2.Struct v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasChanges() => $_has(5);
  @$pb.TagNumber(6)
  void clearChanges() => clearField(6);
  @$pb.TagNumber(6)
  $2.Struct ensureChanges() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<TaskAttachment> get attachments => $_getList(6);

  /// Embedded comment if event_type is comment-related
  @$pb.TagNumber(8)
  TaskComment get comment => $_getN(7);
  @$pb.TagNumber(8)
  set comment(TaskComment v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasComment() => $_has(7);
  @$pb.TagNumber(8)
  void clearComment() => clearField(8);
  @$pb.TagNumber(8)
  TaskComment ensureComment() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureCreatedAt() => $_ensure(8);
}

class GetTaskActivityRequest extends $pb.GeneratedMessage {
  factory GetTaskActivityRequest({
    $core.String? taskId,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetTaskActivityRequest._() : super();
  factory GetTaskActivityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskActivityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskActivityRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskActivityRequest clone() => GetTaskActivityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskActivityRequest copyWith(void Function(GetTaskActivityRequest) updates) => super.copyWith((message) => updates(message as GetTaskActivityRequest)) as GetTaskActivityRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskActivityRequest create() => GetTaskActivityRequest._();
  GetTaskActivityRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskActivityRequest> createRepeated() => $pb.PbList<GetTaskActivityRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskActivityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskActivityRequest>(create);
  static GetTaskActivityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);
}

class GetTaskActivityResponse extends $pb.GeneratedMessage {
  factory GetTaskActivityResponse({
    $core.Iterable<TaskActivity>? items,
    $core.int? total,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  GetTaskActivityResponse._() : super();
  factory GetTaskActivityResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskActivityResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskActivityResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<TaskActivity>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: TaskActivity.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskActivityResponse clone() => GetTaskActivityResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskActivityResponse copyWith(void Function(GetTaskActivityResponse) updates) => super.copyWith((message) => updates(message as GetTaskActivityResponse)) as GetTaskActivityResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskActivityResponse create() => GetTaskActivityResponse._();
  GetTaskActivityResponse createEmptyInstance() => create();
  static $pb.PbList<GetTaskActivityResponse> createRepeated() => $pb.PbList<GetTaskActivityResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTaskActivityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskActivityResponse>(create);
  static GetTaskActivityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskActivity> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

class AssignmentRule extends $pb.GeneratedMessage {
  factory AssignmentRule({
    $core.String? id,
    $core.String? companyId,
    $core.String? name,
    $core.String? description,
    $core.bool? isActive,
    $core.int? priority,
    $2.Struct? conditions,
    AssignmentTargetType? assignmentType,
    AssignmentMethod? assignmentMethod,
    $core.String? createdBy,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (conditions != null) {
      $result.conditions = conditions;
    }
    if (assignmentType != null) {
      $result.assignmentType = assignmentType;
    }
    if (assignmentMethod != null) {
      $result.assignmentMethod = assignmentMethod;
    }
    if (createdBy != null) {
      $result.createdBy = createdBy;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  AssignmentRule._() : super();
  factory AssignmentRule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignmentRule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssignmentRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'companyId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOB(5, _omitFieldNames ? '' : 'isActive')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..aOM<$2.Struct>(7, _omitFieldNames ? '' : 'conditions', subBuilder: $2.Struct.create)
    ..e<AssignmentTargetType>(8, _omitFieldNames ? '' : 'assignmentType', $pb.PbFieldType.OE, defaultOrMaker: AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_UNSPECIFIED, valueOf: AssignmentTargetType.valueOf, enumValues: AssignmentTargetType.values)
    ..e<AssignmentMethod>(9, _omitFieldNames ? '' : 'assignmentMethod', $pb.PbFieldType.OE, defaultOrMaker: AssignmentMethod.ASSIGNMENT_METHOD_UNSPECIFIED, valueOf: AssignmentMethod.valueOf, enumValues: AssignmentMethod.values)
    ..aOS(10, _omitFieldNames ? '' : 'createdBy')
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(12, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignmentRule clone() => AssignmentRule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignmentRule copyWith(void Function(AssignmentRule) updates) => super.copyWith((message) => updates(message as AssignmentRule)) as AssignmentRule;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignmentRule create() => AssignmentRule._();
  AssignmentRule createEmptyInstance() => create();
  static $pb.PbList<AssignmentRule> createRepeated() => $pb.PbList<AssignmentRule>();
  @$core.pragma('dart2js:noInline')
  static AssignmentRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignmentRule>(create);
  static AssignmentRule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isActive => $_getBF(4);
  @$pb.TagNumber(5)
  set isActive($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsActive() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsActive() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get priority => $_getIZ(5);
  @$pb.TagNumber(6)
  set priority($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPriority() => $_has(5);
  @$pb.TagNumber(6)
  void clearPriority() => clearField(6);

  /// Conditions: task_types, location_ids, asset_types (division codes), role_names, member_ids
  @$pb.TagNumber(7)
  $2.Struct get conditions => $_getN(6);
  @$pb.TagNumber(7)
  set conditions($2.Struct v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasConditions() => $_has(6);
  @$pb.TagNumber(7)
  void clearConditions() => clearField(7);
  @$pb.TagNumber(7)
  $2.Struct ensureConditions() => $_ensure(6);

  @$pb.TagNumber(8)
  AssignmentTargetType get assignmentType => $_getN(7);
  @$pb.TagNumber(8)
  set assignmentType(AssignmentTargetType v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAssignmentType() => $_has(7);
  @$pb.TagNumber(8)
  void clearAssignmentType() => clearField(8);

  @$pb.TagNumber(9)
  AssignmentMethod get assignmentMethod => $_getN(8);
  @$pb.TagNumber(9)
  set assignmentMethod(AssignmentMethod v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasAssignmentMethod() => $_has(8);
  @$pb.TagNumber(9)
  void clearAssignmentMethod() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get createdBy => $_getSZ(9);
  @$pb.TagNumber(10)
  set createdBy($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreatedBy() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedBy() => clearField(10);

  @$pb.TagNumber(11)
  $1.Timestamp get createdAt => $_getN(10);
  @$pb.TagNumber(11)
  set createdAt($1.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureCreatedAt() => $_ensure(10);

  @$pb.TagNumber(12)
  $1.Timestamp get updatedAt => $_getN(11);
  @$pb.TagNumber(12)
  set updatedAt($1.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdatedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearUpdatedAt() => clearField(12);
  @$pb.TagNumber(12)
  $1.Timestamp ensureUpdatedAt() => $_ensure(11);
}

class CreateAssignmentRuleRequest extends $pb.GeneratedMessage {
  factory CreateAssignmentRuleRequest({
    $core.String? name,
    $core.String? description,
    $core.bool? isActive,
    $core.int? priority,
    $2.Struct? conditions,
    AssignmentTargetType? assignmentType,
    AssignmentMethod? assignmentMethod,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (conditions != null) {
      $result.conditions = conditions;
    }
    if (assignmentType != null) {
      $result.assignmentType = assignmentType;
    }
    if (assignmentMethod != null) {
      $result.assignmentMethod = assignmentMethod;
    }
    return $result;
  }
  CreateAssignmentRuleRequest._() : super();
  factory CreateAssignmentRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAssignmentRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAssignmentRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOB(3, _omitFieldNames ? '' : 'isActive')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..aOM<$2.Struct>(5, _omitFieldNames ? '' : 'conditions', subBuilder: $2.Struct.create)
    ..e<AssignmentTargetType>(6, _omitFieldNames ? '' : 'assignmentType', $pb.PbFieldType.OE, defaultOrMaker: AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_UNSPECIFIED, valueOf: AssignmentTargetType.valueOf, enumValues: AssignmentTargetType.values)
    ..e<AssignmentMethod>(7, _omitFieldNames ? '' : 'assignmentMethod', $pb.PbFieldType.OE, defaultOrMaker: AssignmentMethod.ASSIGNMENT_METHOD_UNSPECIFIED, valueOf: AssignmentMethod.valueOf, enumValues: AssignmentMethod.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAssignmentRuleRequest clone() => CreateAssignmentRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAssignmentRuleRequest copyWith(void Function(CreateAssignmentRuleRequest) updates) => super.copyWith((message) => updates(message as CreateAssignmentRuleRequest)) as CreateAssignmentRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAssignmentRuleRequest create() => CreateAssignmentRuleRequest._();
  CreateAssignmentRuleRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAssignmentRuleRequest> createRepeated() => $pb.PbList<CreateAssignmentRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAssignmentRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAssignmentRuleRequest>(create);
  static CreateAssignmentRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isActive => $_getBF(2);
  @$pb.TagNumber(3)
  set isActive($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsActive() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsActive() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get priority => $_getIZ(3);
  @$pb.TagNumber(4)
  set priority($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPriority() => $_has(3);
  @$pb.TagNumber(4)
  void clearPriority() => clearField(4);

  @$pb.TagNumber(5)
  $2.Struct get conditions => $_getN(4);
  @$pb.TagNumber(5)
  set conditions($2.Struct v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasConditions() => $_has(4);
  @$pb.TagNumber(5)
  void clearConditions() => clearField(5);
  @$pb.TagNumber(5)
  $2.Struct ensureConditions() => $_ensure(4);

  @$pb.TagNumber(6)
  AssignmentTargetType get assignmentType => $_getN(5);
  @$pb.TagNumber(6)
  set assignmentType(AssignmentTargetType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAssignmentType() => $_has(5);
  @$pb.TagNumber(6)
  void clearAssignmentType() => clearField(6);

  @$pb.TagNumber(7)
  AssignmentMethod get assignmentMethod => $_getN(6);
  @$pb.TagNumber(7)
  set assignmentMethod(AssignmentMethod v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAssignmentMethod() => $_has(6);
  @$pb.TagNumber(7)
  void clearAssignmentMethod() => clearField(7);
}

class UpdateAssignmentRuleRequest extends $pb.GeneratedMessage {
  factory UpdateAssignmentRuleRequest({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.bool? isActive,
    $core.int? priority,
    $2.Struct? conditions,
    AssignmentTargetType? assignmentType,
    AssignmentMethod? assignmentMethod,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (conditions != null) {
      $result.conditions = conditions;
    }
    if (assignmentType != null) {
      $result.assignmentType = assignmentType;
    }
    if (assignmentMethod != null) {
      $result.assignmentMethod = assignmentMethod;
    }
    return $result;
  }
  UpdateAssignmentRuleRequest._() : super();
  factory UpdateAssignmentRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAssignmentRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAssignmentRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOB(4, _omitFieldNames ? '' : 'isActive')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..aOM<$2.Struct>(6, _omitFieldNames ? '' : 'conditions', subBuilder: $2.Struct.create)
    ..e<AssignmentTargetType>(7, _omitFieldNames ? '' : 'assignmentType', $pb.PbFieldType.OE, defaultOrMaker: AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_UNSPECIFIED, valueOf: AssignmentTargetType.valueOf, enumValues: AssignmentTargetType.values)
    ..e<AssignmentMethod>(8, _omitFieldNames ? '' : 'assignmentMethod', $pb.PbFieldType.OE, defaultOrMaker: AssignmentMethod.ASSIGNMENT_METHOD_UNSPECIFIED, valueOf: AssignmentMethod.valueOf, enumValues: AssignmentMethod.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAssignmentRuleRequest clone() => UpdateAssignmentRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAssignmentRuleRequest copyWith(void Function(UpdateAssignmentRuleRequest) updates) => super.copyWith((message) => updates(message as UpdateAssignmentRuleRequest)) as UpdateAssignmentRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssignmentRuleRequest create() => UpdateAssignmentRuleRequest._();
  UpdateAssignmentRuleRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAssignmentRuleRequest> createRepeated() => $pb.PbList<UpdateAssignmentRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssignmentRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssignmentRuleRequest>(create);
  static UpdateAssignmentRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isActive => $_getBF(3);
  @$pb.TagNumber(4)
  set isActive($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsActive() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get priority => $_getIZ(4);
  @$pb.TagNumber(5)
  set priority($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPriority() => $_has(4);
  @$pb.TagNumber(5)
  void clearPriority() => clearField(5);

  @$pb.TagNumber(6)
  $2.Struct get conditions => $_getN(5);
  @$pb.TagNumber(6)
  set conditions($2.Struct v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasConditions() => $_has(5);
  @$pb.TagNumber(6)
  void clearConditions() => clearField(6);
  @$pb.TagNumber(6)
  $2.Struct ensureConditions() => $_ensure(5);

  @$pb.TagNumber(7)
  AssignmentTargetType get assignmentType => $_getN(6);
  @$pb.TagNumber(7)
  set assignmentType(AssignmentTargetType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAssignmentType() => $_has(6);
  @$pb.TagNumber(7)
  void clearAssignmentType() => clearField(7);

  @$pb.TagNumber(8)
  AssignmentMethod get assignmentMethod => $_getN(7);
  @$pb.TagNumber(8)
  set assignmentMethod(AssignmentMethod v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAssignmentMethod() => $_has(7);
  @$pb.TagNumber(8)
  void clearAssignmentMethod() => clearField(8);
}

class DeleteAssignmentRuleRequest extends $pb.GeneratedMessage {
  factory DeleteAssignmentRuleRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteAssignmentRuleRequest._() : super();
  factory DeleteAssignmentRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAssignmentRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAssignmentRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAssignmentRuleRequest clone() => DeleteAssignmentRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAssignmentRuleRequest copyWith(void Function(DeleteAssignmentRuleRequest) updates) => super.copyWith((message) => updates(message as DeleteAssignmentRuleRequest)) as DeleteAssignmentRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAssignmentRuleRequest create() => DeleteAssignmentRuleRequest._();
  DeleteAssignmentRuleRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAssignmentRuleRequest> createRepeated() => $pb.PbList<DeleteAssignmentRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAssignmentRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAssignmentRuleRequest>(create);
  static DeleteAssignmentRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteAssignmentRuleResponse extends $pb.GeneratedMessage {
  factory DeleteAssignmentRuleResponse() => create();
  DeleteAssignmentRuleResponse._() : super();
  factory DeleteAssignmentRuleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAssignmentRuleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAssignmentRuleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAssignmentRuleResponse clone() => DeleteAssignmentRuleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAssignmentRuleResponse copyWith(void Function(DeleteAssignmentRuleResponse) updates) => super.copyWith((message) => updates(message as DeleteAssignmentRuleResponse)) as DeleteAssignmentRuleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAssignmentRuleResponse create() => DeleteAssignmentRuleResponse._();
  DeleteAssignmentRuleResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteAssignmentRuleResponse> createRepeated() => $pb.PbList<DeleteAssignmentRuleResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteAssignmentRuleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAssignmentRuleResponse>(create);
  static DeleteAssignmentRuleResponse? _defaultInstance;
}

class ListAssignmentRulesRequest extends $pb.GeneratedMessage {
  factory ListAssignmentRulesRequest({
    $core.bool? isActive,
    AssignmentTargetType? assignmentType,
  }) {
    final $result = create();
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (assignmentType != null) {
      $result.assignmentType = assignmentType;
    }
    return $result;
  }
  ListAssignmentRulesRequest._() : super();
  factory ListAssignmentRulesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAssignmentRulesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAssignmentRulesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isActive')
    ..e<AssignmentTargetType>(2, _omitFieldNames ? '' : 'assignmentType', $pb.PbFieldType.OE, defaultOrMaker: AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_UNSPECIFIED, valueOf: AssignmentTargetType.valueOf, enumValues: AssignmentTargetType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAssignmentRulesRequest clone() => ListAssignmentRulesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAssignmentRulesRequest copyWith(void Function(ListAssignmentRulesRequest) updates) => super.copyWith((message) => updates(message as ListAssignmentRulesRequest)) as ListAssignmentRulesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAssignmentRulesRequest create() => ListAssignmentRulesRequest._();
  ListAssignmentRulesRequest createEmptyInstance() => create();
  static $pb.PbList<ListAssignmentRulesRequest> createRepeated() => $pb.PbList<ListAssignmentRulesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAssignmentRulesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAssignmentRulesRequest>(create);
  static ListAssignmentRulesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isActive => $_getBF(0);
  @$pb.TagNumber(1)
  set isActive($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsActive() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsActive() => clearField(1);

  @$pb.TagNumber(2)
  AssignmentTargetType get assignmentType => $_getN(1);
  @$pb.TagNumber(2)
  set assignmentType(AssignmentTargetType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssignmentType() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssignmentType() => clearField(2);
}

class ListAssignmentRulesResponse extends $pb.GeneratedMessage {
  factory ListAssignmentRulesResponse({
    $core.Iterable<AssignmentRule>? items,
    $core.int? total,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ListAssignmentRulesResponse._() : super();
  factory ListAssignmentRulesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAssignmentRulesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAssignmentRulesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<AssignmentRule>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: AssignmentRule.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAssignmentRulesResponse clone() => ListAssignmentRulesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAssignmentRulesResponse copyWith(void Function(ListAssignmentRulesResponse) updates) => super.copyWith((message) => updates(message as ListAssignmentRulesResponse)) as ListAssignmentRulesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAssignmentRulesResponse create() => ListAssignmentRulesResponse._();
  ListAssignmentRulesResponse createEmptyInstance() => create();
  static $pb.PbList<ListAssignmentRulesResponse> createRepeated() => $pb.PbList<ListAssignmentRulesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAssignmentRulesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAssignmentRulesResponse>(create);
  static ListAssignmentRulesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AssignmentRule> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

/// Assignable members
class AssignableMember extends $pb.GeneratedMessage {
  factory AssignableMember({
    $core.String? id,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? email,
    $core.String? avatarUrl,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (email != null) {
      $result.email = email;
    }
    if (avatarUrl != null) {
      $result.avatarUrl = avatarUrl;
    }
    return $result;
  }
  AssignableMember._() : super();
  factory AssignableMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignableMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssignableMember', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'firstName')
    ..aOS(3, _omitFieldNames ? '' : 'lastName')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'avatarUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignableMember clone() => AssignableMember()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignableMember copyWith(void Function(AssignableMember) updates) => super.copyWith((message) => updates(message as AssignableMember)) as AssignableMember;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignableMember create() => AssignableMember._();
  AssignableMember createEmptyInstance() => create();
  static $pb.PbList<AssignableMember> createRepeated() => $pb.PbList<AssignableMember>();
  @$core.pragma('dart2js:noInline')
  static AssignableMember getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignableMember>(create);
  static AssignableMember? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatarUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatarUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvatarUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatarUrl() => clearField(5);
}

class GetAssignableMembersRequest extends $pb.GeneratedMessage {
  factory GetAssignableMembersRequest({
    $core.String? search,
    $core.String? locationId,
  }) {
    final $result = create();
    if (search != null) {
      $result.search = search;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    return $result;
  }
  GetAssignableMembersRequest._() : super();
  factory GetAssignableMembersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssignableMembersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssignableMembersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'search')
    ..aOS(2, _omitFieldNames ? '' : 'locationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssignableMembersRequest clone() => GetAssignableMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssignableMembersRequest copyWith(void Function(GetAssignableMembersRequest) updates) => super.copyWith((message) => updates(message as GetAssignableMembersRequest)) as GetAssignableMembersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssignableMembersRequest create() => GetAssignableMembersRequest._();
  GetAssignableMembersRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssignableMembersRequest> createRepeated() => $pb.PbList<GetAssignableMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssignableMembersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssignableMembersRequest>(create);
  static GetAssignableMembersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get search => $_getSZ(0);
  @$pb.TagNumber(1)
  set search($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSearch() => $_has(0);
  @$pb.TagNumber(1)
  void clearSearch() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get locationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set locationId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocationId() => clearField(2);
}

class GetAssignableMembersResponse extends $pb.GeneratedMessage {
  factory GetAssignableMembersResponse({
    $core.Iterable<AssignableMember>? members,
  }) {
    final $result = create();
    if (members != null) {
      $result.members.addAll(members);
    }
    return $result;
  }
  GetAssignableMembersResponse._() : super();
  factory GetAssignableMembersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssignableMembersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssignableMembersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<AssignableMember>(1, _omitFieldNames ? '' : 'members', $pb.PbFieldType.PM, subBuilder: AssignableMember.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssignableMembersResponse clone() => GetAssignableMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssignableMembersResponse copyWith(void Function(GetAssignableMembersResponse) updates) => super.copyWith((message) => updates(message as GetAssignableMembersResponse)) as GetAssignableMembersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssignableMembersResponse create() => GetAssignableMembersResponse._();
  GetAssignableMembersResponse createEmptyInstance() => create();
  static $pb.PbList<GetAssignableMembersResponse> createRepeated() => $pb.PbList<GetAssignableMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAssignableMembersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssignableMembersResponse>(create);
  static GetAssignableMembersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AssignableMember> get members => $_getList(0);
}

/// Assignable roles
class AssignableRole extends $pb.GeneratedMessage {
  factory AssignableRole({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.int? memberCount,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (memberCount != null) {
      $result.memberCount = memberCount;
    }
    return $result;
  }
  AssignableRole._() : super();
  factory AssignableRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignableRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssignableRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'memberCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignableRole clone() => AssignableRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignableRole copyWith(void Function(AssignableRole) updates) => super.copyWith((message) => updates(message as AssignableRole)) as AssignableRole;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignableRole create() => AssignableRole._();
  AssignableRole createEmptyInstance() => create();
  static $pb.PbList<AssignableRole> createRepeated() => $pb.PbList<AssignableRole>();
  @$core.pragma('dart2js:noInline')
  static AssignableRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignableRole>(create);
  static AssignableRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get memberCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set memberCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMemberCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberCount() => clearField(4);
}

class GetAssignableRolesRequest extends $pb.GeneratedMessage {
  factory GetAssignableRolesRequest({
    $core.String? locationId,
  }) {
    final $result = create();
    if (locationId != null) {
      $result.locationId = locationId;
    }
    return $result;
  }
  GetAssignableRolesRequest._() : super();
  factory GetAssignableRolesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssignableRolesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssignableRolesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'locationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssignableRolesRequest clone() => GetAssignableRolesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssignableRolesRequest copyWith(void Function(GetAssignableRolesRequest) updates) => super.copyWith((message) => updates(message as GetAssignableRolesRequest)) as GetAssignableRolesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssignableRolesRequest create() => GetAssignableRolesRequest._();
  GetAssignableRolesRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssignableRolesRequest> createRepeated() => $pb.PbList<GetAssignableRolesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssignableRolesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssignableRolesRequest>(create);
  static GetAssignableRolesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get locationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set locationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => clearField(1);
}

class GetAssignableRolesResponse extends $pb.GeneratedMessage {
  factory GetAssignableRolesResponse({
    $core.Iterable<AssignableRole>? roles,
  }) {
    final $result = create();
    if (roles != null) {
      $result.roles.addAll(roles);
    }
    return $result;
  }
  GetAssignableRolesResponse._() : super();
  factory GetAssignableRolesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssignableRolesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssignableRolesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<AssignableRole>(1, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: AssignableRole.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssignableRolesResponse clone() => GetAssignableRolesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssignableRolesResponse copyWith(void Function(GetAssignableRolesResponse) updates) => super.copyWith((message) => updates(message as GetAssignableRolesResponse)) as GetAssignableRolesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssignableRolesResponse create() => GetAssignableRolesResponse._();
  GetAssignableRolesResponse createEmptyInstance() => create();
  static $pb.PbList<GetAssignableRolesResponse> createRepeated() => $pb.PbList<GetAssignableRolesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAssignableRolesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssignableRolesResponse>(create);
  static GetAssignableRolesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AssignableRole> get roles => $_getList(0);
}

/// Ticket locations
class TicketLocation extends $pb.GeneratedMessage {
  factory TicketLocation({
    $core.String? id,
    $core.String? name,
    $core.String? address,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  TicketLocation._() : super();
  factory TicketLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TicketLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TicketLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TicketLocation clone() => TicketLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TicketLocation copyWith(void Function(TicketLocation) updates) => super.copyWith((message) => updates(message as TicketLocation)) as TicketLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TicketLocation create() => TicketLocation._();
  TicketLocation createEmptyInstance() => create();
  static $pb.PbList<TicketLocation> createRepeated() => $pb.PbList<TicketLocation>();
  @$core.pragma('dart2js:noInline')
  static TicketLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TicketLocation>(create);
  static TicketLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);
}

class GetTicketLocationsRequest extends $pb.GeneratedMessage {
  factory GetTicketLocationsRequest() => create();
  GetTicketLocationsRequest._() : super();
  factory GetTicketLocationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTicketLocationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTicketLocationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTicketLocationsRequest clone() => GetTicketLocationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTicketLocationsRequest copyWith(void Function(GetTicketLocationsRequest) updates) => super.copyWith((message) => updates(message as GetTicketLocationsRequest)) as GetTicketLocationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTicketLocationsRequest create() => GetTicketLocationsRequest._();
  GetTicketLocationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetTicketLocationsRequest> createRepeated() => $pb.PbList<GetTicketLocationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTicketLocationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTicketLocationsRequest>(create);
  static GetTicketLocationsRequest? _defaultInstance;
}

class GetTicketLocationsResponse extends $pb.GeneratedMessage {
  factory GetTicketLocationsResponse({
    $core.Iterable<TicketLocation>? locations,
  }) {
    final $result = create();
    if (locations != null) {
      $result.locations.addAll(locations);
    }
    return $result;
  }
  GetTicketLocationsResponse._() : super();
  factory GetTicketLocationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTicketLocationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTicketLocationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<TicketLocation>(1, _omitFieldNames ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: TicketLocation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTicketLocationsResponse clone() => GetTicketLocationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTicketLocationsResponse copyWith(void Function(GetTicketLocationsResponse) updates) => super.copyWith((message) => updates(message as GetTicketLocationsResponse)) as GetTicketLocationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTicketLocationsResponse create() => GetTicketLocationsResponse._();
  GetTicketLocationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetTicketLocationsResponse> createRepeated() => $pb.PbList<GetTicketLocationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTicketLocationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTicketLocationsResponse>(create);
  static GetTicketLocationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TicketLocation> get locations => $_getList(0);
}

/// Task title generation
class GenerateTaskTitleRequest extends $pb.GeneratedMessage {
  factory GenerateTaskTitleRequest({
    $core.String? description,
    $core.String? specificLocation,
  }) {
    final $result = create();
    if (description != null) {
      $result.description = description;
    }
    if (specificLocation != null) {
      $result.specificLocation = specificLocation;
    }
    return $result;
  }
  GenerateTaskTitleRequest._() : super();
  factory GenerateTaskTitleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateTaskTitleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateTaskTitleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'description')
    ..aOS(2, _omitFieldNames ? '' : 'specificLocation')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateTaskTitleRequest clone() => GenerateTaskTitleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateTaskTitleRequest copyWith(void Function(GenerateTaskTitleRequest) updates) => super.copyWith((message) => updates(message as GenerateTaskTitleRequest)) as GenerateTaskTitleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateTaskTitleRequest create() => GenerateTaskTitleRequest._();
  GenerateTaskTitleRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateTaskTitleRequest> createRepeated() => $pb.PbList<GenerateTaskTitleRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateTaskTitleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateTaskTitleRequest>(create);
  static GenerateTaskTitleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get specificLocation => $_getSZ(1);
  @$pb.TagNumber(2)
  set specificLocation($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSpecificLocation() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpecificLocation() => clearField(2);
}

class GenerateTaskTitleResponse extends $pb.GeneratedMessage {
  factory GenerateTaskTitleResponse({
    $core.String? title,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    return $result;
  }
  GenerateTaskTitleResponse._() : super();
  factory GenerateTaskTitleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateTaskTitleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateTaskTitleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateTaskTitleResponse clone() => GenerateTaskTitleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateTaskTitleResponse copyWith(void Function(GenerateTaskTitleResponse) updates) => super.copyWith((message) => updates(message as GenerateTaskTitleResponse)) as GenerateTaskTitleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateTaskTitleResponse create() => GenerateTaskTitleResponse._();
  GenerateTaskTitleResponse createEmptyInstance() => create();
  static $pb.PbList<GenerateTaskTitleResponse> createRepeated() => $pb.PbList<GenerateTaskTitleResponse>();
  @$core.pragma('dart2js:noInline')
  static GenerateTaskTitleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateTaskTitleResponse>(create);
  static GenerateTaskTitleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);
}

/// Task definition statistics
class GetTaskDefStatisticsRequest extends $pb.GeneratedMessage {
  factory GetTaskDefStatisticsRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetTaskDefStatisticsRequest._() : super();
  factory GetTaskDefStatisticsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskDefStatisticsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskDefStatisticsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskDefStatisticsRequest clone() => GetTaskDefStatisticsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskDefStatisticsRequest copyWith(void Function(GetTaskDefStatisticsRequest) updates) => super.copyWith((message) => updates(message as GetTaskDefStatisticsRequest)) as GetTaskDefStatisticsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskDefStatisticsRequest create() => GetTaskDefStatisticsRequest._();
  GetTaskDefStatisticsRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskDefStatisticsRequest> createRepeated() => $pb.PbList<GetTaskDefStatisticsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskDefStatisticsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskDefStatisticsRequest>(create);
  static GetTaskDefStatisticsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class TaskDefStatistics extends $pb.GeneratedMessage {
  factory TaskDefStatistics({
    $core.String? taskDefId,
    $core.int? activeTasksCount,
    $core.int? completedTasksCount,
    $1.Timestamp? lastCompletedAt,
    $1.Timestamp? nextScheduledAt,
    $core.double? completionRate,
    $core.double? avgCompletionTimeHours,
  }) {
    final $result = create();
    if (taskDefId != null) {
      $result.taskDefId = taskDefId;
    }
    if (activeTasksCount != null) {
      $result.activeTasksCount = activeTasksCount;
    }
    if (completedTasksCount != null) {
      $result.completedTasksCount = completedTasksCount;
    }
    if (lastCompletedAt != null) {
      $result.lastCompletedAt = lastCompletedAt;
    }
    if (nextScheduledAt != null) {
      $result.nextScheduledAt = nextScheduledAt;
    }
    if (completionRate != null) {
      $result.completionRate = completionRate;
    }
    if (avgCompletionTimeHours != null) {
      $result.avgCompletionTimeHours = avgCompletionTimeHours;
    }
    return $result;
  }
  TaskDefStatistics._() : super();
  factory TaskDefStatistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskDefStatistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskDefStatistics', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskDefId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'activeTasksCount', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'completedTasksCount', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'lastCompletedAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'nextScheduledAt', subBuilder: $1.Timestamp.create)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'completionRate', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'avgCompletionTimeHours', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskDefStatistics clone() => TaskDefStatistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskDefStatistics copyWith(void Function(TaskDefStatistics) updates) => super.copyWith((message) => updates(message as TaskDefStatistics)) as TaskDefStatistics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskDefStatistics create() => TaskDefStatistics._();
  TaskDefStatistics createEmptyInstance() => create();
  static $pb.PbList<TaskDefStatistics> createRepeated() => $pb.PbList<TaskDefStatistics>();
  @$core.pragma('dart2js:noInline')
  static TaskDefStatistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskDefStatistics>(create);
  static TaskDefStatistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskDefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskDefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskDefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskDefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get activeTasksCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set activeTasksCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActiveTasksCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearActiveTasksCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get completedTasksCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set completedTasksCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCompletedTasksCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompletedTasksCount() => clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get lastCompletedAt => $_getN(3);
  @$pb.TagNumber(4)
  set lastCompletedAt($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastCompletedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastCompletedAt() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureLastCompletedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get nextScheduledAt => $_getN(4);
  @$pb.TagNumber(5)
  set nextScheduledAt($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasNextScheduledAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextScheduledAt() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureNextScheduledAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.double get completionRate => $_getN(5);
  @$pb.TagNumber(6)
  set completionRate($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCompletionRate() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompletionRate() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get avgCompletionTimeHours => $_getN(6);
  @$pb.TagNumber(7)
  set avgCompletionTimeHours($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAvgCompletionTimeHours() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvgCompletionTimeHours() => clearField(7);
}

/// Upcoming/Overdue tasks
class GetUpcomingTasksRequest extends $pb.GeneratedMessage {
  factory GetUpcomingTasksRequest({
    $core.int? days,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (days != null) {
      $result.days = days;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetUpcomingTasksRequest._() : super();
  factory GetUpcomingTasksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUpcomingTasksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUpcomingTasksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'days', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUpcomingTasksRequest clone() => GetUpcomingTasksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUpcomingTasksRequest copyWith(void Function(GetUpcomingTasksRequest) updates) => super.copyWith((message) => updates(message as GetUpcomingTasksRequest)) as GetUpcomingTasksRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUpcomingTasksRequest create() => GetUpcomingTasksRequest._();
  GetUpcomingTasksRequest createEmptyInstance() => create();
  static $pb.PbList<GetUpcomingTasksRequest> createRepeated() => $pb.PbList<GetUpcomingTasksRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUpcomingTasksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUpcomingTasksRequest>(create);
  static GetUpcomingTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get days => $_getIZ(0);
  @$pb.TagNumber(1)
  set days($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDays() => $_has(0);
  @$pb.TagNumber(1)
  void clearDays() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);
}

class GetOverdueTasksRequest extends $pb.GeneratedMessage {
  factory GetOverdueTasksRequest({
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetOverdueTasksRequest._() : super();
  factory GetOverdueTasksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOverdueTasksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOverdueTasksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOverdueTasksRequest clone() => GetOverdueTasksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOverdueTasksRequest copyWith(void Function(GetOverdueTasksRequest) updates) => super.copyWith((message) => updates(message as GetOverdueTasksRequest)) as GetOverdueTasksRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOverdueTasksRequest create() => GetOverdueTasksRequest._();
  GetOverdueTasksRequest createEmptyInstance() => create();
  static $pb.PbList<GetOverdueTasksRequest> createRepeated() => $pb.PbList<GetOverdueTasksRequest>();
  @$core.pragma('dart2js:noInline')
  static GetOverdueTasksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOverdueTasksRequest>(create);
  static GetOverdueTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);
}

/// Task management overview
class GetTaskManagementOverviewRequest extends $pb.GeneratedMessage {
  factory GetTaskManagementOverviewRequest() => create();
  GetTaskManagementOverviewRequest._() : super();
  factory GetTaskManagementOverviewRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskManagementOverviewRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskManagementOverviewRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskManagementOverviewRequest clone() => GetTaskManagementOverviewRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskManagementOverviewRequest copyWith(void Function(GetTaskManagementOverviewRequest) updates) => super.copyWith((message) => updates(message as GetTaskManagementOverviewRequest)) as GetTaskManagementOverviewRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskManagementOverviewRequest create() => GetTaskManagementOverviewRequest._();
  GetTaskManagementOverviewRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskManagementOverviewRequest> createRepeated() => $pb.PbList<GetTaskManagementOverviewRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskManagementOverviewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskManagementOverviewRequest>(create);
  static GetTaskManagementOverviewRequest? _defaultInstance;
}

class TaskManagementOverview extends $pb.GeneratedMessage {
  factory TaskManagementOverview({
    $core.int? totalTasks,
    $core.int? openTasks,
    $core.int? inProgressTasks,
    $core.int? onHoldTasks,
    $core.int? resolvedTasks,
    $core.int? overdueTasks,
    $core.int? unassignedTasks,
    $core.double? avgTimeToCloseHours,
    $core.double? avgResponseTimeHours,
    $core.double? completionRate,
    $core.Map<$core.String, $core.int>? tasksByType,
    $core.Map<$core.String, $core.int>? tasksByStatus,
    $core.Iterable<WeeklyMetricDataPoint>? weeklyTimeToClose,
    $core.Iterable<WeeklyMetricDataPoint>? weeklyResponseTime,
    $core.Iterable<WeeklyCountDataPoint>? weeklyCreated,
    $core.Iterable<WeeklyCountDataPoint>? weeklyResolved,
  }) {
    final $result = create();
    if (totalTasks != null) {
      $result.totalTasks = totalTasks;
    }
    if (openTasks != null) {
      $result.openTasks = openTasks;
    }
    if (inProgressTasks != null) {
      $result.inProgressTasks = inProgressTasks;
    }
    if (onHoldTasks != null) {
      $result.onHoldTasks = onHoldTasks;
    }
    if (resolvedTasks != null) {
      $result.resolvedTasks = resolvedTasks;
    }
    if (overdueTasks != null) {
      $result.overdueTasks = overdueTasks;
    }
    if (unassignedTasks != null) {
      $result.unassignedTasks = unassignedTasks;
    }
    if (avgTimeToCloseHours != null) {
      $result.avgTimeToCloseHours = avgTimeToCloseHours;
    }
    if (avgResponseTimeHours != null) {
      $result.avgResponseTimeHours = avgResponseTimeHours;
    }
    if (completionRate != null) {
      $result.completionRate = completionRate;
    }
    if (tasksByType != null) {
      $result.tasksByType.addAll(tasksByType);
    }
    if (tasksByStatus != null) {
      $result.tasksByStatus.addAll(tasksByStatus);
    }
    if (weeklyTimeToClose != null) {
      $result.weeklyTimeToClose.addAll(weeklyTimeToClose);
    }
    if (weeklyResponseTime != null) {
      $result.weeklyResponseTime.addAll(weeklyResponseTime);
    }
    if (weeklyCreated != null) {
      $result.weeklyCreated.addAll(weeklyCreated);
    }
    if (weeklyResolved != null) {
      $result.weeklyResolved.addAll(weeklyResolved);
    }
    return $result;
  }
  TaskManagementOverview._() : super();
  factory TaskManagementOverview.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskManagementOverview.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskManagementOverview', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'totalTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'openTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'inProgressTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'onHoldTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'resolvedTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'overdueTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'unassignedTasks', $pb.PbFieldType.O3)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'avgTimeToCloseHours', $pb.PbFieldType.OD)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'avgResponseTimeHours', $pb.PbFieldType.OD)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'completionRate', $pb.PbFieldType.OD)
    ..m<$core.String, $core.int>(11, _omitFieldNames ? '' : 'tasksByType', entryClassName: 'TaskManagementOverview.TasksByTypeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('moat.v1'))
    ..m<$core.String, $core.int>(12, _omitFieldNames ? '' : 'tasksByStatus', entryClassName: 'TaskManagementOverview.TasksByStatusEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('moat.v1'))
    ..pc<WeeklyMetricDataPoint>(13, _omitFieldNames ? '' : 'weeklyTimeToClose', $pb.PbFieldType.PM, subBuilder: WeeklyMetricDataPoint.create)
    ..pc<WeeklyMetricDataPoint>(14, _omitFieldNames ? '' : 'weeklyResponseTime', $pb.PbFieldType.PM, subBuilder: WeeklyMetricDataPoint.create)
    ..pc<WeeklyCountDataPoint>(15, _omitFieldNames ? '' : 'weeklyCreated', $pb.PbFieldType.PM, subBuilder: WeeklyCountDataPoint.create)
    ..pc<WeeklyCountDataPoint>(16, _omitFieldNames ? '' : 'weeklyResolved', $pb.PbFieldType.PM, subBuilder: WeeklyCountDataPoint.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskManagementOverview clone() => TaskManagementOverview()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskManagementOverview copyWith(void Function(TaskManagementOverview) updates) => super.copyWith((message) => updates(message as TaskManagementOverview)) as TaskManagementOverview;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskManagementOverview create() => TaskManagementOverview._();
  TaskManagementOverview createEmptyInstance() => create();
  static $pb.PbList<TaskManagementOverview> createRepeated() => $pb.PbList<TaskManagementOverview>();
  @$core.pragma('dart2js:noInline')
  static TaskManagementOverview getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskManagementOverview>(create);
  static TaskManagementOverview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalTasks => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalTasks($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalTasks() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalTasks() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get openTasks => $_getIZ(1);
  @$pb.TagNumber(2)
  set openTasks($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOpenTasks() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpenTasks() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get inProgressTasks => $_getIZ(2);
  @$pb.TagNumber(3)
  set inProgressTasks($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInProgressTasks() => $_has(2);
  @$pb.TagNumber(3)
  void clearInProgressTasks() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get onHoldTasks => $_getIZ(3);
  @$pb.TagNumber(4)
  set onHoldTasks($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOnHoldTasks() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnHoldTasks() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get resolvedTasks => $_getIZ(4);
  @$pb.TagNumber(5)
  set resolvedTasks($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResolvedTasks() => $_has(4);
  @$pb.TagNumber(5)
  void clearResolvedTasks() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get overdueTasks => $_getIZ(5);
  @$pb.TagNumber(6)
  set overdueTasks($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOverdueTasks() => $_has(5);
  @$pb.TagNumber(6)
  void clearOverdueTasks() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get unassignedTasks => $_getIZ(6);
  @$pb.TagNumber(7)
  set unassignedTasks($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUnassignedTasks() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnassignedTasks() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get avgTimeToCloseHours => $_getN(7);
  @$pb.TagNumber(8)
  set avgTimeToCloseHours($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAvgTimeToCloseHours() => $_has(7);
  @$pb.TagNumber(8)
  void clearAvgTimeToCloseHours() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get avgResponseTimeHours => $_getN(8);
  @$pb.TagNumber(9)
  set avgResponseTimeHours($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAvgResponseTimeHours() => $_has(8);
  @$pb.TagNumber(9)
  void clearAvgResponseTimeHours() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get completionRate => $_getN(9);
  @$pb.TagNumber(10)
  set completionRate($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCompletionRate() => $_has(9);
  @$pb.TagNumber(10)
  void clearCompletionRate() => clearField(10);

  /// Breakdown by task type
  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.int> get tasksByType => $_getMap(10);

  /// Breakdown by status
  @$pb.TagNumber(12)
  $core.Map<$core.String, $core.int> get tasksByStatus => $_getMap(11);

  /// Weekly trends
  @$pb.TagNumber(13)
  $core.List<WeeklyMetricDataPoint> get weeklyTimeToClose => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<WeeklyMetricDataPoint> get weeklyResponseTime => $_getList(13);

  @$pb.TagNumber(15)
  $core.List<WeeklyCountDataPoint> get weeklyCreated => $_getList(14);

  @$pb.TagNumber(16)
  $core.List<WeeklyCountDataPoint> get weeklyResolved => $_getList(15);
}

class ValidateRecurrenceRuleRequest extends $pb.GeneratedMessage {
  factory ValidateRecurrenceRuleRequest({
    $core.String? rule,
  }) {
    final $result = create();
    if (rule != null) {
      $result.rule = rule;
    }
    return $result;
  }
  ValidateRecurrenceRuleRequest._() : super();
  factory ValidateRecurrenceRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateRecurrenceRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateRecurrenceRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rule')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateRecurrenceRuleRequest clone() => ValidateRecurrenceRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateRecurrenceRuleRequest copyWith(void Function(ValidateRecurrenceRuleRequest) updates) => super.copyWith((message) => updates(message as ValidateRecurrenceRuleRequest)) as ValidateRecurrenceRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateRecurrenceRuleRequest create() => ValidateRecurrenceRuleRequest._();
  ValidateRecurrenceRuleRequest createEmptyInstance() => create();
  static $pb.PbList<ValidateRecurrenceRuleRequest> createRepeated() => $pb.PbList<ValidateRecurrenceRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static ValidateRecurrenceRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateRecurrenceRuleRequest>(create);
  static ValidateRecurrenceRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rule => $_getSZ(0);
  @$pb.TagNumber(1)
  set rule($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRule() => $_has(0);
  @$pb.TagNumber(1)
  void clearRule() => clearField(1);
}

class ValidateRecurrenceRuleResponse extends $pb.GeneratedMessage {
  factory ValidateRecurrenceRuleResponse({
    $core.bool? isValid,
    $core.String? errorMessage,
    $core.String? description,
  }) {
    final $result = create();
    if (isValid != null) {
      $result.isValid = isValid;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  ValidateRecurrenceRuleResponse._() : super();
  factory ValidateRecurrenceRuleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateRecurrenceRuleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateRecurrenceRuleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isValid')
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateRecurrenceRuleResponse clone() => ValidateRecurrenceRuleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateRecurrenceRuleResponse copyWith(void Function(ValidateRecurrenceRuleResponse) updates) => super.copyWith((message) => updates(message as ValidateRecurrenceRuleResponse)) as ValidateRecurrenceRuleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateRecurrenceRuleResponse create() => ValidateRecurrenceRuleResponse._();
  ValidateRecurrenceRuleResponse createEmptyInstance() => create();
  static $pb.PbList<ValidateRecurrenceRuleResponse> createRepeated() => $pb.PbList<ValidateRecurrenceRuleResponse>();
  @$core.pragma('dart2js:noInline')
  static ValidateRecurrenceRuleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateRecurrenceRuleResponse>(create);
  static ValidateRecurrenceRuleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isValid => $_getBF(0);
  @$pb.TagNumber(1)
  set isValid($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsValid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);

  /// Human-readable description of the rule
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class PreviewRecurrenceOccurrencesRequest extends $pb.GeneratedMessage {
  factory PreviewRecurrenceOccurrencesRequest({
    $core.String? rule,
    $1.Timestamp? startDate,
    $core.int? count,
  }) {
    final $result = create();
    if (rule != null) {
      $result.rule = rule;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  PreviewRecurrenceOccurrencesRequest._() : super();
  factory PreviewRecurrenceOccurrencesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PreviewRecurrenceOccurrencesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PreviewRecurrenceOccurrencesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rule')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'startDate', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PreviewRecurrenceOccurrencesRequest clone() => PreviewRecurrenceOccurrencesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PreviewRecurrenceOccurrencesRequest copyWith(void Function(PreviewRecurrenceOccurrencesRequest) updates) => super.copyWith((message) => updates(message as PreviewRecurrenceOccurrencesRequest)) as PreviewRecurrenceOccurrencesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreviewRecurrenceOccurrencesRequest create() => PreviewRecurrenceOccurrencesRequest._();
  PreviewRecurrenceOccurrencesRequest createEmptyInstance() => create();
  static $pb.PbList<PreviewRecurrenceOccurrencesRequest> createRepeated() => $pb.PbList<PreviewRecurrenceOccurrencesRequest>();
  @$core.pragma('dart2js:noInline')
  static PreviewRecurrenceOccurrencesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PreviewRecurrenceOccurrencesRequest>(create);
  static PreviewRecurrenceOccurrencesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rule => $_getSZ(0);
  @$pb.TagNumber(1)
  set rule($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRule() => $_has(0);
  @$pb.TagNumber(1)
  void clearRule() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);
}

class PreviewRecurrenceOccurrencesResponse extends $pb.GeneratedMessage {
  factory PreviewRecurrenceOccurrencesResponse({
    $core.Iterable<$1.Timestamp>? occurrences,
    $core.String? description,
  }) {
    final $result = create();
    if (occurrences != null) {
      $result.occurrences.addAll(occurrences);
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  PreviewRecurrenceOccurrencesResponse._() : super();
  factory PreviewRecurrenceOccurrencesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PreviewRecurrenceOccurrencesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PreviewRecurrenceOccurrencesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<$1.Timestamp>(1, _omitFieldNames ? '' : 'occurrences', $pb.PbFieldType.PM, subBuilder: $1.Timestamp.create)
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PreviewRecurrenceOccurrencesResponse clone() => PreviewRecurrenceOccurrencesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PreviewRecurrenceOccurrencesResponse copyWith(void Function(PreviewRecurrenceOccurrencesResponse) updates) => super.copyWith((message) => updates(message as PreviewRecurrenceOccurrencesResponse)) as PreviewRecurrenceOccurrencesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreviewRecurrenceOccurrencesResponse create() => PreviewRecurrenceOccurrencesResponse._();
  PreviewRecurrenceOccurrencesResponse createEmptyInstance() => create();
  static $pb.PbList<PreviewRecurrenceOccurrencesResponse> createRepeated() => $pb.PbList<PreviewRecurrenceOccurrencesResponse>();
  @$core.pragma('dart2js:noInline')
  static PreviewRecurrenceOccurrencesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PreviewRecurrenceOccurrencesResponse>(create);
  static PreviewRecurrenceOccurrencesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Timestamp> get occurrences => $_getList(0);

  /// Human-readable description of the rule
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class CreateRecurrenceRuleRequest extends $pb.GeneratedMessage {
  factory CreateRecurrenceRuleRequest({
    RecurrenceFrequency? frequency,
    $core.int? interval,
    $core.Iterable<$core.String>? byDay,
    $core.int? byMonthDay,
    $core.int? byMonth,
    $core.int? count,
    $1.Timestamp? until,
  }) {
    final $result = create();
    if (frequency != null) {
      $result.frequency = frequency;
    }
    if (interval != null) {
      $result.interval = interval;
    }
    if (byDay != null) {
      $result.byDay.addAll(byDay);
    }
    if (byMonthDay != null) {
      $result.byMonthDay = byMonthDay;
    }
    if (byMonth != null) {
      $result.byMonth = byMonth;
    }
    if (count != null) {
      $result.count = count;
    }
    if (until != null) {
      $result.until = until;
    }
    return $result;
  }
  CreateRecurrenceRuleRequest._() : super();
  factory CreateRecurrenceRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRecurrenceRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRecurrenceRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..e<RecurrenceFrequency>(1, _omitFieldNames ? '' : 'frequency', $pb.PbFieldType.OE, defaultOrMaker: RecurrenceFrequency.RECURRENCE_FREQUENCY_UNSPECIFIED, valueOf: RecurrenceFrequency.valueOf, enumValues: RecurrenceFrequency.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'interval', $pb.PbFieldType.O3)
    ..pPS(3, _omitFieldNames ? '' : 'byDay')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'byMonthDay', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'byMonth', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'until', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRecurrenceRuleRequest clone() => CreateRecurrenceRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRecurrenceRuleRequest copyWith(void Function(CreateRecurrenceRuleRequest) updates) => super.copyWith((message) => updates(message as CreateRecurrenceRuleRequest)) as CreateRecurrenceRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRecurrenceRuleRequest create() => CreateRecurrenceRuleRequest._();
  CreateRecurrenceRuleRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRecurrenceRuleRequest> createRepeated() => $pb.PbList<CreateRecurrenceRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRecurrenceRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRecurrenceRuleRequest>(create);
  static CreateRecurrenceRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  RecurrenceFrequency get frequency => $_getN(0);
  @$pb.TagNumber(1)
  set frequency(RecurrenceFrequency v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrequency() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrequency() => clearField(1);

  /// Repeat interval (e.g., every 2 weeks)
  @$pb.TagNumber(2)
  $core.int get interval => $_getIZ(1);
  @$pb.TagNumber(2)
  set interval($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInterval() => $_has(1);
  @$pb.TagNumber(2)
  void clearInterval() => clearField(2);

  /// Days of week for weekly recurrence (MO, TU, WE, TH, FR, SA, SU)
  @$pb.TagNumber(3)
  $core.List<$core.String> get byDay => $_getList(2);

  /// Day of month for monthly recurrence (1-31)
  @$pb.TagNumber(4)
  $core.int get byMonthDay => $_getIZ(3);
  @$pb.TagNumber(4)
  set byMonthDay($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasByMonthDay() => $_has(3);
  @$pb.TagNumber(4)
  void clearByMonthDay() => clearField(4);

  /// Month for yearly recurrence (1-12)
  @$pb.TagNumber(5)
  $core.int get byMonth => $_getIZ(4);
  @$pb.TagNumber(5)
  set byMonth($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasByMonth() => $_has(4);
  @$pb.TagNumber(5)
  void clearByMonth() => clearField(5);

  /// Number of occurrences (optional - either count or until, not both)
  @$pb.TagNumber(6)
  $core.int get count => $_getIZ(5);
  @$pb.TagNumber(6)
  set count($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => clearField(6);

  /// End date (optional - either count or until, not both)
  @$pb.TagNumber(7)
  $1.Timestamp get until => $_getN(6);
  @$pb.TagNumber(7)
  set until($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUntil() => $_has(6);
  @$pb.TagNumber(7)
  void clearUntil() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureUntil() => $_ensure(6);
}

class CreateRecurrenceRuleResponse extends $pb.GeneratedMessage {
  factory CreateRecurrenceRuleResponse({
    $core.String? rule,
    $core.String? description,
  }) {
    final $result = create();
    if (rule != null) {
      $result.rule = rule;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  CreateRecurrenceRuleResponse._() : super();
  factory CreateRecurrenceRuleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRecurrenceRuleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRecurrenceRuleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rule')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRecurrenceRuleResponse clone() => CreateRecurrenceRuleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRecurrenceRuleResponse copyWith(void Function(CreateRecurrenceRuleResponse) updates) => super.copyWith((message) => updates(message as CreateRecurrenceRuleResponse)) as CreateRecurrenceRuleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRecurrenceRuleResponse create() => CreateRecurrenceRuleResponse._();
  CreateRecurrenceRuleResponse createEmptyInstance() => create();
  static $pb.PbList<CreateRecurrenceRuleResponse> createRepeated() => $pb.PbList<CreateRecurrenceRuleResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateRecurrenceRuleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRecurrenceRuleResponse>(create);
  static CreateRecurrenceRuleResponse? _defaultInstance;

  /// The generated iCal RRULE string
  @$pb.TagNumber(1)
  $core.String get rule => $_getSZ(0);
  @$pb.TagNumber(1)
  set rule($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRule() => $_has(0);
  @$pb.TagNumber(1)
  void clearRule() => clearField(1);

  /// Human-readable description
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class BulkCreateTaskDefsRequest extends $pb.GeneratedMessage {
  factory BulkCreateTaskDefsRequest({
    $core.Iterable<$core.String>? assetIds,
    $core.String? locationId,
    TaskType? taskType,
    $core.String? title,
    $core.String? description,
    $core.bool? isEnabled,
    $core.String? recurrenceRule,
    $1.Timestamp? recurrenceStart,
    $1.Timestamp? recurrenceEnd,
    $core.String? specificLocation,
    $2.Struct? details,
  }) {
    final $result = create();
    if (assetIds != null) {
      $result.assetIds.addAll(assetIds);
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (recurrenceRule != null) {
      $result.recurrenceRule = recurrenceRule;
    }
    if (recurrenceStart != null) {
      $result.recurrenceStart = recurrenceStart;
    }
    if (recurrenceEnd != null) {
      $result.recurrenceEnd = recurrenceEnd;
    }
    if (specificLocation != null) {
      $result.specificLocation = specificLocation;
    }
    if (details != null) {
      $result.details = details;
    }
    return $result;
  }
  BulkCreateTaskDefsRequest._() : super();
  factory BulkCreateTaskDefsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkCreateTaskDefsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkCreateTaskDefsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'assetIds')
    ..aOS(2, _omitFieldNames ? '' : 'locationId')
    ..e<TaskType>(3, _omitFieldNames ? '' : 'taskType', $pb.PbFieldType.OE, defaultOrMaker: TaskType.TASK_TYPE_UNSPECIFIED, valueOf: TaskType.valueOf, enumValues: TaskType.values)
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOB(6, _omitFieldNames ? '' : 'isEnabled')
    ..aOS(7, _omitFieldNames ? '' : 'recurrenceRule')
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'recurrenceStart', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'recurrenceEnd', subBuilder: $1.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'specificLocation')
    ..aOM<$2.Struct>(11, _omitFieldNames ? '' : 'details', subBuilder: $2.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkCreateTaskDefsRequest clone() => BulkCreateTaskDefsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkCreateTaskDefsRequest copyWith(void Function(BulkCreateTaskDefsRequest) updates) => super.copyWith((message) => updates(message as BulkCreateTaskDefsRequest)) as BulkCreateTaskDefsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkCreateTaskDefsRequest create() => BulkCreateTaskDefsRequest._();
  BulkCreateTaskDefsRequest createEmptyInstance() => create();
  static $pb.PbList<BulkCreateTaskDefsRequest> createRepeated() => $pb.PbList<BulkCreateTaskDefsRequest>();
  @$core.pragma('dart2js:noInline')
  static BulkCreateTaskDefsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkCreateTaskDefsRequest>(create);
  static BulkCreateTaskDefsRequest? _defaultInstance;

  /// Asset IDs to create task definitions for
  @$pb.TagNumber(1)
  $core.List<$core.String> get assetIds => $_getList(0);

  /// Common properties for all task definitions
  @$pb.TagNumber(2)
  $core.String get locationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set locationId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocationId() => clearField(2);

  @$pb.TagNumber(3)
  TaskType get taskType => $_getN(2);
  @$pb.TagNumber(3)
  set taskType(TaskType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTaskType() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaskType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isEnabled => $_getBF(5);
  @$pb.TagNumber(6)
  set isEnabled($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsEnabled() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get recurrenceRule => $_getSZ(6);
  @$pb.TagNumber(7)
  set recurrenceRule($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRecurrenceRule() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecurrenceRule() => clearField(7);

  @$pb.TagNumber(8)
  $1.Timestamp get recurrenceStart => $_getN(7);
  @$pb.TagNumber(8)
  set recurrenceStart($1.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasRecurrenceStart() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecurrenceStart() => clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureRecurrenceStart() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Timestamp get recurrenceEnd => $_getN(8);
  @$pb.TagNumber(9)
  set recurrenceEnd($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasRecurrenceEnd() => $_has(8);
  @$pb.TagNumber(9)
  void clearRecurrenceEnd() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureRecurrenceEnd() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get specificLocation => $_getSZ(9);
  @$pb.TagNumber(10)
  set specificLocation($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSpecificLocation() => $_has(9);
  @$pb.TagNumber(10)
  void clearSpecificLocation() => clearField(10);

  @$pb.TagNumber(11)
  $2.Struct get details => $_getN(10);
  @$pb.TagNumber(11)
  set details($2.Struct v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDetails() => $_has(10);
  @$pb.TagNumber(11)
  void clearDetails() => clearField(11);
  @$pb.TagNumber(11)
  $2.Struct ensureDetails() => $_ensure(10);
}

class BulkCreateTaskDefsResponse extends $pb.GeneratedMessage {
  factory BulkCreateTaskDefsResponse({
    $core.int? createdCount,
    $core.Iterable<$core.String>? failedAssetIds,
    $core.Iterable<$core.String>? createdIds,
  }) {
    final $result = create();
    if (createdCount != null) {
      $result.createdCount = createdCount;
    }
    if (failedAssetIds != null) {
      $result.failedAssetIds.addAll(failedAssetIds);
    }
    if (createdIds != null) {
      $result.createdIds.addAll(createdIds);
    }
    return $result;
  }
  BulkCreateTaskDefsResponse._() : super();
  factory BulkCreateTaskDefsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkCreateTaskDefsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkCreateTaskDefsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'createdCount', $pb.PbFieldType.O3)
    ..pPS(2, _omitFieldNames ? '' : 'failedAssetIds')
    ..pPS(3, _omitFieldNames ? '' : 'createdIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkCreateTaskDefsResponse clone() => BulkCreateTaskDefsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkCreateTaskDefsResponse copyWith(void Function(BulkCreateTaskDefsResponse) updates) => super.copyWith((message) => updates(message as BulkCreateTaskDefsResponse)) as BulkCreateTaskDefsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkCreateTaskDefsResponse create() => BulkCreateTaskDefsResponse._();
  BulkCreateTaskDefsResponse createEmptyInstance() => create();
  static $pb.PbList<BulkCreateTaskDefsResponse> createRepeated() => $pb.PbList<BulkCreateTaskDefsResponse>();
  @$core.pragma('dart2js:noInline')
  static BulkCreateTaskDefsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkCreateTaskDefsResponse>(create);
  static BulkCreateTaskDefsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get createdCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set createdCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreatedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatedCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get failedAssetIds => $_getList(1);

  /// Created task definition IDs
  @$pb.TagNumber(3)
  $core.List<$core.String> get createdIds => $_getList(2);
}

class BulkUpdateTaskDefsRequest extends $pb.GeneratedMessage {
  factory BulkUpdateTaskDefsRequest({
    $core.Iterable<$core.String>? ids,
    $core.bool? isEnabled,
    $core.String? locationId,
    TaskType? taskType,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (taskType != null) {
      $result.taskType = taskType;
    }
    return $result;
  }
  BulkUpdateTaskDefsRequest._() : super();
  factory BulkUpdateTaskDefsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkUpdateTaskDefsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkUpdateTaskDefsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..aOB(2, _omitFieldNames ? '' : 'isEnabled')
    ..aOS(3, _omitFieldNames ? '' : 'locationId')
    ..e<TaskType>(4, _omitFieldNames ? '' : 'taskType', $pb.PbFieldType.OE, defaultOrMaker: TaskType.TASK_TYPE_UNSPECIFIED, valueOf: TaskType.valueOf, enumValues: TaskType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkUpdateTaskDefsRequest clone() => BulkUpdateTaskDefsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkUpdateTaskDefsRequest copyWith(void Function(BulkUpdateTaskDefsRequest) updates) => super.copyWith((message) => updates(message as BulkUpdateTaskDefsRequest)) as BulkUpdateTaskDefsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkUpdateTaskDefsRequest create() => BulkUpdateTaskDefsRequest._();
  BulkUpdateTaskDefsRequest createEmptyInstance() => create();
  static $pb.PbList<BulkUpdateTaskDefsRequest> createRepeated() => $pb.PbList<BulkUpdateTaskDefsRequest>();
  @$core.pragma('dart2js:noInline')
  static BulkUpdateTaskDefsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkUpdateTaskDefsRequest>(create);
  static BulkUpdateTaskDefsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);

  /// Fields to update (all optional - only provided fields are updated)
  @$pb.TagNumber(2)
  $core.bool get isEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnabled() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get locationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set locationId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocationId() => clearField(3);

  @$pb.TagNumber(4)
  TaskType get taskType => $_getN(3);
  @$pb.TagNumber(4)
  set taskType(TaskType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTaskType() => $_has(3);
  @$pb.TagNumber(4)
  void clearTaskType() => clearField(4);
}

class BulkUpdateTaskDefsResponse extends $pb.GeneratedMessage {
  factory BulkUpdateTaskDefsResponse({
    $core.int? updatedCount,
    $core.Iterable<$core.String>? failedIds,
  }) {
    final $result = create();
    if (updatedCount != null) {
      $result.updatedCount = updatedCount;
    }
    if (failedIds != null) {
      $result.failedIds.addAll(failedIds);
    }
    return $result;
  }
  BulkUpdateTaskDefsResponse._() : super();
  factory BulkUpdateTaskDefsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkUpdateTaskDefsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkUpdateTaskDefsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'updatedCount', $pb.PbFieldType.O3)
    ..pPS(2, _omitFieldNames ? '' : 'failedIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkUpdateTaskDefsResponse clone() => BulkUpdateTaskDefsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkUpdateTaskDefsResponse copyWith(void Function(BulkUpdateTaskDefsResponse) updates) => super.copyWith((message) => updates(message as BulkUpdateTaskDefsResponse)) as BulkUpdateTaskDefsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkUpdateTaskDefsResponse create() => BulkUpdateTaskDefsResponse._();
  BulkUpdateTaskDefsResponse createEmptyInstance() => create();
  static $pb.PbList<BulkUpdateTaskDefsResponse> createRepeated() => $pb.PbList<BulkUpdateTaskDefsResponse>();
  @$core.pragma('dart2js:noInline')
  static BulkUpdateTaskDefsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkUpdateTaskDefsResponse>(create);
  static BulkUpdateTaskDefsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get updatedCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set updatedCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdatedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdatedCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get failedIds => $_getList(1);
}

class BulkDeleteTaskDefsRequest extends $pb.GeneratedMessage {
  factory BulkDeleteTaskDefsRequest({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  BulkDeleteTaskDefsRequest._() : super();
  factory BulkDeleteTaskDefsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkDeleteTaskDefsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkDeleteTaskDefsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkDeleteTaskDefsRequest clone() => BulkDeleteTaskDefsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkDeleteTaskDefsRequest copyWith(void Function(BulkDeleteTaskDefsRequest) updates) => super.copyWith((message) => updates(message as BulkDeleteTaskDefsRequest)) as BulkDeleteTaskDefsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkDeleteTaskDefsRequest create() => BulkDeleteTaskDefsRequest._();
  BulkDeleteTaskDefsRequest createEmptyInstance() => create();
  static $pb.PbList<BulkDeleteTaskDefsRequest> createRepeated() => $pb.PbList<BulkDeleteTaskDefsRequest>();
  @$core.pragma('dart2js:noInline')
  static BulkDeleteTaskDefsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkDeleteTaskDefsRequest>(create);
  static BulkDeleteTaskDefsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

class BulkDeleteTaskDefsResponse extends $pb.GeneratedMessage {
  factory BulkDeleteTaskDefsResponse({
    $core.int? deletedCount,
    $core.Iterable<$core.String>? failedIds,
  }) {
    final $result = create();
    if (deletedCount != null) {
      $result.deletedCount = deletedCount;
    }
    if (failedIds != null) {
      $result.failedIds.addAll(failedIds);
    }
    return $result;
  }
  BulkDeleteTaskDefsResponse._() : super();
  factory BulkDeleteTaskDefsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkDeleteTaskDefsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkDeleteTaskDefsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deletedCount', $pb.PbFieldType.O3)
    ..pPS(2, _omitFieldNames ? '' : 'failedIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkDeleteTaskDefsResponse clone() => BulkDeleteTaskDefsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkDeleteTaskDefsResponse copyWith(void Function(BulkDeleteTaskDefsResponse) updates) => super.copyWith((message) => updates(message as BulkDeleteTaskDefsResponse)) as BulkDeleteTaskDefsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkDeleteTaskDefsResponse create() => BulkDeleteTaskDefsResponse._();
  BulkDeleteTaskDefsResponse createEmptyInstance() => create();
  static $pb.PbList<BulkDeleteTaskDefsResponse> createRepeated() => $pb.PbList<BulkDeleteTaskDefsResponse>();
  @$core.pragma('dart2js:noInline')
  static BulkDeleteTaskDefsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkDeleteTaskDefsResponse>(create);
  static BulkDeleteTaskDefsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deletedCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set deletedCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeletedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeletedCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get failedIds => $_getList(1);
}

class BulkUpdateTaskStatusRequest extends $pb.GeneratedMessage {
  factory BulkUpdateTaskStatusRequest({
    $core.Iterable<$core.String>? ids,
    TaskStatus? status,
    ResolutionType? resolutionType,
    $core.String? notes,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (status != null) {
      $result.status = status;
    }
    if (resolutionType != null) {
      $result.resolutionType = resolutionType;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  BulkUpdateTaskStatusRequest._() : super();
  factory BulkUpdateTaskStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkUpdateTaskStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkUpdateTaskStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..e<TaskStatus>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: TaskStatus.TASK_STATUS_UNSPECIFIED, valueOf: TaskStatus.valueOf, enumValues: TaskStatus.values)
    ..e<ResolutionType>(3, _omitFieldNames ? '' : 'resolutionType', $pb.PbFieldType.OE, defaultOrMaker: ResolutionType.RESOLUTION_TYPE_UNSPECIFIED, valueOf: ResolutionType.valueOf, enumValues: ResolutionType.values)
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkUpdateTaskStatusRequest clone() => BulkUpdateTaskStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkUpdateTaskStatusRequest copyWith(void Function(BulkUpdateTaskStatusRequest) updates) => super.copyWith((message) => updates(message as BulkUpdateTaskStatusRequest)) as BulkUpdateTaskStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkUpdateTaskStatusRequest create() => BulkUpdateTaskStatusRequest._();
  BulkUpdateTaskStatusRequest createEmptyInstance() => create();
  static $pb.PbList<BulkUpdateTaskStatusRequest> createRepeated() => $pb.PbList<BulkUpdateTaskStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static BulkUpdateTaskStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkUpdateTaskStatusRequest>(create);
  static BulkUpdateTaskStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);

  @$pb.TagNumber(2)
  TaskStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(TaskStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  ResolutionType get resolutionType => $_getN(2);
  @$pb.TagNumber(3)
  set resolutionType(ResolutionType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResolutionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearResolutionType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => clearField(4);
}

class BulkUpdateTaskStatusResponse extends $pb.GeneratedMessage {
  factory BulkUpdateTaskStatusResponse({
    $core.int? updatedCount,
    $core.Iterable<$core.String>? failedIds,
  }) {
    final $result = create();
    if (updatedCount != null) {
      $result.updatedCount = updatedCount;
    }
    if (failedIds != null) {
      $result.failedIds.addAll(failedIds);
    }
    return $result;
  }
  BulkUpdateTaskStatusResponse._() : super();
  factory BulkUpdateTaskStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkUpdateTaskStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkUpdateTaskStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'updatedCount', $pb.PbFieldType.O3)
    ..pPS(2, _omitFieldNames ? '' : 'failedIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkUpdateTaskStatusResponse clone() => BulkUpdateTaskStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkUpdateTaskStatusResponse copyWith(void Function(BulkUpdateTaskStatusResponse) updates) => super.copyWith((message) => updates(message as BulkUpdateTaskStatusResponse)) as BulkUpdateTaskStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkUpdateTaskStatusResponse create() => BulkUpdateTaskStatusResponse._();
  BulkUpdateTaskStatusResponse createEmptyInstance() => create();
  static $pb.PbList<BulkUpdateTaskStatusResponse> createRepeated() => $pb.PbList<BulkUpdateTaskStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static BulkUpdateTaskStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkUpdateTaskStatusResponse>(create);
  static BulkUpdateTaskStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get updatedCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set updatedCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdatedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdatedCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get failedIds => $_getList(1);
}

class GetTaskDefHistoryRequest extends $pb.GeneratedMessage {
  factory GetTaskDefHistoryRequest({
    $core.String? taskDefId,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (taskDefId != null) {
      $result.taskDefId = taskDefId;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetTaskDefHistoryRequest._() : super();
  factory GetTaskDefHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskDefHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskDefHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskDefId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskDefHistoryRequest clone() => GetTaskDefHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskDefHistoryRequest copyWith(void Function(GetTaskDefHistoryRequest) updates) => super.copyWith((message) => updates(message as GetTaskDefHistoryRequest)) as GetTaskDefHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskDefHistoryRequest create() => GetTaskDefHistoryRequest._();
  GetTaskDefHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskDefHistoryRequest> createRepeated() => $pb.PbList<GetTaskDefHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskDefHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskDefHistoryRequest>(create);
  static GetTaskDefHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskDefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskDefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskDefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskDefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);
}

class GetTaskDefHistoryResponse extends $pb.GeneratedMessage {
  factory GetTaskDefHistoryResponse({
    $core.Iterable<TaskDefHistoryEntry>? entries,
    $core.int? total,
  }) {
    final $result = create();
    if (entries != null) {
      $result.entries.addAll(entries);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  GetTaskDefHistoryResponse._() : super();
  factory GetTaskDefHistoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskDefHistoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskDefHistoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<TaskDefHistoryEntry>(1, _omitFieldNames ? '' : 'entries', $pb.PbFieldType.PM, subBuilder: TaskDefHistoryEntry.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskDefHistoryResponse clone() => GetTaskDefHistoryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskDefHistoryResponse copyWith(void Function(GetTaskDefHistoryResponse) updates) => super.copyWith((message) => updates(message as GetTaskDefHistoryResponse)) as GetTaskDefHistoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskDefHistoryResponse create() => GetTaskDefHistoryResponse._();
  GetTaskDefHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetTaskDefHistoryResponse> createRepeated() => $pb.PbList<GetTaskDefHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTaskDefHistoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskDefHistoryResponse>(create);
  static GetTaskDefHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskDefHistoryEntry> get entries => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

class TaskDefHistoryEntry extends $pb.GeneratedMessage {
  factory TaskDefHistoryEntry({
    $core.String? id,
    $core.String? taskDefId,
    $core.String? changeType,
    $2.Struct? changes,
    $core.String? changedById,
    $core.String? changedByName,
    $1.Timestamp? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (taskDefId != null) {
      $result.taskDefId = taskDefId;
    }
    if (changeType != null) {
      $result.changeType = changeType;
    }
    if (changes != null) {
      $result.changes = changes;
    }
    if (changedById != null) {
      $result.changedById = changedById;
    }
    if (changedByName != null) {
      $result.changedByName = changedByName;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  TaskDefHistoryEntry._() : super();
  factory TaskDefHistoryEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskDefHistoryEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskDefHistoryEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'taskDefId')
    ..aOS(3, _omitFieldNames ? '' : 'changeType')
    ..aOM<$2.Struct>(4, _omitFieldNames ? '' : 'changes', subBuilder: $2.Struct.create)
    ..aOS(5, _omitFieldNames ? '' : 'changedById')
    ..aOS(6, _omitFieldNames ? '' : 'changedByName')
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskDefHistoryEntry clone() => TaskDefHistoryEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskDefHistoryEntry copyWith(void Function(TaskDefHistoryEntry) updates) => super.copyWith((message) => updates(message as TaskDefHistoryEntry)) as TaskDefHistoryEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskDefHistoryEntry create() => TaskDefHistoryEntry._();
  TaskDefHistoryEntry createEmptyInstance() => create();
  static $pb.PbList<TaskDefHistoryEntry> createRepeated() => $pb.PbList<TaskDefHistoryEntry>();
  @$core.pragma('dart2js:noInline')
  static TaskDefHistoryEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskDefHistoryEntry>(create);
  static TaskDefHistoryEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskDefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskDefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskDefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskDefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get changeType => $_getSZ(2);
  @$pb.TagNumber(3)
  set changeType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChangeType() => $_has(2);
  @$pb.TagNumber(3)
  void clearChangeType() => clearField(3);

  @$pb.TagNumber(4)
  $2.Struct get changes => $_getN(3);
  @$pb.TagNumber(4)
  set changes($2.Struct v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasChanges() => $_has(3);
  @$pb.TagNumber(4)
  void clearChanges() => clearField(4);
  @$pb.TagNumber(4)
  $2.Struct ensureChanges() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get changedById => $_getSZ(4);
  @$pb.TagNumber(5)
  set changedById($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChangedById() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangedById() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get changedByName => $_getSZ(5);
  @$pb.TagNumber(6)
  set changedByName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasChangedByName() => $_has(5);
  @$pb.TagNumber(6)
  void clearChangedByName() => clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureCreatedAt() => $_ensure(6);
}

class TaskServiceApi {
  $pb.RpcClient _client;
  TaskServiceApi(this._client);

  $async.Future<TaskDef> createTaskDef($pb.ClientContext? ctx, CreateTaskDefRequest request) =>
    _client.invoke<TaskDef>(ctx, 'TaskService', 'CreateTaskDef', request, TaskDef())
  ;
  $async.Future<TaskDef> getTaskDef($pb.ClientContext? ctx, GetTaskDefRequest request) =>
    _client.invoke<TaskDef>(ctx, 'TaskService', 'GetTaskDef', request, TaskDef())
  ;
  $async.Future<TaskDef> updateTaskDef($pb.ClientContext? ctx, UpdateTaskDefRequest request) =>
    _client.invoke<TaskDef>(ctx, 'TaskService', 'UpdateTaskDef', request, TaskDef())
  ;
  $async.Future<DeleteTaskDefResponse> deleteTaskDef($pb.ClientContext? ctx, DeleteTaskDefRequest request) =>
    _client.invoke<DeleteTaskDefResponse>(ctx, 'TaskService', 'DeleteTaskDef', request, DeleteTaskDefResponse())
  ;
  $async.Future<ListTaskDefsResponse> listTaskDefs($pb.ClientContext? ctx, ListTaskDefsRequest request) =>
    _client.invoke<ListTaskDefsResponse>(ctx, 'TaskService', 'ListTaskDefs', request, ListTaskDefsResponse())
  ;
  $async.Future<Task> createTask($pb.ClientContext? ctx, CreateTaskRequest request) =>
    _client.invoke<Task>(ctx, 'TaskService', 'CreateTask', request, Task())
  ;
  $async.Future<TaskWithDetails> getTask($pb.ClientContext? ctx, GetTaskRequest request) =>
    _client.invoke<TaskWithDetails>(ctx, 'TaskService', 'GetTask', request, TaskWithDetails())
  ;
  $async.Future<TaskWithDetails> getTaskByExternalId($pb.ClientContext? ctx, GetTaskByExternalIdRequest request) =>
    _client.invoke<TaskWithDetails>(ctx, 'TaskService', 'GetTaskByExternalId', request, TaskWithDetails())
  ;
  $async.Future<Task> updateTask($pb.ClientContext? ctx, UpdateTaskRequest request) =>
    _client.invoke<Task>(ctx, 'TaskService', 'UpdateTask', request, Task())
  ;
  $async.Future<DeleteTaskResponse> deleteTask($pb.ClientContext? ctx, DeleteTaskRequest request) =>
    _client.invoke<DeleteTaskResponse>(ctx, 'TaskService', 'DeleteTask', request, DeleteTaskResponse())
  ;
  $async.Future<ListTasksResponse> listTasks($pb.ClientContext? ctx, ListTasksRequest request) =>
    _client.invoke<ListTasksResponse>(ctx, 'TaskService', 'ListTasks', request, ListTasksResponse())
  ;
  $async.Future<Task> updateTaskStatus($pb.ClientContext? ctx, UpdateTaskStatusRequest request) =>
    _client.invoke<Task>(ctx, 'TaskService', 'UpdateTaskStatus', request, Task())
  ;
  $async.Future<Task> claimTask($pb.ClientContext? ctx, ClaimTaskRequest request) =>
    _client.invoke<Task>(ctx, 'TaskService', 'ClaimTask', request, Task())
  ;
  $async.Future<TaskComment> createComment($pb.ClientContext? ctx, CreateCommentRequest request) =>
    _client.invoke<TaskComment>(ctx, 'TaskService', 'CreateComment', request, TaskComment())
  ;
  $async.Future<TaskComment> updateComment($pb.ClientContext? ctx, UpdateCommentRequest request) =>
    _client.invoke<TaskComment>(ctx, 'TaskService', 'UpdateComment', request, TaskComment())
  ;
  $async.Future<DeleteCommentResponse> deleteComment($pb.ClientContext? ctx, DeleteCommentRequest request) =>
    _client.invoke<DeleteCommentResponse>(ctx, 'TaskService', 'DeleteComment', request, DeleteCommentResponse())
  ;
  $async.Future<ListCommentsResponse> listComments($pb.ClientContext? ctx, ListCommentsRequest request) =>
    _client.invoke<ListCommentsResponse>(ctx, 'TaskService', 'ListComments', request, ListCommentsResponse())
  ;
  $async.Future<GetTaskActivityResponse> getTaskActivity($pb.ClientContext? ctx, GetTaskActivityRequest request) =>
    _client.invoke<GetTaskActivityResponse>(ctx, 'TaskService', 'GetTaskActivity', request, GetTaskActivityResponse())
  ;
  $async.Future<AssignmentRule> createAssignmentRule($pb.ClientContext? ctx, CreateAssignmentRuleRequest request) =>
    _client.invoke<AssignmentRule>(ctx, 'TaskService', 'CreateAssignmentRule', request, AssignmentRule())
  ;
  $async.Future<AssignmentRule> updateAssignmentRule($pb.ClientContext? ctx, UpdateAssignmentRuleRequest request) =>
    _client.invoke<AssignmentRule>(ctx, 'TaskService', 'UpdateAssignmentRule', request, AssignmentRule())
  ;
  $async.Future<DeleteAssignmentRuleResponse> deleteAssignmentRule($pb.ClientContext? ctx, DeleteAssignmentRuleRequest request) =>
    _client.invoke<DeleteAssignmentRuleResponse>(ctx, 'TaskService', 'DeleteAssignmentRule', request, DeleteAssignmentRuleResponse())
  ;
  $async.Future<ListAssignmentRulesResponse> listAssignmentRules($pb.ClientContext? ctx, ListAssignmentRulesRequest request) =>
    _client.invoke<ListAssignmentRulesResponse>(ctx, 'TaskService', 'ListAssignmentRules', request, ListAssignmentRulesResponse())
  ;
  $async.Future<GetAssignableMembersResponse> getAssignableMembers($pb.ClientContext? ctx, GetAssignableMembersRequest request) =>
    _client.invoke<GetAssignableMembersResponse>(ctx, 'TaskService', 'GetAssignableMembers', request, GetAssignableMembersResponse())
  ;
  $async.Future<GetAssignableRolesResponse> getAssignableRoles($pb.ClientContext? ctx, GetAssignableRolesRequest request) =>
    _client.invoke<GetAssignableRolesResponse>(ctx, 'TaskService', 'GetAssignableRoles', request, GetAssignableRolesResponse())
  ;
  $async.Future<GetTicketLocationsResponse> getTicketLocations($pb.ClientContext? ctx, GetTicketLocationsRequest request) =>
    _client.invoke<GetTicketLocationsResponse>(ctx, 'TaskService', 'GetTicketLocations', request, GetTicketLocationsResponse())
  ;
  $async.Future<GenerateTaskTitleResponse> generateTaskTitle($pb.ClientContext? ctx, GenerateTaskTitleRequest request) =>
    _client.invoke<GenerateTaskTitleResponse>(ctx, 'TaskService', 'GenerateTaskTitle', request, GenerateTaskTitleResponse())
  ;
  $async.Future<TaskDefStatistics> getTaskDefStatistics($pb.ClientContext? ctx, GetTaskDefStatisticsRequest request) =>
    _client.invoke<TaskDefStatistics>(ctx, 'TaskService', 'GetTaskDefStatistics', request, TaskDefStatistics())
  ;
  $async.Future<ListTasksResponse> getUpcomingTasks($pb.ClientContext? ctx, GetUpcomingTasksRequest request) =>
    _client.invoke<ListTasksResponse>(ctx, 'TaskService', 'GetUpcomingTasks', request, ListTasksResponse())
  ;
  $async.Future<ListTasksResponse> getOverdueTasks($pb.ClientContext? ctx, GetOverdueTasksRequest request) =>
    _client.invoke<ListTasksResponse>(ctx, 'TaskService', 'GetOverdueTasks', request, ListTasksResponse())
  ;
  $async.Future<TaskManagementOverview> getTaskManagementOverview($pb.ClientContext? ctx, GetTaskManagementOverviewRequest request) =>
    _client.invoke<TaskManagementOverview>(ctx, 'TaskService', 'GetTaskManagementOverview', request, TaskManagementOverview())
  ;
  $async.Future<GetAttachmentUploadUrlResponse> getAttachmentUploadUrl($pb.ClientContext? ctx, GetAttachmentUploadUrlRequest request) =>
    _client.invoke<GetAttachmentUploadUrlResponse>(ctx, 'TaskService', 'GetAttachmentUploadUrl', request, GetAttachmentUploadUrlResponse())
  ;
  $async.Future<TaskAttachment> confirmAttachmentUpload($pb.ClientContext? ctx, ConfirmAttachmentUploadRequest request) =>
    _client.invoke<TaskAttachment>(ctx, 'TaskService', 'ConfirmAttachmentUpload', request, TaskAttachment())
  ;
  $async.Future<ListTaskAttachmentsResponse> listTaskAttachments($pb.ClientContext? ctx, ListTaskAttachmentsRequest request) =>
    _client.invoke<ListTaskAttachmentsResponse>(ctx, 'TaskService', 'ListTaskAttachments', request, ListTaskAttachmentsResponse())
  ;
  $async.Future<DeleteAttachmentResponse> deleteAttachment($pb.ClientContext? ctx, DeleteAttachmentRequest request) =>
    _client.invoke<DeleteAttachmentResponse>(ctx, 'TaskService', 'DeleteAttachment', request, DeleteAttachmentResponse())
  ;
  $async.Future<ValidateRecurrenceRuleResponse> validateRecurrenceRule($pb.ClientContext? ctx, ValidateRecurrenceRuleRequest request) =>
    _client.invoke<ValidateRecurrenceRuleResponse>(ctx, 'TaskService', 'ValidateRecurrenceRule', request, ValidateRecurrenceRuleResponse())
  ;
  $async.Future<PreviewRecurrenceOccurrencesResponse> previewRecurrenceOccurrences($pb.ClientContext? ctx, PreviewRecurrenceOccurrencesRequest request) =>
    _client.invoke<PreviewRecurrenceOccurrencesResponse>(ctx, 'TaskService', 'PreviewRecurrenceOccurrences', request, PreviewRecurrenceOccurrencesResponse())
  ;
  $async.Future<CreateRecurrenceRuleResponse> createRecurrenceRule($pb.ClientContext? ctx, CreateRecurrenceRuleRequest request) =>
    _client.invoke<CreateRecurrenceRuleResponse>(ctx, 'TaskService', 'CreateRecurrenceRule', request, CreateRecurrenceRuleResponse())
  ;
  $async.Future<BulkCreateTaskDefsResponse> bulkCreateTaskDefs($pb.ClientContext? ctx, BulkCreateTaskDefsRequest request) =>
    _client.invoke<BulkCreateTaskDefsResponse>(ctx, 'TaskService', 'BulkCreateTaskDefs', request, BulkCreateTaskDefsResponse())
  ;
  $async.Future<BulkUpdateTaskDefsResponse> bulkUpdateTaskDefs($pb.ClientContext? ctx, BulkUpdateTaskDefsRequest request) =>
    _client.invoke<BulkUpdateTaskDefsResponse>(ctx, 'TaskService', 'BulkUpdateTaskDefs', request, BulkUpdateTaskDefsResponse())
  ;
  $async.Future<BulkDeleteTaskDefsResponse> bulkDeleteTaskDefs($pb.ClientContext? ctx, BulkDeleteTaskDefsRequest request) =>
    _client.invoke<BulkDeleteTaskDefsResponse>(ctx, 'TaskService', 'BulkDeleteTaskDefs', request, BulkDeleteTaskDefsResponse())
  ;
  $async.Future<BulkUpdateTaskStatusResponse> bulkUpdateTaskStatus($pb.ClientContext? ctx, BulkUpdateTaskStatusRequest request) =>
    _client.invoke<BulkUpdateTaskStatusResponse>(ctx, 'TaskService', 'BulkUpdateTaskStatus', request, BulkUpdateTaskStatusResponse())
  ;
  $async.Future<GetTaskDefHistoryResponse> getTaskDefHistory($pb.ClientContext? ctx, GetTaskDefHistoryRequest request) =>
    _client.invoke<GetTaskDefHistoryResponse>(ctx, 'TaskService', 'GetTaskDefHistory', request, GetTaskDefHistoryResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
