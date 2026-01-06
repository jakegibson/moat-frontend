//
//  Generated code. Do not modify.
//  source: moat/v1/task.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/struct.pbjson.dart' as $1;
import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use taskTypeDescriptor instead')
const TaskType$json = {
  '1': 'TaskType',
  '2': [
    {'1': 'TASK_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'TASK_TYPE_MAINTENANCE', '2': 1},
    {'1': 'TASK_TYPE_SERVICE_REQUEST', '2': 2},
    {'1': 'TASK_TYPE_WARRANTY', '2': 3},
    {'1': 'TASK_TYPE_OTHER', '2': 4},
  ],
};

/// Descriptor for `TaskType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List taskTypeDescriptor = $convert.base64Decode(
    'CghUYXNrVHlwZRIZChVUQVNLX1RZUEVfVU5TUEVDSUZJRUQQABIZChVUQVNLX1RZUEVfTUFJTl'
    'RFTkFOQ0UQARIdChlUQVNLX1RZUEVfU0VSVklDRV9SRVFVRVNUEAISFgoSVEFTS19UWVBFX1dB'
    'UlJBTlRZEAMSEwoPVEFTS19UWVBFX09USEVSEAQ=');

@$core.Deprecated('Use taskStatusDescriptor instead')
const TaskStatus$json = {
  '1': 'TaskStatus',
  '2': [
    {'1': 'TASK_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'TASK_STATUS_CREATED', '2': 1},
    {'1': 'TASK_STATUS_IN_PROGRESS', '2': 2},
    {'1': 'TASK_STATUS_ON_HOLD', '2': 3},
    {'1': 'TASK_STATUS_RESOLVED', '2': 4},
  ],
};

/// Descriptor for `TaskStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List taskStatusDescriptor = $convert.base64Decode(
    'CgpUYXNrU3RhdHVzEhsKF1RBU0tfU1RBVFVTX1VOU1BFQ0lGSUVEEAASFwoTVEFTS19TVEFUVV'
    'NfQ1JFQVRFRBABEhsKF1RBU0tfU1RBVFVTX0lOX1BST0dSRVNTEAISFwoTVEFTS19TVEFUVVNf'
    'T05fSE9MRBADEhgKFFRBU0tfU1RBVFVTX1JFU09MVkVEEAQ=');

@$core.Deprecated('Use resolutionTypeDescriptor instead')
const ResolutionType$json = {
  '1': 'ResolutionType',
  '2': [
    {'1': 'RESOLUTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'RESOLUTION_TYPE_COMPLETED', '2': 1},
    {'1': 'RESOLUTION_TYPE_NON_ISSUE', '2': 2},
    {'1': 'RESOLUTION_TYPE_DUPLICATE', '2': 3},
    {'1': 'RESOLUTION_TYPE_WILL_NOT_FIX', '2': 4},
  ],
};

/// Descriptor for `ResolutionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List resolutionTypeDescriptor = $convert.base64Decode(
    'Cg5SZXNvbHV0aW9uVHlwZRIfChtSRVNPTFVUSU9OX1RZUEVfVU5TUEVDSUZJRUQQABIdChlSRV'
    'NPTFVUSU9OX1RZUEVfQ09NUExFVEVEEAESHQoZUkVTT0xVVElPTl9UWVBFX05PTl9JU1NVRRAC'
    'Eh0KGVJFU09MVVRJT05fVFlQRV9EVVBMSUNBVEUQAxIgChxSRVNPTFVUSU9OX1RZUEVfV0lMTF'
    '9OT1RfRklYEAQ=');

@$core.Deprecated('Use assignmentMethodDescriptor instead')
const AssignmentMethod$json = {
  '1': 'AssignmentMethod',
  '2': [
    {'1': 'ASSIGNMENT_METHOD_UNSPECIFIED', '2': 0},
    {'1': 'ASSIGNMENT_METHOD_RANDOM', '2': 1},
    {'1': 'ASSIGNMENT_METHOD_LEAST_LOADED', '2': 2},
  ],
};

/// Descriptor for `AssignmentMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assignmentMethodDescriptor = $convert.base64Decode(
    'ChBBc3NpZ25tZW50TWV0aG9kEiEKHUFTU0lHTk1FTlRfTUVUSE9EX1VOU1BFQ0lGSUVEEAASHA'
    'oYQVNTSUdOTUVOVF9NRVRIT0RfUkFORE9NEAESIgoeQVNTSUdOTUVOVF9NRVRIT0RfTEVBU1Rf'
    'TE9BREVEEAI=');

@$core.Deprecated('Use assignmentTargetTypeDescriptor instead')
const AssignmentTargetType$json = {
  '1': 'AssignmentTargetType',
  '2': [
    {'1': 'ASSIGNMENT_TARGET_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'ASSIGNMENT_TARGET_TYPE_ROLE', '2': 1},
    {'1': 'ASSIGNMENT_TARGET_TYPE_MEMBER', '2': 2},
  ],
};

/// Descriptor for `AssignmentTargetType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assignmentTargetTypeDescriptor = $convert.base64Decode(
    'ChRBc3NpZ25tZW50VGFyZ2V0VHlwZRImCiJBU1NJR05NRU5UX1RBUkdFVF9UWVBFX1VOU1BFQ0'
    'lGSUVEEAASHwobQVNTSUdOTUVOVF9UQVJHRVRfVFlQRV9ST0xFEAESIQodQVNTSUdOTUVOVF9U'
    'QVJHRVRfVFlQRV9NRU1CRVIQAg==');

@$core.Deprecated('Use recurrenceFrequencyDescriptor instead')
const RecurrenceFrequency$json = {
  '1': 'RecurrenceFrequency',
  '2': [
    {'1': 'RECURRENCE_FREQUENCY_UNSPECIFIED', '2': 0},
    {'1': 'RECURRENCE_FREQUENCY_DAILY', '2': 1},
    {'1': 'RECURRENCE_FREQUENCY_WEEKLY', '2': 2},
    {'1': 'RECURRENCE_FREQUENCY_MONTHLY', '2': 3},
    {'1': 'RECURRENCE_FREQUENCY_YEARLY', '2': 4},
  ],
};

/// Descriptor for `RecurrenceFrequency`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recurrenceFrequencyDescriptor = $convert.base64Decode(
    'ChNSZWN1cnJlbmNlRnJlcXVlbmN5EiQKIFJFQ1VSUkVOQ0VfRlJFUVVFTkNZX1VOU1BFQ0lGSU'
    'VEEAASHgoaUkVDVVJSRU5DRV9GUkVRVUVOQ1lfREFJTFkQARIfChtSRUNVUlJFTkNFX0ZSRVFV'
    'RU5DWV9XRUVLTFkQAhIgChxSRUNVUlJFTkNFX0ZSRVFVRU5DWV9NT05USExZEAMSHwobUkVDVV'
    'JSRU5DRV9GUkVRVUVOQ1lfWUVBUkxZEAQ=');

@$core.Deprecated('Use taskDefDescriptor instead')
const TaskDef$json = {
  '1': 'TaskDef',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'company_id', '3': 2, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'asset_id', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'assetId', '17': true},
    {'1': 'location_id', '3': 4, '4': 1, '5': 9, '10': 'locationId'},
    {'1': 'file_id', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'fileId', '17': true},
    {'1': 'task_type', '3': 6, '4': 1, '5': 14, '6': '.moat.v1.TaskType', '10': 'taskType'},
    {'1': 'title', '3': 7, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 8, '4': 1, '5': 9, '9': 2, '10': 'description', '17': true},
    {'1': 'is_enabled', '3': 9, '4': 1, '5': 8, '10': 'isEnabled'},
    {'1': 'recurrence_rule', '3': 10, '4': 1, '5': 9, '9': 3, '10': 'recurrenceRule', '17': true},
    {'1': 'recurrence_start', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 4, '10': 'recurrenceStart', '17': true},
    {'1': 'recurrence_end', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 5, '10': 'recurrenceEnd', '17': true},
    {'1': 'next_run_at', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 6, '10': 'nextRunAt', '17': true},
    {'1': 'task_id', '3': 14, '4': 1, '5': 9, '9': 7, '10': 'taskId', '17': true},
    {'1': 'specific_location', '3': 15, '4': 1, '5': 9, '9': 8, '10': 'specificLocation', '17': true},
    {'1': 'details', '3': 16, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 9, '10': 'details', '17': true},
    {'1': 'created_at', '3': 17, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 18, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '8': [
    {'1': '_asset_id'},
    {'1': '_file_id'},
    {'1': '_description'},
    {'1': '_recurrence_rule'},
    {'1': '_recurrence_start'},
    {'1': '_recurrence_end'},
    {'1': '_next_run_at'},
    {'1': '_task_id'},
    {'1': '_specific_location'},
    {'1': '_details'},
  ],
};

/// Descriptor for `TaskDef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDefDescriptor = $convert.base64Decode(
    'CgdUYXNrRGVmEg4KAmlkGAEgASgJUgJpZBIdCgpjb21wYW55X2lkGAIgASgJUgljb21wYW55SW'
    'QSHgoIYXNzZXRfaWQYAyABKAlIAFIHYXNzZXRJZIgBARIfCgtsb2NhdGlvbl9pZBgEIAEoCVIK'
    'bG9jYXRpb25JZBIcCgdmaWxlX2lkGAUgASgJSAFSBmZpbGVJZIgBARIuCgl0YXNrX3R5cGUYBi'
    'ABKA4yES5tb2F0LnYxLlRhc2tUeXBlUgh0YXNrVHlwZRIUCgV0aXRsZRgHIAEoCVIFdGl0bGUS'
    'JQoLZGVzY3JpcHRpb24YCCABKAlIAlILZGVzY3JpcHRpb26IAQESHQoKaXNfZW5hYmxlZBgJIA'
    'EoCFIJaXNFbmFibGVkEiwKD3JlY3VycmVuY2VfcnVsZRgKIAEoCUgDUg5yZWN1cnJlbmNlUnVs'
    'ZYgBARJKChByZWN1cnJlbmNlX3N0YXJ0GAsgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcEgEUg9yZWN1cnJlbmNlU3RhcnSIAQESRgoOcmVjdXJyZW5jZV9lbmQYDCABKAsyGi5nb29n'
    'bGUucHJvdG9idWYuVGltZXN0YW1wSAVSDXJlY3VycmVuY2VFbmSIAQESPwoLbmV4dF9ydW5fYX'
    'QYDSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAZSCW5leHRSdW5BdIgBARIcCgd0'
    'YXNrX2lkGA4gASgJSAdSBnRhc2tJZIgBARIwChFzcGVjaWZpY19sb2NhdGlvbhgPIAEoCUgIUh'
    'BzcGVjaWZpY0xvY2F0aW9uiAEBEjYKB2RldGFpbHMYECABKAsyFy5nb29nbGUucHJvdG9idWYu'
    'U3RydWN0SAlSB2RldGFpbHOIAQESOQoKY3JlYXRlZF9hdBgRIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GBIgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0QgsKCV9hc3NldF9pZEIKCghfZmlsZV9pZEIOCg'
    'xfZGVzY3JpcHRpb25CEgoQX3JlY3VycmVuY2VfcnVsZUITChFfcmVjdXJyZW5jZV9zdGFydEIR'
    'Cg9fcmVjdXJyZW5jZV9lbmRCDgoMX25leHRfcnVuX2F0QgoKCF90YXNrX2lkQhQKEl9zcGVjaW'
    'ZpY19sb2NhdGlvbkIKCghfZGV0YWlscw==');

@$core.Deprecated('Use createTaskDefRequestDescriptor instead')
const CreateTaskDefRequest$json = {
  '1': 'CreateTaskDefRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'assetId', '17': true},
    {'1': 'location_id', '3': 2, '4': 1, '5': 9, '10': 'locationId'},
    {'1': 'file_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'fileId', '17': true},
    {'1': 'task_type', '3': 4, '4': 1, '5': 14, '6': '.moat.v1.TaskType', '10': 'taskType'},
    {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'description', '17': true},
    {'1': 'is_enabled', '3': 7, '4': 1, '5': 8, '10': 'isEnabled'},
    {'1': 'recurrence_rule', '3': 8, '4': 1, '5': 9, '9': 3, '10': 'recurrenceRule', '17': true},
    {'1': 'recurrence_start', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 4, '10': 'recurrenceStart', '17': true},
    {'1': 'recurrence_end', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 5, '10': 'recurrenceEnd', '17': true},
    {'1': 'specific_location', '3': 11, '4': 1, '5': 9, '9': 6, '10': 'specificLocation', '17': true},
    {'1': 'details', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 7, '10': 'details', '17': true},
  ],
  '8': [
    {'1': '_asset_id'},
    {'1': '_file_id'},
    {'1': '_description'},
    {'1': '_recurrence_rule'},
    {'1': '_recurrence_start'},
    {'1': '_recurrence_end'},
    {'1': '_specific_location'},
    {'1': '_details'},
  ],
};

/// Descriptor for `CreateTaskDefRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskDefRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVUYXNrRGVmUmVxdWVzdBIeCghhc3NldF9pZBgBIAEoCUgAUgdhc3NldElkiAEBEh'
    '8KC2xvY2F0aW9uX2lkGAIgASgJUgpsb2NhdGlvbklkEhwKB2ZpbGVfaWQYAyABKAlIAVIGZmls'
    'ZUlkiAEBEi4KCXRhc2tfdHlwZRgEIAEoDjIRLm1vYXQudjEuVGFza1R5cGVSCHRhc2tUeXBlEh'
    'QKBXRpdGxlGAUgASgJUgV0aXRsZRIlCgtkZXNjcmlwdGlvbhgGIAEoCUgCUgtkZXNjcmlwdGlv'
    'bogBARIdCgppc19lbmFibGVkGAcgASgIUglpc0VuYWJsZWQSLAoPcmVjdXJyZW5jZV9ydWxlGA'
    'ggASgJSANSDnJlY3VycmVuY2VSdWxliAEBEkoKEHJlY3VycmVuY2Vfc3RhcnQYCSABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wSARSD3JlY3VycmVuY2VTdGFydIgBARJGCg5yZWN1cn'
    'JlbmNlX2VuZBgKIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIBVINcmVjdXJyZW5j'
    'ZUVuZIgBARIwChFzcGVjaWZpY19sb2NhdGlvbhgLIAEoCUgGUhBzcGVjaWZpY0xvY2F0aW9uiA'
    'EBEjYKB2RldGFpbHMYDCABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0SAdSB2RldGFpbHOI'
    'AQFCCwoJX2Fzc2V0X2lkQgoKCF9maWxlX2lkQg4KDF9kZXNjcmlwdGlvbkISChBfcmVjdXJyZW'
    '5jZV9ydWxlQhMKEV9yZWN1cnJlbmNlX3N0YXJ0QhEKD19yZWN1cnJlbmNlX2VuZEIUChJfc3Bl'
    'Y2lmaWNfbG9jYXRpb25CCgoIX2RldGFpbHM=');

@$core.Deprecated('Use getTaskDefRequestDescriptor instead')
const GetTaskDefRequest$json = {
  '1': 'GetTaskDefRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetTaskDefRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskDefRequestDescriptor = $convert.base64Decode(
    'ChFHZXRUYXNrRGVmUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use updateTaskDefRequestDescriptor instead')
const UpdateTaskDefRequest$json = {
  '1': 'UpdateTaskDefRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'task_type', '3': 2, '4': 1, '5': 14, '6': '.moat.v1.TaskType', '9': 0, '10': 'taskType', '17': true},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'title', '17': true},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'description', '17': true},
    {'1': 'is_enabled', '3': 5, '4': 1, '5': 8, '9': 3, '10': 'isEnabled', '17': true},
    {'1': 'recurrence_rule', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'recurrenceRule', '17': true},
    {'1': 'recurrence_start', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 5, '10': 'recurrenceStart', '17': true},
    {'1': 'recurrence_end', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 6, '10': 'recurrenceEnd', '17': true},
    {'1': 'specific_location', '3': 9, '4': 1, '5': 9, '9': 7, '10': 'specificLocation', '17': true},
    {'1': 'details', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 8, '10': 'details', '17': true},
    {'1': 'file_id', '3': 11, '4': 1, '5': 9, '9': 9, '10': 'fileId', '17': true},
    {'1': 'location_id', '3': 12, '4': 1, '5': 9, '9': 10, '10': 'locationId', '17': true},
  ],
  '8': [
    {'1': '_task_type'},
    {'1': '_title'},
    {'1': '_description'},
    {'1': '_is_enabled'},
    {'1': '_recurrence_rule'},
    {'1': '_recurrence_start'},
    {'1': '_recurrence_end'},
    {'1': '_specific_location'},
    {'1': '_details'},
    {'1': '_file_id'},
    {'1': '_location_id'},
  ],
};

/// Descriptor for `UpdateTaskDefRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTaskDefRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVUYXNrRGVmUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSMwoJdGFza190eXBlGAIgAS'
    'gOMhEubW9hdC52MS5UYXNrVHlwZUgAUgh0YXNrVHlwZYgBARIZCgV0aXRsZRgDIAEoCUgBUgV0'
    'aXRsZYgBARIlCgtkZXNjcmlwdGlvbhgEIAEoCUgCUgtkZXNjcmlwdGlvbogBARIiCgppc19lbm'
    'FibGVkGAUgASgISANSCWlzRW5hYmxlZIgBARIsCg9yZWN1cnJlbmNlX3J1bGUYBiABKAlIBFIO'
    'cmVjdXJyZW5jZVJ1bGWIAQESSgoQcmVjdXJyZW5jZV9zdGFydBgHIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBIBVIPcmVjdXJyZW5jZVN0YXJ0iAEBEkYKDnJlY3VycmVuY2VfZW5k'
    'GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgGUg1yZWN1cnJlbmNlRW5kiAEBEj'
    'AKEXNwZWNpZmljX2xvY2F0aW9uGAkgASgJSAdSEHNwZWNpZmljTG9jYXRpb26IAQESNgoHZGV0'
    'YWlscxgKIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RICFIHZGV0YWlsc4gBARIcCgdmaW'
    'xlX2lkGAsgASgJSAlSBmZpbGVJZIgBARIkCgtsb2NhdGlvbl9pZBgMIAEoCUgKUgpsb2NhdGlv'
    'bklkiAEBQgwKCl90YXNrX3R5cGVCCAoGX3RpdGxlQg4KDF9kZXNjcmlwdGlvbkINCgtfaXNfZW'
    '5hYmxlZEISChBfcmVjdXJyZW5jZV9ydWxlQhMKEV9yZWN1cnJlbmNlX3N0YXJ0QhEKD19yZWN1'
    'cnJlbmNlX2VuZEIUChJfc3BlY2lmaWNfbG9jYXRpb25CCgoIX2RldGFpbHNCCgoIX2ZpbGVfaW'
    'RCDgoMX2xvY2F0aW9uX2lk');

@$core.Deprecated('Use deleteTaskDefRequestDescriptor instead')
const DeleteTaskDefRequest$json = {
  '1': 'DeleteTaskDefRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteTaskDefRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskDefRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVUYXNrRGVmUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use deleteTaskDefResponseDescriptor instead')
const DeleteTaskDefResponse$json = {
  '1': 'DeleteTaskDefResponse',
};

/// Descriptor for `DeleteTaskDefResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskDefResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVUYXNrRGVmUmVzcG9uc2U=');

@$core.Deprecated('Use listTaskDefsRequestDescriptor instead')
const ListTaskDefsRequest$json = {
  '1': 'ListTaskDefsRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'assetId', '17': true},
    {'1': 'asset_ids', '3': 2, '4': 3, '5': 9, '10': 'assetIds'},
    {'1': 'location_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'locationId', '17': true},
    {'1': 'location_ids', '3': 4, '4': 3, '5': 9, '10': 'locationIds'},
    {'1': 'task_type', '3': 5, '4': 1, '5': 14, '6': '.moat.v1.TaskType', '9': 2, '10': 'taskType', '17': true},
    {'1': 'is_enabled', '3': 6, '4': 1, '5': 8, '9': 3, '10': 'isEnabled', '17': true},
    {'1': 'search', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'search', '17': true},
    {'1': 'limit', '3': 8, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 9, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'has_active_tasks', '3': 10, '4': 1, '5': 8, '9': 5, '10': 'hasActiveTasks', '17': true},
  ],
  '8': [
    {'1': '_asset_id'},
    {'1': '_location_id'},
    {'1': '_task_type'},
    {'1': '_is_enabled'},
    {'1': '_search'},
    {'1': '_has_active_tasks'},
  ],
};

/// Descriptor for `ListTaskDefsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTaskDefsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0VGFza0RlZnNSZXF1ZXN0Eh4KCGFzc2V0X2lkGAEgASgJSABSB2Fzc2V0SWSIAQESGw'
    'oJYXNzZXRfaWRzGAIgAygJUghhc3NldElkcxIkCgtsb2NhdGlvbl9pZBgDIAEoCUgBUgpsb2Nh'
    'dGlvbklkiAEBEiEKDGxvY2F0aW9uX2lkcxgEIAMoCVILbG9jYXRpb25JZHMSMwoJdGFza190eX'
    'BlGAUgASgOMhEubW9hdC52MS5UYXNrVHlwZUgCUgh0YXNrVHlwZYgBARIiCgppc19lbmFibGVk'
    'GAYgASgISANSCWlzRW5hYmxlZIgBARIbCgZzZWFyY2gYByABKAlIBFIGc2VhcmNoiAEBEhQKBW'
    'xpbWl0GAggASgFUgVsaW1pdBIWCgZvZmZzZXQYCSABKAVSBm9mZnNldBItChBoYXNfYWN0aXZl'
    'X3Rhc2tzGAogASgISAVSDmhhc0FjdGl2ZVRhc2tziAEBQgsKCV9hc3NldF9pZEIOCgxfbG9jYX'
    'Rpb25faWRCDAoKX3Rhc2tfdHlwZUINCgtfaXNfZW5hYmxlZEIJCgdfc2VhcmNoQhMKEV9oYXNf'
    'YWN0aXZlX3Rhc2tz');

@$core.Deprecated('Use listTaskDefsResponseDescriptor instead')
const ListTaskDefsResponse$json = {
  '1': 'ListTaskDefsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.TaskDef', '10': 'items'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListTaskDefsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTaskDefsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0VGFza0RlZnNSZXNwb25zZRImCgVpdGVtcxgBIAMoCzIQLm1vYXQudjEuVGFza0RlZl'
    'IFaXRlbXMSFAoFdG90YWwYAiABKAVSBXRvdGFs');

@$core.Deprecated('Use taskDescriptor instead')
const Task$json = {
  '1': 'Task',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'task_def_id', '3': 2, '4': 1, '5': 9, '10': 'taskDefId'},
    {'1': 'assignee_id', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'assigneeId', '17': true},
    {'1': 'assigned_role_id', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'assignedRoleId', '17': true},
    {'1': 'requested_by_id', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'requestedById', '17': true},
    {'1': 'assigned_by_id', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'assignedById', '17': true},
    {'1': 'scheduled_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'scheduledDate'},
    {'1': 'due_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 4, '10': 'dueDate', '17': true},
    {'1': 'completed_date', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 5, '10': 'completedDate', '17': true},
    {'1': 'status', '3': 10, '4': 1, '5': 14, '6': '.moat.v1.TaskStatus', '10': 'status'},
    {'1': 'resolution_type', '3': 11, '4': 1, '5': 14, '6': '.moat.v1.ResolutionType', '9': 6, '10': 'resolutionType', '17': true},
    {'1': 'external_id', '3': 12, '4': 1, '5': 9, '9': 7, '10': 'externalId', '17': true},
    {'1': 'details', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 8, '10': 'details', '17': true},
    {'1': 'created_at', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'floor_location', '3': 16, '4': 1, '5': 9, '9': 9, '10': 'floorLocation', '17': true},
    {'1': 'service_area', '3': 17, '4': 1, '5': 9, '9': 10, '10': 'serviceArea', '17': true},
    {'1': 'specific_location', '3': 18, '4': 1, '5': 9, '9': 11, '10': 'specificLocation', '17': true},
    {'1': 'assignee_first_name', '3': 19, '4': 1, '5': 9, '9': 12, '10': 'assigneeFirstName', '17': true},
    {'1': 'assignee_last_name', '3': 20, '4': 1, '5': 9, '9': 13, '10': 'assigneeLastName', '17': true},
    {'1': 'requested_by_first_name', '3': 21, '4': 1, '5': 9, '9': 14, '10': 'requestedByFirstName', '17': true},
    {'1': 'requested_by_last_name', '3': 22, '4': 1, '5': 9, '9': 15, '10': 'requestedByLastName', '17': true},
    {'1': 'assigned_by_first_name', '3': 23, '4': 1, '5': 9, '9': 16, '10': 'assignedByFirstName', '17': true},
    {'1': 'assigned_by_last_name', '3': 24, '4': 1, '5': 9, '9': 17, '10': 'assignedByLastName', '17': true},
  ],
  '8': [
    {'1': '_assignee_id'},
    {'1': '_assigned_role_id'},
    {'1': '_requested_by_id'},
    {'1': '_assigned_by_id'},
    {'1': '_due_date'},
    {'1': '_completed_date'},
    {'1': '_resolution_type'},
    {'1': '_external_id'},
    {'1': '_details'},
    {'1': '_floor_location'},
    {'1': '_service_area'},
    {'1': '_specific_location'},
    {'1': '_assignee_first_name'},
    {'1': '_assignee_last_name'},
    {'1': '_requested_by_first_name'},
    {'1': '_requested_by_last_name'},
    {'1': '_assigned_by_first_name'},
    {'1': '_assigned_by_last_name'},
  ],
};

/// Descriptor for `Task`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDescriptor = $convert.base64Decode(
    'CgRUYXNrEg4KAmlkGAEgASgJUgJpZBIeCgt0YXNrX2RlZl9pZBgCIAEoCVIJdGFza0RlZklkEi'
    'QKC2Fzc2lnbmVlX2lkGAMgASgJSABSCmFzc2lnbmVlSWSIAQESLQoQYXNzaWduZWRfcm9sZV9p'
    'ZBgEIAEoCUgBUg5hc3NpZ25lZFJvbGVJZIgBARIrCg9yZXF1ZXN0ZWRfYnlfaWQYBSABKAlIAl'
    'INcmVxdWVzdGVkQnlJZIgBARIpCg5hc3NpZ25lZF9ieV9pZBgGIAEoCUgDUgxhc3NpZ25lZEJ5'
    'SWSIAQESQQoOc2NoZWR1bGVkX2RhdGUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW'
    '1wUg1zY2hlZHVsZWREYXRlEjoKCGR1ZV9kYXRlGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcEgEUgdkdWVEYXRliAEBEkYKDmNvbXBsZXRlZF9kYXRlGAkgASgLMhouZ29vZ2xlLn'
    'Byb3RvYnVmLlRpbWVzdGFtcEgFUg1jb21wbGV0ZWREYXRliAEBEisKBnN0YXR1cxgKIAEoDjIT'
    'Lm1vYXQudjEuVGFza1N0YXR1c1IGc3RhdHVzEkUKD3Jlc29sdXRpb25fdHlwZRgLIAEoDjIXLm'
    '1vYXQudjEuUmVzb2x1dGlvblR5cGVIBlIOcmVzb2x1dGlvblR5cGWIAQESJAoLZXh0ZXJuYWxf'
    'aWQYDCABKAlIB1IKZXh0ZXJuYWxJZIgBARI2CgdkZXRhaWxzGA0gASgLMhcuZ29vZ2xlLnByb3'
    'RvYnVmLlN0cnVjdEgIUgdkZXRhaWxziAEBEjkKCmNyZWF0ZWRfYXQYDiABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgPIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIqCg5mbG9vcl9sb2NhdGlvbhgQIAEo'
    'CUgJUg1mbG9vckxvY2F0aW9uiAEBEiYKDHNlcnZpY2VfYXJlYRgRIAEoCUgKUgtzZXJ2aWNlQX'
    'JlYYgBARIwChFzcGVjaWZpY19sb2NhdGlvbhgSIAEoCUgLUhBzcGVjaWZpY0xvY2F0aW9uiAEB'
    'EjMKE2Fzc2lnbmVlX2ZpcnN0X25hbWUYEyABKAlIDFIRYXNzaWduZWVGaXJzdE5hbWWIAQESMQ'
    'oSYXNzaWduZWVfbGFzdF9uYW1lGBQgASgJSA1SEGFzc2lnbmVlTGFzdE5hbWWIAQESOgoXcmVx'
    'dWVzdGVkX2J5X2ZpcnN0X25hbWUYFSABKAlIDlIUcmVxdWVzdGVkQnlGaXJzdE5hbWWIAQESOA'
    'oWcmVxdWVzdGVkX2J5X2xhc3RfbmFtZRgWIAEoCUgPUhNyZXF1ZXN0ZWRCeUxhc3ROYW1liAEB'
    'EjgKFmFzc2lnbmVkX2J5X2ZpcnN0X25hbWUYFyABKAlIEFITYXNzaWduZWRCeUZpcnN0TmFtZY'
    'gBARI2ChVhc3NpZ25lZF9ieV9sYXN0X25hbWUYGCABKAlIEVISYXNzaWduZWRCeUxhc3ROYW1l'
    'iAEBQg4KDF9hc3NpZ25lZV9pZEITChFfYXNzaWduZWRfcm9sZV9pZEISChBfcmVxdWVzdGVkX2'
    'J5X2lkQhEKD19hc3NpZ25lZF9ieV9pZEILCglfZHVlX2RhdGVCEQoPX2NvbXBsZXRlZF9kYXRl'
    'QhIKEF9yZXNvbHV0aW9uX3R5cGVCDgoMX2V4dGVybmFsX2lkQgoKCF9kZXRhaWxzQhEKD19mbG'
    '9vcl9sb2NhdGlvbkIPCg1fc2VydmljZV9hcmVhQhQKEl9zcGVjaWZpY19sb2NhdGlvbkIWChRf'
    'YXNzaWduZWVfZmlyc3RfbmFtZUIVChNfYXNzaWduZWVfbGFzdF9uYW1lQhoKGF9yZXF1ZXN0ZW'
    'RfYnlfZmlyc3RfbmFtZUIZChdfcmVxdWVzdGVkX2J5X2xhc3RfbmFtZUIZChdfYXNzaWduZWRf'
    'YnlfZmlyc3RfbmFtZUIYChZfYXNzaWduZWRfYnlfbGFzdF9uYW1l');

@$core.Deprecated('Use taskWithDetailsDescriptor instead')
const TaskWithDetails$json = {
  '1': 'TaskWithDetails',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'task_def_id', '3': 2, '4': 1, '5': 9, '10': 'taskDefId'},
    {'1': 'assignee_id', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'assigneeId', '17': true},
    {'1': 'assigned_role_id', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'assignedRoleId', '17': true},
    {'1': 'requested_by_id', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'requestedById', '17': true},
    {'1': 'assigned_by_id', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'assignedById', '17': true},
    {'1': 'scheduled_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'scheduledDate'},
    {'1': 'due_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 4, '10': 'dueDate', '17': true},
    {'1': 'completed_date', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 5, '10': 'completedDate', '17': true},
    {'1': 'status', '3': 10, '4': 1, '5': 14, '6': '.moat.v1.TaskStatus', '10': 'status'},
    {'1': 'resolution_type', '3': 11, '4': 1, '5': 14, '6': '.moat.v1.ResolutionType', '9': 6, '10': 'resolutionType', '17': true},
    {'1': 'external_id', '3': 12, '4': 1, '5': 9, '9': 7, '10': 'externalId', '17': true},
    {'1': 'details', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 8, '10': 'details', '17': true},
    {'1': 'created_at', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'floor_location', '3': 16, '4': 1, '5': 9, '9': 9, '10': 'floorLocation', '17': true},
    {'1': 'service_area', '3': 17, '4': 1, '5': 9, '9': 10, '10': 'serviceArea', '17': true},
    {'1': 'specific_location', '3': 18, '4': 1, '5': 9, '9': 11, '10': 'specificLocation', '17': true},
    {'1': 'assignee_first_name', '3': 19, '4': 1, '5': 9, '9': 12, '10': 'assigneeFirstName', '17': true},
    {'1': 'assignee_last_name', '3': 20, '4': 1, '5': 9, '9': 13, '10': 'assigneeLastName', '17': true},
    {'1': 'requested_by_first_name', '3': 21, '4': 1, '5': 9, '9': 14, '10': 'requestedByFirstName', '17': true},
    {'1': 'requested_by_last_name', '3': 22, '4': 1, '5': 9, '9': 15, '10': 'requestedByLastName', '17': true},
    {'1': 'assigned_by_first_name', '3': 23, '4': 1, '5': 9, '9': 16, '10': 'assignedByFirstName', '17': true},
    {'1': 'assigned_by_last_name', '3': 24, '4': 1, '5': 9, '9': 17, '10': 'assignedByLastName', '17': true},
    {'1': 'task_type', '3': 25, '4': 1, '5': 14, '6': '.moat.v1.TaskType', '10': 'taskType'},
    {'1': 'title', '3': 26, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 27, '4': 1, '5': 9, '9': 18, '10': 'description', '17': true},
    {'1': 'location_id', '3': 28, '4': 1, '5': 9, '9': 19, '10': 'locationId', '17': true},
    {'1': 'location_name', '3': 29, '4': 1, '5': 9, '9': 20, '10': 'locationName', '17': true},
    {'1': 'asset_id', '3': 30, '4': 1, '5': 9, '9': 21, '10': 'assetId', '17': true},
    {'1': 'task_def_created_at', '3': 31, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 22, '10': 'taskDefCreatedAt', '17': true},
  ],
  '8': [
    {'1': '_assignee_id'},
    {'1': '_assigned_role_id'},
    {'1': '_requested_by_id'},
    {'1': '_assigned_by_id'},
    {'1': '_due_date'},
    {'1': '_completed_date'},
    {'1': '_resolution_type'},
    {'1': '_external_id'},
    {'1': '_details'},
    {'1': '_floor_location'},
    {'1': '_service_area'},
    {'1': '_specific_location'},
    {'1': '_assignee_first_name'},
    {'1': '_assignee_last_name'},
    {'1': '_requested_by_first_name'},
    {'1': '_requested_by_last_name'},
    {'1': '_assigned_by_first_name'},
    {'1': '_assigned_by_last_name'},
    {'1': '_description'},
    {'1': '_location_id'},
    {'1': '_location_name'},
    {'1': '_asset_id'},
    {'1': '_task_def_created_at'},
  ],
};

/// Descriptor for `TaskWithDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskWithDetailsDescriptor = $convert.base64Decode(
    'Cg9UYXNrV2l0aERldGFpbHMSDgoCaWQYASABKAlSAmlkEh4KC3Rhc2tfZGVmX2lkGAIgASgJUg'
    'l0YXNrRGVmSWQSJAoLYXNzaWduZWVfaWQYAyABKAlIAFIKYXNzaWduZWVJZIgBARItChBhc3Np'
    'Z25lZF9yb2xlX2lkGAQgASgJSAFSDmFzc2lnbmVkUm9sZUlkiAEBEisKD3JlcXVlc3RlZF9ieV'
    '9pZBgFIAEoCUgCUg1yZXF1ZXN0ZWRCeUlkiAEBEikKDmFzc2lnbmVkX2J5X2lkGAYgASgJSANS'
    'DGFzc2lnbmVkQnlJZIgBARJBCg5zY2hlZHVsZWRfZGF0ZRgHIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSDXNjaGVkdWxlZERhdGUSOgoIZHVlX2RhdGUYCCABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wSARSB2R1ZURhdGWIAQESRgoOY29tcGxldGVkX2RhdGUYCSABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAVSDWNvbXBsZXRlZERhdGWIAQESKwoGc3Rh'
    'dHVzGAogASgOMhMubW9hdC52MS5UYXNrU3RhdHVzUgZzdGF0dXMSRQoPcmVzb2x1dGlvbl90eX'
    'BlGAsgASgOMhcubW9hdC52MS5SZXNvbHV0aW9uVHlwZUgGUg5yZXNvbHV0aW9uVHlwZYgBARIk'
    'CgtleHRlcm5hbF9pZBgMIAEoCUgHUgpleHRlcm5hbElkiAEBEjYKB2RldGFpbHMYDSABKAsyFy'
    '5nb29nbGUucHJvdG9idWYuU3RydWN0SAhSB2RldGFpbHOIAQESOQoKY3JlYXRlZF9hdBgOIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GA'
    '8gASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0EioKDmZsb29yX2xv'
    'Y2F0aW9uGBAgASgJSAlSDWZsb29yTG9jYXRpb26IAQESJgoMc2VydmljZV9hcmVhGBEgASgJSA'
    'pSC3NlcnZpY2VBcmVhiAEBEjAKEXNwZWNpZmljX2xvY2F0aW9uGBIgASgJSAtSEHNwZWNpZmlj'
    'TG9jYXRpb26IAQESMwoTYXNzaWduZWVfZmlyc3RfbmFtZRgTIAEoCUgMUhFhc3NpZ25lZUZpcn'
    'N0TmFtZYgBARIxChJhc3NpZ25lZV9sYXN0X25hbWUYFCABKAlIDVIQYXNzaWduZWVMYXN0TmFt'
    'ZYgBARI6ChdyZXF1ZXN0ZWRfYnlfZmlyc3RfbmFtZRgVIAEoCUgOUhRyZXF1ZXN0ZWRCeUZpcn'
    'N0TmFtZYgBARI4ChZyZXF1ZXN0ZWRfYnlfbGFzdF9uYW1lGBYgASgJSA9SE3JlcXVlc3RlZEJ5'
    'TGFzdE5hbWWIAQESOAoWYXNzaWduZWRfYnlfZmlyc3RfbmFtZRgXIAEoCUgQUhNhc3NpZ25lZE'
    'J5Rmlyc3ROYW1liAEBEjYKFWFzc2lnbmVkX2J5X2xhc3RfbmFtZRgYIAEoCUgRUhJhc3NpZ25l'
    'ZEJ5TGFzdE5hbWWIAQESLgoJdGFza190eXBlGBkgASgOMhEubW9hdC52MS5UYXNrVHlwZVIIdG'
    'Fza1R5cGUSFAoFdGl0bGUYGiABKAlSBXRpdGxlEiUKC2Rlc2NyaXB0aW9uGBsgASgJSBJSC2Rl'
    'c2NyaXB0aW9uiAEBEiQKC2xvY2F0aW9uX2lkGBwgASgJSBNSCmxvY2F0aW9uSWSIAQESKAoNbG'
    '9jYXRpb25fbmFtZRgdIAEoCUgUUgxsb2NhdGlvbk5hbWWIAQESHgoIYXNzZXRfaWQYHiABKAlI'
    'FVIHYXNzZXRJZIgBARJOChN0YXNrX2RlZl9jcmVhdGVkX2F0GB8gASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcEgWUhB0YXNrRGVmQ3JlYXRlZEF0iAEBQg4KDF9hc3NpZ25lZV9pZEIT'
    'ChFfYXNzaWduZWRfcm9sZV9pZEISChBfcmVxdWVzdGVkX2J5X2lkQhEKD19hc3NpZ25lZF9ieV'
    '9pZEILCglfZHVlX2RhdGVCEQoPX2NvbXBsZXRlZF9kYXRlQhIKEF9yZXNvbHV0aW9uX3R5cGVC'
    'DgoMX2V4dGVybmFsX2lkQgoKCF9kZXRhaWxzQhEKD19mbG9vcl9sb2NhdGlvbkIPCg1fc2Vydm'
    'ljZV9hcmVhQhQKEl9zcGVjaWZpY19sb2NhdGlvbkIWChRfYXNzaWduZWVfZmlyc3RfbmFtZUIV'
    'ChNfYXNzaWduZWVfbGFzdF9uYW1lQhoKGF9yZXF1ZXN0ZWRfYnlfZmlyc3RfbmFtZUIZChdfcm'
    'VxdWVzdGVkX2J5X2xhc3RfbmFtZUIZChdfYXNzaWduZWRfYnlfZmlyc3RfbmFtZUIYChZfYXNz'
    'aWduZWRfYnlfbGFzdF9uYW1lQg4KDF9kZXNjcmlwdGlvbkIOCgxfbG9jYXRpb25faWRCEAoOX2'
    'xvY2F0aW9uX25hbWVCCwoJX2Fzc2V0X2lkQhYKFF90YXNrX2RlZl9jcmVhdGVkX2F0');

@$core.Deprecated('Use createTaskRequestDescriptor instead')
const CreateTaskRequest$json = {
  '1': 'CreateTaskRequest',
  '2': [
    {'1': 'task_def_id', '3': 1, '4': 1, '5': 9, '10': 'taskDefId'},
    {'1': 'assignee_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'assigneeId', '17': true},
    {'1': 'assigned_role_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'assignedRoleId', '17': true},
    {'1': 'requested_by_id', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'requestedById', '17': true},
    {'1': 'scheduled_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'scheduledDate'},
    {'1': 'due_date', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'dueDate', '17': true},
    {'1': 'details', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 4, '10': 'details', '17': true},
  ],
  '8': [
    {'1': '_assignee_id'},
    {'1': '_assigned_role_id'},
    {'1': '_requested_by_id'},
    {'1': '_due_date'},
    {'1': '_details'},
  ],
};

/// Descriptor for `CreateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVUYXNrUmVxdWVzdBIeCgt0YXNrX2RlZl9pZBgBIAEoCVIJdGFza0RlZklkEiQKC2'
    'Fzc2lnbmVlX2lkGAIgASgJSABSCmFzc2lnbmVlSWSIAQESLQoQYXNzaWduZWRfcm9sZV9pZBgD'
    'IAEoCUgBUg5hc3NpZ25lZFJvbGVJZIgBARIrCg9yZXF1ZXN0ZWRfYnlfaWQYBCABKAlIAlINcm'
    'VxdWVzdGVkQnlJZIgBARJBCg5zY2hlZHVsZWRfZGF0ZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSDXNjaGVkdWxlZERhdGUSOgoIZHVlX2RhdGUYBiABKAsyGi5nb29nbGUucH'
    'JvdG9idWYuVGltZXN0YW1wSANSB2R1ZURhdGWIAQESNgoHZGV0YWlscxgHIAEoCzIXLmdvb2ds'
    'ZS5wcm90b2J1Zi5TdHJ1Y3RIBFIHZGV0YWlsc4gBAUIOCgxfYXNzaWduZWVfaWRCEwoRX2Fzc2'
    'lnbmVkX3JvbGVfaWRCEgoQX3JlcXVlc3RlZF9ieV9pZEILCglfZHVlX2RhdGVCCgoIX2RldGFp'
    'bHM=');

@$core.Deprecated('Use getTaskRequestDescriptor instead')
const GetTaskRequest$json = {
  '1': 'GetTaskRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRUYXNrUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use getTaskByExternalIdRequestDescriptor instead')
const GetTaskByExternalIdRequest$json = {
  '1': 'GetTaskByExternalIdRequest',
  '2': [
    {'1': 'external_id', '3': 1, '4': 1, '5': 9, '10': 'externalId'},
  ],
};

/// Descriptor for `GetTaskByExternalIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskByExternalIdRequestDescriptor = $convert.base64Decode(
    'ChpHZXRUYXNrQnlFeHRlcm5hbElkUmVxdWVzdBIfCgtleHRlcm5hbF9pZBgBIAEoCVIKZXh0ZX'
    'JuYWxJZA==');

@$core.Deprecated('Use updateTaskRequestDescriptor instead')
const UpdateTaskRequest$json = {
  '1': 'UpdateTaskRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'assignee_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'assigneeId', '17': true},
    {'1': 'assigned_role_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'assignedRoleId', '17': true},
    {'1': 'scheduled_date', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'scheduledDate', '17': true},
    {'1': 'due_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'dueDate', '17': true},
    {'1': 'details', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 4, '10': 'details', '17': true},
    {'1': 'notes', '3': 7, '4': 1, '5': 9, '9': 5, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_assignee_id'},
    {'1': '_assigned_role_id'},
    {'1': '_scheduled_date'},
    {'1': '_due_date'},
    {'1': '_details'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `UpdateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTaskRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVUYXNrUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSJAoLYXNzaWduZWVfaWQYAiABKA'
    'lIAFIKYXNzaWduZWVJZIgBARItChBhc3NpZ25lZF9yb2xlX2lkGAMgASgJSAFSDmFzc2lnbmVk'
    'Um9sZUlkiAEBEkYKDnNjaGVkdWxlZF9kYXRlGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcEgCUg1zY2hlZHVsZWREYXRliAEBEjoKCGR1ZV9kYXRlGAUgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcEgDUgdkdWVEYXRliAEBEjYKB2RldGFpbHMYBiABKAsyFy5nb29nbG'
    'UucHJvdG9idWYuU3RydWN0SARSB2RldGFpbHOIAQESGQoFbm90ZXMYByABKAlIBVIFbm90ZXOI'
    'AQFCDgoMX2Fzc2lnbmVlX2lkQhMKEV9hc3NpZ25lZF9yb2xlX2lkQhEKD19zY2hlZHVsZWRfZG'
    'F0ZUILCglfZHVlX2RhdGVCCgoIX2RldGFpbHNCCAoGX25vdGVz');

@$core.Deprecated('Use deleteTaskRequestDescriptor instead')
const DeleteTaskRequest$json = {
  '1': 'DeleteTaskRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVUYXNrUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use deleteTaskResponseDescriptor instead')
const DeleteTaskResponse$json = {
  '1': 'DeleteTaskResponse',
};

/// Descriptor for `DeleteTaskResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVUYXNrUmVzcG9uc2U=');

@$core.Deprecated('Use updateTaskStatusRequestDescriptor instead')
const UpdateTaskStatusRequest$json = {
  '1': 'UpdateTaskStatusRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.moat.v1.TaskStatus', '10': 'status'},
    {'1': 'resolution_type', '3': 3, '4': 1, '5': 14, '6': '.moat.v1.ResolutionType', '9': 0, '10': 'resolutionType', '17': true},
    {'1': 'notes', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
    {'1': 'attachment_ids', '3': 5, '4': 3, '5': 9, '10': 'attachmentIds'},
  ],
  '8': [
    {'1': '_resolution_type'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `UpdateTaskStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTaskStatusRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVUYXNrU3RhdHVzUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSKwoGc3RhdHVzGAIgAS'
    'gOMhMubW9hdC52MS5UYXNrU3RhdHVzUgZzdGF0dXMSRQoPcmVzb2x1dGlvbl90eXBlGAMgASgO'
    'MhcubW9hdC52MS5SZXNvbHV0aW9uVHlwZUgAUg5yZXNvbHV0aW9uVHlwZYgBARIZCgVub3Rlcx'
    'gEIAEoCUgBUgVub3Rlc4gBARIlCg5hdHRhY2htZW50X2lkcxgFIAMoCVINYXR0YWNobWVudElk'
    'c0ISChBfcmVzb2x1dGlvbl90eXBlQggKBl9ub3Rlcw==');

@$core.Deprecated('Use claimTaskRequestDescriptor instead')
const ClaimTaskRequest$json = {
  '1': 'ClaimTaskRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `ClaimTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimTaskRequestDescriptor = $convert.base64Decode(
    'ChBDbGFpbVRhc2tSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use listTasksRequestDescriptor instead')
const ListTasksRequest$json = {
  '1': 'ListTasksRequest',
  '2': [
    {'1': 'asset_ids', '3': 1, '4': 3, '5': 9, '10': 'assetIds'},
    {'1': 'task_def_ids', '3': 2, '4': 3, '5': 9, '10': 'taskDefIds'},
    {'1': 'statuses', '3': 3, '4': 3, '5': 14, '6': '.moat.v1.TaskStatus', '10': 'statuses'},
    {'1': 'assignee_ids', '3': 4, '4': 3, '5': 9, '10': 'assigneeIds'},
    {'1': 'assigned_by_ids', '3': 5, '4': 3, '5': 9, '10': 'assignedByIds'},
    {'1': 'requested_by_ids', '3': 6, '4': 3, '5': 9, '10': 'requestedByIds'},
    {'1': 'location_ids', '3': 7, '4': 3, '5': 9, '10': 'locationIds'},
    {'1': 'task_types', '3': 8, '4': 3, '5': 14, '6': '.moat.v1.TaskType', '10': 'taskTypes'},
    {'1': 'search', '3': 9, '4': 1, '5': 9, '9': 0, '10': 'search', '17': true},
    {'1': 'from_date', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'fromDate', '17': true},
    {'1': 'to_date', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'toDate', '17': true},
    {'1': 'is_overdue', '3': 12, '4': 1, '5': 8, '9': 3, '10': 'isOverdue', '17': true},
    {'1': 'filter_unassigned', '3': 13, '4': 1, '5': 8, '9': 4, '10': 'filterUnassigned', '17': true},
    {'1': 'sort_by', '3': 14, '4': 1, '5': 9, '9': 5, '10': 'sortBy', '17': true},
    {'1': 'sort_order', '3': 15, '4': 1, '5': 9, '9': 6, '10': 'sortOrder', '17': true},
    {'1': 'limit', '3': 16, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 17, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'scheduled_date_from', '3': 18, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 7, '10': 'scheduledDateFrom', '17': true},
    {'1': 'scheduled_date_to', '3': 19, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 8, '10': 'scheduledDateTo', '17': true},
    {'1': 'due_date_from', '3': 20, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 9, '10': 'dueDateFrom', '17': true},
    {'1': 'due_date_to', '3': 21, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 10, '10': 'dueDateTo', '17': true},
    {'1': 'filter_no_assigner', '3': 22, '4': 1, '5': 8, '9': 11, '10': 'filterNoAssigner', '17': true},
    {'1': 'filter_no_requester', '3': 23, '4': 1, '5': 8, '9': 12, '10': 'filterNoRequester', '17': true},
  ],
  '8': [
    {'1': '_search'},
    {'1': '_from_date'},
    {'1': '_to_date'},
    {'1': '_is_overdue'},
    {'1': '_filter_unassigned'},
    {'1': '_sort_by'},
    {'1': '_sort_order'},
    {'1': '_scheduled_date_from'},
    {'1': '_scheduled_date_to'},
    {'1': '_due_date_from'},
    {'1': '_due_date_to'},
    {'1': '_filter_no_assigner'},
    {'1': '_filter_no_requester'},
  ],
};

/// Descriptor for `ListTasksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VGFza3NSZXF1ZXN0EhsKCWFzc2V0X2lkcxgBIAMoCVIIYXNzZXRJZHMSIAoMdGFza1'
    '9kZWZfaWRzGAIgAygJUgp0YXNrRGVmSWRzEi8KCHN0YXR1c2VzGAMgAygOMhMubW9hdC52MS5U'
    'YXNrU3RhdHVzUghzdGF0dXNlcxIhCgxhc3NpZ25lZV9pZHMYBCADKAlSC2Fzc2lnbmVlSWRzEi'
    'YKD2Fzc2lnbmVkX2J5X2lkcxgFIAMoCVINYXNzaWduZWRCeUlkcxIoChByZXF1ZXN0ZWRfYnlf'
    'aWRzGAYgAygJUg5yZXF1ZXN0ZWRCeUlkcxIhCgxsb2NhdGlvbl9pZHMYByADKAlSC2xvY2F0aW'
    '9uSWRzEjAKCnRhc2tfdHlwZXMYCCADKA4yES5tb2F0LnYxLlRhc2tUeXBlUgl0YXNrVHlwZXMS'
    'GwoGc2VhcmNoGAkgASgJSABSBnNlYXJjaIgBARI8Cglmcm9tX2RhdGUYCiABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wSAFSCGZyb21EYXRliAEBEjgKB3RvX2RhdGUYCyABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wSAJSBnRvRGF0ZYgBARIiCgppc19vdmVyZHVlGAwgAS'
    'gISANSCWlzT3ZlcmR1ZYgBARIwChFmaWx0ZXJfdW5hc3NpZ25lZBgNIAEoCEgEUhBmaWx0ZXJV'
    'bmFzc2lnbmVkiAEBEhwKB3NvcnRfYnkYDiABKAlIBVIGc29ydEJ5iAEBEiIKCnNvcnRfb3JkZX'
    'IYDyABKAlIBlIJc29ydE9yZGVyiAEBEhQKBWxpbWl0GBAgASgFUgVsaW1pdBIWCgZvZmZzZXQY'
    'ESABKAVSBm9mZnNldBJPChNzY2hlZHVsZWRfZGF0ZV9mcm9tGBIgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcEgHUhFzY2hlZHVsZWREYXRlRnJvbYgBARJLChFzY2hlZHVsZWRfZGF0'
    'ZV90bxgTIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBICFIPc2NoZWR1bGVkRGF0ZV'
    'RviAEBEkMKDWR1ZV9kYXRlX2Zyb20YFCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1w'
    'SAlSC2R1ZURhdGVGcm9tiAEBEj8KC2R1ZV9kYXRlX3RvGBUgASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcEgKUglkdWVEYXRlVG+IAQESMQoSZmlsdGVyX25vX2Fzc2lnbmVyGBYgASgI'
    'SAtSEGZpbHRlck5vQXNzaWduZXKIAQESMwoTZmlsdGVyX25vX3JlcXVlc3RlchgXIAEoCEgMUh'
    'FmaWx0ZXJOb1JlcXVlc3RlcogBAUIJCgdfc2VhcmNoQgwKCl9mcm9tX2RhdGVCCgoIX3RvX2Rh'
    'dGVCDQoLX2lzX292ZXJkdWVCFAoSX2ZpbHRlcl91bmFzc2lnbmVkQgoKCF9zb3J0X2J5Qg0KC1'
    '9zb3J0X29yZGVyQhYKFF9zY2hlZHVsZWRfZGF0ZV9mcm9tQhQKEl9zY2hlZHVsZWRfZGF0ZV90'
    'b0IQCg5fZHVlX2RhdGVfZnJvbUIOCgxfZHVlX2RhdGVfdG9CFQoTX2ZpbHRlcl9ub19hc3NpZ2'
    '5lckIWChRfZmlsdGVyX25vX3JlcXVlc3Rlcg==');

@$core.Deprecated('Use listTasksResponseDescriptor instead')
const ListTasksResponse$json = {
  '1': 'ListTasksResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.TaskWithDetails', '10': 'items'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
    {'1': 'page', '3': 3, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 4, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'total_pages', '3': 5, '4': 1, '5': 5, '10': 'totalPages'},
    {'1': 'avg_time_to_close_hours', '3': 6, '4': 1, '5': 1, '9': 0, '10': 'avgTimeToCloseHours', '17': true},
    {'1': 'avg_response_time_hours', '3': 7, '4': 1, '5': 1, '9': 1, '10': 'avgResponseTimeHours', '17': true},
    {'1': 'avg_time_to_close_last_month_hours', '3': 8, '4': 1, '5': 1, '9': 2, '10': 'avgTimeToCloseLastMonthHours', '17': true},
    {'1': 'avg_response_time_last_month_hours', '3': 9, '4': 1, '5': 1, '9': 3, '10': 'avgResponseTimeLastMonthHours', '17': true},
    {'1': 'total_tickets_last_month', '3': 10, '4': 1, '5': 5, '9': 4, '10': 'totalTicketsLastMonth', '17': true},
    {'1': 'weekly_time_to_close', '3': 11, '4': 3, '5': 11, '6': '.moat.v1.WeeklyMetricDataPoint', '10': 'weeklyTimeToClose'},
    {'1': 'weekly_response_time', '3': 12, '4': 3, '5': 11, '6': '.moat.v1.WeeklyMetricDataPoint', '10': 'weeklyResponseTime'},
    {'1': 'weekly_open_tickets', '3': 13, '4': 3, '5': 11, '6': '.moat.v1.WeeklyCountDataPoint', '10': 'weeklyOpenTickets'},
  ],
  '8': [
    {'1': '_avg_time_to_close_hours'},
    {'1': '_avg_response_time_hours'},
    {'1': '_avg_time_to_close_last_month_hours'},
    {'1': '_avg_response_time_last_month_hours'},
    {'1': '_total_tickets_last_month'},
  ],
};

/// Descriptor for `ListTasksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0VGFza3NSZXNwb25zZRIuCgVpdGVtcxgBIAMoCzIYLm1vYXQudjEuVGFza1dpdGhEZX'
    'RhaWxzUgVpdGVtcxIUCgV0b3RhbBgCIAEoBVIFdG90YWwSEgoEcGFnZRgDIAEoBVIEcGFnZRIb'
    'CglwYWdlX3NpemUYBCABKAVSCHBhZ2VTaXplEh8KC3RvdGFsX3BhZ2VzGAUgASgFUgp0b3RhbF'
    'BhZ2VzEjkKF2F2Z190aW1lX3RvX2Nsb3NlX2hvdXJzGAYgASgBSABSE2F2Z1RpbWVUb0Nsb3Nl'
    'SG91cnOIAQESOgoXYXZnX3Jlc3BvbnNlX3RpbWVfaG91cnMYByABKAFIAVIUYXZnUmVzcG9uc2'
    'VUaW1lSG91cnOIAQESTQoiYXZnX3RpbWVfdG9fY2xvc2VfbGFzdF9tb250aF9ob3VycxgIIAEo'
    'AUgCUhxhdmdUaW1lVG9DbG9zZUxhc3RNb250aEhvdXJziAEBEk4KImF2Z19yZXNwb25zZV90aW'
    '1lX2xhc3RfbW9udGhfaG91cnMYCSABKAFIA1IdYXZnUmVzcG9uc2VUaW1lTGFzdE1vbnRoSG91'
    'cnOIAQESPAoYdG90YWxfdGlja2V0c19sYXN0X21vbnRoGAogASgFSARSFXRvdGFsVGlja2V0c0'
    'xhc3RNb250aIgBARJPChR3ZWVrbHlfdGltZV90b19jbG9zZRgLIAMoCzIeLm1vYXQudjEuV2Vl'
    'a2x5TWV0cmljRGF0YVBvaW50UhF3ZWVrbHlUaW1lVG9DbG9zZRJQChR3ZWVrbHlfcmVzcG9uc2'
    'VfdGltZRgMIAMoCzIeLm1vYXQudjEuV2Vla2x5TWV0cmljRGF0YVBvaW50UhJ3ZWVrbHlSZXNw'
    'b25zZVRpbWUSTQoTd2Vla2x5X29wZW5fdGlja2V0cxgNIAMoCzIdLm1vYXQudjEuV2Vla2x5Q2'
    '91bnREYXRhUG9pbnRSEXdlZWtseU9wZW5UaWNrZXRzQhoKGF9hdmdfdGltZV90b19jbG9zZV9o'
    'b3Vyc0IaChhfYXZnX3Jlc3BvbnNlX3RpbWVfaG91cnNCJQojX2F2Z190aW1lX3RvX2Nsb3NlX2'
    'xhc3RfbW9udGhfaG91cnNCJQojX2F2Z19yZXNwb25zZV90aW1lX2xhc3RfbW9udGhfaG91cnNC'
    'GwoZX3RvdGFsX3RpY2tldHNfbGFzdF9tb250aA==');

@$core.Deprecated('Use weeklyMetricDataPointDescriptor instead')
const WeeklyMetricDataPoint$json = {
  '1': 'WeeklyMetricDataPoint',
  '2': [
    {'1': 'week_start', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'weekStart'},
    {'1': 'average_hours', '3': 2, '4': 1, '5': 1, '10': 'averageHours'},
    {'1': 'task_count', '3': 3, '4': 1, '5': 5, '10': 'taskCount'},
  ],
};

/// Descriptor for `WeeklyMetricDataPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List weeklyMetricDataPointDescriptor = $convert.base64Decode(
    'ChVXZWVrbHlNZXRyaWNEYXRhUG9pbnQSOQoKd2Vla19zdGFydBgBIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSCXdlZWtTdGFydBIjCg1hdmVyYWdlX2hvdXJzGAIgASgBUgxhdmVy'
    'YWdlSG91cnMSHQoKdGFza19jb3VudBgDIAEoBVIJdGFza0NvdW50');

@$core.Deprecated('Use weeklyCountDataPointDescriptor instead')
const WeeklyCountDataPoint$json = {
  '1': 'WeeklyCountDataPoint',
  '2': [
    {'1': 'week_start', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'weekStart'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `WeeklyCountDataPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List weeklyCountDataPointDescriptor = $convert.base64Decode(
    'ChRXZWVrbHlDb3VudERhdGFQb2ludBI5Cgp3ZWVrX3N0YXJ0GAEgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJd2Vla1N0YXJ0EhQKBWNvdW50GAIgASgFUgVjb3VudA==');

@$core.Deprecated('Use taskCommentDescriptor instead')
const TaskComment$json = {
  '1': 'TaskComment',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'task_id', '3': 2, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'mentioned_members', '3': 4, '4': 3, '5': 11, '6': '.moat.v1.MentionedMember', '10': 'mentionedMembers'},
    {'1': 'created_by', '3': 5, '4': 1, '5': 11, '6': '.moat.v1.CommentAuthor', '9': 0, '10': 'createdBy', '17': true},
    {'1': 'attachments', '3': 6, '4': 3, '5': 11, '6': '.moat.v1.TaskAttachment', '10': 'attachments'},
    {'1': 'edit_history', '3': 7, '4': 3, '5': 11, '6': '.moat.v1.CommentEditHistory', '10': 'editHistory'},
    {'1': 'edited', '3': 8, '4': 1, '5': 8, '10': 'edited'},
    {'1': 'edited_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'editedAt', '17': true},
    {'1': 'created_at', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '8': [
    {'1': '_created_by'},
    {'1': '_edited_at'},
  ],
};

/// Descriptor for `TaskComment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskCommentDescriptor = $convert.base64Decode(
    'CgtUYXNrQ29tbWVudBIOCgJpZBgBIAEoCVICaWQSFwoHdGFza19pZBgCIAEoCVIGdGFza0lkEh'
    'gKB2NvbnRlbnQYAyABKAlSB2NvbnRlbnQSRQoRbWVudGlvbmVkX21lbWJlcnMYBCADKAsyGC5t'
    'b2F0LnYxLk1lbnRpb25lZE1lbWJlclIQbWVudGlvbmVkTWVtYmVycxI6CgpjcmVhdGVkX2J5GA'
    'UgASgLMhYubW9hdC52MS5Db21tZW50QXV0aG9ySABSCWNyZWF0ZWRCeYgBARI5CgthdHRhY2ht'
    'ZW50cxgGIAMoCzIXLm1vYXQudjEuVGFza0F0dGFjaG1lbnRSC2F0dGFjaG1lbnRzEj4KDGVkaX'
    'RfaGlzdG9yeRgHIAMoCzIbLm1vYXQudjEuQ29tbWVudEVkaXRIaXN0b3J5UgtlZGl0SGlzdG9y'
    'eRIWCgZlZGl0ZWQYCCABKAhSBmVkaXRlZBI8CgllZGl0ZWRfYXQYCSABKAsyGi5nb29nbGUucH'
    'JvdG9idWYuVGltZXN0YW1wSAFSCGVkaXRlZEF0iAEBEjkKCmNyZWF0ZWRfYXQYCiABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgLIAEoCz'
    'IaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdEINCgtfY3JlYXRlZF9ieUIM'
    'CgpfZWRpdGVkX2F0');

@$core.Deprecated('Use mentionedMemberDescriptor instead')
const MentionedMember$json = {
  '1': 'MentionedMember',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `MentionedMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mentionedMemberDescriptor = $convert.base64Decode(
    'Cg9NZW50aW9uZWRNZW1iZXISDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFA'
    'oFZW1haWwYAyABKAlSBWVtYWls');

@$core.Deprecated('Use commentAuthorDescriptor instead')
const CommentAuthor$json = {
  '1': 'CommentAuthor',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `CommentAuthor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentAuthorDescriptor = $convert.base64Decode(
    'Cg1Db21tZW50QXV0aG9yEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBW'
    'VtYWlsGAMgASgJUgVlbWFpbA==');

@$core.Deprecated('Use commentEditHistoryDescriptor instead')
const CommentEditHistory$json = {
  '1': 'CommentEditHistory',
  '2': [
    {'1': 'previous_content', '3': 1, '4': 1, '5': 9, '10': 'previousContent'},
    {'1': 'edited_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'editedAt'},
    {'1': 'edited_by_id', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'editedById', '17': true},
    {'1': 'edited_by_name', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'editedByName', '17': true},
  ],
  '8': [
    {'1': '_edited_by_id'},
    {'1': '_edited_by_name'},
  ],
};

/// Descriptor for `CommentEditHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentEditHistoryDescriptor = $convert.base64Decode(
    'ChJDb21tZW50RWRpdEhpc3RvcnkSKQoQcHJldmlvdXNfY29udGVudBgBIAEoCVIPcHJldmlvdX'
    'NDb250ZW50EjcKCWVkaXRlZF9hdBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBS'
    'CGVkaXRlZEF0EiUKDGVkaXRlZF9ieV9pZBgDIAEoCUgAUgplZGl0ZWRCeUlkiAEBEikKDmVkaX'
    'RlZF9ieV9uYW1lGAQgASgJSAFSDGVkaXRlZEJ5TmFtZYgBAUIPCg1fZWRpdGVkX2J5X2lkQhEK'
    'D19lZGl0ZWRfYnlfbmFtZQ==');

@$core.Deprecated('Use taskAttachmentDescriptor instead')
const TaskAttachment$json = {
  '1': 'TaskAttachment',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 3, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'size_bytes', '3': 4, '4': 1, '5': 3, '10': 'sizeBytes'},
    {'1': 'url', '3': 5, '4': 1, '5': 9, '10': 'url'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `TaskAttachment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskAttachmentDescriptor = $convert.base64Decode(
    'Cg5UYXNrQXR0YWNobWVudBIOCgJpZBgBIAEoCVICaWQSGwoJZmlsZV9uYW1lGAIgASgJUghmaW'
    'xlTmFtZRIhCgxjb250ZW50X3R5cGUYAyABKAlSC2NvbnRlbnRUeXBlEh0KCnNpemVfYnl0ZXMY'
    'BCABKANSCXNpemVCeXRlcxIQCgN1cmwYBSABKAlSA3VybBI5CgpjcmVhdGVkX2F0GAYgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0');

@$core.Deprecated('Use getAttachmentUploadUrlRequestDescriptor instead')
const GetAttachmentUploadUrlRequest$json = {
  '1': 'GetAttachmentUploadUrlRequest',
  '2': [
    {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 3, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'size_bytes', '3': 4, '4': 1, '5': 3, '10': 'sizeBytes'},
  ],
};

/// Descriptor for `GetAttachmentUploadUrlRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAttachmentUploadUrlRequestDescriptor = $convert.base64Decode(
    'Ch1HZXRBdHRhY2htZW50VXBsb2FkVXJsUmVxdWVzdBIXCgd0YXNrX2lkGAEgASgJUgZ0YXNrSW'
    'QSGwoJZmlsZV9uYW1lGAIgASgJUghmaWxlTmFtZRIhCgxjb250ZW50X3R5cGUYAyABKAlSC2Nv'
    'bnRlbnRUeXBlEh0KCnNpemVfYnl0ZXMYBCABKANSCXNpemVCeXRlcw==');

@$core.Deprecated('Use getAttachmentUploadUrlResponseDescriptor instead')
const GetAttachmentUploadUrlResponse$json = {
  '1': 'GetAttachmentUploadUrlResponse',
  '2': [
    {'1': 'upload_url', '3': 1, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'attachment_id', '3': 2, '4': 1, '5': 9, '10': 'attachmentId'},
    {'1': 'expires_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
  ],
};

/// Descriptor for `GetAttachmentUploadUrlResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAttachmentUploadUrlResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRBdHRhY2htZW50VXBsb2FkVXJsUmVzcG9uc2USHQoKdXBsb2FkX3VybBgBIAEoCVIJdX'
    'Bsb2FkVXJsEiMKDWF0dGFjaG1lbnRfaWQYAiABKAlSDGF0dGFjaG1lbnRJZBI5CgpleHBpcmVz'
    'X2F0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJZXhwaXJlc0F0');

@$core.Deprecated('Use confirmAttachmentUploadRequestDescriptor instead')
const ConfirmAttachmentUploadRequest$json = {
  '1': 'ConfirmAttachmentUploadRequest',
  '2': [
    {'1': 'attachment_id', '3': 1, '4': 1, '5': 9, '10': 'attachmentId'},
    {'1': 'task_id', '3': 2, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'comment_id', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'commentId', '17': true},
  ],
  '8': [
    {'1': '_comment_id'},
  ],
};

/// Descriptor for `ConfirmAttachmentUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmAttachmentUploadRequestDescriptor = $convert.base64Decode(
    'Ch5Db25maXJtQXR0YWNobWVudFVwbG9hZFJlcXVlc3QSIwoNYXR0YWNobWVudF9pZBgBIAEoCV'
    'IMYXR0YWNobWVudElkEhcKB3Rhc2tfaWQYAiABKAlSBnRhc2tJZBIiCgpjb21tZW50X2lkGAMg'
    'ASgJSABSCWNvbW1lbnRJZIgBAUINCgtfY29tbWVudF9pZA==');

@$core.Deprecated('Use listTaskAttachmentsRequestDescriptor instead')
const ListTaskAttachmentsRequest$json = {
  '1': 'ListTaskAttachmentsRequest',
  '2': [
    {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
  ],
};

/// Descriptor for `ListTaskAttachmentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTaskAttachmentsRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0VGFza0F0dGFjaG1lbnRzUmVxdWVzdBIXCgd0YXNrX2lkGAEgASgJUgZ0YXNrSWQ=');

@$core.Deprecated('Use listTaskAttachmentsResponseDescriptor instead')
const ListTaskAttachmentsResponse$json = {
  '1': 'ListTaskAttachmentsResponse',
  '2': [
    {'1': 'attachments', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.TaskAttachment', '10': 'attachments'},
  ],
};

/// Descriptor for `ListTaskAttachmentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTaskAttachmentsResponseDescriptor = $convert.base64Decode(
    'ChtMaXN0VGFza0F0dGFjaG1lbnRzUmVzcG9uc2USOQoLYXR0YWNobWVudHMYASADKAsyFy5tb2'
    'F0LnYxLlRhc2tBdHRhY2htZW50UgthdHRhY2htZW50cw==');

@$core.Deprecated('Use deleteAttachmentRequestDescriptor instead')
const DeleteAttachmentRequest$json = {
  '1': 'DeleteAttachmentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteAttachmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAttachmentRequestDescriptor = $convert.base64Decode(
    'ChdEZWxldGVBdHRhY2htZW50UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use deleteAttachmentResponseDescriptor instead')
const DeleteAttachmentResponse$json = {
  '1': 'DeleteAttachmentResponse',
};

/// Descriptor for `DeleteAttachmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAttachmentResponseDescriptor = $convert.base64Decode(
    'ChhEZWxldGVBdHRhY2htZW50UmVzcG9uc2U=');

@$core.Deprecated('Use updateAttachmentRequestDescriptor instead')
const UpdateAttachmentRequest$json = {
  '1': 'UpdateAttachmentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'caption', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'caption', '17': true},
    {'1': 'display_order', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'displayOrder', '17': true},
  ],
  '8': [
    {'1': '_caption'},
    {'1': '_display_order'},
  ],
};

/// Descriptor for `UpdateAttachmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAttachmentRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVBdHRhY2htZW50UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSHQoHY2FwdGlvbhgCIA'
    'EoCUgAUgdjYXB0aW9uiAEBEigKDWRpc3BsYXlfb3JkZXIYAyABKAVIAVIMZGlzcGxheU9yZGVy'
    'iAEBQgoKCF9jYXB0aW9uQhAKDl9kaXNwbGF5X29yZGVy');

@$core.Deprecated('Use getTaskDefAttachmentUploadUrlRequestDescriptor instead')
const GetTaskDefAttachmentUploadUrlRequest$json = {
  '1': 'GetTaskDefAttachmentUploadUrlRequest',
  '2': [
    {'1': 'task_def_id', '3': 1, '4': 1, '5': 9, '10': 'taskDefId'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 3, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'size_bytes', '3': 4, '4': 1, '5': 3, '10': 'sizeBytes'},
  ],
};

/// Descriptor for `GetTaskDefAttachmentUploadUrlRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskDefAttachmentUploadUrlRequestDescriptor = $convert.base64Decode(
    'CiRHZXRUYXNrRGVmQXR0YWNobWVudFVwbG9hZFVybFJlcXVlc3QSHgoLdGFza19kZWZfaWQYAS'
    'ABKAlSCXRhc2tEZWZJZBIbCglmaWxlX25hbWUYAiABKAlSCGZpbGVOYW1lEiEKDGNvbnRlbnRf'
    'dHlwZRgDIAEoCVILY29udGVudFR5cGUSHQoKc2l6ZV9ieXRlcxgEIAEoA1IJc2l6ZUJ5dGVz');

@$core.Deprecated('Use confirmTaskDefAttachmentUploadRequestDescriptor instead')
const ConfirmTaskDefAttachmentUploadRequest$json = {
  '1': 'ConfirmTaskDefAttachmentUploadRequest',
  '2': [
    {'1': 'attachment_id', '3': 1, '4': 1, '5': 9, '10': 'attachmentId'},
    {'1': 'task_def_id', '3': 2, '4': 1, '5': 9, '10': 'taskDefId'},
  ],
};

/// Descriptor for `ConfirmTaskDefAttachmentUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmTaskDefAttachmentUploadRequestDescriptor = $convert.base64Decode(
    'CiVDb25maXJtVGFza0RlZkF0dGFjaG1lbnRVcGxvYWRSZXF1ZXN0EiMKDWF0dGFjaG1lbnRfaW'
    'QYASABKAlSDGF0dGFjaG1lbnRJZBIeCgt0YXNrX2RlZl9pZBgCIAEoCVIJdGFza0RlZklk');

@$core.Deprecated('Use listTaskDefAttachmentsRequestDescriptor instead')
const ListTaskDefAttachmentsRequest$json = {
  '1': 'ListTaskDefAttachmentsRequest',
  '2': [
    {'1': 'task_def_id', '3': 1, '4': 1, '5': 9, '10': 'taskDefId'},
  ],
};

/// Descriptor for `ListTaskDefAttachmentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTaskDefAttachmentsRequestDescriptor = $convert.base64Decode(
    'Ch1MaXN0VGFza0RlZkF0dGFjaG1lbnRzUmVxdWVzdBIeCgt0YXNrX2RlZl9pZBgBIAEoCVIJdG'
    'Fza0RlZklk');

@$core.Deprecated('Use deleteTaskDefAttachmentRequestDescriptor instead')
const DeleteTaskDefAttachmentRequest$json = {
  '1': 'DeleteTaskDefAttachmentRequest',
  '2': [
    {'1': 'task_def_id', '3': 1, '4': 1, '5': 9, '10': 'taskDefId'},
    {'1': 'attachment_id', '3': 2, '4': 1, '5': 9, '10': 'attachmentId'},
  ],
};

/// Descriptor for `DeleteTaskDefAttachmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskDefAttachmentRequestDescriptor = $convert.base64Decode(
    'Ch5EZWxldGVUYXNrRGVmQXR0YWNobWVudFJlcXVlc3QSHgoLdGFza19kZWZfaWQYASABKAlSCX'
    'Rhc2tEZWZJZBIjCg1hdHRhY2htZW50X2lkGAIgASgJUgxhdHRhY2htZW50SWQ=');

@$core.Deprecated('Use createCommentRequestDescriptor instead')
const CreateCommentRequest$json = {
  '1': 'CreateCommentRequest',
  '2': [
    {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'mentioned_member_ids', '3': 3, '4': 3, '5': 9, '10': 'mentionedMemberIds'},
    {'1': 'attachment_ids', '3': 4, '4': 3, '5': 9, '10': 'attachmentIds'},
  ],
};

/// Descriptor for `CreateCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCommentRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVDb21tZW50UmVxdWVzdBIXCgd0YXNrX2lkGAEgASgJUgZ0YXNrSWQSGAoHY29udG'
    'VudBgCIAEoCVIHY29udGVudBIwChRtZW50aW9uZWRfbWVtYmVyX2lkcxgDIAMoCVISbWVudGlv'
    'bmVkTWVtYmVySWRzEiUKDmF0dGFjaG1lbnRfaWRzGAQgAygJUg1hdHRhY2htZW50SWRz');

@$core.Deprecated('Use updateCommentRequestDescriptor instead')
const UpdateCommentRequest$json = {
  '1': 'UpdateCommentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'mentioned_member_ids', '3': 3, '4': 3, '5': 9, '10': 'mentionedMemberIds'},
  ],
};

/// Descriptor for `UpdateCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCommentRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDb21tZW50UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSGAoHY29udGVudBgCIAEoCV'
    'IHY29udGVudBIwChRtZW50aW9uZWRfbWVtYmVyX2lkcxgDIAMoCVISbWVudGlvbmVkTWVtYmVy'
    'SWRz');

@$core.Deprecated('Use deleteCommentRequestDescriptor instead')
const DeleteCommentRequest$json = {
  '1': 'DeleteCommentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVDb21tZW50UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use deleteCommentResponseDescriptor instead')
const DeleteCommentResponse$json = {
  '1': 'DeleteCommentResponse',
};

/// Descriptor for `DeleteCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVDb21tZW50UmVzcG9uc2U=');

@$core.Deprecated('Use listCommentsRequestDescriptor instead')
const ListCommentsRequest$json = {
  '1': 'ListCommentsRequest',
  '2': [
    {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ListCommentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCommentsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0Q29tbWVudHNSZXF1ZXN0EhcKB3Rhc2tfaWQYASABKAlSBnRhc2tJZBIUCgVsaW1pdB'
    'gCIAEoBVIFbGltaXQSFgoGb2Zmc2V0GAMgASgFUgZvZmZzZXQ=');

@$core.Deprecated('Use listCommentsResponseDescriptor instead')
const ListCommentsResponse$json = {
  '1': 'ListCommentsResponse',
  '2': [
    {'1': 'comments', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.TaskComment', '10': 'comments'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListCommentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCommentsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0Q29tbWVudHNSZXNwb25zZRIwCghjb21tZW50cxgBIAMoCzIULm1vYXQudjEuVGFza0'
    'NvbW1lbnRSCGNvbW1lbnRzEhQKBXRvdGFsGAIgASgFUgV0b3RhbA==');

@$core.Deprecated('Use taskActivityDescriptor instead')
const TaskActivity$json = {
  '1': 'TaskActivity',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'task_id', '3': 2, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'event_type', '3': 3, '4': 1, '5': 9, '10': 'eventType'},
    {'1': 'changed_by', '3': 4, '4': 1, '5': 11, '6': '.moat.v1.CommentAuthor', '9': 0, '10': 'changedBy', '17': true},
    {'1': 'notes', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
    {'1': 'changes', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 2, '10': 'changes', '17': true},
    {'1': 'attachments', '3': 7, '4': 3, '5': 11, '6': '.moat.v1.TaskAttachment', '10': 'attachments'},
    {'1': 'comment', '3': 8, '4': 1, '5': 11, '6': '.moat.v1.TaskComment', '9': 3, '10': 'comment', '17': true},
    {'1': 'created_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
  '8': [
    {'1': '_changed_by'},
    {'1': '_notes'},
    {'1': '_changes'},
    {'1': '_comment'},
  ],
};

/// Descriptor for `TaskActivity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskActivityDescriptor = $convert.base64Decode(
    'CgxUYXNrQWN0aXZpdHkSDgoCaWQYASABKAlSAmlkEhcKB3Rhc2tfaWQYAiABKAlSBnRhc2tJZB'
    'IdCgpldmVudF90eXBlGAMgASgJUglldmVudFR5cGUSOgoKY2hhbmdlZF9ieRgEIAEoCzIWLm1v'
    'YXQudjEuQ29tbWVudEF1dGhvckgAUgljaGFuZ2VkQnmIAQESGQoFbm90ZXMYBSABKAlIAVIFbm'
    '90ZXOIAQESNgoHY2hhbmdlcxgGIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RIAlIHY2hh'
    'bmdlc4gBARI5CgthdHRhY2htZW50cxgHIAMoCzIXLm1vYXQudjEuVGFza0F0dGFjaG1lbnRSC2'
    'F0dGFjaG1lbnRzEjMKB2NvbW1lbnQYCCABKAsyFC5tb2F0LnYxLlRhc2tDb21tZW50SANSB2Nv'
    'bW1lbnSIAQESOQoKY3JlYXRlZF9hdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbX'
    'BSCWNyZWF0ZWRBdEINCgtfY2hhbmdlZF9ieUIICgZfbm90ZXNCCgoIX2NoYW5nZXNCCgoIX2Nv'
    'bW1lbnQ=');

@$core.Deprecated('Use getTaskActivityRequestDescriptor instead')
const GetTaskActivityRequest$json = {
  '1': 'GetTaskActivityRequest',
  '2': [
    {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetTaskActivityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskActivityRequestDescriptor = $convert.base64Decode(
    'ChZHZXRUYXNrQWN0aXZpdHlSZXF1ZXN0EhcKB3Rhc2tfaWQYASABKAlSBnRhc2tJZBIUCgVsaW'
    '1pdBgCIAEoBVIFbGltaXQSFgoGb2Zmc2V0GAMgASgFUgZvZmZzZXQ=');

@$core.Deprecated('Use getTaskActivityResponseDescriptor instead')
const GetTaskActivityResponse$json = {
  '1': 'GetTaskActivityResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.TaskActivity', '10': 'items'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `GetTaskActivityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskActivityResponseDescriptor = $convert.base64Decode(
    'ChdHZXRUYXNrQWN0aXZpdHlSZXNwb25zZRIrCgVpdGVtcxgBIAMoCzIVLm1vYXQudjEuVGFza0'
    'FjdGl2aXR5UgVpdGVtcxIUCgV0b3RhbBgCIAEoBVIFdG90YWw=');

@$core.Deprecated('Use assignmentRuleDescriptor instead')
const AssignmentRule$json = {
  '1': 'AssignmentRule',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'company_id', '3': 2, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'is_active', '3': 5, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'priority', '3': 6, '4': 1, '5': 5, '10': 'priority'},
    {'1': 'conditions', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'conditions'},
    {'1': 'assignment_type', '3': 8, '4': 1, '5': 14, '6': '.moat.v1.AssignmentTargetType', '10': 'assignmentType'},
    {'1': 'assignment_method', '3': 9, '4': 1, '5': 14, '6': '.moat.v1.AssignmentMethod', '10': 'assignmentMethod'},
    {'1': 'created_by', '3': 10, '4': 1, '5': 9, '9': 1, '10': 'createdBy', '17': true},
    {'1': 'created_at', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '8': [
    {'1': '_description'},
    {'1': '_created_by'},
  ],
};

/// Descriptor for `AssignmentRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignmentRuleDescriptor = $convert.base64Decode(
    'Cg5Bc3NpZ25tZW50UnVsZRIOCgJpZBgBIAEoCVICaWQSHQoKY29tcGFueV9pZBgCIAEoCVIJY2'
    '9tcGFueUlkEhIKBG5hbWUYAyABKAlSBG5hbWUSJQoLZGVzY3JpcHRpb24YBCABKAlIAFILZGVz'
    'Y3JpcHRpb26IAQESGwoJaXNfYWN0aXZlGAUgASgIUghpc0FjdGl2ZRIaCghwcmlvcml0eRgGIA'
    'EoBVIIcHJpb3JpdHkSNwoKY29uZGl0aW9ucxgHIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1'
    'Y3RSCmNvbmRpdGlvbnMSRgoPYXNzaWdubWVudF90eXBlGAggASgOMh0ubW9hdC52MS5Bc3NpZ2'
    '5tZW50VGFyZ2V0VHlwZVIOYXNzaWdubWVudFR5cGUSRgoRYXNzaWdubWVudF9tZXRob2QYCSAB'
    'KA4yGS5tb2F0LnYxLkFzc2lnbm1lbnRNZXRob2RSEGFzc2lnbm1lbnRNZXRob2QSIgoKY3JlYX'
    'RlZF9ieRgKIAEoCUgBUgljcmVhdGVkQnmIAQESOQoKY3JlYXRlZF9hdBgLIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAwgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0Qg4KDF9kZXNjcmlwdGlvbkINCgtf'
    'Y3JlYXRlZF9ieQ==');

@$core.Deprecated('Use createAssignmentRuleRequestDescriptor instead')
const CreateAssignmentRuleRequest$json = {
  '1': 'CreateAssignmentRuleRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'is_active', '3': 3, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'priority', '3': 4, '4': 1, '5': 5, '10': 'priority'},
    {'1': 'conditions', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'conditions'},
    {'1': 'assignment_type', '3': 6, '4': 1, '5': 14, '6': '.moat.v1.AssignmentTargetType', '10': 'assignmentType'},
    {'1': 'assignment_method', '3': 7, '4': 1, '5': 14, '6': '.moat.v1.AssignmentMethod', '10': 'assignmentMethod'},
  ],
  '8': [
    {'1': '_description'},
  ],
};

/// Descriptor for `CreateAssignmentRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAssignmentRuleRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVBc3NpZ25tZW50UnVsZVJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIlCgtkZX'
    'NjcmlwdGlvbhgCIAEoCUgAUgtkZXNjcmlwdGlvbogBARIbCglpc19hY3RpdmUYAyABKAhSCGlz'
    'QWN0aXZlEhoKCHByaW9yaXR5GAQgASgFUghwcmlvcml0eRI3Cgpjb25kaXRpb25zGAUgASgLMh'
    'cuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFIKY29uZGl0aW9ucxJGCg9hc3NpZ25tZW50X3R5cGUY'
    'BiABKA4yHS5tb2F0LnYxLkFzc2lnbm1lbnRUYXJnZXRUeXBlUg5hc3NpZ25tZW50VHlwZRJGCh'
    'Fhc3NpZ25tZW50X21ldGhvZBgHIAEoDjIZLm1vYXQudjEuQXNzaWdubWVudE1ldGhvZFIQYXNz'
    'aWdubWVudE1ldGhvZEIOCgxfZGVzY3JpcHRpb24=');

@$core.Deprecated('Use updateAssignmentRuleRequestDescriptor instead')
const UpdateAssignmentRuleRequest$json = {
  '1': 'UpdateAssignmentRuleRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    {'1': 'is_active', '3': 4, '4': 1, '5': 8, '9': 2, '10': 'isActive', '17': true},
    {'1': 'priority', '3': 5, '4': 1, '5': 5, '9': 3, '10': 'priority', '17': true},
    {'1': 'conditions', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 4, '10': 'conditions', '17': true},
    {'1': 'assignment_type', '3': 7, '4': 1, '5': 14, '6': '.moat.v1.AssignmentTargetType', '9': 5, '10': 'assignmentType', '17': true},
    {'1': 'assignment_method', '3': 8, '4': 1, '5': 14, '6': '.moat.v1.AssignmentMethod', '9': 6, '10': 'assignmentMethod', '17': true},
  ],
  '8': [
    {'1': '_name'},
    {'1': '_description'},
    {'1': '_is_active'},
    {'1': '_priority'},
    {'1': '_conditions'},
    {'1': '_assignment_type'},
    {'1': '_assignment_method'},
  ],
};

/// Descriptor for `UpdateAssignmentRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssignmentRuleRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVBc3NpZ25tZW50UnVsZVJlcXVlc3QSDgoCaWQYASABKAlSAmlkEhcKBG5hbWUYAi'
    'ABKAlIAFIEbmFtZYgBARIlCgtkZXNjcmlwdGlvbhgDIAEoCUgBUgtkZXNjcmlwdGlvbogBARIg'
    'Cglpc19hY3RpdmUYBCABKAhIAlIIaXNBY3RpdmWIAQESHwoIcHJpb3JpdHkYBSABKAVIA1IIcH'
    'Jpb3JpdHmIAQESPAoKY29uZGl0aW9ucxgGIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RI'
    'BFIKY29uZGl0aW9uc4gBARJLCg9hc3NpZ25tZW50X3R5cGUYByABKA4yHS5tb2F0LnYxLkFzc2'
    'lnbm1lbnRUYXJnZXRUeXBlSAVSDmFzc2lnbm1lbnRUeXBliAEBEksKEWFzc2lnbm1lbnRfbWV0'
    'aG9kGAggASgOMhkubW9hdC52MS5Bc3NpZ25tZW50TWV0aG9kSAZSEGFzc2lnbm1lbnRNZXRob2'
    'SIAQFCBwoFX25hbWVCDgoMX2Rlc2NyaXB0aW9uQgwKCl9pc19hY3RpdmVCCwoJX3ByaW9yaXR5'
    'Qg0KC19jb25kaXRpb25zQhIKEF9hc3NpZ25tZW50X3R5cGVCFAoSX2Fzc2lnbm1lbnRfbWV0aG'
    '9k');

@$core.Deprecated('Use deleteAssignmentRuleRequestDescriptor instead')
const DeleteAssignmentRuleRequest$json = {
  '1': 'DeleteAssignmentRuleRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteAssignmentRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAssignmentRuleRequestDescriptor = $convert.base64Decode(
    'ChtEZWxldGVBc3NpZ25tZW50UnVsZVJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use deleteAssignmentRuleResponseDescriptor instead')
const DeleteAssignmentRuleResponse$json = {
  '1': 'DeleteAssignmentRuleResponse',
};

/// Descriptor for `DeleteAssignmentRuleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAssignmentRuleResponseDescriptor = $convert.base64Decode(
    'ChxEZWxldGVBc3NpZ25tZW50UnVsZVJlc3BvbnNl');

@$core.Deprecated('Use listAssignmentRulesRequestDescriptor instead')
const ListAssignmentRulesRequest$json = {
  '1': 'ListAssignmentRulesRequest',
  '2': [
    {'1': 'is_active', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isActive', '17': true},
    {'1': 'assignment_type', '3': 2, '4': 1, '5': 14, '6': '.moat.v1.AssignmentTargetType', '9': 1, '10': 'assignmentType', '17': true},
  ],
  '8': [
    {'1': '_is_active'},
    {'1': '_assignment_type'},
  ],
};

/// Descriptor for `ListAssignmentRulesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssignmentRulesRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0QXNzaWdubWVudFJ1bGVzUmVxdWVzdBIgCglpc19hY3RpdmUYASABKAhIAFIIaXNBY3'
    'RpdmWIAQESSwoPYXNzaWdubWVudF90eXBlGAIgASgOMh0ubW9hdC52MS5Bc3NpZ25tZW50VGFy'
    'Z2V0VHlwZUgBUg5hc3NpZ25tZW50VHlwZYgBAUIMCgpfaXNfYWN0aXZlQhIKEF9hc3NpZ25tZW'
    '50X3R5cGU=');

@$core.Deprecated('Use listAssignmentRulesResponseDescriptor instead')
const ListAssignmentRulesResponse$json = {
  '1': 'ListAssignmentRulesResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssignmentRule', '10': 'items'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListAssignmentRulesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssignmentRulesResponseDescriptor = $convert.base64Decode(
    'ChtMaXN0QXNzaWdubWVudFJ1bGVzUmVzcG9uc2USLQoFaXRlbXMYASADKAsyFy5tb2F0LnYxLk'
    'Fzc2lnbm1lbnRSdWxlUgVpdGVtcxIUCgV0b3RhbBgCIAEoBVIFdG90YWw=');

@$core.Deprecated('Use assignableMemberDescriptor instead')
const AssignableMember$json = {
  '1': 'AssignableMember',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'avatar_url', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'avatarUrl', '17': true},
  ],
  '8': [
    {'1': '_avatar_url'},
  ],
};

/// Descriptor for `AssignableMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignableMemberDescriptor = $convert.base64Decode(
    'ChBBc3NpZ25hYmxlTWVtYmVyEg4KAmlkGAEgASgJUgJpZBIdCgpmaXJzdF9uYW1lGAIgASgJUg'
    'lmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAMgASgJUghsYXN0TmFtZRIUCgVlbWFpbBgEIAEoCVIF'
    'ZW1haWwSIgoKYXZhdGFyX3VybBgFIAEoCUgAUglhdmF0YXJVcmyIAQFCDQoLX2F2YXRhcl91cm'
    'w=');

@$core.Deprecated('Use getAssignableMembersRequestDescriptor instead')
const GetAssignableMembersRequest$json = {
  '1': 'GetAssignableMembersRequest',
  '2': [
    {'1': 'search', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'search', '17': true},
    {'1': 'location_id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'locationId', '17': true},
  ],
  '8': [
    {'1': '_search'},
    {'1': '_location_id'},
  ],
};

/// Descriptor for `GetAssignableMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssignableMembersRequestDescriptor = $convert.base64Decode(
    'ChtHZXRBc3NpZ25hYmxlTWVtYmVyc1JlcXVlc3QSGwoGc2VhcmNoGAEgASgJSABSBnNlYXJjaI'
    'gBARIkCgtsb2NhdGlvbl9pZBgCIAEoCUgBUgpsb2NhdGlvbklkiAEBQgkKB19zZWFyY2hCDgoM'
    'X2xvY2F0aW9uX2lk');

@$core.Deprecated('Use getAssignableMembersResponseDescriptor instead')
const GetAssignableMembersResponse$json = {
  '1': 'GetAssignableMembersResponse',
  '2': [
    {'1': 'members', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssignableMember', '10': 'members'},
  ],
};

/// Descriptor for `GetAssignableMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssignableMembersResponseDescriptor = $convert.base64Decode(
    'ChxHZXRBc3NpZ25hYmxlTWVtYmVyc1Jlc3BvbnNlEjMKB21lbWJlcnMYASADKAsyGS5tb2F0Ln'
    'YxLkFzc2lnbmFibGVNZW1iZXJSB21lbWJlcnM=');

@$core.Deprecated('Use assignableRoleDescriptor instead')
const AssignableRole$json = {
  '1': 'AssignableRole',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'member_count', '3': 4, '4': 1, '5': 5, '10': 'memberCount'},
  ],
  '8': [
    {'1': '_description'},
  ],
};

/// Descriptor for `AssignableRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignableRoleDescriptor = $convert.base64Decode(
    'Cg5Bc3NpZ25hYmxlUm9sZRIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIlCg'
    'tkZXNjcmlwdGlvbhgDIAEoCUgAUgtkZXNjcmlwdGlvbogBARIhCgxtZW1iZXJfY291bnQYBCAB'
    'KAVSC21lbWJlckNvdW50Qg4KDF9kZXNjcmlwdGlvbg==');

@$core.Deprecated('Use getAssignableRolesRequestDescriptor instead')
const GetAssignableRolesRequest$json = {
  '1': 'GetAssignableRolesRequest',
  '2': [
    {'1': 'location_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'locationId', '17': true},
  ],
  '8': [
    {'1': '_location_id'},
  ],
};

/// Descriptor for `GetAssignableRolesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssignableRolesRequestDescriptor = $convert.base64Decode(
    'ChlHZXRBc3NpZ25hYmxlUm9sZXNSZXF1ZXN0EiQKC2xvY2F0aW9uX2lkGAEgASgJSABSCmxvY2'
    'F0aW9uSWSIAQFCDgoMX2xvY2F0aW9uX2lk');

@$core.Deprecated('Use getAssignableRolesResponseDescriptor instead')
const GetAssignableRolesResponse$json = {
  '1': 'GetAssignableRolesResponse',
  '2': [
    {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssignableRole', '10': 'roles'},
  ],
};

/// Descriptor for `GetAssignableRolesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssignableRolesResponseDescriptor = $convert.base64Decode(
    'ChpHZXRBc3NpZ25hYmxlUm9sZXNSZXNwb25zZRItCgVyb2xlcxgBIAMoCzIXLm1vYXQudjEuQX'
    'NzaWduYWJsZVJvbGVSBXJvbGVz');

@$core.Deprecated('Use ticketLocationDescriptor instead')
const TicketLocation$json = {
  '1': 'TicketLocation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'address', '17': true},
  ],
  '8': [
    {'1': '_address'},
  ],
};

/// Descriptor for `TicketLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ticketLocationDescriptor = $convert.base64Decode(
    'Cg5UaWNrZXRMb2NhdGlvbhIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIdCg'
    'dhZGRyZXNzGAMgASgJSABSB2FkZHJlc3OIAQFCCgoIX2FkZHJlc3M=');

@$core.Deprecated('Use getTicketLocationsRequestDescriptor instead')
const GetTicketLocationsRequest$json = {
  '1': 'GetTicketLocationsRequest',
};

/// Descriptor for `GetTicketLocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTicketLocationsRequestDescriptor = $convert.base64Decode(
    'ChlHZXRUaWNrZXRMb2NhdGlvbnNSZXF1ZXN0');

@$core.Deprecated('Use getTicketLocationsResponseDescriptor instead')
const GetTicketLocationsResponse$json = {
  '1': 'GetTicketLocationsResponse',
  '2': [
    {'1': 'locations', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.TicketLocation', '10': 'locations'},
  ],
};

/// Descriptor for `GetTicketLocationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTicketLocationsResponseDescriptor = $convert.base64Decode(
    'ChpHZXRUaWNrZXRMb2NhdGlvbnNSZXNwb25zZRI1Cglsb2NhdGlvbnMYASADKAsyFy5tb2F0Ln'
    'YxLlRpY2tldExvY2F0aW9uUglsb2NhdGlvbnM=');

@$core.Deprecated('Use generateTaskTitleRequestDescriptor instead')
const GenerateTaskTitleRequest$json = {
  '1': 'GenerateTaskTitleRequest',
  '2': [
    {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    {'1': 'specific_location', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'specificLocation', '17': true},
  ],
  '8': [
    {'1': '_specific_location'},
  ],
};

/// Descriptor for `GenerateTaskTitleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateTaskTitleRequestDescriptor = $convert.base64Decode(
    'ChhHZW5lcmF0ZVRhc2tUaXRsZVJlcXVlc3QSIAoLZGVzY3JpcHRpb24YASABKAlSC2Rlc2NyaX'
    'B0aW9uEjAKEXNwZWNpZmljX2xvY2F0aW9uGAIgASgJSABSEHNwZWNpZmljTG9jYXRpb26IAQFC'
    'FAoSX3NwZWNpZmljX2xvY2F0aW9u');

@$core.Deprecated('Use generateTaskTitleResponseDescriptor instead')
const GenerateTaskTitleResponse$json = {
  '1': 'GenerateTaskTitleResponse',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `GenerateTaskTitleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateTaskTitleResponseDescriptor = $convert.base64Decode(
    'ChlHZW5lcmF0ZVRhc2tUaXRsZVJlc3BvbnNlEhQKBXRpdGxlGAEgASgJUgV0aXRsZQ==');

@$core.Deprecated('Use getTaskDefStatisticsRequestDescriptor instead')
const GetTaskDefStatisticsRequest$json = {
  '1': 'GetTaskDefStatisticsRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetTaskDefStatisticsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskDefStatisticsRequestDescriptor = $convert.base64Decode(
    'ChtHZXRUYXNrRGVmU3RhdGlzdGljc1JlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use taskDefStatisticsDescriptor instead')
const TaskDefStatistics$json = {
  '1': 'TaskDefStatistics',
  '2': [
    {'1': 'task_def_id', '3': 1, '4': 1, '5': 9, '10': 'taskDefId'},
    {'1': 'active_tasks_count', '3': 2, '4': 1, '5': 5, '10': 'activeTasksCount'},
    {'1': 'completed_tasks_count', '3': 3, '4': 1, '5': 5, '10': 'completedTasksCount'},
    {'1': 'last_completed_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'lastCompletedAt', '17': true},
    {'1': 'next_scheduled_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'nextScheduledAt', '17': true},
    {'1': 'completion_rate', '3': 6, '4': 1, '5': 1, '10': 'completionRate'},
    {'1': 'avg_completion_time_hours', '3': 7, '4': 1, '5': 1, '9': 2, '10': 'avgCompletionTimeHours', '17': true},
  ],
  '8': [
    {'1': '_last_completed_at'},
    {'1': '_next_scheduled_at'},
    {'1': '_avg_completion_time_hours'},
  ],
};

/// Descriptor for `TaskDefStatistics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDefStatisticsDescriptor = $convert.base64Decode(
    'ChFUYXNrRGVmU3RhdGlzdGljcxIeCgt0YXNrX2RlZl9pZBgBIAEoCVIJdGFza0RlZklkEiwKEm'
    'FjdGl2ZV90YXNrc19jb3VudBgCIAEoBVIQYWN0aXZlVGFza3NDb3VudBIyChVjb21wbGV0ZWRf'
    'dGFza3NfY291bnQYAyABKAVSE2NvbXBsZXRlZFRhc2tzQ291bnQSSwoRbGFzdF9jb21wbGV0ZW'
    'RfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSD2xhc3RDb21wbGV0ZWRB'
    'dIgBARJLChFuZXh0X3NjaGVkdWxlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBIAVIPbmV4dFNjaGVkdWxlZEF0iAEBEicKD2NvbXBsZXRpb25fcmF0ZRgGIAEoAVIOY29t'
    'cGxldGlvblJhdGUSPgoZYXZnX2NvbXBsZXRpb25fdGltZV9ob3VycxgHIAEoAUgCUhZhdmdDb2'
    '1wbGV0aW9uVGltZUhvdXJziAEBQhQKEl9sYXN0X2NvbXBsZXRlZF9hdEIUChJfbmV4dF9zY2hl'
    'ZHVsZWRfYXRCHAoaX2F2Z19jb21wbGV0aW9uX3RpbWVfaG91cnM=');

@$core.Deprecated('Use getUpcomingTasksRequestDescriptor instead')
const GetUpcomingTasksRequest$json = {
  '1': 'GetUpcomingTasksRequest',
  '2': [
    {'1': 'days', '3': 1, '4': 1, '5': 5, '10': 'days'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetUpcomingTasksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUpcomingTasksRequestDescriptor = $convert.base64Decode(
    'ChdHZXRVcGNvbWluZ1Rhc2tzUmVxdWVzdBISCgRkYXlzGAEgASgFUgRkYXlzEhQKBWxpbWl0GA'
    'IgASgFUgVsaW1pdBIWCgZvZmZzZXQYAyABKAVSBm9mZnNldA==');

@$core.Deprecated('Use getOverdueTasksRequestDescriptor instead')
const GetOverdueTasksRequest$json = {
  '1': 'GetOverdueTasksRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetOverdueTasksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOverdueTasksRequestDescriptor = $convert.base64Decode(
    'ChZHZXRPdmVyZHVlVGFza3NSZXF1ZXN0EhQKBWxpbWl0GAEgASgFUgVsaW1pdBIWCgZvZmZzZX'
    'QYAiABKAVSBm9mZnNldA==');

@$core.Deprecated('Use getTaskManagementOverviewRequestDescriptor instead')
const GetTaskManagementOverviewRequest$json = {
  '1': 'GetTaskManagementOverviewRequest',
};

/// Descriptor for `GetTaskManagementOverviewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskManagementOverviewRequestDescriptor = $convert.base64Decode(
    'CiBHZXRUYXNrTWFuYWdlbWVudE92ZXJ2aWV3UmVxdWVzdA==');

@$core.Deprecated('Use taskManagementOverviewDescriptor instead')
const TaskManagementOverview$json = {
  '1': 'TaskManagementOverview',
  '2': [
    {'1': 'total_tasks', '3': 1, '4': 1, '5': 5, '10': 'totalTasks'},
    {'1': 'open_tasks', '3': 2, '4': 1, '5': 5, '10': 'openTasks'},
    {'1': 'in_progress_tasks', '3': 3, '4': 1, '5': 5, '10': 'inProgressTasks'},
    {'1': 'on_hold_tasks', '3': 4, '4': 1, '5': 5, '10': 'onHoldTasks'},
    {'1': 'resolved_tasks', '3': 5, '4': 1, '5': 5, '10': 'resolvedTasks'},
    {'1': 'overdue_tasks', '3': 6, '4': 1, '5': 5, '10': 'overdueTasks'},
    {'1': 'unassigned_tasks', '3': 7, '4': 1, '5': 5, '10': 'unassignedTasks'},
    {'1': 'avg_time_to_close_hours', '3': 8, '4': 1, '5': 1, '10': 'avgTimeToCloseHours'},
    {'1': 'avg_response_time_hours', '3': 9, '4': 1, '5': 1, '10': 'avgResponseTimeHours'},
    {'1': 'completion_rate', '3': 10, '4': 1, '5': 1, '10': 'completionRate'},
    {'1': 'tasks_by_type', '3': 11, '4': 3, '5': 11, '6': '.moat.v1.TaskManagementOverview.TasksByTypeEntry', '10': 'tasksByType'},
    {'1': 'tasks_by_status', '3': 12, '4': 3, '5': 11, '6': '.moat.v1.TaskManagementOverview.TasksByStatusEntry', '10': 'tasksByStatus'},
    {'1': 'weekly_time_to_close', '3': 13, '4': 3, '5': 11, '6': '.moat.v1.WeeklyMetricDataPoint', '10': 'weeklyTimeToClose'},
    {'1': 'weekly_response_time', '3': 14, '4': 3, '5': 11, '6': '.moat.v1.WeeklyMetricDataPoint', '10': 'weeklyResponseTime'},
    {'1': 'weekly_created', '3': 15, '4': 3, '5': 11, '6': '.moat.v1.WeeklyCountDataPoint', '10': 'weeklyCreated'},
    {'1': 'weekly_resolved', '3': 16, '4': 3, '5': 11, '6': '.moat.v1.WeeklyCountDataPoint', '10': 'weeklyResolved'},
  ],
  '3': [TaskManagementOverview_TasksByTypeEntry$json, TaskManagementOverview_TasksByStatusEntry$json],
};

@$core.Deprecated('Use taskManagementOverviewDescriptor instead')
const TaskManagementOverview_TasksByTypeEntry$json = {
  '1': 'TasksByTypeEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use taskManagementOverviewDescriptor instead')
const TaskManagementOverview_TasksByStatusEntry$json = {
  '1': 'TasksByStatusEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TaskManagementOverview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskManagementOverviewDescriptor = $convert.base64Decode(
    'ChZUYXNrTWFuYWdlbWVudE92ZXJ2aWV3Eh8KC3RvdGFsX3Rhc2tzGAEgASgFUgp0b3RhbFRhc2'
    'tzEh0KCm9wZW5fdGFza3MYAiABKAVSCW9wZW5UYXNrcxIqChFpbl9wcm9ncmVzc190YXNrcxgD'
    'IAEoBVIPaW5Qcm9ncmVzc1Rhc2tzEiIKDW9uX2hvbGRfdGFza3MYBCABKAVSC29uSG9sZFRhc2'
    'tzEiUKDnJlc29sdmVkX3Rhc2tzGAUgASgFUg1yZXNvbHZlZFRhc2tzEiMKDW92ZXJkdWVfdGFz'
    'a3MYBiABKAVSDG92ZXJkdWVUYXNrcxIpChB1bmFzc2lnbmVkX3Rhc2tzGAcgASgFUg91bmFzc2'
    'lnbmVkVGFza3MSNAoXYXZnX3RpbWVfdG9fY2xvc2VfaG91cnMYCCABKAFSE2F2Z1RpbWVUb0Ns'
    'b3NlSG91cnMSNQoXYXZnX3Jlc3BvbnNlX3RpbWVfaG91cnMYCSABKAFSFGF2Z1Jlc3BvbnNlVG'
    'ltZUhvdXJzEicKD2NvbXBsZXRpb25fcmF0ZRgKIAEoAVIOY29tcGxldGlvblJhdGUSVAoNdGFz'
    'a3NfYnlfdHlwZRgLIAMoCzIwLm1vYXQudjEuVGFza01hbmFnZW1lbnRPdmVydmlldy5UYXNrc0'
    'J5VHlwZUVudHJ5Ugt0YXNrc0J5VHlwZRJaCg90YXNrc19ieV9zdGF0dXMYDCADKAsyMi5tb2F0'
    'LnYxLlRhc2tNYW5hZ2VtZW50T3ZlcnZpZXcuVGFza3NCeVN0YXR1c0VudHJ5Ug10YXNrc0J5U3'
    'RhdHVzEk8KFHdlZWtseV90aW1lX3RvX2Nsb3NlGA0gAygLMh4ubW9hdC52MS5XZWVrbHlNZXRy'
    'aWNEYXRhUG9pbnRSEXdlZWtseVRpbWVUb0Nsb3NlElAKFHdlZWtseV9yZXNwb25zZV90aW1lGA'
    '4gAygLMh4ubW9hdC52MS5XZWVrbHlNZXRyaWNEYXRhUG9pbnRSEndlZWtseVJlc3BvbnNlVGlt'
    'ZRJECg53ZWVrbHlfY3JlYXRlZBgPIAMoCzIdLm1vYXQudjEuV2Vla2x5Q291bnREYXRhUG9pbn'
    'RSDXdlZWtseUNyZWF0ZWQSRgoPd2Vla2x5X3Jlc29sdmVkGBAgAygLMh0ubW9hdC52MS5XZWVr'
    'bHlDb3VudERhdGFQb2ludFIOd2Vla2x5UmVzb2x2ZWQaPgoQVGFza3NCeVR5cGVFbnRyeRIQCg'
    'NrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoBVIFdmFsdWU6AjgBGkAKElRhc2tzQnlTdGF0'
    'dXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoBVIFdmFsdWU6AjgB');

@$core.Deprecated('Use validateRecurrenceRuleRequestDescriptor instead')
const ValidateRecurrenceRuleRequest$json = {
  '1': 'ValidateRecurrenceRuleRequest',
  '2': [
    {'1': 'rule', '3': 1, '4': 1, '5': 9, '10': 'rule'},
  ],
};

/// Descriptor for `ValidateRecurrenceRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateRecurrenceRuleRequestDescriptor = $convert.base64Decode(
    'Ch1WYWxpZGF0ZVJlY3VycmVuY2VSdWxlUmVxdWVzdBISCgRydWxlGAEgASgJUgRydWxl');

@$core.Deprecated('Use validateRecurrenceRuleResponseDescriptor instead')
const ValidateRecurrenceRuleResponse$json = {
  '1': 'ValidateRecurrenceRuleResponse',
  '2': [
    {'1': 'is_valid', '3': 1, '4': 1, '5': 8, '10': 'isValid'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'errorMessage', '17': true},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
  ],
  '8': [
    {'1': '_error_message'},
    {'1': '_description'},
  ],
};

/// Descriptor for `ValidateRecurrenceRuleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateRecurrenceRuleResponseDescriptor = $convert.base64Decode(
    'Ch5WYWxpZGF0ZVJlY3VycmVuY2VSdWxlUmVzcG9uc2USGQoIaXNfdmFsaWQYASABKAhSB2lzVm'
    'FsaWQSKAoNZXJyb3JfbWVzc2FnZRgCIAEoCUgAUgxlcnJvck1lc3NhZ2WIAQESJQoLZGVzY3Jp'
    'cHRpb24YAyABKAlIAVILZGVzY3JpcHRpb26IAQFCEAoOX2Vycm9yX21lc3NhZ2VCDgoMX2Rlc2'
    'NyaXB0aW9u');

@$core.Deprecated('Use previewRecurrenceOccurrencesRequestDescriptor instead')
const PreviewRecurrenceOccurrencesRequest$json = {
  '1': 'PreviewRecurrenceOccurrencesRequest',
  '2': [
    {'1': 'rule', '3': 1, '4': 1, '5': 9, '10': 'rule'},
    {'1': 'start_date', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startDate'},
    {'1': 'count', '3': 3, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `PreviewRecurrenceOccurrencesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List previewRecurrenceOccurrencesRequestDescriptor = $convert.base64Decode(
    'CiNQcmV2aWV3UmVjdXJyZW5jZU9jY3VycmVuY2VzUmVxdWVzdBISCgRydWxlGAEgASgJUgRydW'
    'xlEjkKCnN0YXJ0X2RhdGUYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglzdGFy'
    'dERhdGUSFAoFY291bnQYAyABKAVSBWNvdW50');

@$core.Deprecated('Use previewRecurrenceOccurrencesResponseDescriptor instead')
const PreviewRecurrenceOccurrencesResponse$json = {
  '1': 'PreviewRecurrenceOccurrencesResponse',
  '2': [
    {'1': 'occurrences', '3': 1, '4': 3, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'occurrences'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
  ],
  '8': [
    {'1': '_description'},
  ],
};

/// Descriptor for `PreviewRecurrenceOccurrencesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List previewRecurrenceOccurrencesResponseDescriptor = $convert.base64Decode(
    'CiRQcmV2aWV3UmVjdXJyZW5jZU9jY3VycmVuY2VzUmVzcG9uc2USPAoLb2NjdXJyZW5jZXMYAS'
    'ADKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgtvY2N1cnJlbmNlcxIlCgtkZXNjcmlw'
    'dGlvbhgCIAEoCUgAUgtkZXNjcmlwdGlvbogBAUIOCgxfZGVzY3JpcHRpb24=');

@$core.Deprecated('Use createRecurrenceRuleRequestDescriptor instead')
const CreateRecurrenceRuleRequest$json = {
  '1': 'CreateRecurrenceRuleRequest',
  '2': [
    {'1': 'frequency', '3': 1, '4': 1, '5': 14, '6': '.moat.v1.RecurrenceFrequency', '10': 'frequency'},
    {'1': 'interval', '3': 2, '4': 1, '5': 5, '10': 'interval'},
    {'1': 'by_day', '3': 3, '4': 3, '5': 9, '10': 'byDay'},
    {'1': 'by_month_day', '3': 4, '4': 1, '5': 5, '9': 0, '10': 'byMonthDay', '17': true},
    {'1': 'by_month', '3': 5, '4': 1, '5': 5, '9': 1, '10': 'byMonth', '17': true},
    {'1': 'count', '3': 6, '4': 1, '5': 5, '9': 2, '10': 'count', '17': true},
    {'1': 'until', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'until', '17': true},
  ],
  '8': [
    {'1': '_by_month_day'},
    {'1': '_by_month'},
    {'1': '_count'},
    {'1': '_until'},
  ],
};

/// Descriptor for `CreateRecurrenceRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRecurrenceRuleRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVSZWN1cnJlbmNlUnVsZVJlcXVlc3QSOgoJZnJlcXVlbmN5GAEgASgOMhwubW9hdC'
    '52MS5SZWN1cnJlbmNlRnJlcXVlbmN5UglmcmVxdWVuY3kSGgoIaW50ZXJ2YWwYAiABKAVSCGlu'
    'dGVydmFsEhUKBmJ5X2RheRgDIAMoCVIFYnlEYXkSJQoMYnlfbW9udGhfZGF5GAQgASgFSABSCm'
    'J5TW9udGhEYXmIAQESHgoIYnlfbW9udGgYBSABKAVIAVIHYnlNb250aIgBARIZCgVjb3VudBgG'
    'IAEoBUgCUgVjb3VudIgBARI1CgV1bnRpbBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBIA1IFdW50aWyIAQFCDwoNX2J5X21vbnRoX2RheUILCglfYnlfbW9udGhCCAoGX2NvdW50'
    'QggKBl91bnRpbA==');

@$core.Deprecated('Use createRecurrenceRuleResponseDescriptor instead')
const CreateRecurrenceRuleResponse$json = {
  '1': 'CreateRecurrenceRuleResponse',
  '2': [
    {'1': 'rule', '3': 1, '4': 1, '5': 9, '10': 'rule'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreateRecurrenceRuleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRecurrenceRuleResponseDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVSZWN1cnJlbmNlUnVsZVJlc3BvbnNlEhIKBHJ1bGUYASABKAlSBHJ1bGUSIAoLZG'
    'VzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use bulkCreateTaskDefsRequestDescriptor instead')
const BulkCreateTaskDefsRequest$json = {
  '1': 'BulkCreateTaskDefsRequest',
  '2': [
    {'1': 'asset_ids', '3': 1, '4': 3, '5': 9, '10': 'assetIds'},
    {'1': 'location_id', '3': 2, '4': 1, '5': 9, '10': 'locationId'},
    {'1': 'task_type', '3': 3, '4': 1, '5': 14, '6': '.moat.v1.TaskType', '10': 'taskType'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'is_enabled', '3': 6, '4': 1, '5': 8, '10': 'isEnabled'},
    {'1': 'recurrence_rule', '3': 7, '4': 1, '5': 9, '9': 1, '10': 'recurrenceRule', '17': true},
    {'1': 'recurrence_start', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'recurrenceStart', '17': true},
    {'1': 'recurrence_end', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'recurrenceEnd', '17': true},
    {'1': 'specific_location', '3': 10, '4': 1, '5': 9, '9': 4, '10': 'specificLocation', '17': true},
    {'1': 'details', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 5, '10': 'details', '17': true},
  ],
  '8': [
    {'1': '_description'},
    {'1': '_recurrence_rule'},
    {'1': '_recurrence_start'},
    {'1': '_recurrence_end'},
    {'1': '_specific_location'},
    {'1': '_details'},
  ],
};

/// Descriptor for `BulkCreateTaskDefsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkCreateTaskDefsRequestDescriptor = $convert.base64Decode(
    'ChlCdWxrQ3JlYXRlVGFza0RlZnNSZXF1ZXN0EhsKCWFzc2V0X2lkcxgBIAMoCVIIYXNzZXRJZH'
    'MSHwoLbG9jYXRpb25faWQYAiABKAlSCmxvY2F0aW9uSWQSLgoJdGFza190eXBlGAMgASgOMhEu'
    'bW9hdC52MS5UYXNrVHlwZVIIdGFza1R5cGUSFAoFdGl0bGUYBCABKAlSBXRpdGxlEiUKC2Rlc2'
    'NyaXB0aW9uGAUgASgJSABSC2Rlc2NyaXB0aW9uiAEBEh0KCmlzX2VuYWJsZWQYBiABKAhSCWlz'
    'RW5hYmxlZBIsCg9yZWN1cnJlbmNlX3J1bGUYByABKAlIAVIOcmVjdXJyZW5jZVJ1bGWIAQESSg'
    'oQcmVjdXJyZW5jZV9zdGFydBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAlIP'
    'cmVjdXJyZW5jZVN0YXJ0iAEBEkYKDnJlY3VycmVuY2VfZW5kGAkgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcEgDUg1yZWN1cnJlbmNlRW5kiAEBEjAKEXNwZWNpZmljX2xvY2F0aW9u'
    'GAogASgJSARSEHNwZWNpZmljTG9jYXRpb26IAQESNgoHZGV0YWlscxgLIAEoCzIXLmdvb2dsZS'
    '5wcm90b2J1Zi5TdHJ1Y3RIBVIHZGV0YWlsc4gBAUIOCgxfZGVzY3JpcHRpb25CEgoQX3JlY3Vy'
    'cmVuY2VfcnVsZUITChFfcmVjdXJyZW5jZV9zdGFydEIRCg9fcmVjdXJyZW5jZV9lbmRCFAoSX3'
    'NwZWNpZmljX2xvY2F0aW9uQgoKCF9kZXRhaWxz');

@$core.Deprecated('Use bulkCreateTaskDefsResponseDescriptor instead')
const BulkCreateTaskDefsResponse$json = {
  '1': 'BulkCreateTaskDefsResponse',
  '2': [
    {'1': 'created_count', '3': 1, '4': 1, '5': 5, '10': 'createdCount'},
    {'1': 'failed_asset_ids', '3': 2, '4': 3, '5': 9, '10': 'failedAssetIds'},
    {'1': 'created_ids', '3': 3, '4': 3, '5': 9, '10': 'createdIds'},
  ],
};

/// Descriptor for `BulkCreateTaskDefsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkCreateTaskDefsResponseDescriptor = $convert.base64Decode(
    'ChpCdWxrQ3JlYXRlVGFza0RlZnNSZXNwb25zZRIjCg1jcmVhdGVkX2NvdW50GAEgASgFUgxjcm'
    'VhdGVkQ291bnQSKAoQZmFpbGVkX2Fzc2V0X2lkcxgCIAMoCVIOZmFpbGVkQXNzZXRJZHMSHwoL'
    'Y3JlYXRlZF9pZHMYAyADKAlSCmNyZWF0ZWRJZHM=');

@$core.Deprecated('Use bulkUpdateTaskDefsRequestDescriptor instead')
const BulkUpdateTaskDefsRequest$json = {
  '1': 'BulkUpdateTaskDefsRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
    {'1': 'is_enabled', '3': 2, '4': 1, '5': 8, '9': 0, '10': 'isEnabled', '17': true},
    {'1': 'location_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'locationId', '17': true},
    {'1': 'task_type', '3': 4, '4': 1, '5': 14, '6': '.moat.v1.TaskType', '9': 2, '10': 'taskType', '17': true},
  ],
  '8': [
    {'1': '_is_enabled'},
    {'1': '_location_id'},
    {'1': '_task_type'},
  ],
};

/// Descriptor for `BulkUpdateTaskDefsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkUpdateTaskDefsRequestDescriptor = $convert.base64Decode(
    'ChlCdWxrVXBkYXRlVGFza0RlZnNSZXF1ZXN0EhAKA2lkcxgBIAMoCVIDaWRzEiIKCmlzX2VuYW'
    'JsZWQYAiABKAhIAFIJaXNFbmFibGVkiAEBEiQKC2xvY2F0aW9uX2lkGAMgASgJSAFSCmxvY2F0'
    'aW9uSWSIAQESMwoJdGFza190eXBlGAQgASgOMhEubW9hdC52MS5UYXNrVHlwZUgCUgh0YXNrVH'
    'lwZYgBAUINCgtfaXNfZW5hYmxlZEIOCgxfbG9jYXRpb25faWRCDAoKX3Rhc2tfdHlwZQ==');

@$core.Deprecated('Use bulkUpdateTaskDefsResponseDescriptor instead')
const BulkUpdateTaskDefsResponse$json = {
  '1': 'BulkUpdateTaskDefsResponse',
  '2': [
    {'1': 'updated_count', '3': 1, '4': 1, '5': 5, '10': 'updatedCount'},
    {'1': 'failed_ids', '3': 2, '4': 3, '5': 9, '10': 'failedIds'},
  ],
};

/// Descriptor for `BulkUpdateTaskDefsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkUpdateTaskDefsResponseDescriptor = $convert.base64Decode(
    'ChpCdWxrVXBkYXRlVGFza0RlZnNSZXNwb25zZRIjCg11cGRhdGVkX2NvdW50GAEgASgFUgx1cG'
    'RhdGVkQ291bnQSHQoKZmFpbGVkX2lkcxgCIAMoCVIJZmFpbGVkSWRz');

@$core.Deprecated('Use bulkDeleteTaskDefsRequestDescriptor instead')
const BulkDeleteTaskDefsRequest$json = {
  '1': 'BulkDeleteTaskDefsRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `BulkDeleteTaskDefsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkDeleteTaskDefsRequestDescriptor = $convert.base64Decode(
    'ChlCdWxrRGVsZXRlVGFza0RlZnNSZXF1ZXN0EhAKA2lkcxgBIAMoCVIDaWRz');

@$core.Deprecated('Use bulkDeleteTaskDefsResponseDescriptor instead')
const BulkDeleteTaskDefsResponse$json = {
  '1': 'BulkDeleteTaskDefsResponse',
  '2': [
    {'1': 'deleted_count', '3': 1, '4': 1, '5': 5, '10': 'deletedCount'},
    {'1': 'failed_ids', '3': 2, '4': 3, '5': 9, '10': 'failedIds'},
  ],
};

/// Descriptor for `BulkDeleteTaskDefsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkDeleteTaskDefsResponseDescriptor = $convert.base64Decode(
    'ChpCdWxrRGVsZXRlVGFza0RlZnNSZXNwb25zZRIjCg1kZWxldGVkX2NvdW50GAEgASgFUgxkZW'
    'xldGVkQ291bnQSHQoKZmFpbGVkX2lkcxgCIAMoCVIJZmFpbGVkSWRz');

@$core.Deprecated('Use bulkUpdateTaskStatusRequestDescriptor instead')
const BulkUpdateTaskStatusRequest$json = {
  '1': 'BulkUpdateTaskStatusRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.moat.v1.TaskStatus', '10': 'status'},
    {'1': 'resolution_type', '3': 3, '4': 1, '5': 14, '6': '.moat.v1.ResolutionType', '9': 0, '10': 'resolutionType', '17': true},
    {'1': 'notes', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_resolution_type'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `BulkUpdateTaskStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkUpdateTaskStatusRequestDescriptor = $convert.base64Decode(
    'ChtCdWxrVXBkYXRlVGFza1N0YXR1c1JlcXVlc3QSEAoDaWRzGAEgAygJUgNpZHMSKwoGc3RhdH'
    'VzGAIgASgOMhMubW9hdC52MS5UYXNrU3RhdHVzUgZzdGF0dXMSRQoPcmVzb2x1dGlvbl90eXBl'
    'GAMgASgOMhcubW9hdC52MS5SZXNvbHV0aW9uVHlwZUgAUg5yZXNvbHV0aW9uVHlwZYgBARIZCg'
    'Vub3RlcxgEIAEoCUgBUgVub3Rlc4gBAUISChBfcmVzb2x1dGlvbl90eXBlQggKBl9ub3Rlcw==');

@$core.Deprecated('Use bulkUpdateTaskStatusResponseDescriptor instead')
const BulkUpdateTaskStatusResponse$json = {
  '1': 'BulkUpdateTaskStatusResponse',
  '2': [
    {'1': 'updated_count', '3': 1, '4': 1, '5': 5, '10': 'updatedCount'},
    {'1': 'failed_ids', '3': 2, '4': 3, '5': 9, '10': 'failedIds'},
  ],
};

/// Descriptor for `BulkUpdateTaskStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkUpdateTaskStatusResponseDescriptor = $convert.base64Decode(
    'ChxCdWxrVXBkYXRlVGFza1N0YXR1c1Jlc3BvbnNlEiMKDXVwZGF0ZWRfY291bnQYASABKAVSDH'
    'VwZGF0ZWRDb3VudBIdCgpmYWlsZWRfaWRzGAIgAygJUglmYWlsZWRJZHM=');

@$core.Deprecated('Use getTaskDefHistoryRequestDescriptor instead')
const GetTaskDefHistoryRequest$json = {
  '1': 'GetTaskDefHistoryRequest',
  '2': [
    {'1': 'task_def_id', '3': 1, '4': 1, '5': 9, '10': 'taskDefId'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetTaskDefHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskDefHistoryRequestDescriptor = $convert.base64Decode(
    'ChhHZXRUYXNrRGVmSGlzdG9yeVJlcXVlc3QSHgoLdGFza19kZWZfaWQYASABKAlSCXRhc2tEZW'
    'ZJZBIUCgVsaW1pdBgCIAEoBVIFbGltaXQSFgoGb2Zmc2V0GAMgASgFUgZvZmZzZXQ=');

@$core.Deprecated('Use getTaskDefHistoryResponseDescriptor instead')
const GetTaskDefHistoryResponse$json = {
  '1': 'GetTaskDefHistoryResponse',
  '2': [
    {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.TaskDefHistoryEntry', '10': 'entries'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `GetTaskDefHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskDefHistoryResponseDescriptor = $convert.base64Decode(
    'ChlHZXRUYXNrRGVmSGlzdG9yeVJlc3BvbnNlEjYKB2VudHJpZXMYASADKAsyHC5tb2F0LnYxLl'
    'Rhc2tEZWZIaXN0b3J5RW50cnlSB2VudHJpZXMSFAoFdG90YWwYAiABKAVSBXRvdGFs');

@$core.Deprecated('Use taskDefHistoryEntryDescriptor instead')
const TaskDefHistoryEntry$json = {
  '1': 'TaskDefHistoryEntry',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'task_def_id', '3': 2, '4': 1, '5': 9, '10': 'taskDefId'},
    {'1': 'change_type', '3': 3, '4': 1, '5': 9, '10': 'changeType'},
    {'1': 'changes', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'changes'},
    {'1': 'changed_by_id', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'changedById', '17': true},
    {'1': 'changed_by_name', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'changedByName', '17': true},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
  '8': [
    {'1': '_changed_by_id'},
    {'1': '_changed_by_name'},
  ],
};

/// Descriptor for `TaskDefHistoryEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDefHistoryEntryDescriptor = $convert.base64Decode(
    'ChNUYXNrRGVmSGlzdG9yeUVudHJ5Eg4KAmlkGAEgASgJUgJpZBIeCgt0YXNrX2RlZl9pZBgCIA'
    'EoCVIJdGFza0RlZklkEh8KC2NoYW5nZV90eXBlGAMgASgJUgpjaGFuZ2VUeXBlEjEKB2NoYW5n'
    'ZXMYBCABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0UgdjaGFuZ2VzEicKDWNoYW5nZWRfYn'
    'lfaWQYBSABKAlIAFILY2hhbmdlZEJ5SWSIAQESKwoPY2hhbmdlZF9ieV9uYW1lGAYgASgJSAFS'
    'DWNoYW5nZWRCeU5hbWWIAQESOQoKY3JlYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBSCWNyZWF0ZWRBdEIQCg5fY2hhbmdlZF9ieV9pZEISChBfY2hhbmdlZF9ieV9u'
    'YW1l');

const $core.Map<$core.String, $core.dynamic> TaskServiceBase$json = {
  '1': 'TaskService',
  '2': [
    {'1': 'CreateTaskDef', '2': '.moat.v1.CreateTaskDefRequest', '3': '.moat.v1.TaskDef'},
    {'1': 'GetTaskDef', '2': '.moat.v1.GetTaskDefRequest', '3': '.moat.v1.TaskDef'},
    {'1': 'UpdateTaskDef', '2': '.moat.v1.UpdateTaskDefRequest', '3': '.moat.v1.TaskDef'},
    {'1': 'DeleteTaskDef', '2': '.moat.v1.DeleteTaskDefRequest', '3': '.moat.v1.DeleteTaskDefResponse'},
    {'1': 'ListTaskDefs', '2': '.moat.v1.ListTaskDefsRequest', '3': '.moat.v1.ListTaskDefsResponse'},
    {'1': 'CreateTask', '2': '.moat.v1.CreateTaskRequest', '3': '.moat.v1.Task'},
    {'1': 'GetTask', '2': '.moat.v1.GetTaskRequest', '3': '.moat.v1.TaskWithDetails'},
    {'1': 'GetTaskByExternalId', '2': '.moat.v1.GetTaskByExternalIdRequest', '3': '.moat.v1.TaskWithDetails'},
    {'1': 'UpdateTask', '2': '.moat.v1.UpdateTaskRequest', '3': '.moat.v1.Task'},
    {'1': 'DeleteTask', '2': '.moat.v1.DeleteTaskRequest', '3': '.moat.v1.DeleteTaskResponse'},
    {'1': 'ListTasks', '2': '.moat.v1.ListTasksRequest', '3': '.moat.v1.ListTasksResponse'},
    {'1': 'UpdateTaskStatus', '2': '.moat.v1.UpdateTaskStatusRequest', '3': '.moat.v1.Task'},
    {'1': 'ClaimTask', '2': '.moat.v1.ClaimTaskRequest', '3': '.moat.v1.Task'},
    {'1': 'CreateComment', '2': '.moat.v1.CreateCommentRequest', '3': '.moat.v1.TaskComment'},
    {'1': 'UpdateComment', '2': '.moat.v1.UpdateCommentRequest', '3': '.moat.v1.TaskComment'},
    {'1': 'DeleteComment', '2': '.moat.v1.DeleteCommentRequest', '3': '.moat.v1.DeleteCommentResponse'},
    {'1': 'ListComments', '2': '.moat.v1.ListCommentsRequest', '3': '.moat.v1.ListCommentsResponse'},
    {'1': 'GetTaskActivity', '2': '.moat.v1.GetTaskActivityRequest', '3': '.moat.v1.GetTaskActivityResponse'},
    {'1': 'CreateAssignmentRule', '2': '.moat.v1.CreateAssignmentRuleRequest', '3': '.moat.v1.AssignmentRule'},
    {'1': 'UpdateAssignmentRule', '2': '.moat.v1.UpdateAssignmentRuleRequest', '3': '.moat.v1.AssignmentRule'},
    {'1': 'DeleteAssignmentRule', '2': '.moat.v1.DeleteAssignmentRuleRequest', '3': '.moat.v1.DeleteAssignmentRuleResponse'},
    {'1': 'ListAssignmentRules', '2': '.moat.v1.ListAssignmentRulesRequest', '3': '.moat.v1.ListAssignmentRulesResponse'},
    {'1': 'GetAssignableMembers', '2': '.moat.v1.GetAssignableMembersRequest', '3': '.moat.v1.GetAssignableMembersResponse'},
    {'1': 'GetAssignableRoles', '2': '.moat.v1.GetAssignableRolesRequest', '3': '.moat.v1.GetAssignableRolesResponse'},
    {'1': 'GetTicketLocations', '2': '.moat.v1.GetTicketLocationsRequest', '3': '.moat.v1.GetTicketLocationsResponse'},
    {'1': 'GenerateTaskTitle', '2': '.moat.v1.GenerateTaskTitleRequest', '3': '.moat.v1.GenerateTaskTitleResponse'},
    {'1': 'GetTaskDefStatistics', '2': '.moat.v1.GetTaskDefStatisticsRequest', '3': '.moat.v1.TaskDefStatistics'},
    {'1': 'GetUpcomingTasks', '2': '.moat.v1.GetUpcomingTasksRequest', '3': '.moat.v1.ListTasksResponse'},
    {'1': 'GetOverdueTasks', '2': '.moat.v1.GetOverdueTasksRequest', '3': '.moat.v1.ListTasksResponse'},
    {'1': 'GetTaskManagementOverview', '2': '.moat.v1.GetTaskManagementOverviewRequest', '3': '.moat.v1.TaskManagementOverview'},
    {'1': 'GetAttachmentUploadUrl', '2': '.moat.v1.GetAttachmentUploadUrlRequest', '3': '.moat.v1.GetAttachmentUploadUrlResponse'},
    {'1': 'ConfirmAttachmentUpload', '2': '.moat.v1.ConfirmAttachmentUploadRequest', '3': '.moat.v1.TaskAttachment'},
    {'1': 'ListTaskAttachments', '2': '.moat.v1.ListTaskAttachmentsRequest', '3': '.moat.v1.ListTaskAttachmentsResponse'},
    {'1': 'DeleteAttachment', '2': '.moat.v1.DeleteAttachmentRequest', '3': '.moat.v1.DeleteAttachmentResponse'},
    {'1': 'UpdateAttachment', '2': '.moat.v1.UpdateAttachmentRequest', '3': '.moat.v1.TaskAttachment'},
    {'1': 'GetTaskDefAttachmentUploadUrl', '2': '.moat.v1.GetTaskDefAttachmentUploadUrlRequest', '3': '.moat.v1.GetAttachmentUploadUrlResponse'},
    {'1': 'ConfirmTaskDefAttachmentUpload', '2': '.moat.v1.ConfirmTaskDefAttachmentUploadRequest', '3': '.moat.v1.TaskAttachment'},
    {'1': 'ListTaskDefAttachments', '2': '.moat.v1.ListTaskDefAttachmentsRequest', '3': '.moat.v1.ListTaskAttachmentsResponse'},
    {'1': 'DeleteTaskDefAttachment', '2': '.moat.v1.DeleteTaskDefAttachmentRequest', '3': '.moat.v1.DeleteAttachmentResponse'},
    {'1': 'ValidateRecurrenceRule', '2': '.moat.v1.ValidateRecurrenceRuleRequest', '3': '.moat.v1.ValidateRecurrenceRuleResponse'},
    {'1': 'PreviewRecurrenceOccurrences', '2': '.moat.v1.PreviewRecurrenceOccurrencesRequest', '3': '.moat.v1.PreviewRecurrenceOccurrencesResponse'},
    {'1': 'CreateRecurrenceRule', '2': '.moat.v1.CreateRecurrenceRuleRequest', '3': '.moat.v1.CreateRecurrenceRuleResponse'},
    {'1': 'BulkCreateTaskDefs', '2': '.moat.v1.BulkCreateTaskDefsRequest', '3': '.moat.v1.BulkCreateTaskDefsResponse'},
    {'1': 'BulkUpdateTaskDefs', '2': '.moat.v1.BulkUpdateTaskDefsRequest', '3': '.moat.v1.BulkUpdateTaskDefsResponse'},
    {'1': 'BulkDeleteTaskDefs', '2': '.moat.v1.BulkDeleteTaskDefsRequest', '3': '.moat.v1.BulkDeleteTaskDefsResponse'},
    {'1': 'BulkUpdateTaskStatus', '2': '.moat.v1.BulkUpdateTaskStatusRequest', '3': '.moat.v1.BulkUpdateTaskStatusResponse'},
    {'1': 'GetTaskDefHistory', '2': '.moat.v1.GetTaskDefHistoryRequest', '3': '.moat.v1.GetTaskDefHistoryResponse'},
  ],
};

@$core.Deprecated('Use taskServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> TaskServiceBase$messageJson = {
  '.moat.v1.CreateTaskDefRequest': CreateTaskDefRequest$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.google.protobuf.Struct': $1.Struct$json,
  '.google.protobuf.Struct.FieldsEntry': $1.Struct_FieldsEntry$json,
  '.google.protobuf.Value': $1.Value$json,
  '.google.protobuf.ListValue': $1.ListValue$json,
  '.moat.v1.TaskDef': TaskDef$json,
  '.moat.v1.GetTaskDefRequest': GetTaskDefRequest$json,
  '.moat.v1.UpdateTaskDefRequest': UpdateTaskDefRequest$json,
  '.moat.v1.DeleteTaskDefRequest': DeleteTaskDefRequest$json,
  '.moat.v1.DeleteTaskDefResponse': DeleteTaskDefResponse$json,
  '.moat.v1.ListTaskDefsRequest': ListTaskDefsRequest$json,
  '.moat.v1.ListTaskDefsResponse': ListTaskDefsResponse$json,
  '.moat.v1.CreateTaskRequest': CreateTaskRequest$json,
  '.moat.v1.Task': Task$json,
  '.moat.v1.GetTaskRequest': GetTaskRequest$json,
  '.moat.v1.TaskWithDetails': TaskWithDetails$json,
  '.moat.v1.GetTaskByExternalIdRequest': GetTaskByExternalIdRequest$json,
  '.moat.v1.UpdateTaskRequest': UpdateTaskRequest$json,
  '.moat.v1.DeleteTaskRequest': DeleteTaskRequest$json,
  '.moat.v1.DeleteTaskResponse': DeleteTaskResponse$json,
  '.moat.v1.ListTasksRequest': ListTasksRequest$json,
  '.moat.v1.ListTasksResponse': ListTasksResponse$json,
  '.moat.v1.WeeklyMetricDataPoint': WeeklyMetricDataPoint$json,
  '.moat.v1.WeeklyCountDataPoint': WeeklyCountDataPoint$json,
  '.moat.v1.UpdateTaskStatusRequest': UpdateTaskStatusRequest$json,
  '.moat.v1.ClaimTaskRequest': ClaimTaskRequest$json,
  '.moat.v1.CreateCommentRequest': CreateCommentRequest$json,
  '.moat.v1.TaskComment': TaskComment$json,
  '.moat.v1.MentionedMember': MentionedMember$json,
  '.moat.v1.CommentAuthor': CommentAuthor$json,
  '.moat.v1.TaskAttachment': TaskAttachment$json,
  '.moat.v1.CommentEditHistory': CommentEditHistory$json,
  '.moat.v1.UpdateCommentRequest': UpdateCommentRequest$json,
  '.moat.v1.DeleteCommentRequest': DeleteCommentRequest$json,
  '.moat.v1.DeleteCommentResponse': DeleteCommentResponse$json,
  '.moat.v1.ListCommentsRequest': ListCommentsRequest$json,
  '.moat.v1.ListCommentsResponse': ListCommentsResponse$json,
  '.moat.v1.GetTaskActivityRequest': GetTaskActivityRequest$json,
  '.moat.v1.GetTaskActivityResponse': GetTaskActivityResponse$json,
  '.moat.v1.TaskActivity': TaskActivity$json,
  '.moat.v1.CreateAssignmentRuleRequest': CreateAssignmentRuleRequest$json,
  '.moat.v1.AssignmentRule': AssignmentRule$json,
  '.moat.v1.UpdateAssignmentRuleRequest': UpdateAssignmentRuleRequest$json,
  '.moat.v1.DeleteAssignmentRuleRequest': DeleteAssignmentRuleRequest$json,
  '.moat.v1.DeleteAssignmentRuleResponse': DeleteAssignmentRuleResponse$json,
  '.moat.v1.ListAssignmentRulesRequest': ListAssignmentRulesRequest$json,
  '.moat.v1.ListAssignmentRulesResponse': ListAssignmentRulesResponse$json,
  '.moat.v1.GetAssignableMembersRequest': GetAssignableMembersRequest$json,
  '.moat.v1.GetAssignableMembersResponse': GetAssignableMembersResponse$json,
  '.moat.v1.AssignableMember': AssignableMember$json,
  '.moat.v1.GetAssignableRolesRequest': GetAssignableRolesRequest$json,
  '.moat.v1.GetAssignableRolesResponse': GetAssignableRolesResponse$json,
  '.moat.v1.AssignableRole': AssignableRole$json,
  '.moat.v1.GetTicketLocationsRequest': GetTicketLocationsRequest$json,
  '.moat.v1.GetTicketLocationsResponse': GetTicketLocationsResponse$json,
  '.moat.v1.TicketLocation': TicketLocation$json,
  '.moat.v1.GenerateTaskTitleRequest': GenerateTaskTitleRequest$json,
  '.moat.v1.GenerateTaskTitleResponse': GenerateTaskTitleResponse$json,
  '.moat.v1.GetTaskDefStatisticsRequest': GetTaskDefStatisticsRequest$json,
  '.moat.v1.TaskDefStatistics': TaskDefStatistics$json,
  '.moat.v1.GetUpcomingTasksRequest': GetUpcomingTasksRequest$json,
  '.moat.v1.GetOverdueTasksRequest': GetOverdueTasksRequest$json,
  '.moat.v1.GetTaskManagementOverviewRequest': GetTaskManagementOverviewRequest$json,
  '.moat.v1.TaskManagementOverview': TaskManagementOverview$json,
  '.moat.v1.TaskManagementOverview.TasksByTypeEntry': TaskManagementOverview_TasksByTypeEntry$json,
  '.moat.v1.TaskManagementOverview.TasksByStatusEntry': TaskManagementOverview_TasksByStatusEntry$json,
  '.moat.v1.GetAttachmentUploadUrlRequest': GetAttachmentUploadUrlRequest$json,
  '.moat.v1.GetAttachmentUploadUrlResponse': GetAttachmentUploadUrlResponse$json,
  '.moat.v1.ConfirmAttachmentUploadRequest': ConfirmAttachmentUploadRequest$json,
  '.moat.v1.ListTaskAttachmentsRequest': ListTaskAttachmentsRequest$json,
  '.moat.v1.ListTaskAttachmentsResponse': ListTaskAttachmentsResponse$json,
  '.moat.v1.DeleteAttachmentRequest': DeleteAttachmentRequest$json,
  '.moat.v1.DeleteAttachmentResponse': DeleteAttachmentResponse$json,
  '.moat.v1.UpdateAttachmentRequest': UpdateAttachmentRequest$json,
  '.moat.v1.GetTaskDefAttachmentUploadUrlRequest': GetTaskDefAttachmentUploadUrlRequest$json,
  '.moat.v1.ConfirmTaskDefAttachmentUploadRequest': ConfirmTaskDefAttachmentUploadRequest$json,
  '.moat.v1.ListTaskDefAttachmentsRequest': ListTaskDefAttachmentsRequest$json,
  '.moat.v1.DeleteTaskDefAttachmentRequest': DeleteTaskDefAttachmentRequest$json,
  '.moat.v1.ValidateRecurrenceRuleRequest': ValidateRecurrenceRuleRequest$json,
  '.moat.v1.ValidateRecurrenceRuleResponse': ValidateRecurrenceRuleResponse$json,
  '.moat.v1.PreviewRecurrenceOccurrencesRequest': PreviewRecurrenceOccurrencesRequest$json,
  '.moat.v1.PreviewRecurrenceOccurrencesResponse': PreviewRecurrenceOccurrencesResponse$json,
  '.moat.v1.CreateRecurrenceRuleRequest': CreateRecurrenceRuleRequest$json,
  '.moat.v1.CreateRecurrenceRuleResponse': CreateRecurrenceRuleResponse$json,
  '.moat.v1.BulkCreateTaskDefsRequest': BulkCreateTaskDefsRequest$json,
  '.moat.v1.BulkCreateTaskDefsResponse': BulkCreateTaskDefsResponse$json,
  '.moat.v1.BulkUpdateTaskDefsRequest': BulkUpdateTaskDefsRequest$json,
  '.moat.v1.BulkUpdateTaskDefsResponse': BulkUpdateTaskDefsResponse$json,
  '.moat.v1.BulkDeleteTaskDefsRequest': BulkDeleteTaskDefsRequest$json,
  '.moat.v1.BulkDeleteTaskDefsResponse': BulkDeleteTaskDefsResponse$json,
  '.moat.v1.BulkUpdateTaskStatusRequest': BulkUpdateTaskStatusRequest$json,
  '.moat.v1.BulkUpdateTaskStatusResponse': BulkUpdateTaskStatusResponse$json,
  '.moat.v1.GetTaskDefHistoryRequest': GetTaskDefHistoryRequest$json,
  '.moat.v1.GetTaskDefHistoryResponse': GetTaskDefHistoryResponse$json,
  '.moat.v1.TaskDefHistoryEntry': TaskDefHistoryEntry$json,
};

/// Descriptor for `TaskService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List taskServiceDescriptor = $convert.base64Decode(
    'CgtUYXNrU2VydmljZRJACg1DcmVhdGVUYXNrRGVmEh0ubW9hdC52MS5DcmVhdGVUYXNrRGVmUm'
    'VxdWVzdBoQLm1vYXQudjEuVGFza0RlZhI6CgpHZXRUYXNrRGVmEhoubW9hdC52MS5HZXRUYXNr'
    'RGVmUmVxdWVzdBoQLm1vYXQudjEuVGFza0RlZhJACg1VcGRhdGVUYXNrRGVmEh0ubW9hdC52MS'
    '5VcGRhdGVUYXNrRGVmUmVxdWVzdBoQLm1vYXQudjEuVGFza0RlZhJOCg1EZWxldGVUYXNrRGVm'
    'Eh0ubW9hdC52MS5EZWxldGVUYXNrRGVmUmVxdWVzdBoeLm1vYXQudjEuRGVsZXRlVGFza0RlZl'
    'Jlc3BvbnNlEksKDExpc3RUYXNrRGVmcxIcLm1vYXQudjEuTGlzdFRhc2tEZWZzUmVxdWVzdBod'
    'Lm1vYXQudjEuTGlzdFRhc2tEZWZzUmVzcG9uc2USNwoKQ3JlYXRlVGFzaxIaLm1vYXQudjEuQ3'
    'JlYXRlVGFza1JlcXVlc3QaDS5tb2F0LnYxLlRhc2sSPAoHR2V0VGFzaxIXLm1vYXQudjEuR2V0'
    'VGFza1JlcXVlc3QaGC5tb2F0LnYxLlRhc2tXaXRoRGV0YWlscxJUChNHZXRUYXNrQnlFeHRlcm'
    '5hbElkEiMubW9hdC52MS5HZXRUYXNrQnlFeHRlcm5hbElkUmVxdWVzdBoYLm1vYXQudjEuVGFz'
    'a1dpdGhEZXRhaWxzEjcKClVwZGF0ZVRhc2sSGi5tb2F0LnYxLlVwZGF0ZVRhc2tSZXF1ZXN0Gg'
    '0ubW9hdC52MS5UYXNrEkUKCkRlbGV0ZVRhc2sSGi5tb2F0LnYxLkRlbGV0ZVRhc2tSZXF1ZXN0'
    'GhsubW9hdC52MS5EZWxldGVUYXNrUmVzcG9uc2USQgoJTGlzdFRhc2tzEhkubW9hdC52MS5MaX'
    'N0VGFza3NSZXF1ZXN0GhoubW9hdC52MS5MaXN0VGFza3NSZXNwb25zZRJDChBVcGRhdGVUYXNr'
    'U3RhdHVzEiAubW9hdC52MS5VcGRhdGVUYXNrU3RhdHVzUmVxdWVzdBoNLm1vYXQudjEuVGFzax'
    'I1CglDbGFpbVRhc2sSGS5tb2F0LnYxLkNsYWltVGFza1JlcXVlc3QaDS5tb2F0LnYxLlRhc2sS'
    'RAoNQ3JlYXRlQ29tbWVudBIdLm1vYXQudjEuQ3JlYXRlQ29tbWVudFJlcXVlc3QaFC5tb2F0Ln'
    'YxLlRhc2tDb21tZW50EkQKDVVwZGF0ZUNvbW1lbnQSHS5tb2F0LnYxLlVwZGF0ZUNvbW1lbnRS'
    'ZXF1ZXN0GhQubW9hdC52MS5UYXNrQ29tbWVudBJOCg1EZWxldGVDb21tZW50Eh0ubW9hdC52MS'
    '5EZWxldGVDb21tZW50UmVxdWVzdBoeLm1vYXQudjEuRGVsZXRlQ29tbWVudFJlc3BvbnNlEksK'
    'DExpc3RDb21tZW50cxIcLm1vYXQudjEuTGlzdENvbW1lbnRzUmVxdWVzdBodLm1vYXQudjEuTG'
    'lzdENvbW1lbnRzUmVzcG9uc2USVAoPR2V0VGFza0FjdGl2aXR5Eh8ubW9hdC52MS5HZXRUYXNr'
    'QWN0aXZpdHlSZXF1ZXN0GiAubW9hdC52MS5HZXRUYXNrQWN0aXZpdHlSZXNwb25zZRJVChRDcm'
    'VhdGVBc3NpZ25tZW50UnVsZRIkLm1vYXQudjEuQ3JlYXRlQXNzaWdubWVudFJ1bGVSZXF1ZXN0'
    'GhcubW9hdC52MS5Bc3NpZ25tZW50UnVsZRJVChRVcGRhdGVBc3NpZ25tZW50UnVsZRIkLm1vYX'
    'QudjEuVXBkYXRlQXNzaWdubWVudFJ1bGVSZXF1ZXN0GhcubW9hdC52MS5Bc3NpZ25tZW50UnVs'
    'ZRJjChREZWxldGVBc3NpZ25tZW50UnVsZRIkLm1vYXQudjEuRGVsZXRlQXNzaWdubWVudFJ1bG'
    'VSZXF1ZXN0GiUubW9hdC52MS5EZWxldGVBc3NpZ25tZW50UnVsZVJlc3BvbnNlEmAKE0xpc3RB'
    'c3NpZ25tZW50UnVsZXMSIy5tb2F0LnYxLkxpc3RBc3NpZ25tZW50UnVsZXNSZXF1ZXN0GiQubW'
    '9hdC52MS5MaXN0QXNzaWdubWVudFJ1bGVzUmVzcG9uc2USYwoUR2V0QXNzaWduYWJsZU1lbWJl'
    'cnMSJC5tb2F0LnYxLkdldEFzc2lnbmFibGVNZW1iZXJzUmVxdWVzdBolLm1vYXQudjEuR2V0QX'
    'NzaWduYWJsZU1lbWJlcnNSZXNwb25zZRJdChJHZXRBc3NpZ25hYmxlUm9sZXMSIi5tb2F0LnYx'
    'LkdldEFzc2lnbmFibGVSb2xlc1JlcXVlc3QaIy5tb2F0LnYxLkdldEFzc2lnbmFibGVSb2xlc1'
    'Jlc3BvbnNlEl0KEkdldFRpY2tldExvY2F0aW9ucxIiLm1vYXQudjEuR2V0VGlja2V0TG9jYXRp'
    'b25zUmVxdWVzdBojLm1vYXQudjEuR2V0VGlja2V0TG9jYXRpb25zUmVzcG9uc2USWgoRR2VuZX'
    'JhdGVUYXNrVGl0bGUSIS5tb2F0LnYxLkdlbmVyYXRlVGFza1RpdGxlUmVxdWVzdBoiLm1vYXQu'
    'djEuR2VuZXJhdGVUYXNrVGl0bGVSZXNwb25zZRJYChRHZXRUYXNrRGVmU3RhdGlzdGljcxIkLm'
    '1vYXQudjEuR2V0VGFza0RlZlN0YXRpc3RpY3NSZXF1ZXN0GhoubW9hdC52MS5UYXNrRGVmU3Rh'
    'dGlzdGljcxJQChBHZXRVcGNvbWluZ1Rhc2tzEiAubW9hdC52MS5HZXRVcGNvbWluZ1Rhc2tzUm'
    'VxdWVzdBoaLm1vYXQudjEuTGlzdFRhc2tzUmVzcG9uc2USTgoPR2V0T3ZlcmR1ZVRhc2tzEh8u'
    'bW9hdC52MS5HZXRPdmVyZHVlVGFza3NSZXF1ZXN0GhoubW9hdC52MS5MaXN0VGFza3NSZXNwb2'
    '5zZRJnChlHZXRUYXNrTWFuYWdlbWVudE92ZXJ2aWV3EikubW9hdC52MS5HZXRUYXNrTWFuYWdl'
    'bWVudE92ZXJ2aWV3UmVxdWVzdBofLm1vYXQudjEuVGFza01hbmFnZW1lbnRPdmVydmlldxJpCh'
    'ZHZXRBdHRhY2htZW50VXBsb2FkVXJsEiYubW9hdC52MS5HZXRBdHRhY2htZW50VXBsb2FkVXJs'
    'UmVxdWVzdBonLm1vYXQudjEuR2V0QXR0YWNobWVudFVwbG9hZFVybFJlc3BvbnNlElsKF0Nvbm'
    'Zpcm1BdHRhY2htZW50VXBsb2FkEicubW9hdC52MS5Db25maXJtQXR0YWNobWVudFVwbG9hZFJl'
    'cXVlc3QaFy5tb2F0LnYxLlRhc2tBdHRhY2htZW50EmAKE0xpc3RUYXNrQXR0YWNobWVudHMSIy'
    '5tb2F0LnYxLkxpc3RUYXNrQXR0YWNobWVudHNSZXF1ZXN0GiQubW9hdC52MS5MaXN0VGFza0F0'
    'dGFjaG1lbnRzUmVzcG9uc2USVwoQRGVsZXRlQXR0YWNobWVudBIgLm1vYXQudjEuRGVsZXRlQX'
    'R0YWNobWVudFJlcXVlc3QaIS5tb2F0LnYxLkRlbGV0ZUF0dGFjaG1lbnRSZXNwb25zZRJNChBV'
    'cGRhdGVBdHRhY2htZW50EiAubW9hdC52MS5VcGRhdGVBdHRhY2htZW50UmVxdWVzdBoXLm1vYX'
    'QudjEuVGFza0F0dGFjaG1lbnQSdwodR2V0VGFza0RlZkF0dGFjaG1lbnRVcGxvYWRVcmwSLS5t'
    'b2F0LnYxLkdldFRhc2tEZWZBdHRhY2htZW50VXBsb2FkVXJsUmVxdWVzdBonLm1vYXQudjEuR2'
    'V0QXR0YWNobWVudFVwbG9hZFVybFJlc3BvbnNlEmkKHkNvbmZpcm1UYXNrRGVmQXR0YWNobWVu'
    'dFVwbG9hZBIuLm1vYXQudjEuQ29uZmlybVRhc2tEZWZBdHRhY2htZW50VXBsb2FkUmVxdWVzdB'
    'oXLm1vYXQudjEuVGFza0F0dGFjaG1lbnQSZgoWTGlzdFRhc2tEZWZBdHRhY2htZW50cxImLm1v'
    'YXQudjEuTGlzdFRhc2tEZWZBdHRhY2htZW50c1JlcXVlc3QaJC5tb2F0LnYxLkxpc3RUYXNrQX'
    'R0YWNobWVudHNSZXNwb25zZRJlChdEZWxldGVUYXNrRGVmQXR0YWNobWVudBInLm1vYXQudjEu'
    'RGVsZXRlVGFza0RlZkF0dGFjaG1lbnRSZXF1ZXN0GiEubW9hdC52MS5EZWxldGVBdHRhY2htZW'
    '50UmVzcG9uc2USaQoWVmFsaWRhdGVSZWN1cnJlbmNlUnVsZRImLm1vYXQudjEuVmFsaWRhdGVS'
    'ZWN1cnJlbmNlUnVsZVJlcXVlc3QaJy5tb2F0LnYxLlZhbGlkYXRlUmVjdXJyZW5jZVJ1bGVSZX'
    'Nwb25zZRJ7ChxQcmV2aWV3UmVjdXJyZW5jZU9jY3VycmVuY2VzEiwubW9hdC52MS5QcmV2aWV3'
    'UmVjdXJyZW5jZU9jY3VycmVuY2VzUmVxdWVzdBotLm1vYXQudjEuUHJldmlld1JlY3VycmVuY2'
    'VPY2N1cnJlbmNlc1Jlc3BvbnNlEmMKFENyZWF0ZVJlY3VycmVuY2VSdWxlEiQubW9hdC52MS5D'
    'cmVhdGVSZWN1cnJlbmNlUnVsZVJlcXVlc3QaJS5tb2F0LnYxLkNyZWF0ZVJlY3VycmVuY2VSdW'
    'xlUmVzcG9uc2USXQoSQnVsa0NyZWF0ZVRhc2tEZWZzEiIubW9hdC52MS5CdWxrQ3JlYXRlVGFz'
    'a0RlZnNSZXF1ZXN0GiMubW9hdC52MS5CdWxrQ3JlYXRlVGFza0RlZnNSZXNwb25zZRJdChJCdW'
    'xrVXBkYXRlVGFza0RlZnMSIi5tb2F0LnYxLkJ1bGtVcGRhdGVUYXNrRGVmc1JlcXVlc3QaIy5t'
    'b2F0LnYxLkJ1bGtVcGRhdGVUYXNrRGVmc1Jlc3BvbnNlEl0KEkJ1bGtEZWxldGVUYXNrRGVmcx'
    'IiLm1vYXQudjEuQnVsa0RlbGV0ZVRhc2tEZWZzUmVxdWVzdBojLm1vYXQudjEuQnVsa0RlbGV0'
    'ZVRhc2tEZWZzUmVzcG9uc2USYwoUQnVsa1VwZGF0ZVRhc2tTdGF0dXMSJC5tb2F0LnYxLkJ1bG'
    'tVcGRhdGVUYXNrU3RhdHVzUmVxdWVzdBolLm1vYXQudjEuQnVsa1VwZGF0ZVRhc2tTdGF0dXNS'
    'ZXNwb25zZRJaChFHZXRUYXNrRGVmSGlzdG9yeRIhLm1vYXQudjEuR2V0VGFza0RlZkhpc3Rvcn'
    'lSZXF1ZXN0GiIubW9hdC52MS5HZXRUYXNrRGVmSGlzdG9yeVJlc3BvbnNl');

