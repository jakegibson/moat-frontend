//
//  Generated code. Do not modify.
//  source: moat/v1/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getCurrentUserRequestDescriptor instead')
const GetCurrentUserRequest$json = {
  '1': 'GetCurrentUserRequest',
};

/// Descriptor for `GetCurrentUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurrentUserRequestDescriptor = $convert.base64Decode(
    'ChVHZXRDdXJyZW50VXNlclJlcXVlc3Q=');

@$core.Deprecated('Use getCurrentUserResponseDescriptor instead')
const GetCurrentUserResponse$json = {
  '1': 'GetCurrentUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.moat.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `GetCurrentUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurrentUserResponseDescriptor = $convert.base64Decode(
    'ChZHZXRDdXJyZW50VXNlclJlc3BvbnNlEiEKBHVzZXIYASABKAsyDS5tb2F0LnYxLlVzZXJSBH'
    'VzZXI=');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'firebase_uid', '3': 2, '4': 1, '5': 9, '10': 'firebaseUid'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 4, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 5, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'company', '3': 6, '4': 1, '5': 11, '6': '.moat.v1.Company', '10': 'company'},
    {'1': 'roles', '3': 7, '4': 3, '5': 11, '6': '.moat.v1.Role', '10': 'roles'},
    {'1': 'permissions', '3': 8, '4': 3, '5': 9, '10': 'permissions'},
    {'1': 'location_ids', '3': 9, '4': 3, '5': 9, '10': 'locationIds'},
    {'1': 'has_accepted_invite', '3': 10, '4': 1, '5': 8, '10': 'hasAcceptedInvite'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIhCgxmaXJlYmFzZV91aWQYAiABKAlSC2ZpcmViYXNlVW'
    'lkEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIdCgpmaXJzdF9uYW1lGAQgASgJUglmaXJzdE5hbWUS'
    'GwoJbGFzdF9uYW1lGAUgASgJUghsYXN0TmFtZRIqCgdjb21wYW55GAYgASgLMhAubW9hdC52MS'
    '5Db21wYW55Ugdjb21wYW55EiMKBXJvbGVzGAcgAygLMg0ubW9hdC52MS5Sb2xlUgVyb2xlcxIg'
    'CgtwZXJtaXNzaW9ucxgIIAMoCVILcGVybWlzc2lvbnMSIQoMbG9jYXRpb25faWRzGAkgAygJUg'
    'tsb2NhdGlvbklkcxIuChNoYXNfYWNjZXB0ZWRfaW52aXRlGAogASgIUhFoYXNBY2NlcHRlZElu'
    'dml0ZQ==');

@$core.Deprecated('Use companyDescriptor instead')
const Company$json = {
  '1': 'Company',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Company`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List companyDescriptor = $convert.base64Decode(
    'CgdDb21wYW55Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');

@$core.Deprecated('Use roleDescriptor instead')
const Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'permissions', '3': 3, '4': 3, '5': 9, '10': 'permissions'},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC3Blcm1pc3Npb2'
    '5zGAMgAygJUgtwZXJtaXNzaW9ucw==');

const $core.Map<$core.String, $core.dynamic> AuthServiceBase$json = {
  '1': 'AuthService',
  '2': [
    {'1': 'GetCurrentUser', '2': '.moat.v1.GetCurrentUserRequest', '3': '.moat.v1.GetCurrentUserResponse'},
  ],
};

@$core.Deprecated('Use authServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> AuthServiceBase$messageJson = {
  '.moat.v1.GetCurrentUserRequest': GetCurrentUserRequest$json,
  '.moat.v1.GetCurrentUserResponse': GetCurrentUserResponse$json,
  '.moat.v1.User': User$json,
  '.moat.v1.Company': Company$json,
  '.moat.v1.Role': Role$json,
};

/// Descriptor for `AuthService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List authServiceDescriptor = $convert.base64Decode(
    'CgtBdXRoU2VydmljZRJRCg5HZXRDdXJyZW50VXNlchIeLm1vYXQudjEuR2V0Q3VycmVudFVzZX'
    'JSZXF1ZXN0Gh8ubW9hdC52MS5HZXRDdXJyZW50VXNlclJlc3BvbnNl');

