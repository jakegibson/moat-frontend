//
//  Generated code. Do not modify.
//  source: moat/v1/task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TaskType extends $pb.ProtobufEnum {
  static const TaskType TASK_TYPE_UNSPECIFIED = TaskType._(0, _omitEnumNames ? '' : 'TASK_TYPE_UNSPECIFIED');
  static const TaskType TASK_TYPE_MAINTENANCE = TaskType._(1, _omitEnumNames ? '' : 'TASK_TYPE_MAINTENANCE');
  static const TaskType TASK_TYPE_SERVICE_REQUEST = TaskType._(2, _omitEnumNames ? '' : 'TASK_TYPE_SERVICE_REQUEST');
  static const TaskType TASK_TYPE_WARRANTY = TaskType._(3, _omitEnumNames ? '' : 'TASK_TYPE_WARRANTY');
  static const TaskType TASK_TYPE_OTHER = TaskType._(4, _omitEnumNames ? '' : 'TASK_TYPE_OTHER');

  static const $core.List<TaskType> values = <TaskType> [
    TASK_TYPE_UNSPECIFIED,
    TASK_TYPE_MAINTENANCE,
    TASK_TYPE_SERVICE_REQUEST,
    TASK_TYPE_WARRANTY,
    TASK_TYPE_OTHER,
  ];

  static final $core.Map<$core.int, TaskType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TaskType? valueOf($core.int value) => _byValue[value];

  const TaskType._($core.int v, $core.String n) : super(v, n);
}

class TaskStatus extends $pb.ProtobufEnum {
  static const TaskStatus TASK_STATUS_UNSPECIFIED = TaskStatus._(0, _omitEnumNames ? '' : 'TASK_STATUS_UNSPECIFIED');
  static const TaskStatus TASK_STATUS_CREATED = TaskStatus._(1, _omitEnumNames ? '' : 'TASK_STATUS_CREATED');
  static const TaskStatus TASK_STATUS_IN_PROGRESS = TaskStatus._(2, _omitEnumNames ? '' : 'TASK_STATUS_IN_PROGRESS');
  static const TaskStatus TASK_STATUS_ON_HOLD = TaskStatus._(3, _omitEnumNames ? '' : 'TASK_STATUS_ON_HOLD');
  static const TaskStatus TASK_STATUS_RESOLVED = TaskStatus._(4, _omitEnumNames ? '' : 'TASK_STATUS_RESOLVED');

  static const $core.List<TaskStatus> values = <TaskStatus> [
    TASK_STATUS_UNSPECIFIED,
    TASK_STATUS_CREATED,
    TASK_STATUS_IN_PROGRESS,
    TASK_STATUS_ON_HOLD,
    TASK_STATUS_RESOLVED,
  ];

  static final $core.Map<$core.int, TaskStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TaskStatus? valueOf($core.int value) => _byValue[value];

  const TaskStatus._($core.int v, $core.String n) : super(v, n);
}

class ResolutionType extends $pb.ProtobufEnum {
  static const ResolutionType RESOLUTION_TYPE_UNSPECIFIED = ResolutionType._(0, _omitEnumNames ? '' : 'RESOLUTION_TYPE_UNSPECIFIED');
  static const ResolutionType RESOLUTION_TYPE_COMPLETED = ResolutionType._(1, _omitEnumNames ? '' : 'RESOLUTION_TYPE_COMPLETED');
  static const ResolutionType RESOLUTION_TYPE_NON_ISSUE = ResolutionType._(2, _omitEnumNames ? '' : 'RESOLUTION_TYPE_NON_ISSUE');
  static const ResolutionType RESOLUTION_TYPE_DUPLICATE = ResolutionType._(3, _omitEnumNames ? '' : 'RESOLUTION_TYPE_DUPLICATE');
  static const ResolutionType RESOLUTION_TYPE_WILL_NOT_FIX = ResolutionType._(4, _omitEnumNames ? '' : 'RESOLUTION_TYPE_WILL_NOT_FIX');

  static const $core.List<ResolutionType> values = <ResolutionType> [
    RESOLUTION_TYPE_UNSPECIFIED,
    RESOLUTION_TYPE_COMPLETED,
    RESOLUTION_TYPE_NON_ISSUE,
    RESOLUTION_TYPE_DUPLICATE,
    RESOLUTION_TYPE_WILL_NOT_FIX,
  ];

  static final $core.Map<$core.int, ResolutionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResolutionType? valueOf($core.int value) => _byValue[value];

  const ResolutionType._($core.int v, $core.String n) : super(v, n);
}

class AssignmentMethod extends $pb.ProtobufEnum {
  static const AssignmentMethod ASSIGNMENT_METHOD_UNSPECIFIED = AssignmentMethod._(0, _omitEnumNames ? '' : 'ASSIGNMENT_METHOD_UNSPECIFIED');
  static const AssignmentMethod ASSIGNMENT_METHOD_RANDOM = AssignmentMethod._(1, _omitEnumNames ? '' : 'ASSIGNMENT_METHOD_RANDOM');
  static const AssignmentMethod ASSIGNMENT_METHOD_LEAST_LOADED = AssignmentMethod._(2, _omitEnumNames ? '' : 'ASSIGNMENT_METHOD_LEAST_LOADED');

  static const $core.List<AssignmentMethod> values = <AssignmentMethod> [
    ASSIGNMENT_METHOD_UNSPECIFIED,
    ASSIGNMENT_METHOD_RANDOM,
    ASSIGNMENT_METHOD_LEAST_LOADED,
  ];

  static final $core.Map<$core.int, AssignmentMethod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AssignmentMethod? valueOf($core.int value) => _byValue[value];

  const AssignmentMethod._($core.int v, $core.String n) : super(v, n);
}

class AssignmentTargetType extends $pb.ProtobufEnum {
  static const AssignmentTargetType ASSIGNMENT_TARGET_TYPE_UNSPECIFIED = AssignmentTargetType._(0, _omitEnumNames ? '' : 'ASSIGNMENT_TARGET_TYPE_UNSPECIFIED');
  static const AssignmentTargetType ASSIGNMENT_TARGET_TYPE_ROLE = AssignmentTargetType._(1, _omitEnumNames ? '' : 'ASSIGNMENT_TARGET_TYPE_ROLE');
  static const AssignmentTargetType ASSIGNMENT_TARGET_TYPE_MEMBER = AssignmentTargetType._(2, _omitEnumNames ? '' : 'ASSIGNMENT_TARGET_TYPE_MEMBER');

  static const $core.List<AssignmentTargetType> values = <AssignmentTargetType> [
    ASSIGNMENT_TARGET_TYPE_UNSPECIFIED,
    ASSIGNMENT_TARGET_TYPE_ROLE,
    ASSIGNMENT_TARGET_TYPE_MEMBER,
  ];

  static final $core.Map<$core.int, AssignmentTargetType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AssignmentTargetType? valueOf($core.int value) => _byValue[value];

  const AssignmentTargetType._($core.int v, $core.String n) : super(v, n);
}

/// Recurrence frequency
class RecurrenceFrequency extends $pb.ProtobufEnum {
  static const RecurrenceFrequency RECURRENCE_FREQUENCY_UNSPECIFIED = RecurrenceFrequency._(0, _omitEnumNames ? '' : 'RECURRENCE_FREQUENCY_UNSPECIFIED');
  static const RecurrenceFrequency RECURRENCE_FREQUENCY_DAILY = RecurrenceFrequency._(1, _omitEnumNames ? '' : 'RECURRENCE_FREQUENCY_DAILY');
  static const RecurrenceFrequency RECURRENCE_FREQUENCY_WEEKLY = RecurrenceFrequency._(2, _omitEnumNames ? '' : 'RECURRENCE_FREQUENCY_WEEKLY');
  static const RecurrenceFrequency RECURRENCE_FREQUENCY_MONTHLY = RecurrenceFrequency._(3, _omitEnumNames ? '' : 'RECURRENCE_FREQUENCY_MONTHLY');
  static const RecurrenceFrequency RECURRENCE_FREQUENCY_YEARLY = RecurrenceFrequency._(4, _omitEnumNames ? '' : 'RECURRENCE_FREQUENCY_YEARLY');

  static const $core.List<RecurrenceFrequency> values = <RecurrenceFrequency> [
    RECURRENCE_FREQUENCY_UNSPECIFIED,
    RECURRENCE_FREQUENCY_DAILY,
    RECURRENCE_FREQUENCY_WEEKLY,
    RECURRENCE_FREQUENCY_MONTHLY,
    RECURRENCE_FREQUENCY_YEARLY,
  ];

  static final $core.Map<$core.int, RecurrenceFrequency> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RecurrenceFrequency? valueOf($core.int value) => _byValue[value];

  const RecurrenceFrequency._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
