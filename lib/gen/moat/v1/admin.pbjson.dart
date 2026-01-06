//
//  Generated code. Do not modify.
//  source: moat/v1/admin.proto
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

@$core.Deprecated('Use promptCategoryDescriptor instead')
const PromptCategory$json = {
  '1': 'PromptCategory',
  '2': [
    {'1': 'PROMPT_CATEGORY_UNSPECIFIED', '2': 0},
    {'1': 'PROMPT_CATEGORY_EXTRACTION', '2': 1},
    {'1': 'PROMPT_CATEGORY_ANALYSIS', '2': 2},
    {'1': 'PROMPT_CATEGORY_GENERATION', '2': 3},
    {'1': 'PROMPT_CATEGORY_CLASSIFICATION', '2': 4},
  ],
};

/// Descriptor for `PromptCategory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List promptCategoryDescriptor = $convert.base64Decode(
    'Cg5Qcm9tcHRDYXRlZ29yeRIfChtQUk9NUFRfQ0FURUdPUllfVU5TUEVDSUZJRUQQABIeChpQUk'
    '9NUFRfQ0FURUdPUllfRVhUUkFDVElPThABEhwKGFBST01QVF9DQVRFR09SWV9BTkFMWVNJUxAC'
    'Eh4KGlBST01QVF9DQVRFR09SWV9HRU5FUkFUSU9OEAMSIgoeUFJPTVBUX0NBVEVHT1JZX0NMQV'
    'NTSUZJQ0FUSU9OEAQ=');

@$core.Deprecated('Use environmentDescriptor instead')
const Environment$json = {
  '1': 'Environment',
  '2': [
    {'1': 'ENVIRONMENT_UNSPECIFIED', '2': 0},
    {'1': 'ENVIRONMENT_DEVELOPMENT', '2': 1},
    {'1': 'ENVIRONMENT_STAGING', '2': 2},
    {'1': 'ENVIRONMENT_PRODUCTION', '2': 3},
  ],
};

/// Descriptor for `Environment`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List environmentDescriptor = $convert.base64Decode(
    'CgtFbnZpcm9ubWVudBIbChdFTlZJUk9OTUVOVF9VTlNQRUNJRklFRBAAEhsKF0VOVklST05NRU'
    '5UX0RFVkVMT1BNRU5UEAESFwoTRU5WSVJPTk1FTlRfU1RBR0lORxACEhoKFkVOVklST05NRU5U'
    'X1BST0RVQ1RJT04QAw==');

@$core.Deprecated('Use sSODomainDescriptor instead')
const SSODomain$json = {
  '1': 'SSODomain',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'domain', '3': 2, '4': 1, '5': 9, '10': 'domain'},
    {'1': 'company_id', '3': 3, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'company_name', '3': 4, '4': 1, '5': 9, '10': 'companyName'},
    {'1': 'allowed_auth_providers', '3': 5, '4': 3, '5': 9, '10': 'allowedAuthProviders'},
    {'1': 'auto_join_enabled', '3': 6, '4': 1, '5': 8, '10': 'autoJoinEnabled'},
    {'1': 'default_role_id', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'defaultRoleId', '17': true},
    {'1': 'default_role_name', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'defaultRoleName', '17': true},
    {'1': 'created_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '8': [
    {'1': '_default_role_id'},
    {'1': '_default_role_name'},
  ],
};

/// Descriptor for `SSODomain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sSODomainDescriptor = $convert.base64Decode(
    'CglTU09Eb21haW4SDgoCaWQYASABKAlSAmlkEhYKBmRvbWFpbhgCIAEoCVIGZG9tYWluEh0KCm'
    'NvbXBhbnlfaWQYAyABKAlSCWNvbXBhbnlJZBIhCgxjb21wYW55X25hbWUYBCABKAlSC2NvbXBh'
    'bnlOYW1lEjQKFmFsbG93ZWRfYXV0aF9wcm92aWRlcnMYBSADKAlSFGFsbG93ZWRBdXRoUHJvdm'
    'lkZXJzEioKEWF1dG9fam9pbl9lbmFibGVkGAYgASgIUg9hdXRvSm9pbkVuYWJsZWQSKwoPZGVm'
    'YXVsdF9yb2xlX2lkGAcgASgJSABSDWRlZmF1bHRSb2xlSWSIAQESLwoRZGVmYXVsdF9yb2xlX2'
    '5hbWUYCCABKAlIAVIPZGVmYXVsdFJvbGVOYW1liAEBEjkKCmNyZWF0ZWRfYXQYCSABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgKIAEoCz'
    'IaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdEISChBfZGVmYXVsdF9yb2xl'
    'X2lkQhQKEl9kZWZhdWx0X3JvbGVfbmFtZQ==');

@$core.Deprecated('Use listSSODomainsRequestDescriptor instead')
const ListSSODomainsRequest$json = {
  '1': 'ListSSODomainsRequest',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'companyId', '17': true},
  ],
  '8': [
    {'1': '_company_id'},
  ],
};

/// Descriptor for `ListSSODomainsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSSODomainsRequestDescriptor = $convert.base64Decode(
    'ChVMaXN0U1NPRG9tYWluc1JlcXVlc3QSIgoKY29tcGFueV9pZBgBIAEoCUgAUgljb21wYW55SW'
    'SIAQFCDQoLX2NvbXBhbnlfaWQ=');

@$core.Deprecated('Use listSSODomainsResponseDescriptor instead')
const ListSSODomainsResponse$json = {
  '1': 'ListSSODomainsResponse',
  '2': [
    {'1': 'domains', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.SSODomain', '10': 'domains'},
  ],
};

/// Descriptor for `ListSSODomainsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSSODomainsResponseDescriptor = $convert.base64Decode(
    'ChZMaXN0U1NPRG9tYWluc1Jlc3BvbnNlEiwKB2RvbWFpbnMYASADKAsyEi5tb2F0LnYxLlNTT0'
    'RvbWFpblIHZG9tYWlucw==');

@$core.Deprecated('Use getSSODomainRequestDescriptor instead')
const GetSSODomainRequest$json = {
  '1': 'GetSSODomainRequest',
  '2': [
    {'1': 'domain_id', '3': 1, '4': 1, '5': 9, '10': 'domainId'},
  ],
};

/// Descriptor for `GetSSODomainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSSODomainRequestDescriptor = $convert.base64Decode(
    'ChNHZXRTU09Eb21haW5SZXF1ZXN0EhsKCWRvbWFpbl9pZBgBIAEoCVIIZG9tYWluSWQ=');

@$core.Deprecated('Use createSSODomainRequestDescriptor instead')
const CreateSSODomainRequest$json = {
  '1': 'CreateSSODomainRequest',
  '2': [
    {'1': 'domain', '3': 1, '4': 1, '5': 9, '10': 'domain'},
    {'1': 'company_id', '3': 2, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'allowed_auth_providers', '3': 3, '4': 3, '5': 9, '10': 'allowedAuthProviders'},
    {'1': 'auto_join_enabled', '3': 4, '4': 1, '5': 8, '10': 'autoJoinEnabled'},
    {'1': 'default_role_id', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'defaultRoleId', '17': true},
  ],
  '8': [
    {'1': '_default_role_id'},
  ],
};

/// Descriptor for `CreateSSODomainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSSODomainRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVTU09Eb21haW5SZXF1ZXN0EhYKBmRvbWFpbhgBIAEoCVIGZG9tYWluEh0KCmNvbX'
    'BhbnlfaWQYAiABKAlSCWNvbXBhbnlJZBI0ChZhbGxvd2VkX2F1dGhfcHJvdmlkZXJzGAMgAygJ'
    'UhRhbGxvd2VkQXV0aFByb3ZpZGVycxIqChFhdXRvX2pvaW5fZW5hYmxlZBgEIAEoCFIPYXV0b0'
    'pvaW5FbmFibGVkEisKD2RlZmF1bHRfcm9sZV9pZBgFIAEoCUgAUg1kZWZhdWx0Um9sZUlkiAEB'
    'QhIKEF9kZWZhdWx0X3JvbGVfaWQ=');

@$core.Deprecated('Use updateSSODomainRequestDescriptor instead')
const UpdateSSODomainRequest$json = {
  '1': 'UpdateSSODomainRequest',
  '2': [
    {'1': 'domain_id', '3': 1, '4': 1, '5': 9, '10': 'domainId'},
    {'1': 'domain', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'domain', '17': true},
    {'1': 'allowed_auth_providers', '3': 3, '4': 3, '5': 9, '10': 'allowedAuthProviders'},
    {'1': 'auto_join_enabled', '3': 4, '4': 1, '5': 8, '9': 1, '10': 'autoJoinEnabled', '17': true},
    {'1': 'default_role_id', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'defaultRoleId', '17': true},
  ],
  '8': [
    {'1': '_domain'},
    {'1': '_auto_join_enabled'},
    {'1': '_default_role_id'},
  ],
};

/// Descriptor for `UpdateSSODomainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSSODomainRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVTU09Eb21haW5SZXF1ZXN0EhsKCWRvbWFpbl9pZBgBIAEoCVIIZG9tYWluSWQSGw'
    'oGZG9tYWluGAIgASgJSABSBmRvbWFpbogBARI0ChZhbGxvd2VkX2F1dGhfcHJvdmlkZXJzGAMg'
    'AygJUhRhbGxvd2VkQXV0aFByb3ZpZGVycxIvChFhdXRvX2pvaW5fZW5hYmxlZBgEIAEoCEgBUg'
    '9hdXRvSm9pbkVuYWJsZWSIAQESKwoPZGVmYXVsdF9yb2xlX2lkGAUgASgJSAJSDWRlZmF1bHRS'
    'b2xlSWSIAQFCCQoHX2RvbWFpbkIUChJfYXV0b19qb2luX2VuYWJsZWRCEgoQX2RlZmF1bHRfcm'
    '9sZV9pZA==');

@$core.Deprecated('Use deleteSSODomainRequestDescriptor instead')
const DeleteSSODomainRequest$json = {
  '1': 'DeleteSSODomainRequest',
  '2': [
    {'1': 'domain_id', '3': 1, '4': 1, '5': 9, '10': 'domainId'},
  ],
};

/// Descriptor for `DeleteSSODomainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSSODomainRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVTU09Eb21haW5SZXF1ZXN0EhsKCWRvbWFpbl9pZBgBIAEoCVIIZG9tYWluSWQ=');

@$core.Deprecated('Use deleteSSODomainResponseDescriptor instead')
const DeleteSSODomainResponse$json = {
  '1': 'DeleteSSODomainResponse',
};

/// Descriptor for `DeleteSSODomainResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSSODomainResponseDescriptor = $convert.base64Decode(
    'ChdEZWxldGVTU09Eb21haW5SZXNwb25zZQ==');

@$core.Deprecated('Use promptTemplateDescriptor instead')
const PromptTemplate$json = {
  '1': 'PromptTemplate',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'category', '3': 5, '4': 1, '5': 14, '6': '.moat.v1.PromptCategory', '10': 'category'},
    {'1': 'version_count', '3': 6, '4': 1, '5': 5, '10': 'versionCount'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '8': [
    {'1': '_description'},
  ],
};

/// Descriptor for `PromptTemplate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promptTemplateDescriptor = $convert.base64Decode(
    'Cg5Qcm9tcHRUZW1wbGF0ZRIOCgJpZBgBIAEoCVICaWQSEAoDa2V5GAIgASgJUgNrZXkSEgoEbm'
    'FtZRgDIAEoCVIEbmFtZRIlCgtkZXNjcmlwdGlvbhgEIAEoCUgAUgtkZXNjcmlwdGlvbogBARIz'
    'CghjYXRlZ29yeRgFIAEoDjIXLm1vYXQudjEuUHJvbXB0Q2F0ZWdvcnlSCGNhdGVnb3J5EiMKDX'
    'ZlcnNpb25fY291bnQYBiABKAVSDHZlcnNpb25Db3VudBI5CgpjcmVhdGVkX2F0GAcgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYCCABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXRCDgoMX2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use promptVersionDescriptor instead')
const PromptVersion$json = {
  '1': 'PromptVersion',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'template_id', '3': 2, '4': 1, '5': 9, '10': 'templateId'},
    {'1': 'version', '3': 3, '4': 1, '5': 5, '10': 'version'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'active_environments', '3': 5, '4': 3, '5': 14, '6': '.moat.v1.Environment', '10': 'activeEnvironments'},
    {'1': 'notes', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'notes', '17': true},
    {'1': 'model_name', '3': 7, '4': 1, '5': 9, '9': 1, '10': 'modelName', '17': true},
    {'1': 'generation_config', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'generationConfig'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'stats', '3': 10, '4': 1, '5': 11, '6': '.moat.v1.VersionStats', '9': 2, '10': 'stats', '17': true},
  ],
  '8': [
    {'1': '_notes'},
    {'1': '_model_name'},
    {'1': '_stats'},
  ],
};

/// Descriptor for `PromptVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promptVersionDescriptor = $convert.base64Decode(
    'Cg1Qcm9tcHRWZXJzaW9uEg4KAmlkGAEgASgJUgJpZBIfCgt0ZW1wbGF0ZV9pZBgCIAEoCVIKdG'
    'VtcGxhdGVJZBIYCgd2ZXJzaW9uGAMgASgFUgd2ZXJzaW9uEhgKB2NvbnRlbnQYBCABKAlSB2Nv'
    'bnRlbnQSRQoTYWN0aXZlX2Vudmlyb25tZW50cxgFIAMoDjIULm1vYXQudjEuRW52aXJvbm1lbn'
    'RSEmFjdGl2ZUVudmlyb25tZW50cxIZCgVub3RlcxgGIAEoCUgAUgVub3Rlc4gBARIiCgptb2Rl'
    'bF9uYW1lGAcgASgJSAFSCW1vZGVsTmFtZYgBARJEChFnZW5lcmF0aW9uX2NvbmZpZxgIIAEoCz'
    'IXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RSEGdlbmVyYXRpb25Db25maWcSOQoKY3JlYXRlZF9h'
    'dBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBIwCgVzdGF0cx'
    'gKIAEoCzIVLm1vYXQudjEuVmVyc2lvblN0YXRzSAJSBXN0YXRziAEBQggKBl9ub3Rlc0INCgtf'
    'bW9kZWxfbmFtZUIICgZfc3RhdHM=');

@$core.Deprecated('Use versionStatsDescriptor instead')
const VersionStats$json = {
  '1': 'VersionStats',
  '2': [
    {'1': 'total_uses', '3': 1, '4': 1, '5': 5, '10': 'totalUses'},
    {'1': 'successful', '3': 2, '4': 1, '5': 5, '10': 'successful'},
    {'1': 'failed', '3': 3, '4': 1, '5': 5, '10': 'failed'},
    {'1': 'avg_latency_ms', '3': 4, '4': 1, '5': 1, '10': 'avgLatencyMs'},
  ],
};

/// Descriptor for `VersionStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionStatsDescriptor = $convert.base64Decode(
    'CgxWZXJzaW9uU3RhdHMSHQoKdG90YWxfdXNlcxgBIAEoBVIJdG90YWxVc2VzEh4KCnN1Y2Nlc3'
    'NmdWwYAiABKAVSCnN1Y2Nlc3NmdWwSFgoGZmFpbGVkGAMgASgFUgZmYWlsZWQSJAoOYXZnX2xh'
    'dGVuY3lfbXMYBCABKAFSDGF2Z0xhdGVuY3lNcw==');

@$core.Deprecated('Use activeVersionInfoDescriptor instead')
const ActiveVersionInfo$json = {
  '1': 'ActiveVersionInfo',
  '2': [
    {'1': 'version_number', '3': 1, '4': 1, '5': 5, '10': 'versionNumber'},
    {'1': 'version_id', '3': 2, '4': 1, '5': 9, '10': 'versionId'},
  ],
};

/// Descriptor for `ActiveVersionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeVersionInfoDescriptor = $convert.base64Decode(
    'ChFBY3RpdmVWZXJzaW9uSW5mbxIlCg52ZXJzaW9uX251bWJlchgBIAEoBVINdmVyc2lvbk51bW'
    'JlchIdCgp2ZXJzaW9uX2lkGAIgASgJUgl2ZXJzaW9uSWQ=');

@$core.Deprecated('Use promptTemplateDetailDescriptor instead')
const PromptTemplateDetail$json = {
  '1': 'PromptTemplateDetail',
  '2': [
    {'1': 'template', '3': 1, '4': 1, '5': 11, '6': '.moat.v1.PromptTemplate', '10': 'template'},
    {'1': 'versions', '3': 2, '4': 3, '5': 11, '6': '.moat.v1.PromptVersion', '10': 'versions'},
    {'1': 'active_versions', '3': 3, '4': 3, '5': 11, '6': '.moat.v1.PromptTemplateDetail.ActiveVersionsEntry', '10': 'activeVersions'},
  ],
  '3': [PromptTemplateDetail_ActiveVersionsEntry$json],
};

@$core.Deprecated('Use promptTemplateDetailDescriptor instead')
const PromptTemplateDetail_ActiveVersionsEntry$json = {
  '1': 'ActiveVersionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.moat.v1.ActiveVersionInfo', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PromptTemplateDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promptTemplateDetailDescriptor = $convert.base64Decode(
    'ChRQcm9tcHRUZW1wbGF0ZURldGFpbBIzCgh0ZW1wbGF0ZRgBIAEoCzIXLm1vYXQudjEuUHJvbX'
    'B0VGVtcGxhdGVSCHRlbXBsYXRlEjIKCHZlcnNpb25zGAIgAygLMhYubW9hdC52MS5Qcm9tcHRW'
    'ZXJzaW9uUgh2ZXJzaW9ucxJaCg9hY3RpdmVfdmVyc2lvbnMYAyADKAsyMS5tb2F0LnYxLlByb2'
    '1wdFRlbXBsYXRlRGV0YWlsLkFjdGl2ZVZlcnNpb25zRW50cnlSDmFjdGl2ZVZlcnNpb25zGl0K'
    'E0FjdGl2ZVZlcnNpb25zRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSMAoFdmFsdWUYAiABKAsyGi'
    '5tb2F0LnYxLkFjdGl2ZVZlcnNpb25JbmZvUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use listPromptTemplatesRequestDescriptor instead')
const ListPromptTemplatesRequest$json = {
  '1': 'ListPromptTemplatesRequest',
  '2': [
    {'1': 'category', '3': 1, '4': 1, '5': 14, '6': '.moat.v1.PromptCategory', '9': 0, '10': 'category', '17': true},
    {'1': 'search', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'search', '17': true},
  ],
  '8': [
    {'1': '_category'},
    {'1': '_search'},
  ],
};

/// Descriptor for `ListPromptTemplatesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPromptTemplatesRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0UHJvbXB0VGVtcGxhdGVzUmVxdWVzdBI4CghjYXRlZ29yeRgBIAEoDjIXLm1vYXQudj'
    'EuUHJvbXB0Q2F0ZWdvcnlIAFIIY2F0ZWdvcnmIAQESGwoGc2VhcmNoGAIgASgJSAFSBnNlYXJj'
    'aIgBAUILCglfY2F0ZWdvcnlCCQoHX3NlYXJjaA==');

@$core.Deprecated('Use listPromptTemplatesResponseDescriptor instead')
const ListPromptTemplatesResponse$json = {
  '1': 'ListPromptTemplatesResponse',
  '2': [
    {'1': 'templates', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.PromptTemplate', '10': 'templates'},
  ],
};

/// Descriptor for `ListPromptTemplatesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPromptTemplatesResponseDescriptor = $convert.base64Decode(
    'ChtMaXN0UHJvbXB0VGVtcGxhdGVzUmVzcG9uc2USNQoJdGVtcGxhdGVzGAEgAygLMhcubW9hdC'
    '52MS5Qcm9tcHRUZW1wbGF0ZVIJdGVtcGxhdGVz');

@$core.Deprecated('Use getPromptTemplateRequestDescriptor instead')
const GetPromptTemplateRequest$json = {
  '1': 'GetPromptTemplateRequest',
  '2': [
    {'1': 'template_id', '3': 1, '4': 1, '5': 9, '10': 'templateId'},
  ],
};

/// Descriptor for `GetPromptTemplateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPromptTemplateRequestDescriptor = $convert.base64Decode(
    'ChhHZXRQcm9tcHRUZW1wbGF0ZVJlcXVlc3QSHwoLdGVtcGxhdGVfaWQYASABKAlSCnRlbXBsYX'
    'RlSWQ=');

@$core.Deprecated('Use createPromptTemplateRequestDescriptor instead')
const CreatePromptTemplateRequest$json = {
  '1': 'CreatePromptTemplateRequest',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'category', '3': 4, '4': 1, '5': 14, '6': '.moat.v1.PromptCategory', '10': 'category'},
    {'1': 'initial_content', '3': 5, '4': 1, '5': 9, '10': 'initialContent'},
  ],
  '8': [
    {'1': '_description'},
  ],
};

/// Descriptor for `CreatePromptTemplateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPromptTemplateRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVQcm9tcHRUZW1wbGF0ZVJlcXVlc3QSEAoDa2V5GAEgASgJUgNrZXkSEgoEbmFtZR'
    'gCIAEoCVIEbmFtZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgAUgtkZXNjcmlwdGlvbogBARIzCghj'
    'YXRlZ29yeRgEIAEoDjIXLm1vYXQudjEuUHJvbXB0Q2F0ZWdvcnlSCGNhdGVnb3J5EicKD2luaX'
    'RpYWxfY29udGVudBgFIAEoCVIOaW5pdGlhbENvbnRlbnRCDgoMX2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use updatePromptTemplateRequestDescriptor instead')
const UpdatePromptTemplateRequest$json = {
  '1': 'UpdatePromptTemplateRequest',
  '2': [
    {'1': 'template_id', '3': 1, '4': 1, '5': 9, '10': 'templateId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    {'1': 'category', '3': 4, '4': 1, '5': 14, '6': '.moat.v1.PromptCategory', '9': 2, '10': 'category', '17': true},
  ],
  '8': [
    {'1': '_name'},
    {'1': '_description'},
    {'1': '_category'},
  ],
};

/// Descriptor for `UpdatePromptTemplateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePromptTemplateRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVQcm9tcHRUZW1wbGF0ZVJlcXVlc3QSHwoLdGVtcGxhdGVfaWQYASABKAlSCnRlbX'
    'BsYXRlSWQSFwoEbmFtZRgCIAEoCUgAUgRuYW1liAEBEiUKC2Rlc2NyaXB0aW9uGAMgASgJSAFS'
    'C2Rlc2NyaXB0aW9uiAEBEjgKCGNhdGVnb3J5GAQgASgOMhcubW9hdC52MS5Qcm9tcHRDYXRlZ2'
    '9yeUgCUghjYXRlZ29yeYgBAUIHCgVfbmFtZUIOCgxfZGVzY3JpcHRpb25CCwoJX2NhdGVnb3J5');

@$core.Deprecated('Use deletePromptTemplateRequestDescriptor instead')
const DeletePromptTemplateRequest$json = {
  '1': 'DeletePromptTemplateRequest',
  '2': [
    {'1': 'template_id', '3': 1, '4': 1, '5': 9, '10': 'templateId'},
  ],
};

/// Descriptor for `DeletePromptTemplateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePromptTemplateRequestDescriptor = $convert.base64Decode(
    'ChtEZWxldGVQcm9tcHRUZW1wbGF0ZVJlcXVlc3QSHwoLdGVtcGxhdGVfaWQYASABKAlSCnRlbX'
    'BsYXRlSWQ=');

@$core.Deprecated('Use deletePromptTemplateResponseDescriptor instead')
const DeletePromptTemplateResponse$json = {
  '1': 'DeletePromptTemplateResponse',
};

/// Descriptor for `DeletePromptTemplateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePromptTemplateResponseDescriptor = $convert.base64Decode(
    'ChxEZWxldGVQcm9tcHRUZW1wbGF0ZVJlc3BvbnNl');

@$core.Deprecated('Use createPromptVersionRequestDescriptor instead')
const CreatePromptVersionRequest$json = {
  '1': 'CreatePromptVersionRequest',
  '2': [
    {'1': 'template_id', '3': 1, '4': 1, '5': 9, '10': 'templateId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'notes', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'notes', '17': true},
    {'1': 'model_name', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'modelName', '17': true},
    {'1': 'generation_config', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'generationConfig'},
  ],
  '8': [
    {'1': '_notes'},
    {'1': '_model_name'},
  ],
};

/// Descriptor for `CreatePromptVersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPromptVersionRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVQcm9tcHRWZXJzaW9uUmVxdWVzdBIfCgt0ZW1wbGF0ZV9pZBgBIAEoCVIKdGVtcG'
    'xhdGVJZBIYCgdjb250ZW50GAIgASgJUgdjb250ZW50EhkKBW5vdGVzGAMgASgJSABSBW5vdGVz'
    'iAEBEiIKCm1vZGVsX25hbWUYBCABKAlIAVIJbW9kZWxOYW1liAEBEkQKEWdlbmVyYXRpb25fY2'
    '9uZmlnGAUgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFIQZ2VuZXJhdGlvbkNvbmZpZ0II'
    'CgZfbm90ZXNCDQoLX21vZGVsX25hbWU=');

@$core.Deprecated('Use activatePromptVersionRequestDescriptor instead')
const ActivatePromptVersionRequest$json = {
  '1': 'ActivatePromptVersionRequest',
  '2': [
    {'1': 'template_id', '3': 1, '4': 1, '5': 9, '10': 'templateId'},
    {'1': 'version_number', '3': 2, '4': 1, '5': 5, '10': 'versionNumber'},
    {'1': 'environment', '3': 3, '4': 1, '5': 14, '6': '.moat.v1.Environment', '10': 'environment'},
  ],
};

/// Descriptor for `ActivatePromptVersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activatePromptVersionRequestDescriptor = $convert.base64Decode(
    'ChxBY3RpdmF0ZVByb21wdFZlcnNpb25SZXF1ZXN0Eh8KC3RlbXBsYXRlX2lkGAEgASgJUgp0ZW'
    '1wbGF0ZUlkEiUKDnZlcnNpb25fbnVtYmVyGAIgASgFUg12ZXJzaW9uTnVtYmVyEjYKC2Vudmly'
    'b25tZW50GAMgASgOMhQubW9hdC52MS5FbnZpcm9ubWVudFILZW52aXJvbm1lbnQ=');

@$core.Deprecated('Use activatePromptVersionResponseDescriptor instead')
const ActivatePromptVersionResponse$json = {
  '1': 'ActivatePromptVersionResponse',
};

/// Descriptor for `ActivatePromptVersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activatePromptVersionResponseDescriptor = $convert.base64Decode(
    'Ch1BY3RpdmF0ZVByb21wdFZlcnNpb25SZXNwb25zZQ==');

@$core.Deprecated('Use deactivatePromptVersionRequestDescriptor instead')
const DeactivatePromptVersionRequest$json = {
  '1': 'DeactivatePromptVersionRequest',
  '2': [
    {'1': 'template_id', '3': 1, '4': 1, '5': 9, '10': 'templateId'},
    {'1': 'version_number', '3': 2, '4': 1, '5': 5, '10': 'versionNumber'},
    {'1': 'environment', '3': 3, '4': 1, '5': 14, '6': '.moat.v1.Environment', '10': 'environment'},
  ],
};

/// Descriptor for `DeactivatePromptVersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deactivatePromptVersionRequestDescriptor = $convert.base64Decode(
    'Ch5EZWFjdGl2YXRlUHJvbXB0VmVyc2lvblJlcXVlc3QSHwoLdGVtcGxhdGVfaWQYASABKAlSCn'
    'RlbXBsYXRlSWQSJQoOdmVyc2lvbl9udW1iZXIYAiABKAVSDXZlcnNpb25OdW1iZXISNgoLZW52'
    'aXJvbm1lbnQYAyABKA4yFC5tb2F0LnYxLkVudmlyb25tZW50UgtlbnZpcm9ubWVudA==');

@$core.Deprecated('Use deactivatePromptVersionResponseDescriptor instead')
const DeactivatePromptVersionResponse$json = {
  '1': 'DeactivatePromptVersionResponse',
};

/// Descriptor for `DeactivatePromptVersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deactivatePromptVersionResponseDescriptor = $convert.base64Decode(
    'Ch9EZWFjdGl2YXRlUHJvbXB0VmVyc2lvblJlc3BvbnNl');

@$core.Deprecated('Use promotePromptVersionRequestDescriptor instead')
const PromotePromptVersionRequest$json = {
  '1': 'PromotePromptVersionRequest',
  '2': [
    {'1': 'template_id', '3': 1, '4': 1, '5': 9, '10': 'templateId'},
    {'1': 'version_number', '3': 2, '4': 1, '5': 5, '10': 'versionNumber'},
    {'1': 'from_environment', '3': 3, '4': 1, '5': 14, '6': '.moat.v1.Environment', '10': 'fromEnvironment'},
    {'1': 'to_environment', '3': 4, '4': 1, '5': 14, '6': '.moat.v1.Environment', '10': 'toEnvironment'},
  ],
};

/// Descriptor for `PromotePromptVersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promotePromptVersionRequestDescriptor = $convert.base64Decode(
    'ChtQcm9tb3RlUHJvbXB0VmVyc2lvblJlcXVlc3QSHwoLdGVtcGxhdGVfaWQYASABKAlSCnRlbX'
    'BsYXRlSWQSJQoOdmVyc2lvbl9udW1iZXIYAiABKAVSDXZlcnNpb25OdW1iZXISPwoQZnJvbV9l'
    'bnZpcm9ubWVudBgDIAEoDjIULm1vYXQudjEuRW52aXJvbm1lbnRSD2Zyb21FbnZpcm9ubWVudB'
    'I7Cg50b19lbnZpcm9ubWVudBgEIAEoDjIULm1vYXQudjEuRW52aXJvbm1lbnRSDXRvRW52aXJv'
    'bm1lbnQ=');

@$core.Deprecated('Use promotePromptVersionResponseDescriptor instead')
const PromotePromptVersionResponse$json = {
  '1': 'PromotePromptVersionResponse',
};

/// Descriptor for `PromotePromptVersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promotePromptVersionResponseDescriptor = $convert.base64Decode(
    'ChxQcm9tb3RlUHJvbXB0VmVyc2lvblJlc3BvbnNl');

@$core.Deprecated('Use tokenUsageDescriptor instead')
const TokenUsage$json = {
  '1': 'TokenUsage',
  '2': [
    {'1': 'prompt', '3': 1, '4': 1, '5': 5, '10': 'prompt'},
    {'1': 'completion', '3': 2, '4': 1, '5': 5, '10': 'completion'},
    {'1': 'total', '3': 3, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `TokenUsage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenUsageDescriptor = $convert.base64Decode(
    'CgpUb2tlblVzYWdlEhYKBnByb21wdBgBIAEoBVIGcHJvbXB0Eh4KCmNvbXBsZXRpb24YAiABKA'
    'VSCmNvbXBsZXRpb24SFAoFdG90YWwYAyABKAVSBXRvdGFs');

@$core.Deprecated('Use generationDescriptor instead')
const Generation$json = {
  '1': 'Generation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'company_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'companyId', '17': true},
    {'1': 'company_name', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'companyName', '17': true},
    {'1': 'asset_id', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'assetId', '17': true},
    {'1': 'asset_name', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'assetName', '17': true},
    {'1': 'file_id', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'fileId', '17': true},
    {'1': 'generation_type', '3': 7, '4': 1, '5': 9, '10': 'generationType'},
    {'1': 'success', '3': 8, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 9, '4': 1, '5': 9, '9': 5, '10': 'error', '17': true},
    {'1': 'status', '3': 10, '4': 1, '5': 9, '10': 'status'},
    {'1': 'latency_ms', '3': 11, '4': 1, '5': 5, '10': 'latencyMs'},
    {'1': 'tokens', '3': 12, '4': 1, '5': 11, '6': '.moat.v1.TokenUsage', '10': 'tokens'},
    {'1': 'cost_usd', '3': 13, '4': 1, '5': 1, '9': 6, '10': 'costUsd', '17': true},
    {'1': 'created_at', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'completed_at', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 7, '10': 'completedAt', '17': true},
  ],
  '8': [
    {'1': '_company_id'},
    {'1': '_company_name'},
    {'1': '_asset_id'},
    {'1': '_asset_name'},
    {'1': '_file_id'},
    {'1': '_error'},
    {'1': '_cost_usd'},
    {'1': '_completed_at'},
  ],
};

/// Descriptor for `Generation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generationDescriptor = $convert.base64Decode(
    'CgpHZW5lcmF0aW9uEg4KAmlkGAEgASgJUgJpZBIiCgpjb21wYW55X2lkGAIgASgJSABSCWNvbX'
    'BhbnlJZIgBARImCgxjb21wYW55X25hbWUYAyABKAlIAVILY29tcGFueU5hbWWIAQESHgoIYXNz'
    'ZXRfaWQYBCABKAlIAlIHYXNzZXRJZIgBARIiCgphc3NldF9uYW1lGAUgASgJSANSCWFzc2V0Tm'
    'FtZYgBARIcCgdmaWxlX2lkGAYgASgJSARSBmZpbGVJZIgBARInCg9nZW5lcmF0aW9uX3R5cGUY'
    'ByABKAlSDmdlbmVyYXRpb25UeXBlEhgKB3N1Y2Nlc3MYCCABKAhSB3N1Y2Nlc3MSGQoFZXJyb3'
    'IYCSABKAlIBVIFZXJyb3KIAQESFgoGc3RhdHVzGAogASgJUgZzdGF0dXMSHQoKbGF0ZW5jeV9t'
    'cxgLIAEoBVIJbGF0ZW5jeU1zEisKBnRva2VucxgMIAEoCzITLm1vYXQudjEuVG9rZW5Vc2FnZV'
    'IGdG9rZW5zEh4KCGNvc3RfdXNkGA0gASgBSAZSB2Nvc3RVc2SIAQESOQoKY3JlYXRlZF9hdBgO'
    'IAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBJCCgxjb21wbGV0ZW'
    'RfYXQYDyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAdSC2NvbXBsZXRlZEF0iAEB'
    'Qg0KC19jb21wYW55X2lkQg8KDV9jb21wYW55X25hbWVCCwoJX2Fzc2V0X2lkQg0KC19hc3NldF'
    '9uYW1lQgoKCF9maWxlX2lkQggKBl9lcnJvckILCglfY29zdF91c2RCDwoNX2NvbXBsZXRlZF9h'
    'dA==');

@$core.Deprecated('Use generationDetailDescriptor instead')
const GenerationDetail$json = {
  '1': 'GenerationDetail',
  '2': [
    {'1': 'generation', '3': 1, '4': 1, '5': 11, '6': '.moat.v1.Generation', '10': 'generation'},
    {'1': 'prompt_version_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'promptVersionId', '17': true},
    {'1': 'prompt_version_number', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'promptVersionNumber', '17': true},
    {'1': 'model_details', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'modelDetails'},
    {'1': 'llm_request', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'llmRequest'},
    {'1': 'llm_response', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'llmResponse'},
    {'1': 'changes_made', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'changesMade'},
  ],
  '8': [
    {'1': '_prompt_version_id'},
    {'1': '_prompt_version_number'},
  ],
};

/// Descriptor for `GenerationDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generationDetailDescriptor = $convert.base64Decode(
    'ChBHZW5lcmF0aW9uRGV0YWlsEjMKCmdlbmVyYXRpb24YASABKAsyEy5tb2F0LnYxLkdlbmVyYX'
    'Rpb25SCmdlbmVyYXRpb24SLwoRcHJvbXB0X3ZlcnNpb25faWQYAiABKAlIAFIPcHJvbXB0VmVy'
    'c2lvbklkiAEBEjcKFXByb21wdF92ZXJzaW9uX251bWJlchgDIAEoBUgBUhNwcm9tcHRWZXJzaW'
    '9uTnVtYmVyiAEBEjwKDW1vZGVsX2RldGFpbHMYBCABKAsyFy5nb29nbGUucHJvdG9idWYuU3Ry'
    'dWN0Ugxtb2RlbERldGFpbHMSOAoLbGxtX3JlcXVlc3QYBSABKAsyFy5nb29nbGUucHJvdG9idW'
    'YuU3RydWN0UgpsbG1SZXF1ZXN0EjoKDGxsbV9yZXNwb25zZRgGIAEoCzIXLmdvb2dsZS5wcm90'
    'b2J1Zi5TdHJ1Y3RSC2xsbVJlc3BvbnNlEjoKDGNoYW5nZXNfbWFkZRgHIAEoCzIXLmdvb2dsZS'
    '5wcm90b2J1Zi5TdHJ1Y3RSC2NoYW5nZXNNYWRlQhQKEl9wcm9tcHRfdmVyc2lvbl9pZEIYChZf'
    'cHJvbXB0X3ZlcnNpb25fbnVtYmVy');

@$core.Deprecated('Use generationTypeStatsDescriptor instead')
const GenerationTypeStats$json = {
  '1': 'GenerationTypeStats',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
    {'1': 'successful', '3': 3, '4': 1, '5': 5, '10': 'successful'},
    {'1': 'failed', '3': 4, '4': 1, '5': 5, '10': 'failed'},
    {'1': 'avg_latency_ms', '3': 5, '4': 1, '5': 1, '10': 'avgLatencyMs'},
    {'1': 'total_tokens', '3': 6, '4': 1, '5': 3, '10': 'totalTokens'},
    {'1': 'total_cost_usd', '3': 7, '4': 1, '5': 1, '10': 'totalCostUsd'},
  ],
};

/// Descriptor for `GenerationTypeStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generationTypeStatsDescriptor = $convert.base64Decode(
    'ChNHZW5lcmF0aW9uVHlwZVN0YXRzEhIKBHR5cGUYASABKAlSBHR5cGUSFAoFY291bnQYAiABKA'
    'VSBWNvdW50Eh4KCnN1Y2Nlc3NmdWwYAyABKAVSCnN1Y2Nlc3NmdWwSFgoGZmFpbGVkGAQgASgF'
    'UgZmYWlsZWQSJAoOYXZnX2xhdGVuY3lfbXMYBSABKAFSDGF2Z0xhdGVuY3lNcxIhCgx0b3RhbF'
    '90b2tlbnMYBiABKANSC3RvdGFsVG9rZW5zEiQKDnRvdGFsX2Nvc3RfdXNkGAcgASgBUgx0b3Rh'
    'bENvc3RVc2Q=');

@$core.Deprecated('Use dailyTrendDescriptor instead')
const DailyTrend$json = {
  '1': 'DailyTrend',
  '2': [
    {'1': 'date', '3': 1, '4': 1, '5': 9, '10': 'date'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
    {'1': 'successful', '3': 3, '4': 1, '5': 5, '10': 'successful'},
    {'1': 'failed', '3': 4, '4': 1, '5': 5, '10': 'failed'},
    {'1': 'total_cost_usd', '3': 5, '4': 1, '5': 1, '10': 'totalCostUsd'},
  ],
};

/// Descriptor for `DailyTrend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dailyTrendDescriptor = $convert.base64Decode(
    'CgpEYWlseVRyZW5kEhIKBGRhdGUYASABKAlSBGRhdGUSFAoFY291bnQYAiABKAVSBWNvdW50Eh'
    '4KCnN1Y2Nlc3NmdWwYAyABKAVSCnN1Y2Nlc3NmdWwSFgoGZmFpbGVkGAQgASgFUgZmYWlsZWQS'
    'JAoOdG90YWxfY29zdF91c2QYBSABKAFSDHRvdGFsQ29zdFVzZA==');

@$core.Deprecated('Use generationStatsDescriptor instead')
const GenerationStats$json = {
  '1': 'GenerationStats',
  '2': [
    {'1': 'total_generations', '3': 1, '4': 1, '5': 5, '10': 'totalGenerations'},
    {'1': 'successful', '3': 2, '4': 1, '5': 5, '10': 'successful'},
    {'1': 'failed', '3': 3, '4': 1, '5': 5, '10': 'failed'},
    {'1': 'success_rate', '3': 4, '4': 1, '5': 1, '10': 'successRate'},
    {'1': 'avg_latency_ms', '3': 5, '4': 1, '5': 1, '10': 'avgLatencyMs'},
    {'1': 'total_tokens', '3': 6, '4': 1, '5': 3, '10': 'totalTokens'},
    {'1': 'total_cost_usd', '3': 7, '4': 1, '5': 1, '10': 'totalCostUsd'},
    {'1': 'unique_companies', '3': 8, '4': 1, '5': 5, '10': 'uniqueCompanies'},
    {'1': 'unique_assets', '3': 9, '4': 1, '5': 5, '10': 'uniqueAssets'},
    {'1': 'by_type', '3': 10, '4': 3, '5': 11, '6': '.moat.v1.GenerationTypeStats', '10': 'byType'},
    {'1': 'daily_trends', '3': 11, '4': 3, '5': 11, '6': '.moat.v1.DailyTrend', '10': 'dailyTrends'},
  ],
};

/// Descriptor for `GenerationStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generationStatsDescriptor = $convert.base64Decode(
    'Cg9HZW5lcmF0aW9uU3RhdHMSKwoRdG90YWxfZ2VuZXJhdGlvbnMYASABKAVSEHRvdGFsR2VuZX'
    'JhdGlvbnMSHgoKc3VjY2Vzc2Z1bBgCIAEoBVIKc3VjY2Vzc2Z1bBIWCgZmYWlsZWQYAyABKAVS'
    'BmZhaWxlZBIhCgxzdWNjZXNzX3JhdGUYBCABKAFSC3N1Y2Nlc3NSYXRlEiQKDmF2Z19sYXRlbm'
    'N5X21zGAUgASgBUgxhdmdMYXRlbmN5TXMSIQoMdG90YWxfdG9rZW5zGAYgASgDUgt0b3RhbFRv'
    'a2VucxIkCg50b3RhbF9jb3N0X3VzZBgHIAEoAVIMdG90YWxDb3N0VXNkEikKEHVuaXF1ZV9jb2'
    '1wYW5pZXMYCCABKAVSD3VuaXF1ZUNvbXBhbmllcxIjCg11bmlxdWVfYXNzZXRzGAkgASgFUgx1'
    'bmlxdWVBc3NldHMSNQoHYnlfdHlwZRgKIAMoCzIcLm1vYXQudjEuR2VuZXJhdGlvblR5cGVTdG'
    'F0c1IGYnlUeXBlEjYKDGRhaWx5X3RyZW5kcxgLIAMoCzITLm1vYXQudjEuRGFpbHlUcmVuZFIL'
    'ZGFpbHlUcmVuZHM=');

@$core.Deprecated('Use getGenerationStatsRequestDescriptor instead')
const GetGenerationStatsRequest$json = {
  '1': 'GetGenerationStatsRequest',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'companyId', '17': true},
    {'1': 'start_date', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'startDate', '17': true},
    {'1': 'end_date', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'endDate', '17': true},
    {'1': 'generation_type', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'generationType', '17': true},
  ],
  '8': [
    {'1': '_company_id'},
    {'1': '_start_date'},
    {'1': '_end_date'},
    {'1': '_generation_type'},
  ],
};

/// Descriptor for `GetGenerationStatsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGenerationStatsRequestDescriptor = $convert.base64Decode(
    'ChlHZXRHZW5lcmF0aW9uU3RhdHNSZXF1ZXN0EiIKCmNvbXBhbnlfaWQYASABKAlIAFIJY29tcG'
    'FueUlkiAEBEj4KCnN0YXJ0X2RhdGUYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1w'
    'SAFSCXN0YXJ0RGF0ZYgBARI6CghlbmRfZGF0ZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW'
    '1lc3RhbXBIAlIHZW5kRGF0ZYgBARIsCg9nZW5lcmF0aW9uX3R5cGUYBCABKAlIA1IOZ2VuZXJh'
    'dGlvblR5cGWIAQFCDQoLX2NvbXBhbnlfaWRCDQoLX3N0YXJ0X2RhdGVCCwoJX2VuZF9kYXRlQh'
    'IKEF9nZW5lcmF0aW9uX3R5cGU=');

@$core.Deprecated('Use listGenerationsRequestDescriptor instead')
const ListGenerationsRequest$json = {
  '1': 'ListGenerationsRequest',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'companyId', '17': true},
    {'1': 'asset_id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'assetId', '17': true},
    {'1': 'generation_type', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'generationType', '17': true},
    {'1': 'success', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'success', '17': true},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'status', '17': true},
    {'1': 'limit', '3': 6, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 7, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'sort_by', '3': 8, '4': 1, '5': 9, '10': 'sortBy'},
    {'1': 'sort_order', '3': 9, '4': 1, '5': 9, '10': 'sortOrder'},
  ],
  '8': [
    {'1': '_company_id'},
    {'1': '_asset_id'},
    {'1': '_generation_type'},
    {'1': '_success'},
    {'1': '_status'},
  ],
};

/// Descriptor for `ListGenerationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listGenerationsRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0R2VuZXJhdGlvbnNSZXF1ZXN0EiIKCmNvbXBhbnlfaWQYASABKAlIAFIJY29tcGFueU'
    'lkiAEBEh4KCGFzc2V0X2lkGAIgASgJSAFSB2Fzc2V0SWSIAQESLAoPZ2VuZXJhdGlvbl90eXBl'
    'GAMgASgJSAJSDmdlbmVyYXRpb25UeXBliAEBEh0KB3N1Y2Nlc3MYBCABKAhIA1IHc3VjY2Vzc4'
    'gBARIbCgZzdGF0dXMYBSABKAlIBFIGc3RhdHVziAEBEhQKBWxpbWl0GAYgASgFUgVsaW1pdBIW'
    'CgZvZmZzZXQYByABKAVSBm9mZnNldBIXCgdzb3J0X2J5GAggASgJUgZzb3J0QnkSHQoKc29ydF'
    '9vcmRlchgJIAEoCVIJc29ydE9yZGVyQg0KC19jb21wYW55X2lkQgsKCV9hc3NldF9pZEISChBf'
    'Z2VuZXJhdGlvbl90eXBlQgoKCF9zdWNjZXNzQgkKB19zdGF0dXM=');

@$core.Deprecated('Use listGenerationsResponseDescriptor instead')
const ListGenerationsResponse$json = {
  '1': 'ListGenerationsResponse',
  '2': [
    {'1': 'generations', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.Generation', '10': 'generations'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListGenerationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listGenerationsResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0R2VuZXJhdGlvbnNSZXNwb25zZRI1CgtnZW5lcmF0aW9ucxgBIAMoCzITLm1vYXQudj'
    'EuR2VuZXJhdGlvblILZ2VuZXJhdGlvbnMSFAoFdG90YWwYAiABKAVSBXRvdGFs');

@$core.Deprecated('Use getGenerationRequestDescriptor instead')
const GetGenerationRequest$json = {
  '1': 'GetGenerationRequest',
  '2': [
    {'1': 'generation_id', '3': 1, '4': 1, '5': 9, '10': 'generationId'},
  ],
};

/// Descriptor for `GetGenerationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGenerationRequestDescriptor = $convert.base64Decode(
    'ChRHZXRHZW5lcmF0aW9uUmVxdWVzdBIjCg1nZW5lcmF0aW9uX2lkGAEgASgJUgxnZW5lcmF0aW'
    '9uSWQ=');

@$core.Deprecated('Use getRecentErrorsRequestDescriptor instead')
const GetRecentErrorsRequest$json = {
  '1': 'GetRecentErrorsRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'company_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'companyId', '17': true},
  ],
  '8': [
    {'1': '_company_id'},
  ],
};

/// Descriptor for `GetRecentErrorsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecentErrorsRequestDescriptor = $convert.base64Decode(
    'ChZHZXRSZWNlbnRFcnJvcnNSZXF1ZXN0EhQKBWxpbWl0GAEgASgFUgVsaW1pdBIiCgpjb21wYW'
    '55X2lkGAIgASgJSABSCWNvbXBhbnlJZIgBAUINCgtfY29tcGFueV9pZA==');

@$core.Deprecated('Use generationErrorDescriptor instead')
const GenerationError$json = {
  '1': 'GenerationError',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'generation_type', '3': 2, '4': 1, '5': 9, '10': 'generationType'},
    {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
    {'1': 'company_name', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'companyName', '17': true},
    {'1': 'asset_name', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'assetName', '17': true},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
  '8': [
    {'1': '_company_name'},
    {'1': '_asset_name'},
  ],
};

/// Descriptor for `GenerationError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generationErrorDescriptor = $convert.base64Decode(
    'Cg9HZW5lcmF0aW9uRXJyb3ISDgoCaWQYASABKAlSAmlkEicKD2dlbmVyYXRpb25fdHlwZRgCIA'
    'EoCVIOZ2VuZXJhdGlvblR5cGUSFAoFZXJyb3IYAyABKAlSBWVycm9yEiYKDGNvbXBhbnlfbmFt'
    'ZRgEIAEoCUgAUgtjb21wYW55TmFtZYgBARIiCgphc3NldF9uYW1lGAUgASgJSAFSCWFzc2V0Tm'
    'FtZYgBARI5CgpjcmVhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJ'
    'Y3JlYXRlZEF0Qg8KDV9jb21wYW55X25hbWVCDQoLX2Fzc2V0X25hbWU=');

@$core.Deprecated('Use getRecentErrorsResponseDescriptor instead')
const GetRecentErrorsResponse$json = {
  '1': 'GetRecentErrorsResponse',
  '2': [
    {'1': 'errors', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.GenerationError', '10': 'errors'},
  ],
};

/// Descriptor for `GetRecentErrorsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecentErrorsResponseDescriptor = $convert.base64Decode(
    'ChdHZXRSZWNlbnRFcnJvcnNSZXNwb25zZRIwCgZlcnJvcnMYASADKAsyGC5tb2F0LnYxLkdlbm'
    'VyYXRpb25FcnJvclIGZXJyb3Jz');

@$core.Deprecated('Use getAssetAIHistoryRequestDescriptor instead')
const GetAssetAIHistoryRequest$json = {
  '1': 'GetAssetAIHistoryRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
  ],
};

/// Descriptor for `GetAssetAIHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetAIHistoryRequestDescriptor = $convert.base64Decode(
    'ChhHZXRBc3NldEFJSGlzdG9yeVJlcXVlc3QSGQoIYXNzZXRfaWQYASABKAlSB2Fzc2V0SWQ=');

@$core.Deprecated('Use assetAIHistoryDescriptor instead')
const AssetAIHistory$json = {
  '1': 'AssetAIHistory',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'asset_name', '3': 2, '4': 1, '5': 9, '10': 'assetName'},
    {'1': 'generations', '3': 3, '4': 3, '5': 11, '6': '.moat.v1.Generation', '10': 'generations'},
    {'1': 'total_generations', '3': 4, '4': 1, '5': 5, '10': 'totalGenerations'},
    {'1': 'successful', '3': 5, '4': 1, '5': 5, '10': 'successful'},
    {'1': 'failed', '3': 6, '4': 1, '5': 5, '10': 'failed'},
  ],
};

/// Descriptor for `AssetAIHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetAIHistoryDescriptor = $convert.base64Decode(
    'Cg5Bc3NldEFJSGlzdG9yeRIZCghhc3NldF9pZBgBIAEoCVIHYXNzZXRJZBIdCgphc3NldF9uYW'
    '1lGAIgASgJUglhc3NldE5hbWUSNQoLZ2VuZXJhdGlvbnMYAyADKAsyEy5tb2F0LnYxLkdlbmVy'
    'YXRpb25SC2dlbmVyYXRpb25zEisKEXRvdGFsX2dlbmVyYXRpb25zGAQgASgFUhB0b3RhbEdlbm'
    'VyYXRpb25zEh4KCnN1Y2Nlc3NmdWwYBSABKAVSCnN1Y2Nlc3NmdWwSFgoGZmFpbGVkGAYgASgF'
    'UgZmYWlsZWQ=');

@$core.Deprecated('Use fieldCompletenessDescriptor instead')
const FieldCompleteness$json = {
  '1': 'FieldCompleteness',
  '2': [
    {'1': 'field_name', '3': 1, '4': 1, '5': 9, '10': 'fieldName'},
    {'1': 'filled_count', '3': 2, '4': 1, '5': 5, '10': 'filledCount'},
    {'1': 'missing_count', '3': 3, '4': 1, '5': 5, '10': 'missingCount'},
    {'1': 'completion_percentage', '3': 4, '4': 1, '5': 1, '10': 'completionPercentage'},
  ],
};

/// Descriptor for `FieldCompleteness`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldCompletenessDescriptor = $convert.base64Decode(
    'ChFGaWVsZENvbXBsZXRlbmVzcxIdCgpmaWVsZF9uYW1lGAEgASgJUglmaWVsZE5hbWUSIQoMZm'
    'lsbGVkX2NvdW50GAIgASgFUgtmaWxsZWRDb3VudBIjCg1taXNzaW5nX2NvdW50GAMgASgFUgxt'
    'aXNzaW5nQ291bnQSMwoVY29tcGxldGlvbl9wZXJjZW50YWdlGAQgASgBUhRjb21wbGV0aW9uUG'
    'VyY2VudGFnZQ==');

@$core.Deprecated('Use criticalFieldsCompletionDescriptor instead')
const CriticalFieldsCompletion$json = {
  '1': 'CriticalFieldsCompletion',
  '2': [
    {'1': 'warranty_fields', '3': 1, '4': 1, '5': 1, '10': 'warrantyFields'},
    {'1': 'identification_fields', '3': 2, '4': 1, '5': 1, '10': 'identificationFields'},
    {'1': 'value_fields', '3': 3, '4': 1, '5': 1, '10': 'valueFields'},
    {'1': 'location_fields', '3': 4, '4': 1, '5': 1, '10': 'locationFields'},
  ],
};

/// Descriptor for `CriticalFieldsCompletion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List criticalFieldsCompletionDescriptor = $convert.base64Decode(
    'ChhDcml0aWNhbEZpZWxkc0NvbXBsZXRpb24SJwoPd2FycmFudHlfZmllbGRzGAEgASgBUg53YX'
    'JyYW50eUZpZWxkcxIzChVpZGVudGlmaWNhdGlvbl9maWVsZHMYAiABKAFSFGlkZW50aWZpY2F0'
    'aW9uRmllbGRzEiEKDHZhbHVlX2ZpZWxkcxgDIAEoAVILdmFsdWVGaWVsZHMSJwoPbG9jYXRpb2'
    '5fZmllbGRzGAQgASgBUg5sb2NhdGlvbkZpZWxkcw==');

@$core.Deprecated('Use gapAnalysisResponseDescriptor instead')
const GapAnalysisResponse$json = {
  '1': 'GapAnalysisResponse',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'company_name', '3': 2, '4': 1, '5': 9, '10': 'companyName'},
    {'1': 'total_assets', '3': 3, '4': 1, '5': 5, '10': 'totalAssets'},
    {'1': 'field_completeness', '3': 4, '4': 3, '5': 11, '6': '.moat.v1.FieldCompleteness', '10': 'fieldCompleteness'},
    {'1': 'overall_completion_percentage', '3': 5, '4': 1, '5': 1, '10': 'overallCompletionPercentage'},
    {'1': 'critical_fields', '3': 6, '4': 1, '5': 11, '6': '.moat.v1.CriticalFieldsCompletion', '10': 'criticalFields'},
  ],
};

/// Descriptor for `GapAnalysisResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gapAnalysisResponseDescriptor = $convert.base64Decode(
    'ChNHYXBBbmFseXNpc1Jlc3BvbnNlEh0KCmNvbXBhbnlfaWQYASABKAlSCWNvbXBhbnlJZBIhCg'
    'xjb21wYW55X25hbWUYAiABKAlSC2NvbXBhbnlOYW1lEiEKDHRvdGFsX2Fzc2V0cxgDIAEoBVIL'
    'dG90YWxBc3NldHMSSQoSZmllbGRfY29tcGxldGVuZXNzGAQgAygLMhoubW9hdC52MS5GaWVsZE'
    'NvbXBsZXRlbmVzc1IRZmllbGRDb21wbGV0ZW5lc3MSQgodb3ZlcmFsbF9jb21wbGV0aW9uX3Bl'
    'cmNlbnRhZ2UYBSABKAFSG292ZXJhbGxDb21wbGV0aW9uUGVyY2VudGFnZRJKCg9jcml0aWNhbF'
    '9maWVsZHMYBiABKAsyIS5tb2F0LnYxLkNyaXRpY2FsRmllbGRzQ29tcGxldGlvblIOY3JpdGlj'
    'YWxGaWVsZHM=');

@$core.Deprecated('Use getAssetGapAnalysisRequestDescriptor instead')
const GetAssetGapAnalysisRequest$json = {
  '1': 'GetAssetGapAnalysisRequest',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '10': 'companyId'},
  ],
};

/// Descriptor for `GetAssetGapAnalysisRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetGapAnalysisRequestDescriptor = $convert.base64Decode(
    'ChpHZXRBc3NldEdhcEFuYWx5c2lzUmVxdWVzdBIdCgpjb21wYW55X2lkGAEgASgJUgljb21wYW'
    '55SWQ=');

@$core.Deprecated('Use assetMissingFieldDescriptor instead')
const AssetMissingField$json = {
  '1': 'AssetMissingField',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'asset_name', '3': 2, '4': 1, '5': 9, '10': 'assetName'},
    {'1': 'missing_fields', '3': 3, '4': 3, '5': 9, '10': 'missingFields'},
  ],
};

/// Descriptor for `AssetMissingField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetMissingFieldDescriptor = $convert.base64Decode(
    'ChFBc3NldE1pc3NpbmdGaWVsZBIZCghhc3NldF9pZBgBIAEoCVIHYXNzZXRJZBIdCgphc3NldF'
    '9uYW1lGAIgASgJUglhc3NldE5hbWUSJQoObWlzc2luZ19maWVsZHMYAyADKAlSDW1pc3NpbmdG'
    'aWVsZHM=');

@$core.Deprecated('Use getAssetsMissingFieldsRequestDescriptor instead')
const GetAssetsMissingFieldsRequest$json = {
  '1': 'GetAssetsMissingFieldsRequest',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'field_names', '3': 2, '4': 3, '5': 9, '10': 'fieldNames'},
    {'1': 'limit', '3': 3, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 4, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetAssetsMissingFieldsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetsMissingFieldsRequestDescriptor = $convert.base64Decode(
    'Ch1HZXRBc3NldHNNaXNzaW5nRmllbGRzUmVxdWVzdBIdCgpjb21wYW55X2lkGAEgASgJUgljb2'
    '1wYW55SWQSHwoLZmllbGRfbmFtZXMYAiADKAlSCmZpZWxkTmFtZXMSFAoFbGltaXQYAyABKAVS'
    'BWxpbWl0EhYKBm9mZnNldBgEIAEoBVIGb2Zmc2V0');

@$core.Deprecated('Use getAssetsMissingFieldsResponseDescriptor instead')
const GetAssetsMissingFieldsResponse$json = {
  '1': 'GetAssetsMissingFieldsResponse',
  '2': [
    {'1': 'assets', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssetMissingField', '10': 'assets'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `GetAssetsMissingFieldsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetsMissingFieldsResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRBc3NldHNNaXNzaW5nRmllbGRzUmVzcG9uc2USMgoGYXNzZXRzGAEgAygLMhoubW9hdC'
    '52MS5Bc3NldE1pc3NpbmdGaWVsZFIGYXNzZXRzEhQKBXRvdGFsGAIgASgFUgV0b3RhbA==');

@$core.Deprecated('Use assetStatsDescriptor instead')
const AssetStats$json = {
  '1': 'AssetStats',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 5, '10': 'total'},
    {'1': 'by_status', '3': 2, '4': 3, '5': 11, '6': '.moat.v1.AssetStats.ByStatusEntry', '10': 'byStatus'},
    {'1': 'by_process_status', '3': 3, '4': 3, '5': 11, '6': '.moat.v1.AssetStats.ByProcessStatusEntry', '10': 'byProcessStatus'},
    {'1': 'with_warranties', '3': 4, '4': 1, '5': 5, '10': 'withWarranties'},
    {'1': 'with_files', '3': 5, '4': 1, '5': 5, '10': 'withFiles'},
    {'1': 'created_last_30_days', '3': 6, '4': 1, '5': 5, '10': 'createdLast30Days'},
  ],
  '3': [AssetStats_ByStatusEntry$json, AssetStats_ByProcessStatusEntry$json],
};

@$core.Deprecated('Use assetStatsDescriptor instead')
const AssetStats_ByStatusEntry$json = {
  '1': 'ByStatusEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use assetStatsDescriptor instead')
const AssetStats_ByProcessStatusEntry$json = {
  '1': 'ByProcessStatusEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AssetStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetStatsDescriptor = $convert.base64Decode(
    'CgpBc3NldFN0YXRzEhQKBXRvdGFsGAEgASgFUgV0b3RhbBI+CglieV9zdGF0dXMYAiADKAsyIS'
    '5tb2F0LnYxLkFzc2V0U3RhdHMuQnlTdGF0dXNFbnRyeVIIYnlTdGF0dXMSVAoRYnlfcHJvY2Vz'
    'c19zdGF0dXMYAyADKAsyKC5tb2F0LnYxLkFzc2V0U3RhdHMuQnlQcm9jZXNzU3RhdHVzRW50cn'
    'lSD2J5UHJvY2Vzc1N0YXR1cxInCg93aXRoX3dhcnJhbnRpZXMYBCABKAVSDndpdGhXYXJyYW50'
    'aWVzEh0KCndpdGhfZmlsZXMYBSABKAVSCXdpdGhGaWxlcxIvChRjcmVhdGVkX2xhc3RfMzBfZG'
    'F5cxgGIAEoBVIRY3JlYXRlZExhc3QzMERheXMaOwoNQnlTdGF0dXNFbnRyeRIQCgNrZXkYASAB'
    'KAlSA2tleRIUCgV2YWx1ZRgCIAEoBVIFdmFsdWU6AjgBGkIKFEJ5UHJvY2Vzc1N0YXR1c0VudH'
    'J5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgFUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use memberStatsDescriptor instead')
const MemberStats$json = {
  '1': 'MemberStats',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 5, '10': 'total'},
    {'1': 'active', '3': 2, '4': 1, '5': 5, '10': 'active'},
    {'1': 'pending', '3': 3, '4': 1, '5': 5, '10': 'pending'},
    {'1': 'deleted', '3': 4, '4': 1, '5': 5, '10': 'deleted'},
    {'1': 'created_last_30_days', '3': 5, '4': 1, '5': 5, '10': 'createdLast30Days'},
  ],
};

/// Descriptor for `MemberStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberStatsDescriptor = $convert.base64Decode(
    'CgtNZW1iZXJTdGF0cxIUCgV0b3RhbBgBIAEoBVIFdG90YWwSFgoGYWN0aXZlGAIgASgFUgZhY3'
    'RpdmUSGAoHcGVuZGluZxgDIAEoBVIHcGVuZGluZxIYCgdkZWxldGVkGAQgASgFUgdkZWxldGVk'
    'Ei8KFGNyZWF0ZWRfbGFzdF8zMF9kYXlzGAUgASgFUhFjcmVhdGVkTGFzdDMwRGF5cw==');

@$core.Deprecated('Use taskStatsDescriptor instead')
const TaskStats$json = {
  '1': 'TaskStats',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 5, '10': 'total'},
    {'1': 'by_status', '3': 2, '4': 3, '5': 11, '6': '.moat.v1.TaskStats.ByStatusEntry', '10': 'byStatus'},
    {'1': 'overdue', '3': 3, '4': 1, '5': 5, '10': 'overdue'},
    {'1': 'created_last_30_days', '3': 4, '4': 1, '5': 5, '10': 'createdLast30Days'},
    {'1': 'completed_last_30_days', '3': 5, '4': 1, '5': 5, '10': 'completedLast30Days'},
  ],
  '3': [TaskStats_ByStatusEntry$json],
};

@$core.Deprecated('Use taskStatsDescriptor instead')
const TaskStats_ByStatusEntry$json = {
  '1': 'ByStatusEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TaskStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskStatsDescriptor = $convert.base64Decode(
    'CglUYXNrU3RhdHMSFAoFdG90YWwYASABKAVSBXRvdGFsEj0KCWJ5X3N0YXR1cxgCIAMoCzIgLm'
    '1vYXQudjEuVGFza1N0YXRzLkJ5U3RhdHVzRW50cnlSCGJ5U3RhdHVzEhgKB292ZXJkdWUYAyAB'
    'KAVSB292ZXJkdWUSLwoUY3JlYXRlZF9sYXN0XzMwX2RheXMYBCABKAVSEWNyZWF0ZWRMYXN0Mz'
    'BEYXlzEjMKFmNvbXBsZXRlZF9sYXN0XzMwX2RheXMYBSABKAVSE2NvbXBsZXRlZExhc3QzMERh'
    'eXMaOwoNQnlTdGF0dXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoBVIFdm'
    'FsdWU6AjgB');

@$core.Deprecated('Use fileStatsDescriptor instead')
const FileStats$json = {
  '1': 'FileStats',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 5, '10': 'total'},
    {'1': 'total_size_bytes', '3': 2, '4': 1, '5': 3, '10': 'totalSizeBytes'},
    {'1': 'by_type', '3': 3, '4': 3, '5': 11, '6': '.moat.v1.FileStats.ByTypeEntry', '10': 'byType'},
    {'1': 'uploaded_last_30_days', '3': 4, '4': 1, '5': 5, '10': 'uploadedLast30Days'},
  ],
  '3': [FileStats_ByTypeEntry$json],
};

@$core.Deprecated('Use fileStatsDescriptor instead')
const FileStats_ByTypeEntry$json = {
  '1': 'ByTypeEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `FileStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileStatsDescriptor = $convert.base64Decode(
    'CglGaWxlU3RhdHMSFAoFdG90YWwYASABKAVSBXRvdGFsEigKEHRvdGFsX3NpemVfYnl0ZXMYAi'
    'ABKANSDnRvdGFsU2l6ZUJ5dGVzEjcKB2J5X3R5cGUYAyADKAsyHi5tb2F0LnYxLkZpbGVTdGF0'
    'cy5CeVR5cGVFbnRyeVIGYnlUeXBlEjEKFXVwbG9hZGVkX2xhc3RfMzBfZGF5cxgEIAEoBVISdX'
    'Bsb2FkZWRMYXN0MzBEYXlzGjkKC0J5VHlwZUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZh'
    'bHVlGAIgASgFUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use companyStatsDescriptor instead')
const CompanyStats$json = {
  '1': 'CompanyStats',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 5, '10': 'total'},
    {'1': 'active', '3': 2, '4': 1, '5': 5, '10': 'active'},
    {'1': 'created_last_30_days', '3': 3, '4': 1, '5': 5, '10': 'createdLast30Days'},
  ],
};

/// Descriptor for `CompanyStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List companyStatsDescriptor = $convert.base64Decode(
    'CgxDb21wYW55U3RhdHMSFAoFdG90YWwYASABKAVSBXRvdGFsEhYKBmFjdGl2ZRgCIAEoBVIGYW'
    'N0aXZlEi8KFGNyZWF0ZWRfbGFzdF8zMF9kYXlzGAMgASgFUhFjcmVhdGVkTGFzdDMwRGF5cw==');

@$core.Deprecated('Use companySystemStatsDescriptor instead')
const CompanySystemStats$json = {
  '1': 'CompanySystemStats',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'company_name', '3': 2, '4': 1, '5': 9, '10': 'companyName'},
    {'1': 'asset_count', '3': 3, '4': 1, '5': 5, '10': 'assetCount'},
    {'1': 'member_count', '3': 4, '4': 1, '5': 5, '10': 'memberCount'},
    {'1': 'task_count', '3': 5, '4': 1, '5': 5, '10': 'taskCount'},
    {'1': 'file_count', '3': 6, '4': 1, '5': 5, '10': 'fileCount'},
    {'1': 'storage_bytes', '3': 7, '4': 1, '5': 3, '10': 'storageBytes'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'last_activity', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'lastActivity', '17': true},
  ],
  '8': [
    {'1': '_last_activity'},
  ],
};

/// Descriptor for `CompanySystemStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List companySystemStatsDescriptor = $convert.base64Decode(
    'ChJDb21wYW55U3lzdGVtU3RhdHMSHQoKY29tcGFueV9pZBgBIAEoCVIJY29tcGFueUlkEiEKDG'
    'NvbXBhbnlfbmFtZRgCIAEoCVILY29tcGFueU5hbWUSHwoLYXNzZXRfY291bnQYAyABKAVSCmFz'
    'c2V0Q291bnQSIQoMbWVtYmVyX2NvdW50GAQgASgFUgttZW1iZXJDb3VudBIdCgp0YXNrX2NvdW'
    '50GAUgASgFUgl0YXNrQ291bnQSHQoKZmlsZV9jb3VudBgGIAEoBVIJZmlsZUNvdW50EiMKDXN0'
    'b3JhZ2VfYnl0ZXMYByABKANSDHN0b3JhZ2VCeXRlcxI5CgpjcmVhdGVkX2F0GAggASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EkQKDWxhc3RfYWN0aXZpdHkYCSAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSDGxhc3RBY3Rpdml0eYgBAUIQCg5fbG'
    'FzdF9hY3Rpdml0eQ==');

@$core.Deprecated('Use systemOverviewResponseDescriptor instead')
const SystemOverviewResponse$json = {
  '1': 'SystemOverviewResponse',
  '2': [
    {'1': 'assets', '3': 1, '4': 1, '5': 11, '6': '.moat.v1.AssetStats', '10': 'assets'},
    {'1': 'members', '3': 2, '4': 1, '5': 11, '6': '.moat.v1.MemberStats', '10': 'members'},
    {'1': 'tasks', '3': 3, '4': 1, '5': 11, '6': '.moat.v1.TaskStats', '10': 'tasks'},
    {'1': 'files', '3': 4, '4': 1, '5': 11, '6': '.moat.v1.FileStats', '10': 'files'},
    {'1': 'companies', '3': 5, '4': 1, '5': 11, '6': '.moat.v1.CompanyStats', '10': 'companies'},
    {'1': 'by_company', '3': 6, '4': 3, '5': 11, '6': '.moat.v1.CompanySystemStats', '10': 'byCompany'},
  ],
};

/// Descriptor for `SystemOverviewResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemOverviewResponseDescriptor = $convert.base64Decode(
    'ChZTeXN0ZW1PdmVydmlld1Jlc3BvbnNlEisKBmFzc2V0cxgBIAEoCzITLm1vYXQudjEuQXNzZX'
    'RTdGF0c1IGYXNzZXRzEi4KB21lbWJlcnMYAiABKAsyFC5tb2F0LnYxLk1lbWJlclN0YXRzUgdt'
    'ZW1iZXJzEigKBXRhc2tzGAMgASgLMhIubW9hdC52MS5UYXNrU3RhdHNSBXRhc2tzEigKBWZpbG'
    'VzGAQgASgLMhIubW9hdC52MS5GaWxlU3RhdHNSBWZpbGVzEjMKCWNvbXBhbmllcxgFIAEoCzIV'
    'Lm1vYXQudjEuQ29tcGFueVN0YXRzUgljb21wYW5pZXMSOgoKYnlfY29tcGFueRgGIAMoCzIbLm'
    '1vYXQudjEuQ29tcGFueVN5c3RlbVN0YXRzUglieUNvbXBhbnk=');

@$core.Deprecated('Use getSystemOverviewRequestDescriptor instead')
const GetSystemOverviewRequest$json = {
  '1': 'GetSystemOverviewRequest',
};

/// Descriptor for `GetSystemOverviewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSystemOverviewRequestDescriptor = $convert.base64Decode(
    'ChhHZXRTeXN0ZW1PdmVydmlld1JlcXVlc3Q=');

@$core.Deprecated('Use companySummaryDescriptor instead')
const CompanySummary$json = {
  '1': 'CompanySummary',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'company_name', '3': 2, '4': 1, '5': 9, '10': 'companyName'},
    {'1': 'asset_count', '3': 3, '4': 1, '5': 5, '10': 'assetCount'},
    {'1': 'member_count', '3': 4, '4': 1, '5': 5, '10': 'memberCount'},
    {'1': 'location_count', '3': 5, '4': 1, '5': 5, '10': 'locationCount'},
    {'1': 'storage_gb', '3': 6, '4': 1, '5': 1, '10': 'storageGb'},
    {'1': 'ai_generation_count', '3': 7, '4': 1, '5': 5, '10': 'aiGenerationCount'},
    {'1': 'ai_cost_usd', '3': 8, '4': 1, '5': 1, '10': 'aiCostUsd'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `CompanySummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List companySummaryDescriptor = $convert.base64Decode(
    'Cg5Db21wYW55U3VtbWFyeRIdCgpjb21wYW55X2lkGAEgASgJUgljb21wYW55SWQSIQoMY29tcG'
    'FueV9uYW1lGAIgASgJUgtjb21wYW55TmFtZRIfCgthc3NldF9jb3VudBgDIAEoBVIKYXNzZXRD'
    'b3VudBIhCgxtZW1iZXJfY291bnQYBCABKAVSC21lbWJlckNvdW50EiUKDmxvY2F0aW9uX2NvdW'
    '50GAUgASgFUg1sb2NhdGlvbkNvdW50Eh0KCnN0b3JhZ2VfZ2IYBiABKAFSCXN0b3JhZ2VHYhIu'
    'ChNhaV9nZW5lcmF0aW9uX2NvdW50GAcgASgFUhFhaUdlbmVyYXRpb25Db3VudBIeCgthaV9jb3'
    'N0X3VzZBgIIAEoAVIJYWlDb3N0VXNkEjkKCmNyZWF0ZWRfYXQYCSABKAsyGi5nb29nbGUucHJv'
    'dG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use getCompanySummariesRequestDescriptor instead')
const GetCompanySummariesRequest$json = {
  '1': 'GetCompanySummariesRequest',
  '2': [
    {'1': 'search', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'search', '17': true},
    {'1': 'sort_by', '3': 2, '4': 1, '5': 9, '10': 'sortBy'},
    {'1': 'sort_order', '3': 3, '4': 1, '5': 9, '10': 'sortOrder'},
    {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
  ],
  '8': [
    {'1': '_search'},
  ],
};

/// Descriptor for `GetCompanySummariesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCompanySummariesRequestDescriptor = $convert.base64Decode(
    'ChpHZXRDb21wYW55U3VtbWFyaWVzUmVxdWVzdBIbCgZzZWFyY2gYASABKAlIAFIGc2VhcmNoiA'
    'EBEhcKB3NvcnRfYnkYAiABKAlSBnNvcnRCeRIdCgpzb3J0X29yZGVyGAMgASgJUglzb3J0T3Jk'
    'ZXISFAoFbGltaXQYBCABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0QgkKB19zZW'
    'FyY2g=');

@$core.Deprecated('Use getCompanySummariesResponseDescriptor instead')
const GetCompanySummariesResponse$json = {
  '1': 'GetCompanySummariesResponse',
  '2': [
    {'1': 'companies', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.CompanySummary', '10': 'companies'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `GetCompanySummariesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCompanySummariesResponseDescriptor = $convert.base64Decode(
    'ChtHZXRDb21wYW55U3VtbWFyaWVzUmVzcG9uc2USNQoJY29tcGFuaWVzGAEgAygLMhcubW9hdC'
    '52MS5Db21wYW55U3VtbWFyeVIJY29tcGFuaWVzEhQKBXRvdGFsGAIgASgFUgV0b3RhbA==');

const $core.Map<$core.String, $core.dynamic> AdminServiceBase$json = {
  '1': 'AdminService',
  '2': [
    {'1': 'ListSSODomains', '2': '.moat.v1.ListSSODomainsRequest', '3': '.moat.v1.ListSSODomainsResponse'},
    {'1': 'GetSSODomain', '2': '.moat.v1.GetSSODomainRequest', '3': '.moat.v1.SSODomain'},
    {'1': 'CreateSSODomain', '2': '.moat.v1.CreateSSODomainRequest', '3': '.moat.v1.SSODomain'},
    {'1': 'UpdateSSODomain', '2': '.moat.v1.UpdateSSODomainRequest', '3': '.moat.v1.SSODomain'},
    {'1': 'DeleteSSODomain', '2': '.moat.v1.DeleteSSODomainRequest', '3': '.moat.v1.DeleteSSODomainResponse'},
    {'1': 'ListPromptTemplates', '2': '.moat.v1.ListPromptTemplatesRequest', '3': '.moat.v1.ListPromptTemplatesResponse'},
    {'1': 'GetPromptTemplate', '2': '.moat.v1.GetPromptTemplateRequest', '3': '.moat.v1.PromptTemplateDetail'},
    {'1': 'CreatePromptTemplate', '2': '.moat.v1.CreatePromptTemplateRequest', '3': '.moat.v1.PromptTemplate'},
    {'1': 'UpdatePromptTemplate', '2': '.moat.v1.UpdatePromptTemplateRequest', '3': '.moat.v1.PromptTemplate'},
    {'1': 'DeletePromptTemplate', '2': '.moat.v1.DeletePromptTemplateRequest', '3': '.moat.v1.DeletePromptTemplateResponse'},
    {'1': 'CreatePromptVersion', '2': '.moat.v1.CreatePromptVersionRequest', '3': '.moat.v1.PromptVersion'},
    {'1': 'ActivatePromptVersion', '2': '.moat.v1.ActivatePromptVersionRequest', '3': '.moat.v1.ActivatePromptVersionResponse'},
    {'1': 'DeactivatePromptVersion', '2': '.moat.v1.DeactivatePromptVersionRequest', '3': '.moat.v1.DeactivatePromptVersionResponse'},
    {'1': 'PromotePromptVersion', '2': '.moat.v1.PromotePromptVersionRequest', '3': '.moat.v1.PromotePromptVersionResponse'},
    {'1': 'GetGenerationStats', '2': '.moat.v1.GetGenerationStatsRequest', '3': '.moat.v1.GenerationStats'},
    {'1': 'ListGenerations', '2': '.moat.v1.ListGenerationsRequest', '3': '.moat.v1.ListGenerationsResponse'},
    {'1': 'GetGeneration', '2': '.moat.v1.GetGenerationRequest', '3': '.moat.v1.GenerationDetail'},
    {'1': 'GetRecentErrors', '2': '.moat.v1.GetRecentErrorsRequest', '3': '.moat.v1.GetRecentErrorsResponse'},
    {'1': 'GetAssetAIHistory', '2': '.moat.v1.GetAssetAIHistoryRequest', '3': '.moat.v1.AssetAIHistory'},
    {'1': 'GetAssetGapAnalysis', '2': '.moat.v1.GetAssetGapAnalysisRequest', '3': '.moat.v1.GapAnalysisResponse'},
    {'1': 'GetAssetsMissingFields', '2': '.moat.v1.GetAssetsMissingFieldsRequest', '3': '.moat.v1.GetAssetsMissingFieldsResponse'},
    {'1': 'GetSystemOverview', '2': '.moat.v1.GetSystemOverviewRequest', '3': '.moat.v1.SystemOverviewResponse'},
    {'1': 'GetCompanySummaries', '2': '.moat.v1.GetCompanySummariesRequest', '3': '.moat.v1.GetCompanySummariesResponse'},
  ],
};

@$core.Deprecated('Use adminServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> AdminServiceBase$messageJson = {
  '.moat.v1.ListSSODomainsRequest': ListSSODomainsRequest$json,
  '.moat.v1.ListSSODomainsResponse': ListSSODomainsResponse$json,
  '.moat.v1.SSODomain': SSODomain$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.moat.v1.GetSSODomainRequest': GetSSODomainRequest$json,
  '.moat.v1.CreateSSODomainRequest': CreateSSODomainRequest$json,
  '.moat.v1.UpdateSSODomainRequest': UpdateSSODomainRequest$json,
  '.moat.v1.DeleteSSODomainRequest': DeleteSSODomainRequest$json,
  '.moat.v1.DeleteSSODomainResponse': DeleteSSODomainResponse$json,
  '.moat.v1.ListPromptTemplatesRequest': ListPromptTemplatesRequest$json,
  '.moat.v1.ListPromptTemplatesResponse': ListPromptTemplatesResponse$json,
  '.moat.v1.PromptTemplate': PromptTemplate$json,
  '.moat.v1.GetPromptTemplateRequest': GetPromptTemplateRequest$json,
  '.moat.v1.PromptTemplateDetail': PromptTemplateDetail$json,
  '.moat.v1.PromptVersion': PromptVersion$json,
  '.google.protobuf.Struct': $1.Struct$json,
  '.google.protobuf.Struct.FieldsEntry': $1.Struct_FieldsEntry$json,
  '.google.protobuf.Value': $1.Value$json,
  '.google.protobuf.ListValue': $1.ListValue$json,
  '.moat.v1.VersionStats': VersionStats$json,
  '.moat.v1.PromptTemplateDetail.ActiveVersionsEntry': PromptTemplateDetail_ActiveVersionsEntry$json,
  '.moat.v1.ActiveVersionInfo': ActiveVersionInfo$json,
  '.moat.v1.CreatePromptTemplateRequest': CreatePromptTemplateRequest$json,
  '.moat.v1.UpdatePromptTemplateRequest': UpdatePromptTemplateRequest$json,
  '.moat.v1.DeletePromptTemplateRequest': DeletePromptTemplateRequest$json,
  '.moat.v1.DeletePromptTemplateResponse': DeletePromptTemplateResponse$json,
  '.moat.v1.CreatePromptVersionRequest': CreatePromptVersionRequest$json,
  '.moat.v1.ActivatePromptVersionRequest': ActivatePromptVersionRequest$json,
  '.moat.v1.ActivatePromptVersionResponse': ActivatePromptVersionResponse$json,
  '.moat.v1.DeactivatePromptVersionRequest': DeactivatePromptVersionRequest$json,
  '.moat.v1.DeactivatePromptVersionResponse': DeactivatePromptVersionResponse$json,
  '.moat.v1.PromotePromptVersionRequest': PromotePromptVersionRequest$json,
  '.moat.v1.PromotePromptVersionResponse': PromotePromptVersionResponse$json,
  '.moat.v1.GetGenerationStatsRequest': GetGenerationStatsRequest$json,
  '.moat.v1.GenerationStats': GenerationStats$json,
  '.moat.v1.GenerationTypeStats': GenerationTypeStats$json,
  '.moat.v1.DailyTrend': DailyTrend$json,
  '.moat.v1.ListGenerationsRequest': ListGenerationsRequest$json,
  '.moat.v1.ListGenerationsResponse': ListGenerationsResponse$json,
  '.moat.v1.Generation': Generation$json,
  '.moat.v1.TokenUsage': TokenUsage$json,
  '.moat.v1.GetGenerationRequest': GetGenerationRequest$json,
  '.moat.v1.GenerationDetail': GenerationDetail$json,
  '.moat.v1.GetRecentErrorsRequest': GetRecentErrorsRequest$json,
  '.moat.v1.GetRecentErrorsResponse': GetRecentErrorsResponse$json,
  '.moat.v1.GenerationError': GenerationError$json,
  '.moat.v1.GetAssetAIHistoryRequest': GetAssetAIHistoryRequest$json,
  '.moat.v1.AssetAIHistory': AssetAIHistory$json,
  '.moat.v1.GetAssetGapAnalysisRequest': GetAssetGapAnalysisRequest$json,
  '.moat.v1.GapAnalysisResponse': GapAnalysisResponse$json,
  '.moat.v1.FieldCompleteness': FieldCompleteness$json,
  '.moat.v1.CriticalFieldsCompletion': CriticalFieldsCompletion$json,
  '.moat.v1.GetAssetsMissingFieldsRequest': GetAssetsMissingFieldsRequest$json,
  '.moat.v1.GetAssetsMissingFieldsResponse': GetAssetsMissingFieldsResponse$json,
  '.moat.v1.AssetMissingField': AssetMissingField$json,
  '.moat.v1.GetSystemOverviewRequest': GetSystemOverviewRequest$json,
  '.moat.v1.SystemOverviewResponse': SystemOverviewResponse$json,
  '.moat.v1.AssetStats': AssetStats$json,
  '.moat.v1.AssetStats.ByStatusEntry': AssetStats_ByStatusEntry$json,
  '.moat.v1.AssetStats.ByProcessStatusEntry': AssetStats_ByProcessStatusEntry$json,
  '.moat.v1.MemberStats': MemberStats$json,
  '.moat.v1.TaskStats': TaskStats$json,
  '.moat.v1.TaskStats.ByStatusEntry': TaskStats_ByStatusEntry$json,
  '.moat.v1.FileStats': FileStats$json,
  '.moat.v1.FileStats.ByTypeEntry': FileStats_ByTypeEntry$json,
  '.moat.v1.CompanyStats': CompanyStats$json,
  '.moat.v1.CompanySystemStats': CompanySystemStats$json,
  '.moat.v1.GetCompanySummariesRequest': GetCompanySummariesRequest$json,
  '.moat.v1.GetCompanySummariesResponse': GetCompanySummariesResponse$json,
  '.moat.v1.CompanySummary': CompanySummary$json,
};

/// Descriptor for `AdminService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List adminServiceDescriptor = $convert.base64Decode(
    'CgxBZG1pblNlcnZpY2USUQoOTGlzdFNTT0RvbWFpbnMSHi5tb2F0LnYxLkxpc3RTU09Eb21haW'
    '5zUmVxdWVzdBofLm1vYXQudjEuTGlzdFNTT0RvbWFpbnNSZXNwb25zZRJACgxHZXRTU09Eb21h'
    'aW4SHC5tb2F0LnYxLkdldFNTT0RvbWFpblJlcXVlc3QaEi5tb2F0LnYxLlNTT0RvbWFpbhJGCg'
    '9DcmVhdGVTU09Eb21haW4SHy5tb2F0LnYxLkNyZWF0ZVNTT0RvbWFpblJlcXVlc3QaEi5tb2F0'
    'LnYxLlNTT0RvbWFpbhJGCg9VcGRhdGVTU09Eb21haW4SHy5tb2F0LnYxLlVwZGF0ZVNTT0RvbW'
    'FpblJlcXVlc3QaEi5tb2F0LnYxLlNTT0RvbWFpbhJUCg9EZWxldGVTU09Eb21haW4SHy5tb2F0'
    'LnYxLkRlbGV0ZVNTT0RvbWFpblJlcXVlc3QaIC5tb2F0LnYxLkRlbGV0ZVNTT0RvbWFpblJlc3'
    'BvbnNlEmAKE0xpc3RQcm9tcHRUZW1wbGF0ZXMSIy5tb2F0LnYxLkxpc3RQcm9tcHRUZW1wbGF0'
    'ZXNSZXF1ZXN0GiQubW9hdC52MS5MaXN0UHJvbXB0VGVtcGxhdGVzUmVzcG9uc2USVQoRR2V0UH'
    'JvbXB0VGVtcGxhdGUSIS5tb2F0LnYxLkdldFByb21wdFRlbXBsYXRlUmVxdWVzdBodLm1vYXQu'
    'djEuUHJvbXB0VGVtcGxhdGVEZXRhaWwSVQoUQ3JlYXRlUHJvbXB0VGVtcGxhdGUSJC5tb2F0Ln'
    'YxLkNyZWF0ZVByb21wdFRlbXBsYXRlUmVxdWVzdBoXLm1vYXQudjEuUHJvbXB0VGVtcGxhdGUS'
    'VQoUVXBkYXRlUHJvbXB0VGVtcGxhdGUSJC5tb2F0LnYxLlVwZGF0ZVByb21wdFRlbXBsYXRlUm'
    'VxdWVzdBoXLm1vYXQudjEuUHJvbXB0VGVtcGxhdGUSYwoURGVsZXRlUHJvbXB0VGVtcGxhdGUS'
    'JC5tb2F0LnYxLkRlbGV0ZVByb21wdFRlbXBsYXRlUmVxdWVzdBolLm1vYXQudjEuRGVsZXRlUH'
    'JvbXB0VGVtcGxhdGVSZXNwb25zZRJSChNDcmVhdGVQcm9tcHRWZXJzaW9uEiMubW9hdC52MS5D'
    'cmVhdGVQcm9tcHRWZXJzaW9uUmVxdWVzdBoWLm1vYXQudjEuUHJvbXB0VmVyc2lvbhJmChVBY3'
    'RpdmF0ZVByb21wdFZlcnNpb24SJS5tb2F0LnYxLkFjdGl2YXRlUHJvbXB0VmVyc2lvblJlcXVl'
    'c3QaJi5tb2F0LnYxLkFjdGl2YXRlUHJvbXB0VmVyc2lvblJlc3BvbnNlEmwKF0RlYWN0aXZhdG'
    'VQcm9tcHRWZXJzaW9uEicubW9hdC52MS5EZWFjdGl2YXRlUHJvbXB0VmVyc2lvblJlcXVlc3Qa'
    'KC5tb2F0LnYxLkRlYWN0aXZhdGVQcm9tcHRWZXJzaW9uUmVzcG9uc2USYwoUUHJvbW90ZVByb2'
    '1wdFZlcnNpb24SJC5tb2F0LnYxLlByb21vdGVQcm9tcHRWZXJzaW9uUmVxdWVzdBolLm1vYXQu'
    'djEuUHJvbW90ZVByb21wdFZlcnNpb25SZXNwb25zZRJSChJHZXRHZW5lcmF0aW9uU3RhdHMSIi'
    '5tb2F0LnYxLkdldEdlbmVyYXRpb25TdGF0c1JlcXVlc3QaGC5tb2F0LnYxLkdlbmVyYXRpb25T'
    'dGF0cxJUCg9MaXN0R2VuZXJhdGlvbnMSHy5tb2F0LnYxLkxpc3RHZW5lcmF0aW9uc1JlcXVlc3'
    'QaIC5tb2F0LnYxLkxpc3RHZW5lcmF0aW9uc1Jlc3BvbnNlEkkKDUdldEdlbmVyYXRpb24SHS5t'
    'b2F0LnYxLkdldEdlbmVyYXRpb25SZXF1ZXN0GhkubW9hdC52MS5HZW5lcmF0aW9uRGV0YWlsEl'
    'QKD0dldFJlY2VudEVycm9ycxIfLm1vYXQudjEuR2V0UmVjZW50RXJyb3JzUmVxdWVzdBogLm1v'
    'YXQudjEuR2V0UmVjZW50RXJyb3JzUmVzcG9uc2USTwoRR2V0QXNzZXRBSUhpc3RvcnkSIS5tb2'
    'F0LnYxLkdldEFzc2V0QUlIaXN0b3J5UmVxdWVzdBoXLm1vYXQudjEuQXNzZXRBSUhpc3RvcnkS'
    'WAoTR2V0QXNzZXRHYXBBbmFseXNpcxIjLm1vYXQudjEuR2V0QXNzZXRHYXBBbmFseXNpc1JlcX'
    'Vlc3QaHC5tb2F0LnYxLkdhcEFuYWx5c2lzUmVzcG9uc2USaQoWR2V0QXNzZXRzTWlzc2luZ0Zp'
    'ZWxkcxImLm1vYXQudjEuR2V0QXNzZXRzTWlzc2luZ0ZpZWxkc1JlcXVlc3QaJy5tb2F0LnYxLk'
    'dldEFzc2V0c01pc3NpbmdGaWVsZHNSZXNwb25zZRJXChFHZXRTeXN0ZW1PdmVydmlldxIhLm1v'
    'YXQudjEuR2V0U3lzdGVtT3ZlcnZpZXdSZXF1ZXN0Gh8ubW9hdC52MS5TeXN0ZW1PdmVydmlld1'
    'Jlc3BvbnNlEmAKE0dldENvbXBhbnlTdW1tYXJpZXMSIy5tb2F0LnYxLkdldENvbXBhbnlTdW1t'
    'YXJpZXNSZXF1ZXN0GiQubW9hdC52MS5HZXRDb21wYW55U3VtbWFyaWVzUmVzcG9uc2U=');

