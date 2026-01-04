//
//  Generated code. Do not modify.
//  source: moat/v1/warranty_coverage.proto
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

@$core.Deprecated('Use warrantyCoverageDescriptor instead')
const WarrantyCoverage$json = {
  '1': 'WarrantyCoverage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'asset_id', '3': 2, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'company_id', '3': 3, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    {'1': 'expiration_in_months', '3': 6, '4': 1, '5': 5, '10': 'expirationInMonths'},
    {'1': 'page_number', '3': 7, '4': 1, '5': 5, '10': 'pageNumber'},
    {'1': 'file_id', '3': 8, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'details', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'details'},
    {'1': 'start_date', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startDate'},
    {'1': 'end_date', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endDate'},
    {'1': 'status', '3': 12, '4': 1, '5': 9, '10': 'status'},
    {'1': 'is_expired', '3': 13, '4': 1, '5': 8, '10': 'isExpired'},
    {'1': 'days_remaining', '3': 14, '4': 1, '5': 5, '10': 'daysRemaining'},
    {'1': 'created_at', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 16, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `WarrantyCoverage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List warrantyCoverageDescriptor = $convert.base64Decode(
    'ChBXYXJyYW50eUNvdmVyYWdlEg4KAmlkGAEgASgJUgJpZBIZCghhc3NldF9pZBgCIAEoCVIHYX'
    'NzZXRJZBIdCgpjb21wYW55X2lkGAMgASgJUgljb21wYW55SWQSEgoEbmFtZRgEIAEoCVIEbmFt'
    'ZRIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZGVzY3JpcHRpb24SMAoUZXhwaXJhdGlvbl9pbl9tb2'
    '50aHMYBiABKAVSEmV4cGlyYXRpb25Jbk1vbnRocxIfCgtwYWdlX251bWJlchgHIAEoBVIKcGFn'
    'ZU51bWJlchIXCgdmaWxlX2lkGAggASgJUgZmaWxlSWQSMQoHZGV0YWlscxgJIAEoCzIXLmdvb2'
    'dsZS5wcm90b2J1Zi5TdHJ1Y3RSB2RldGFpbHMSOQoKc3RhcnRfZGF0ZRgKIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0YXJ0RGF0ZRI1CghlbmRfZGF0ZRgLIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2VuZERhdGUSFgoGc3RhdHVzGAwgASgJUgZzdGF0dXMS'
    'HQoKaXNfZXhwaXJlZBgNIAEoCFIJaXNFeHBpcmVkEiUKDmRheXNfcmVtYWluaW5nGA4gASgFUg'
    '1kYXlzUmVtYWluaW5nEjkKCmNyZWF0ZWRfYXQYDyABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgQIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use getWarrantyCoverageRequestDescriptor instead')
const GetWarrantyCoverageRequest$json = {
  '1': 'GetWarrantyCoverageRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetWarrantyCoverageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWarrantyCoverageRequestDescriptor = $convert.base64Decode(
    'ChpHZXRXYXJyYW50eUNvdmVyYWdlUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use listWarrantyCoveragesRequestDescriptor instead')
const ListWarrantyCoveragesRequest$json = {
  '1': 'ListWarrantyCoveragesRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `ListWarrantyCoveragesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listWarrantyCoveragesRequestDescriptor = $convert.base64Decode(
    'ChxMaXN0V2FycmFudHlDb3ZlcmFnZXNSZXF1ZXN0EhkKCGFzc2V0X2lkGAEgASgJUgdhc3NldE'
    'lkEhYKBnN0YXR1cxgCIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use listWarrantyCoveragesResponseDescriptor instead')
const ListWarrantyCoveragesResponse$json = {
  '1': 'ListWarrantyCoveragesResponse',
  '2': [
    {'1': 'coverages', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.WarrantyCoverage', '10': 'coverages'},
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `ListWarrantyCoveragesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listWarrantyCoveragesResponseDescriptor = $convert.base64Decode(
    'Ch1MaXN0V2FycmFudHlDb3ZlcmFnZXNSZXNwb25zZRI3Cgljb3ZlcmFnZXMYASADKAsyGS5tb2'
    'F0LnYxLldhcnJhbnR5Q292ZXJhZ2VSCWNvdmVyYWdlcxIfCgt0b3RhbF9jb3VudBgCIAEoBVIK'
    'dG90YWxDb3VudA==');

@$core.Deprecated('Use createWarrantyCoverageRequestDescriptor instead')
const CreateWarrantyCoverageRequest$json = {
  '1': 'CreateWarrantyCoverageRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'expiration_in_months', '3': 4, '4': 1, '5': 5, '10': 'expirationInMonths'},
    {'1': 'page_number', '3': 5, '4': 1, '5': 5, '10': 'pageNumber'},
    {'1': 'file_id', '3': 6, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'details', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'details'},
  ],
};

/// Descriptor for `CreateWarrantyCoverageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createWarrantyCoverageRequestDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVXYXJyYW50eUNvdmVyYWdlUmVxdWVzdBIZCghhc3NldF9pZBgBIAEoCVIHYXNzZX'
    'RJZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlv'
    'bhIwChRleHBpcmF0aW9uX2luX21vbnRocxgEIAEoBVISZXhwaXJhdGlvbkluTW9udGhzEh8KC3'
    'BhZ2VfbnVtYmVyGAUgASgFUgpwYWdlTnVtYmVyEhcKB2ZpbGVfaWQYBiABKAlSBmZpbGVJZBIx'
    'CgdkZXRhaWxzGAcgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFIHZGV0YWlscw==');

@$core.Deprecated('Use updateWarrantyCoverageRequestDescriptor instead')
const UpdateWarrantyCoverageRequest$json = {
  '1': 'UpdateWarrantyCoverageRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    {'1': 'expiration_in_months', '3': 4, '4': 1, '5': 5, '9': 2, '10': 'expirationInMonths', '17': true},
    {'1': 'page_number', '3': 5, '4': 1, '5': 5, '9': 3, '10': 'pageNumber', '17': true},
    {'1': 'file_id', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'fileId', '17': true},
    {'1': 'details', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '9': 5, '10': 'details', '17': true},
    {'1': 'update_file_all', '3': 8, '4': 1, '5': 8, '10': 'updateFileAll'},
  ],
  '8': [
    {'1': '_name'},
    {'1': '_description'},
    {'1': '_expiration_in_months'},
    {'1': '_page_number'},
    {'1': '_file_id'},
    {'1': '_details'},
  ],
};

/// Descriptor for `UpdateWarrantyCoverageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWarrantyCoverageRequestDescriptor = $convert.base64Decode(
    'Ch1VcGRhdGVXYXJyYW50eUNvdmVyYWdlUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSFwoEbmFtZR'
    'gCIAEoCUgAUgRuYW1liAEBEiUKC2Rlc2NyaXB0aW9uGAMgASgJSAFSC2Rlc2NyaXB0aW9uiAEB'
    'EjUKFGV4cGlyYXRpb25faW5fbW9udGhzGAQgASgFSAJSEmV4cGlyYXRpb25Jbk1vbnRoc4gBAR'
    'IkCgtwYWdlX251bWJlchgFIAEoBUgDUgpwYWdlTnVtYmVyiAEBEhwKB2ZpbGVfaWQYBiABKAlI'
    'BFIGZmlsZUlkiAEBEjYKB2RldGFpbHMYByABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0SA'
    'VSB2RldGFpbHOIAQESJgoPdXBkYXRlX2ZpbGVfYWxsGAggASgIUg11cGRhdGVGaWxlQWxsQgcK'
    'BV9uYW1lQg4KDF9kZXNjcmlwdGlvbkIXChVfZXhwaXJhdGlvbl9pbl9tb250aHNCDgoMX3BhZ2'
    'VfbnVtYmVyQgoKCF9maWxlX2lkQgoKCF9kZXRhaWxz');

@$core.Deprecated('Use deleteWarrantyCoverageRequestDescriptor instead')
const DeleteWarrantyCoverageRequest$json = {
  '1': 'DeleteWarrantyCoverageRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `DeleteWarrantyCoverageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteWarrantyCoverageRequestDescriptor = $convert.base64Decode(
    'Ch1EZWxldGVXYXJyYW50eUNvdmVyYWdlUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSFgoGcmVhc2'
    '9uGAIgASgJUgZyZWFzb24=');

@$core.Deprecated('Use deleteWarrantyCoverageResponseDescriptor instead')
const DeleteWarrantyCoverageResponse$json = {
  '1': 'DeleteWarrantyCoverageResponse',
};

/// Descriptor for `DeleteWarrantyCoverageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteWarrantyCoverageResponseDescriptor = $convert.base64Decode(
    'Ch5EZWxldGVXYXJyYW50eUNvdmVyYWdlUmVzcG9uc2U=');

@$core.Deprecated('Use warrantyCoverageHistoryDescriptor instead')
const WarrantyCoverageHistory$json = {
  '1': 'WarrantyCoverageHistory',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'coverage_id', '3': 2, '4': 1, '5': 9, '10': 'coverageId'},
    {'1': 'asset_id', '3': 3, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    {'1': 'user_id', '3': 6, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'user_name', '3': 7, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `WarrantyCoverageHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List warrantyCoverageHistoryDescriptor = $convert.base64Decode(
    'ChdXYXJyYW50eUNvdmVyYWdlSGlzdG9yeRIOCgJpZBgBIAEoCVICaWQSHwoLY292ZXJhZ2VfaW'
    'QYAiABKAlSCmNvdmVyYWdlSWQSGQoIYXNzZXRfaWQYAyABKAlSB2Fzc2V0SWQSEgoEdHlwZRgE'
    'IAEoCVIEdHlwZRIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZGVzY3JpcHRpb24SFwoHdXNlcl9pZB'
    'gGIAEoCVIGdXNlcklkEhsKCXVzZXJfbmFtZRgHIAEoCVIIdXNlck5hbWUSOQoKY3JlYXRlZF9h'
    'dBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use addCoverageHistoryRequestDescriptor instead')
const AddCoverageHistoryRequest$json = {
  '1': 'AddCoverageHistoryRequest',
  '2': [
    {'1': 'coverage_id', '3': 1, '4': 1, '5': 9, '10': 'coverageId'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `AddCoverageHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCoverageHistoryRequestDescriptor = $convert.base64Decode(
    'ChlBZGRDb3ZlcmFnZUhpc3RvcnlSZXF1ZXN0Eh8KC2NvdmVyYWdlX2lkGAEgASgJUgpjb3Zlcm'
    'FnZUlkEhIKBHR5cGUYAiABKAlSBHR5cGUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0'
    'aW9u');

@$core.Deprecated('Use getCoverageHistoryRequestDescriptor instead')
const GetCoverageHistoryRequest$json = {
  '1': 'GetCoverageHistoryRequest',
  '2': [
    {'1': 'coverage_id', '3': 1, '4': 1, '5': 9, '10': 'coverageId'},
  ],
};

/// Descriptor for `GetCoverageHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCoverageHistoryRequestDescriptor = $convert.base64Decode(
    'ChlHZXRDb3ZlcmFnZUhpc3RvcnlSZXF1ZXN0Eh8KC2NvdmVyYWdlX2lkGAEgASgJUgpjb3Zlcm'
    'FnZUlk');

@$core.Deprecated('Use getCoverageHistoryResponseDescriptor instead')
const GetCoverageHistoryResponse$json = {
  '1': 'GetCoverageHistoryResponse',
  '2': [
    {'1': 'history', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.WarrantyCoverageHistory', '10': 'history'},
  ],
};

/// Descriptor for `GetCoverageHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCoverageHistoryResponseDescriptor = $convert.base64Decode(
    'ChpHZXRDb3ZlcmFnZUhpc3RvcnlSZXNwb25zZRI6CgdoaXN0b3J5GAEgAygLMiAubW9hdC52MS'
    '5XYXJyYW50eUNvdmVyYWdlSGlzdG9yeVIHaGlzdG9yeQ==');

const $core.Map<$core.String, $core.dynamic> WarrantyCoverageServiceBase$json = {
  '1': 'WarrantyCoverageService',
  '2': [
    {'1': 'GetWarrantyCoverage', '2': '.moat.v1.GetWarrantyCoverageRequest', '3': '.moat.v1.WarrantyCoverage'},
    {'1': 'ListWarrantyCoverages', '2': '.moat.v1.ListWarrantyCoveragesRequest', '3': '.moat.v1.ListWarrantyCoveragesResponse'},
    {'1': 'CreateWarrantyCoverage', '2': '.moat.v1.CreateWarrantyCoverageRequest', '3': '.moat.v1.WarrantyCoverage'},
    {'1': 'UpdateWarrantyCoverage', '2': '.moat.v1.UpdateWarrantyCoverageRequest', '3': '.moat.v1.WarrantyCoverage'},
    {'1': 'DeleteWarrantyCoverage', '2': '.moat.v1.DeleteWarrantyCoverageRequest', '3': '.moat.v1.DeleteWarrantyCoverageResponse'},
    {'1': 'AddCoverageHistory', '2': '.moat.v1.AddCoverageHistoryRequest', '3': '.moat.v1.WarrantyCoverageHistory'},
    {'1': 'GetCoverageHistory', '2': '.moat.v1.GetCoverageHistoryRequest', '3': '.moat.v1.GetCoverageHistoryResponse'},
  ],
};

@$core.Deprecated('Use warrantyCoverageServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> WarrantyCoverageServiceBase$messageJson = {
  '.moat.v1.GetWarrantyCoverageRequest': GetWarrantyCoverageRequest$json,
  '.moat.v1.WarrantyCoverage': WarrantyCoverage$json,
  '.google.protobuf.Struct': $3.Struct$json,
  '.google.protobuf.Struct.FieldsEntry': $3.Struct_FieldsEntry$json,
  '.google.protobuf.Value': $3.Value$json,
  '.google.protobuf.ListValue': $3.ListValue$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.moat.v1.ListWarrantyCoveragesRequest': ListWarrantyCoveragesRequest$json,
  '.moat.v1.ListWarrantyCoveragesResponse': ListWarrantyCoveragesResponse$json,
  '.moat.v1.CreateWarrantyCoverageRequest': CreateWarrantyCoverageRequest$json,
  '.moat.v1.UpdateWarrantyCoverageRequest': UpdateWarrantyCoverageRequest$json,
  '.moat.v1.DeleteWarrantyCoverageRequest': DeleteWarrantyCoverageRequest$json,
  '.moat.v1.DeleteWarrantyCoverageResponse': DeleteWarrantyCoverageResponse$json,
  '.moat.v1.AddCoverageHistoryRequest': AddCoverageHistoryRequest$json,
  '.moat.v1.WarrantyCoverageHistory': WarrantyCoverageHistory$json,
  '.moat.v1.GetCoverageHistoryRequest': GetCoverageHistoryRequest$json,
  '.moat.v1.GetCoverageHistoryResponse': GetCoverageHistoryResponse$json,
};

/// Descriptor for `WarrantyCoverageService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List warrantyCoverageServiceDescriptor = $convert.base64Decode(
    'ChdXYXJyYW50eUNvdmVyYWdlU2VydmljZRJVChNHZXRXYXJyYW50eUNvdmVyYWdlEiMubW9hdC'
    '52MS5HZXRXYXJyYW50eUNvdmVyYWdlUmVxdWVzdBoZLm1vYXQudjEuV2FycmFudHlDb3ZlcmFn'
    'ZRJmChVMaXN0V2FycmFudHlDb3ZlcmFnZXMSJS5tb2F0LnYxLkxpc3RXYXJyYW50eUNvdmVyYW'
    'dlc1JlcXVlc3QaJi5tb2F0LnYxLkxpc3RXYXJyYW50eUNvdmVyYWdlc1Jlc3BvbnNlElsKFkNy'
    'ZWF0ZVdhcnJhbnR5Q292ZXJhZ2USJi5tb2F0LnYxLkNyZWF0ZVdhcnJhbnR5Q292ZXJhZ2VSZX'
    'F1ZXN0GhkubW9hdC52MS5XYXJyYW50eUNvdmVyYWdlElsKFlVwZGF0ZVdhcnJhbnR5Q292ZXJh'
    'Z2USJi5tb2F0LnYxLlVwZGF0ZVdhcnJhbnR5Q292ZXJhZ2VSZXF1ZXN0GhkubW9hdC52MS5XYX'
    'JyYW50eUNvdmVyYWdlEmkKFkRlbGV0ZVdhcnJhbnR5Q292ZXJhZ2USJi5tb2F0LnYxLkRlbGV0'
    'ZVdhcnJhbnR5Q292ZXJhZ2VSZXF1ZXN0GicubW9hdC52MS5EZWxldGVXYXJyYW50eUNvdmVyYW'
    'dlUmVzcG9uc2USWgoSQWRkQ292ZXJhZ2VIaXN0b3J5EiIubW9hdC52MS5BZGRDb3ZlcmFnZUhp'
    'c3RvcnlSZXF1ZXN0GiAubW9hdC52MS5XYXJyYW50eUNvdmVyYWdlSGlzdG9yeRJdChJHZXRDb3'
    'ZlcmFnZUhpc3RvcnkSIi5tb2F0LnYxLkdldENvdmVyYWdlSGlzdG9yeVJlcXVlc3QaIy5tb2F0'
    'LnYxLkdldENvdmVyYWdlSGlzdG9yeVJlc3BvbnNl');

