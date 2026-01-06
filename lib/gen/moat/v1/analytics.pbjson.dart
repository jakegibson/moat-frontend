//
//  Generated code. Do not modify.
//  source: moat/v1/analytics.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/empty.pbjson.dart' as $3;
import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use translateNaturalLanguageRequestDescriptor instead')
const TranslateNaturalLanguageRequest$json = {
  '1': 'TranslateNaturalLanguageRequest',
  '2': [
    {'1': 'question', '3': 1, '4': 1, '5': 9, '10': 'question'},
    {'1': 'preferred_chart_type', '3': 2, '4': 1, '5': 9, '10': 'preferredChartType'},
  ],
};

/// Descriptor for `TranslateNaturalLanguageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List translateNaturalLanguageRequestDescriptor = $convert.base64Decode(
    'Ch9UcmFuc2xhdGVOYXR1cmFsTGFuZ3VhZ2VSZXF1ZXN0EhoKCHF1ZXN0aW9uGAEgASgJUghxdW'
    'VzdGlvbhIwChRwcmVmZXJyZWRfY2hhcnRfdHlwZRgCIAEoCVIScHJlZmVycmVkQ2hhcnRUeXBl');

@$core.Deprecated('Use translateNaturalLanguageResponseDescriptor instead')
const TranslateNaturalLanguageResponse$json = {
  '1': 'TranslateNaturalLanguageResponse',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 11, '6': '.moat.v1.CubeQuery', '10': 'query'},
    {'1': 'suggested_chart_type', '3': 2, '4': 1, '5': 9, '10': 'suggestedChartType'},
    {'1': 'explanation', '3': 3, '4': 1, '5': 9, '10': 'explanation'},
    {'1': 'confidence', '3': 4, '4': 1, '5': 1, '10': 'confidence'},
  ],
};

/// Descriptor for `TranslateNaturalLanguageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List translateNaturalLanguageResponseDescriptor = $convert.base64Decode(
    'CiBUcmFuc2xhdGVOYXR1cmFsTGFuZ3VhZ2VSZXNwb25zZRIoCgVxdWVyeRgBIAEoCzISLm1vYX'
    'QudjEuQ3ViZVF1ZXJ5UgVxdWVyeRIwChRzdWdnZXN0ZWRfY2hhcnRfdHlwZRgCIAEoCVISc3Vn'
    'Z2VzdGVkQ2hhcnRUeXBlEiAKC2V4cGxhbmF0aW9uGAMgASgJUgtleHBsYW5hdGlvbhIeCgpjb2'
    '5maWRlbmNlGAQgASgBUgpjb25maWRlbmNl');

@$core.Deprecated('Use cubeQueryDescriptor instead')
const CubeQuery$json = {
  '1': 'CubeQuery',
  '2': [
    {'1': 'measures', '3': 1, '4': 3, '5': 9, '10': 'measures'},
    {'1': 'dimensions', '3': 2, '4': 3, '5': 9, '10': 'dimensions'},
    {'1': 'time_dimensions', '3': 3, '4': 3, '5': 11, '6': '.moat.v1.TimeDimension', '10': 'timeDimensions'},
    {'1': 'filters', '3': 4, '4': 3, '5': 11, '6': '.moat.v1.CubeFilter', '10': 'filters'},
    {'1': 'order', '3': 5, '4': 3, '5': 11, '6': '.moat.v1.CubeOrder', '10': 'order'},
    {'1': 'limit', '3': 6, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `CubeQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cubeQueryDescriptor = $convert.base64Decode(
    'CglDdWJlUXVlcnkSGgoIbWVhc3VyZXMYASADKAlSCG1lYXN1cmVzEh4KCmRpbWVuc2lvbnMYAi'
    'ADKAlSCmRpbWVuc2lvbnMSPwoPdGltZV9kaW1lbnNpb25zGAMgAygLMhYubW9hdC52MS5UaW1l'
    'RGltZW5zaW9uUg50aW1lRGltZW5zaW9ucxItCgdmaWx0ZXJzGAQgAygLMhMubW9hdC52MS5DdW'
    'JlRmlsdGVyUgdmaWx0ZXJzEigKBW9yZGVyGAUgAygLMhIubW9hdC52MS5DdWJlT3JkZXJSBW9y'
    'ZGVyEhQKBWxpbWl0GAYgASgFUgVsaW1pdA==');

@$core.Deprecated('Use timeDimensionDescriptor instead')
const TimeDimension$json = {
  '1': 'TimeDimension',
  '2': [
    {'1': 'dimension', '3': 1, '4': 1, '5': 9, '10': 'dimension'},
    {'1': 'granularity', '3': 2, '4': 1, '5': 9, '10': 'granularity'},
    {'1': 'date_range', '3': 3, '4': 3, '5': 9, '10': 'dateRange'},
  ],
};

/// Descriptor for `TimeDimension`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeDimensionDescriptor = $convert.base64Decode(
    'Cg1UaW1lRGltZW5zaW9uEhwKCWRpbWVuc2lvbhgBIAEoCVIJZGltZW5zaW9uEiAKC2dyYW51bG'
    'FyaXR5GAIgASgJUgtncmFudWxhcml0eRIdCgpkYXRlX3JhbmdlGAMgAygJUglkYXRlUmFuZ2U=');

@$core.Deprecated('Use cubeFilterDescriptor instead')
const CubeFilter$json = {
  '1': 'CubeFilter',
  '2': [
    {'1': 'member', '3': 1, '4': 1, '5': 9, '10': 'member'},
    {'1': 'operator', '3': 2, '4': 1, '5': 9, '10': 'operator'},
    {'1': 'values', '3': 3, '4': 3, '5': 9, '10': 'values'},
  ],
};

/// Descriptor for `CubeFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cubeFilterDescriptor = $convert.base64Decode(
    'CgpDdWJlRmlsdGVyEhYKBm1lbWJlchgBIAEoCVIGbWVtYmVyEhoKCG9wZXJhdG9yGAIgASgJUg'
    'hvcGVyYXRvchIWCgZ2YWx1ZXMYAyADKAlSBnZhbHVlcw==');

@$core.Deprecated('Use cubeOrderDescriptor instead')
const CubeOrder$json = {
  '1': 'CubeOrder',
  '2': [
    {'1': 'member', '3': 1, '4': 1, '5': 9, '10': 'member'},
    {'1': 'direction', '3': 2, '4': 1, '5': 9, '10': 'direction'},
  ],
};

/// Descriptor for `CubeOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cubeOrderDescriptor = $convert.base64Decode(
    'CglDdWJlT3JkZXISFgoGbWVtYmVyGAEgASgJUgZtZW1iZXISHAoJZGlyZWN0aW9uGAIgASgJUg'
    'lkaXJlY3Rpb24=');

@$core.Deprecated('Use getQueryTemplatesRequestDescriptor instead')
const GetQueryTemplatesRequest$json = {
  '1': 'GetQueryTemplatesRequest',
};

/// Descriptor for `GetQueryTemplatesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getQueryTemplatesRequestDescriptor = $convert.base64Decode(
    'ChhHZXRRdWVyeVRlbXBsYXRlc1JlcXVlc3Q=');

@$core.Deprecated('Use getQueryTemplatesResponseDescriptor instead')
const GetQueryTemplatesResponse$json = {
  '1': 'GetQueryTemplatesResponse',
  '2': [
    {'1': 'templates', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.QueryTemplate', '10': 'templates'},
  ],
};

/// Descriptor for `GetQueryTemplatesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getQueryTemplatesResponseDescriptor = $convert.base64Decode(
    'ChlHZXRRdWVyeVRlbXBsYXRlc1Jlc3BvbnNlEjQKCXRlbXBsYXRlcxgBIAMoCzIWLm1vYXQudj'
    'EuUXVlcnlUZW1wbGF0ZVIJdGVtcGxhdGVz');

@$core.Deprecated('Use queryTemplateDescriptor instead')
const QueryTemplate$json = {
  '1': 'QueryTemplate',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'category', '3': 4, '4': 1, '5': 9, '10': 'category'},
    {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'query', '3': 6, '4': 1, '5': 11, '6': '.moat.v1.CubeQuery', '10': 'query'},
    {'1': 'chart_type', '3': 7, '4': 1, '5': 9, '10': 'chartType'},
  ],
};

/// Descriptor for `QueryTemplate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTemplateDescriptor = $convert.base64Decode(
    'Cg1RdWVyeVRlbXBsYXRlEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2'
    'Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIaCghjYXRlZ29yeRgEIAEoCVIIY2F0ZWdv'
    'cnkSEgoEaWNvbhgFIAEoCVIEaWNvbhIoCgVxdWVyeRgGIAEoCzISLm1vYXQudjEuQ3ViZVF1ZX'
    'J5UgVxdWVyeRIdCgpjaGFydF90eXBlGAcgASgJUgljaGFydFR5cGU=');

@$core.Deprecated('Use getCubeSchemaRequestDescriptor instead')
const GetCubeSchemaRequest$json = {
  '1': 'GetCubeSchemaRequest',
};

/// Descriptor for `GetCubeSchemaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCubeSchemaRequestDescriptor = $convert.base64Decode(
    'ChRHZXRDdWJlU2NoZW1hUmVxdWVzdA==');

@$core.Deprecated('Use getCubeSchemaResponseDescriptor instead')
const GetCubeSchemaResponse$json = {
  '1': 'GetCubeSchemaResponse',
  '2': [
    {'1': 'cubes', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.CubeDefinition', '10': 'cubes'},
  ],
};

/// Descriptor for `GetCubeSchemaResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCubeSchemaResponseDescriptor = $convert.base64Decode(
    'ChVHZXRDdWJlU2NoZW1hUmVzcG9uc2USLQoFY3ViZXMYASADKAsyFy5tb2F0LnYxLkN1YmVEZW'
    'Zpbml0aW9uUgVjdWJlcw==');

@$core.Deprecated('Use cubeDefinitionDescriptor instead')
const CubeDefinition$json = {
  '1': 'CubeDefinition',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'measures', '3': 4, '4': 3, '5': 11, '6': '.moat.v1.CubeMember', '10': 'measures'},
    {'1': 'dimensions', '3': 5, '4': 3, '5': 11, '6': '.moat.v1.CubeMember', '10': 'dimensions'},
  ],
};

/// Descriptor for `CubeDefinition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cubeDefinitionDescriptor = $convert.base64Decode(
    'Cg5DdWJlRGVmaW5pdGlvbhISCgRuYW1lGAEgASgJUgRuYW1lEhQKBXRpdGxlGAIgASgJUgV0aX'
    'RsZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SLwoIbWVhc3VyZXMYBCADKAsy'
    'Ey5tb2F0LnYxLkN1YmVNZW1iZXJSCG1lYXN1cmVzEjMKCmRpbWVuc2lvbnMYBSADKAsyEy5tb2'
    'F0LnYxLkN1YmVNZW1iZXJSCmRpbWVuc2lvbnM=');

@$core.Deprecated('Use cubeMemberDescriptor instead')
const CubeMember$json = {
  '1': 'CubeMember',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `CubeMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cubeMemberDescriptor = $convert.base64Decode(
    'CgpDdWJlTWVtYmVyEhIKBG5hbWUYASABKAlSBG5hbWUSFAoFdGl0bGUYAiABKAlSBXRpdGxlEi'
    'AKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhISCgR0eXBlGAQgASgJUgR0eXBl');

@$core.Deprecated('Use dashboardDescriptor instead')
const Dashboard$json = {
  '1': 'Dashboard',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'is_default', '3': 4, '4': 1, '5': 8, '10': 'isDefault'},
    {'1': 'items', '3': 5, '4': 3, '5': 11, '6': '.moat.v1.DashboardItem', '10': 'items'},
    {'1': 'created_by_id', '3': 6, '4': 1, '5': 9, '10': 'createdById'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Dashboard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dashboardDescriptor = $convert.base64Decode(
    'CglEYXNoYm9hcmQSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLZGVzY3'
    'JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEh0KCmlzX2RlZmF1bHQYBCABKAhSCWlzRGVmYXVs'
    'dBIsCgVpdGVtcxgFIAMoCzIWLm1vYXQudjEuRGFzaGJvYXJkSXRlbVIFaXRlbXMSIgoNY3JlYX'
    'RlZF9ieV9pZBgGIAEoCVILY3JlYXRlZEJ5SWQSOQoKY3JlYXRlZF9hdBgHIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAggASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');

@$core.Deprecated('Use createDashboardRequestDescriptor instead')
const CreateDashboardRequest$json = {
  '1': 'CreateDashboardRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'is_default', '3': 3, '4': 1, '5': 8, '10': 'isDefault'},
  ],
};

/// Descriptor for `CreateDashboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDashboardRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVEYXNoYm9hcmRSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSIAoLZGVzY3JpcH'
    'Rpb24YAiABKAlSC2Rlc2NyaXB0aW9uEh0KCmlzX2RlZmF1bHQYAyABKAhSCWlzRGVmYXVsdA==');

@$core.Deprecated('Use getDashboardRequestDescriptor instead')
const GetDashboardRequest$json = {
  '1': 'GetDashboardRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetDashboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDashboardRequestDescriptor = $convert.base64Decode(
    'ChNHZXREYXNoYm9hcmRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use listDashboardsRequestDescriptor instead')
const ListDashboardsRequest$json = {
  '1': 'ListDashboardsRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ListDashboardsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDashboardsRequestDescriptor = $convert.base64Decode(
    'ChVMaXN0RGFzaGJvYXJkc1JlcXVlc3QSFAoFbGltaXQYASABKAVSBWxpbWl0EhYKBm9mZnNldB'
    'gCIAEoBVIGb2Zmc2V0');

@$core.Deprecated('Use listDashboardsResponseDescriptor instead')
const ListDashboardsResponse$json = {
  '1': 'ListDashboardsResponse',
  '2': [
    {'1': 'dashboards', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.Dashboard', '10': 'dashboards'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListDashboardsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDashboardsResponseDescriptor = $convert.base64Decode(
    'ChZMaXN0RGFzaGJvYXJkc1Jlc3BvbnNlEjIKCmRhc2hib2FyZHMYASADKAsyEi5tb2F0LnYxLk'
    'Rhc2hib2FyZFIKZGFzaGJvYXJkcxIUCgV0b3RhbBgCIAEoBVIFdG90YWw=');

@$core.Deprecated('Use updateDashboardRequestDescriptor instead')
const UpdateDashboardRequest$json = {
  '1': 'UpdateDashboardRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'is_default', '3': 4, '4': 1, '5': 8, '10': 'isDefault'},
  ],
};

/// Descriptor for `UpdateDashboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDashboardRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVEYXNoYm9hcmRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUg'
    'RuYW1lEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIdCgppc19kZWZhdWx0GAQg'
    'ASgIUglpc0RlZmF1bHQ=');

@$core.Deprecated('Use deleteDashboardRequestDescriptor instead')
const DeleteDashboardRequest$json = {
  '1': 'DeleteDashboardRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteDashboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDashboardRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVEYXNoYm9hcmRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use savedQueryDescriptor instead')
const SavedQuery$json = {
  '1': 'SavedQuery',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'query', '3': 4, '4': 1, '5': 11, '6': '.moat.v1.CubeQuery', '10': 'query'},
    {'1': 'chart_type', '3': 5, '4': 1, '5': 9, '10': 'chartType'},
    {'1': 'chart_config', '3': 6, '4': 1, '5': 11, '6': '.moat.v1.ChartConfig', '10': 'chartConfig'},
    {'1': 'source_type', '3': 7, '4': 1, '5': 9, '10': 'sourceType'},
    {'1': 'nl_question', '3': 8, '4': 1, '5': 9, '10': 'nlQuestion'},
    {'1': 'created_by_id', '3': 9, '4': 1, '5': 9, '10': 'createdById'},
    {'1': 'created_at', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `SavedQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List savedQueryDescriptor = $convert.base64Decode(
    'CgpTYXZlZFF1ZXJ5Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2Rlc2'
    'NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIoCgVxdWVyeRgEIAEoCzISLm1vYXQudjEuQ3Vi'
    'ZVF1ZXJ5UgVxdWVyeRIdCgpjaGFydF90eXBlGAUgASgJUgljaGFydFR5cGUSNwoMY2hhcnRfY2'
    '9uZmlnGAYgASgLMhQubW9hdC52MS5DaGFydENvbmZpZ1ILY2hhcnRDb25maWcSHwoLc291cmNl'
    'X3R5cGUYByABKAlSCnNvdXJjZVR5cGUSHwoLbmxfcXVlc3Rpb24YCCABKAlSCm5sUXVlc3Rpb2'
    '4SIgoNY3JlYXRlZF9ieV9pZBgJIAEoCVILY3JlYXRlZEJ5SWQSOQoKY3JlYXRlZF9hdBgKIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GA'
    'sgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');

@$core.Deprecated('Use chartConfigDescriptor instead')
const ChartConfig$json = {
  '1': 'ChartConfig',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'x_axis_label', '3': 2, '4': 1, '5': 9, '10': 'xAxisLabel'},
    {'1': 'y_axis_label', '3': 3, '4': 1, '5': 9, '10': 'yAxisLabel'},
    {'1': 'show_legend', '3': 4, '4': 1, '5': 8, '10': 'showLegend'},
    {'1': 'color_palette', '3': 5, '4': 3, '5': 9, '10': 'colorPalette'},
  ],
};

/// Descriptor for `ChartConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chartConfigDescriptor = $convert.base64Decode(
    'CgtDaGFydENvbmZpZxIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoMeF9heGlzX2xhYmVsGAIgAS'
    'gJUgp4QXhpc0xhYmVsEiAKDHlfYXhpc19sYWJlbBgDIAEoCVIKeUF4aXNMYWJlbBIfCgtzaG93'
    'X2xlZ2VuZBgEIAEoCFIKc2hvd0xlZ2VuZBIjCg1jb2xvcl9wYWxldHRlGAUgAygJUgxjb2xvcl'
    'BhbGV0dGU=');

@$core.Deprecated('Use createSavedQueryRequestDescriptor instead')
const CreateSavedQueryRequest$json = {
  '1': 'CreateSavedQueryRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'query', '3': 3, '4': 1, '5': 11, '6': '.moat.v1.CubeQuery', '10': 'query'},
    {'1': 'chart_type', '3': 4, '4': 1, '5': 9, '10': 'chartType'},
    {'1': 'chart_config', '3': 5, '4': 1, '5': 11, '6': '.moat.v1.ChartConfig', '10': 'chartConfig'},
    {'1': 'source_type', '3': 6, '4': 1, '5': 9, '10': 'sourceType'},
    {'1': 'nl_question', '3': 7, '4': 1, '5': 9, '10': 'nlQuestion'},
    {'1': 'dashboard_id', '3': 8, '4': 1, '5': 9, '10': 'dashboardId'},
  ],
};

/// Descriptor for `CreateSavedQueryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSavedQueryRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVTYXZlZFF1ZXJ5UmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEiAKC2Rlc2NyaX'
    'B0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhIoCgVxdWVyeRgDIAEoCzISLm1vYXQudjEuQ3ViZVF1'
    'ZXJ5UgVxdWVyeRIdCgpjaGFydF90eXBlGAQgASgJUgljaGFydFR5cGUSNwoMY2hhcnRfY29uZm'
    'lnGAUgASgLMhQubW9hdC52MS5DaGFydENvbmZpZ1ILY2hhcnRDb25maWcSHwoLc291cmNlX3R5'
    'cGUYBiABKAlSCnNvdXJjZVR5cGUSHwoLbmxfcXVlc3Rpb24YByABKAlSCm5sUXVlc3Rpb24SIQ'
    'oMZGFzaGJvYXJkX2lkGAggASgJUgtkYXNoYm9hcmRJZA==');

@$core.Deprecated('Use getSavedQueryRequestDescriptor instead')
const GetSavedQueryRequest$json = {
  '1': 'GetSavedQueryRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetSavedQueryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSavedQueryRequestDescriptor = $convert.base64Decode(
    'ChRHZXRTYXZlZFF1ZXJ5UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use listSavedQueriesRequestDescriptor instead')
const ListSavedQueriesRequest$json = {
  '1': 'ListSavedQueriesRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'dashboard_id', '3': 3, '4': 1, '5': 9, '10': 'dashboardId'},
  ],
};

/// Descriptor for `ListSavedQueriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSavedQueriesRequestDescriptor = $convert.base64Decode(
    'ChdMaXN0U2F2ZWRRdWVyaWVzUmVxdWVzdBIUCgVsaW1pdBgBIAEoBVIFbGltaXQSFgoGb2Zmc2'
    'V0GAIgASgFUgZvZmZzZXQSIQoMZGFzaGJvYXJkX2lkGAMgASgJUgtkYXNoYm9hcmRJZA==');

@$core.Deprecated('Use listSavedQueriesResponseDescriptor instead')
const ListSavedQueriesResponse$json = {
  '1': 'ListSavedQueriesResponse',
  '2': [
    {'1': 'queries', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.SavedQuery', '10': 'queries'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListSavedQueriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSavedQueriesResponseDescriptor = $convert.base64Decode(
    'ChhMaXN0U2F2ZWRRdWVyaWVzUmVzcG9uc2USLQoHcXVlcmllcxgBIAMoCzITLm1vYXQudjEuU2'
    'F2ZWRRdWVyeVIHcXVlcmllcxIUCgV0b3RhbBgCIAEoBVIFdG90YWw=');

@$core.Deprecated('Use updateSavedQueryRequestDescriptor instead')
const UpdateSavedQueryRequest$json = {
  '1': 'UpdateSavedQueryRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'query', '3': 4, '4': 1, '5': 11, '6': '.moat.v1.CubeQuery', '10': 'query'},
    {'1': 'chart_type', '3': 5, '4': 1, '5': 9, '10': 'chartType'},
    {'1': 'chart_config', '3': 6, '4': 1, '5': 11, '6': '.moat.v1.ChartConfig', '10': 'chartConfig'},
  ],
};

/// Descriptor for `UpdateSavedQueryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSavedQueryRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVTYXZlZFF1ZXJ5UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCV'
    'IEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SKAoFcXVlcnkYBCABKAsy'
    'Ei5tb2F0LnYxLkN1YmVRdWVyeVIFcXVlcnkSHQoKY2hhcnRfdHlwZRgFIAEoCVIJY2hhcnRUeX'
    'BlEjcKDGNoYXJ0X2NvbmZpZxgGIAEoCzIULm1vYXQudjEuQ2hhcnRDb25maWdSC2NoYXJ0Q29u'
    'Zmln');

@$core.Deprecated('Use deleteSavedQueryRequestDescriptor instead')
const DeleteSavedQueryRequest$json = {
  '1': 'DeleteSavedQueryRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteSavedQueryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSavedQueryRequestDescriptor = $convert.base64Decode(
    'ChdEZWxldGVTYXZlZFF1ZXJ5UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use dashboardItemDescriptor instead')
const DashboardItem$json = {
  '1': 'DashboardItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'dashboard_id', '3': 2, '4': 1, '5': 9, '10': 'dashboardId'},
    {'1': 'query', '3': 3, '4': 1, '5': 11, '6': '.moat.v1.SavedQuery', '10': 'query'},
    {'1': 'position', '3': 4, '4': 1, '5': 11, '6': '.moat.v1.GridPosition', '10': 'position'},
    {'1': 'custom_title', '3': 5, '4': 1, '5': 9, '10': 'customTitle'},
  ],
};

/// Descriptor for `DashboardItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dashboardItemDescriptor = $convert.base64Decode(
    'Cg1EYXNoYm9hcmRJdGVtEg4KAmlkGAEgASgJUgJpZBIhCgxkYXNoYm9hcmRfaWQYAiABKAlSC2'
    'Rhc2hib2FyZElkEikKBXF1ZXJ5GAMgASgLMhMubW9hdC52MS5TYXZlZFF1ZXJ5UgVxdWVyeRIx'
    'Cghwb3NpdGlvbhgEIAEoCzIVLm1vYXQudjEuR3JpZFBvc2l0aW9uUghwb3NpdGlvbhIhCgxjdX'
    'N0b21fdGl0bGUYBSABKAlSC2N1c3RvbVRpdGxl');

@$core.Deprecated('Use gridPositionDescriptor instead')
const GridPosition$json = {
  '1': 'GridPosition',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
    {'1': 'width', '3': 3, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 4, '4': 1, '5': 5, '10': 'height'},
  ],
};

/// Descriptor for `GridPosition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gridPositionDescriptor = $convert.base64Decode(
    'CgxHcmlkUG9zaXRpb24SDAoBeBgBIAEoBVIBeBIMCgF5GAIgASgFUgF5EhQKBXdpZHRoGAMgAS'
    'gFUgV3aWR0aBIWCgZoZWlnaHQYBCABKAVSBmhlaWdodA==');

@$core.Deprecated('Use addQueryToDashboardRequestDescriptor instead')
const AddQueryToDashboardRequest$json = {
  '1': 'AddQueryToDashboardRequest',
  '2': [
    {'1': 'dashboard_id', '3': 1, '4': 1, '5': 9, '10': 'dashboardId'},
    {'1': 'saved_query_id', '3': 2, '4': 1, '5': 9, '10': 'savedQueryId'},
    {'1': 'position', '3': 3, '4': 1, '5': 11, '6': '.moat.v1.GridPosition', '10': 'position'},
    {'1': 'custom_title', '3': 4, '4': 1, '5': 9, '10': 'customTitle'},
  ],
};

/// Descriptor for `AddQueryToDashboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addQueryToDashboardRequestDescriptor = $convert.base64Decode(
    'ChpBZGRRdWVyeVRvRGFzaGJvYXJkUmVxdWVzdBIhCgxkYXNoYm9hcmRfaWQYASABKAlSC2Rhc2'
    'hib2FyZElkEiQKDnNhdmVkX3F1ZXJ5X2lkGAIgASgJUgxzYXZlZFF1ZXJ5SWQSMQoIcG9zaXRp'
    'b24YAyABKAsyFS5tb2F0LnYxLkdyaWRQb3NpdGlvblIIcG9zaXRpb24SIQoMY3VzdG9tX3RpdG'
    'xlGAQgASgJUgtjdXN0b21UaXRsZQ==');

@$core.Deprecated('Use removeQueryFromDashboardRequestDescriptor instead')
const RemoveQueryFromDashboardRequest$json = {
  '1': 'RemoveQueryFromDashboardRequest',
  '2': [
    {'1': 'dashboard_id', '3': 1, '4': 1, '5': 9, '10': 'dashboardId'},
    {'1': 'saved_query_id', '3': 2, '4': 1, '5': 9, '10': 'savedQueryId'},
  ],
};

/// Descriptor for `RemoveQueryFromDashboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeQueryFromDashboardRequestDescriptor = $convert.base64Decode(
    'Ch9SZW1vdmVRdWVyeUZyb21EYXNoYm9hcmRSZXF1ZXN0EiEKDGRhc2hib2FyZF9pZBgBIAEoCV'
    'ILZGFzaGJvYXJkSWQSJAoOc2F2ZWRfcXVlcnlfaWQYAiABKAlSDHNhdmVkUXVlcnlJZA==');

@$core.Deprecated('Use updateDashboardLayoutRequestDescriptor instead')
const UpdateDashboardLayoutRequest$json = {
  '1': 'UpdateDashboardLayoutRequest',
  '2': [
    {'1': 'dashboard_id', '3': 1, '4': 1, '5': 9, '10': 'dashboardId'},
    {'1': 'items', '3': 2, '4': 3, '5': 11, '6': '.moat.v1.DashboardItemPosition', '10': 'items'},
  ],
};

/// Descriptor for `UpdateDashboardLayoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDashboardLayoutRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVEYXNoYm9hcmRMYXlvdXRSZXF1ZXN0EiEKDGRhc2hib2FyZF9pZBgBIAEoCVILZG'
    'FzaGJvYXJkSWQSNAoFaXRlbXMYAiADKAsyHi5tb2F0LnYxLkRhc2hib2FyZEl0ZW1Qb3NpdGlv'
    'blIFaXRlbXM=');

@$core.Deprecated('Use dashboardItemPositionDescriptor instead')
const DashboardItemPosition$json = {
  '1': 'DashboardItemPosition',
  '2': [
    {'1': 'saved_query_id', '3': 1, '4': 1, '5': 9, '10': 'savedQueryId'},
    {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.moat.v1.GridPosition', '10': 'position'},
    {'1': 'custom_title', '3': 3, '4': 1, '5': 9, '10': 'customTitle'},
  ],
};

/// Descriptor for `DashboardItemPosition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dashboardItemPositionDescriptor = $convert.base64Decode(
    'ChVEYXNoYm9hcmRJdGVtUG9zaXRpb24SJAoOc2F2ZWRfcXVlcnlfaWQYASABKAlSDHNhdmVkUX'
    'VlcnlJZBIxCghwb3NpdGlvbhgCIAEoCzIVLm1vYXQudjEuR3JpZFBvc2l0aW9uUghwb3NpdGlv'
    'bhIhCgxjdXN0b21fdGl0bGUYAyABKAlSC2N1c3RvbVRpdGxl');

const $core.Map<$core.String, $core.dynamic> AnalyticsServiceBase$json = {
  '1': 'AnalyticsService',
  '2': [
    {'1': 'TranslateNaturalLanguage', '2': '.moat.v1.TranslateNaturalLanguageRequest', '3': '.moat.v1.TranslateNaturalLanguageResponse'},
    {'1': 'GetQueryTemplates', '2': '.moat.v1.GetQueryTemplatesRequest', '3': '.moat.v1.GetQueryTemplatesResponse'},
    {'1': 'GetCubeSchema', '2': '.moat.v1.GetCubeSchemaRequest', '3': '.moat.v1.GetCubeSchemaResponse'},
  ],
};

@$core.Deprecated('Use analyticsServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> AnalyticsServiceBase$messageJson = {
  '.moat.v1.TranslateNaturalLanguageRequest': TranslateNaturalLanguageRequest$json,
  '.moat.v1.TranslateNaturalLanguageResponse': TranslateNaturalLanguageResponse$json,
  '.moat.v1.CubeQuery': CubeQuery$json,
  '.moat.v1.TimeDimension': TimeDimension$json,
  '.moat.v1.CubeFilter': CubeFilter$json,
  '.moat.v1.CubeOrder': CubeOrder$json,
  '.moat.v1.GetQueryTemplatesRequest': GetQueryTemplatesRequest$json,
  '.moat.v1.GetQueryTemplatesResponse': GetQueryTemplatesResponse$json,
  '.moat.v1.QueryTemplate': QueryTemplate$json,
  '.moat.v1.GetCubeSchemaRequest': GetCubeSchemaRequest$json,
  '.moat.v1.GetCubeSchemaResponse': GetCubeSchemaResponse$json,
  '.moat.v1.CubeDefinition': CubeDefinition$json,
  '.moat.v1.CubeMember': CubeMember$json,
};

/// Descriptor for `AnalyticsService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List analyticsServiceDescriptor = $convert.base64Decode(
    'ChBBbmFseXRpY3NTZXJ2aWNlEm8KGFRyYW5zbGF0ZU5hdHVyYWxMYW5ndWFnZRIoLm1vYXQudj'
    'EuVHJhbnNsYXRlTmF0dXJhbExhbmd1YWdlUmVxdWVzdBopLm1vYXQudjEuVHJhbnNsYXRlTmF0'
    'dXJhbExhbmd1YWdlUmVzcG9uc2USWgoRR2V0UXVlcnlUZW1wbGF0ZXMSIS5tb2F0LnYxLkdldF'
    'F1ZXJ5VGVtcGxhdGVzUmVxdWVzdBoiLm1vYXQudjEuR2V0UXVlcnlUZW1wbGF0ZXNSZXNwb25z'
    'ZRJOCg1HZXRDdWJlU2NoZW1hEh0ubW9hdC52MS5HZXRDdWJlU2NoZW1hUmVxdWVzdBoeLm1vYX'
    'QudjEuR2V0Q3ViZVNjaGVtYVJlc3BvbnNl');

const $core.Map<$core.String, $core.dynamic> DashboardServiceBase$json = {
  '1': 'DashboardService',
  '2': [
    {'1': 'CreateDashboard', '2': '.moat.v1.CreateDashboardRequest', '3': '.moat.v1.Dashboard'},
    {'1': 'GetDashboard', '2': '.moat.v1.GetDashboardRequest', '3': '.moat.v1.Dashboard'},
    {'1': 'ListDashboards', '2': '.moat.v1.ListDashboardsRequest', '3': '.moat.v1.ListDashboardsResponse'},
    {'1': 'UpdateDashboard', '2': '.moat.v1.UpdateDashboardRequest', '3': '.moat.v1.Dashboard'},
    {'1': 'DeleteDashboard', '2': '.moat.v1.DeleteDashboardRequest', '3': '.google.protobuf.Empty'},
    {'1': 'CreateSavedQuery', '2': '.moat.v1.CreateSavedQueryRequest', '3': '.moat.v1.SavedQuery'},
    {'1': 'GetSavedQuery', '2': '.moat.v1.GetSavedQueryRequest', '3': '.moat.v1.SavedQuery'},
    {'1': 'ListSavedQueries', '2': '.moat.v1.ListSavedQueriesRequest', '3': '.moat.v1.ListSavedQueriesResponse'},
    {'1': 'UpdateSavedQuery', '2': '.moat.v1.UpdateSavedQueryRequest', '3': '.moat.v1.SavedQuery'},
    {'1': 'DeleteSavedQuery', '2': '.moat.v1.DeleteSavedQueryRequest', '3': '.google.protobuf.Empty'},
    {'1': 'AddQueryToDashboard', '2': '.moat.v1.AddQueryToDashboardRequest', '3': '.moat.v1.DashboardItem'},
    {'1': 'RemoveQueryFromDashboard', '2': '.moat.v1.RemoveQueryFromDashboardRequest', '3': '.google.protobuf.Empty'},
    {'1': 'UpdateDashboardLayout', '2': '.moat.v1.UpdateDashboardLayoutRequest', '3': '.moat.v1.Dashboard'},
  ],
};

@$core.Deprecated('Use dashboardServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> DashboardServiceBase$messageJson = {
  '.moat.v1.CreateDashboardRequest': CreateDashboardRequest$json,
  '.moat.v1.Dashboard': Dashboard$json,
  '.moat.v1.DashboardItem': DashboardItem$json,
  '.moat.v1.SavedQuery': SavedQuery$json,
  '.moat.v1.CubeQuery': CubeQuery$json,
  '.moat.v1.TimeDimension': TimeDimension$json,
  '.moat.v1.CubeFilter': CubeFilter$json,
  '.moat.v1.CubeOrder': CubeOrder$json,
  '.moat.v1.ChartConfig': ChartConfig$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.moat.v1.GridPosition': GridPosition$json,
  '.moat.v1.GetDashboardRequest': GetDashboardRequest$json,
  '.moat.v1.ListDashboardsRequest': ListDashboardsRequest$json,
  '.moat.v1.ListDashboardsResponse': ListDashboardsResponse$json,
  '.moat.v1.UpdateDashboardRequest': UpdateDashboardRequest$json,
  '.moat.v1.DeleteDashboardRequest': DeleteDashboardRequest$json,
  '.google.protobuf.Empty': $3.Empty$json,
  '.moat.v1.CreateSavedQueryRequest': CreateSavedQueryRequest$json,
  '.moat.v1.GetSavedQueryRequest': GetSavedQueryRequest$json,
  '.moat.v1.ListSavedQueriesRequest': ListSavedQueriesRequest$json,
  '.moat.v1.ListSavedQueriesResponse': ListSavedQueriesResponse$json,
  '.moat.v1.UpdateSavedQueryRequest': UpdateSavedQueryRequest$json,
  '.moat.v1.DeleteSavedQueryRequest': DeleteSavedQueryRequest$json,
  '.moat.v1.AddQueryToDashboardRequest': AddQueryToDashboardRequest$json,
  '.moat.v1.RemoveQueryFromDashboardRequest': RemoveQueryFromDashboardRequest$json,
  '.moat.v1.UpdateDashboardLayoutRequest': UpdateDashboardLayoutRequest$json,
  '.moat.v1.DashboardItemPosition': DashboardItemPosition$json,
};

/// Descriptor for `DashboardService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List dashboardServiceDescriptor = $convert.base64Decode(
    'ChBEYXNoYm9hcmRTZXJ2aWNlEkYKD0NyZWF0ZURhc2hib2FyZBIfLm1vYXQudjEuQ3JlYXRlRG'
    'FzaGJvYXJkUmVxdWVzdBoSLm1vYXQudjEuRGFzaGJvYXJkEkAKDEdldERhc2hib2FyZBIcLm1v'
    'YXQudjEuR2V0RGFzaGJvYXJkUmVxdWVzdBoSLm1vYXQudjEuRGFzaGJvYXJkElEKDkxpc3REYX'
    'NoYm9hcmRzEh4ubW9hdC52MS5MaXN0RGFzaGJvYXJkc1JlcXVlc3QaHy5tb2F0LnYxLkxpc3RE'
    'YXNoYm9hcmRzUmVzcG9uc2USRgoPVXBkYXRlRGFzaGJvYXJkEh8ubW9hdC52MS5VcGRhdGVEYX'
    'NoYm9hcmRSZXF1ZXN0GhIubW9hdC52MS5EYXNoYm9hcmQSSgoPRGVsZXRlRGFzaGJvYXJkEh8u'
    'bW9hdC52MS5EZWxldGVEYXNoYm9hcmRSZXF1ZXN0GhYuZ29vZ2xlLnByb3RvYnVmLkVtcHR5Ek'
    'kKEENyZWF0ZVNhdmVkUXVlcnkSIC5tb2F0LnYxLkNyZWF0ZVNhdmVkUXVlcnlSZXF1ZXN0GhMu'
    'bW9hdC52MS5TYXZlZFF1ZXJ5EkMKDUdldFNhdmVkUXVlcnkSHS5tb2F0LnYxLkdldFNhdmVkUX'
    'VlcnlSZXF1ZXN0GhMubW9hdC52MS5TYXZlZFF1ZXJ5ElcKEExpc3RTYXZlZFF1ZXJpZXMSIC5t'
    'b2F0LnYxLkxpc3RTYXZlZFF1ZXJpZXNSZXF1ZXN0GiEubW9hdC52MS5MaXN0U2F2ZWRRdWVyaW'
    'VzUmVzcG9uc2USSQoQVXBkYXRlU2F2ZWRRdWVyeRIgLm1vYXQudjEuVXBkYXRlU2F2ZWRRdWVy'
    'eVJlcXVlc3QaEy5tb2F0LnYxLlNhdmVkUXVlcnkSTAoQRGVsZXRlU2F2ZWRRdWVyeRIgLm1vYX'
    'QudjEuRGVsZXRlU2F2ZWRRdWVyeVJlcXVlc3QaFi5nb29nbGUucHJvdG9idWYuRW1wdHkSUgoT'
    'QWRkUXVlcnlUb0Rhc2hib2FyZBIjLm1vYXQudjEuQWRkUXVlcnlUb0Rhc2hib2FyZFJlcXVlc3'
    'QaFi5tb2F0LnYxLkRhc2hib2FyZEl0ZW0SXAoYUmVtb3ZlUXVlcnlGcm9tRGFzaGJvYXJkEigu'
    'bW9hdC52MS5SZW1vdmVRdWVyeUZyb21EYXNoYm9hcmRSZXF1ZXN0GhYuZ29vZ2xlLnByb3RvYn'
    'VmLkVtcHR5ElIKFVVwZGF0ZURhc2hib2FyZExheW91dBIlLm1vYXQudjEuVXBkYXRlRGFzaGJv'
    'YXJkTGF5b3V0UmVxdWVzdBoSLm1vYXQudjEuRGFzaGJvYXJk');

