//
//  Generated code. Do not modify.
//  source: moat/v1/organization.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use memberDescriptor instead')
const Member$json = {
  '1': 'Member',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'has_accepted_invite', '3': 5, '4': 1, '5': 8, '10': 'hasAcceptedInvite'},
    {'1': 'deleted', '3': 6, '4': 1, '5': 8, '10': 'deleted'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'roles', '3': 9, '4': 3, '5': 11, '6': '.moat.v1.MemberRole', '10': 'roles'},
    {'1': 'location_ids', '3': 10, '4': 3, '5': 9, '10': 'locationIds'},
  ],
};

/// Descriptor for `Member`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberDescriptor = $convert.base64Decode(
    'CgZNZW1iZXISDgoCaWQYASABKAlSAmlkEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIdCgpmaXJzdF'
    '9uYW1lGAMgASgJUglmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAQgASgJUghsYXN0TmFtZRIuChNo'
    'YXNfYWNjZXB0ZWRfaW52aXRlGAUgASgIUhFoYXNBY2NlcHRlZEludml0ZRIYCgdkZWxldGVkGA'
    'YgASgIUgdkZWxldGVkEjkKCmNyZWF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIpCgVyb2xlcxgJIAMoCzITLm1vYXQudjEuTWVtYmVyUm9s'
    'ZVIFcm9sZXMSIQoMbG9jYXRpb25faWRzGAogAygJUgtsb2NhdGlvbklkcw==');

@$core.Deprecated('Use memberRoleDescriptor instead')
const MemberRole$json = {
  '1': 'MemberRole',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'is_system', '3': 3, '4': 1, '5': 8, '10': 'isSystem'},
    {'1': 'location_ids', '3': 4, '4': 3, '5': 9, '10': 'locationIds'},
  ],
};

/// Descriptor for `MemberRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberRoleDescriptor = $convert.base64Decode(
    'CgpNZW1iZXJSb2xlEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhsKCWlzX3'
    'N5c3RlbRgDIAEoCFIIaXNTeXN0ZW0SIQoMbG9jYXRpb25faWRzGAQgAygJUgtsb2NhdGlvbklk'
    'cw==');

@$core.Deprecated('Use listMembersRequestDescriptor instead')
const ListMembersRequest$json = {
  '1': 'ListMembersRequest',
  '2': [
    {'1': 'search', '3': 1, '4': 1, '5': 9, '10': 'search'},
    {'1': 'include_deleted', '3': 2, '4': 1, '5': 8, '10': 'includeDeleted'},
    {'1': 'include_pending', '3': 3, '4': 1, '5': 8, '10': 'includePending'},
    {'1': 'has_permission', '3': 4, '4': 1, '5': 9, '10': 'hasPermission'},
    {'1': 'limit', '3': 5, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 6, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'sort_by', '3': 7, '4': 1, '5': 9, '10': 'sortBy'},
    {'1': 'sort_order', '3': 8, '4': 1, '5': 9, '10': 'sortOrder'},
  ],
};

/// Descriptor for `ListMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMembersRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0TWVtYmVyc1JlcXVlc3QSFgoGc2VhcmNoGAEgASgJUgZzZWFyY2gSJwoPaW5jbHVkZV'
    '9kZWxldGVkGAIgASgIUg5pbmNsdWRlRGVsZXRlZBInCg9pbmNsdWRlX3BlbmRpbmcYAyABKAhS'
    'DmluY2x1ZGVQZW5kaW5nEiUKDmhhc19wZXJtaXNzaW9uGAQgASgJUg1oYXNQZXJtaXNzaW9uEh'
    'QKBWxpbWl0GAUgASgFUgVsaW1pdBIWCgZvZmZzZXQYBiABKAVSBm9mZnNldBIXCgdzb3J0X2J5'
    'GAcgASgJUgZzb3J0QnkSHQoKc29ydF9vcmRlchgIIAEoCVIJc29ydE9yZGVy');

@$core.Deprecated('Use listMembersResponseDescriptor instead')
const ListMembersResponse$json = {
  '1': 'ListMembersResponse',
  '2': [
    {'1': 'members', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.Member', '10': 'members'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMembersResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0TWVtYmVyc1Jlc3BvbnNlEikKB21lbWJlcnMYASADKAsyDy5tb2F0LnYxLk1lbWJlcl'
    'IHbWVtYmVycxIUCgV0b3RhbBgCIAEoBVIFdG90YWw=');

@$core.Deprecated('Use getMemberRequestDescriptor instead')
const GetMemberRequest$json = {
  '1': 'GetMemberRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
  ],
};

/// Descriptor for `GetMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMemberRequestDescriptor = $convert.base64Decode(
    'ChBHZXRNZW1iZXJSZXF1ZXN0EhsKCW1lbWJlcl9pZBgBIAEoCVIIbWVtYmVySWQ=');

@$core.Deprecated('Use createMemberRequestDescriptor instead')
const CreateMemberRequest$json = {
  '1': 'CreateMemberRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'role_ids', '3': 4, '4': 3, '5': 9, '10': 'roleIds'},
    {'1': 'location_ids', '3': 5, '4': 3, '5': 9, '10': 'locationIds'},
  ],
};

/// Descriptor for `CreateMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMemberRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVNZW1iZXJSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIdCgpmaXJzdF9uYW'
    '1lGAIgASgJUglmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAMgASgJUghsYXN0TmFtZRIZCghyb2xl'
    'X2lkcxgEIAMoCVIHcm9sZUlkcxIhCgxsb2NhdGlvbl9pZHMYBSADKAlSC2xvY2F0aW9uSWRz');

@$core.Deprecated('Use updateMemberRequestDescriptor instead')
const UpdateMemberRequest$json = {
  '1': 'UpdateMemberRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'firstName', '17': true},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'lastName', '17': true},
  ],
  '8': [
    {'1': '_first_name'},
    {'1': '_last_name'},
  ],
};

/// Descriptor for `UpdateMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMemberRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVNZW1iZXJSZXF1ZXN0EhsKCW1lbWJlcl9pZBgBIAEoCVIIbWVtYmVySWQSIgoKZm'
    'lyc3RfbmFtZRgCIAEoCUgAUglmaXJzdE5hbWWIAQESIAoJbGFzdF9uYW1lGAMgASgJSAFSCGxh'
    'c3ROYW1liAEBQg0KC19maXJzdF9uYW1lQgwKCl9sYXN0X25hbWU=');

@$core.Deprecated('Use deleteMemberRequestDescriptor instead')
const DeleteMemberRequest$json = {
  '1': 'DeleteMemberRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
  ],
};

/// Descriptor for `DeleteMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMemberRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVNZW1iZXJSZXF1ZXN0EhsKCW1lbWJlcl9pZBgBIAEoCVIIbWVtYmVySWQ=');

@$core.Deprecated('Use deleteMemberResponseDescriptor instead')
const DeleteMemberResponse$json = {
  '1': 'DeleteMemberResponse',
};

/// Descriptor for `DeleteMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMemberResponseDescriptor = $convert.base64Decode(
    'ChREZWxldGVNZW1iZXJSZXNwb25zZQ==');

@$core.Deprecated('Use locationDescriptor instead')
const Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    {'1': 'city', '3': 4, '4': 1, '5': 9, '10': 'city'},
    {'1': 'state', '3': 5, '4': 1, '5': 9, '10': 'state'},
    {'1': 'zip_code', '3': 6, '4': 1, '5': 9, '10': 'zipCode'},
    {'1': 'country', '3': 7, '4': 1, '5': 9, '10': 'country'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode(
    'CghMb2NhdGlvbhIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIYCgdhZGRyZX'
    'NzGAMgASgJUgdhZGRyZXNzEhIKBGNpdHkYBCABKAlSBGNpdHkSFAoFc3RhdGUYBSABKAlSBXN0'
    'YXRlEhkKCHppcF9jb2RlGAYgASgJUgd6aXBDb2RlEhgKB2NvdW50cnkYByABKAlSB2NvdW50cn'
    'kSOQoKY3JlYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0'
    'ZWRBdBI5Cgp1cGRhdGVkX2F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdX'
    'BkYXRlZEF0');

@$core.Deprecated('Use listLocationsRequestDescriptor instead')
const ListLocationsRequest$json = {
  '1': 'ListLocationsRequest',
};

/// Descriptor for `ListLocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLocationsRequestDescriptor = $convert.base64Decode(
    'ChRMaXN0TG9jYXRpb25zUmVxdWVzdA==');

@$core.Deprecated('Use listLocationsResponseDescriptor instead')
const ListLocationsResponse$json = {
  '1': 'ListLocationsResponse',
  '2': [
    {'1': 'locations', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.Location', '10': 'locations'},
  ],
};

/// Descriptor for `ListLocationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLocationsResponseDescriptor = $convert.base64Decode(
    'ChVMaXN0TG9jYXRpb25zUmVzcG9uc2USLwoJbG9jYXRpb25zGAEgAygLMhEubW9hdC52MS5Mb2'
    'NhdGlvblIJbG9jYXRpb25z');

@$core.Deprecated('Use getLocationRequestDescriptor instead')
const GetLocationRequest$json = {
  '1': 'GetLocationRequest',
  '2': [
    {'1': 'location_id', '3': 1, '4': 1, '5': 9, '10': 'locationId'},
  ],
};

/// Descriptor for `GetLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationRequestDescriptor = $convert.base64Decode(
    'ChJHZXRMb2NhdGlvblJlcXVlc3QSHwoLbG9jYXRpb25faWQYASABKAlSCmxvY2F0aW9uSWQ=');

@$core.Deprecated('Use createLocationRequestDescriptor instead')
const CreateLocationRequest$json = {
  '1': 'CreateLocationRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {'1': 'city', '3': 3, '4': 1, '5': 9, '10': 'city'},
    {'1': 'state', '3': 4, '4': 1, '5': 9, '10': 'state'},
    {'1': 'zip_code', '3': 5, '4': 1, '5': 9, '10': 'zipCode'},
    {'1': 'country', '3': 6, '4': 1, '5': 9, '10': 'country'},
  ],
};

/// Descriptor for `CreateLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLocationRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVMb2NhdGlvblJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIYCgdhZGRyZXNzGA'
    'IgASgJUgdhZGRyZXNzEhIKBGNpdHkYAyABKAlSBGNpdHkSFAoFc3RhdGUYBCABKAlSBXN0YXRl'
    'EhkKCHppcF9jb2RlGAUgASgJUgd6aXBDb2RlEhgKB2NvdW50cnkYBiABKAlSB2NvdW50cnk=');

@$core.Deprecated('Use updateLocationRequestDescriptor instead')
const UpdateLocationRequest$json = {
  '1': 'UpdateLocationRequest',
  '2': [
    {'1': 'location_id', '3': 1, '4': 1, '5': 9, '10': 'locationId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'address', '17': true},
    {'1': 'city', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'city', '17': true},
    {'1': 'state', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'state', '17': true},
    {'1': 'zip_code', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'zipCode', '17': true},
    {'1': 'country', '3': 7, '4': 1, '5': 9, '9': 5, '10': 'country', '17': true},
  ],
  '8': [
    {'1': '_name'},
    {'1': '_address'},
    {'1': '_city'},
    {'1': '_state'},
    {'1': '_zip_code'},
    {'1': '_country'},
  ],
};

/// Descriptor for `UpdateLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLocationRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVMb2NhdGlvblJlcXVlc3QSHwoLbG9jYXRpb25faWQYASABKAlSCmxvY2F0aW9uSW'
    'QSFwoEbmFtZRgCIAEoCUgAUgRuYW1liAEBEh0KB2FkZHJlc3MYAyABKAlIAVIHYWRkcmVzc4gB'
    'ARIXCgRjaXR5GAQgASgJSAJSBGNpdHmIAQESGQoFc3RhdGUYBSABKAlIA1IFc3RhdGWIAQESHg'
    'oIemlwX2NvZGUYBiABKAlIBFIHemlwQ29kZYgBARIdCgdjb3VudHJ5GAcgASgJSAVSB2NvdW50'
    'cnmIAQFCBwoFX25hbWVCCgoIX2FkZHJlc3NCBwoFX2NpdHlCCAoGX3N0YXRlQgsKCV96aXBfY2'
    '9kZUIKCghfY291bnRyeQ==');

@$core.Deprecated('Use deleteLocationRequestDescriptor instead')
const DeleteLocationRequest$json = {
  '1': 'DeleteLocationRequest',
  '2': [
    {'1': 'location_id', '3': 1, '4': 1, '5': 9, '10': 'locationId'},
  ],
};

/// Descriptor for `DeleteLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLocationRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVMb2NhdGlvblJlcXVlc3QSHwoLbG9jYXRpb25faWQYASABKAlSCmxvY2F0aW9uSW'
    'Q=');

@$core.Deprecated('Use deleteLocationResponseDescriptor instead')
const DeleteLocationResponse$json = {
  '1': 'DeleteLocationResponse',
};

/// Descriptor for `DeleteLocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLocationResponseDescriptor = $convert.base64Decode(
    'ChZEZWxldGVMb2NhdGlvblJlc3BvbnNl');

@$core.Deprecated('Use getMyLocationsRequestDescriptor instead')
const GetMyLocationsRequest$json = {
  '1': 'GetMyLocationsRequest',
};

/// Descriptor for `GetMyLocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyLocationsRequestDescriptor = $convert.base64Decode(
    'ChVHZXRNeUxvY2F0aW9uc1JlcXVlc3Q=');

@$core.Deprecated('Use roleDetailDescriptor instead')
const RoleDetail$json = {
  '1': 'RoleDetail',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'is_system', '3': 4, '4': 1, '5': 8, '10': 'isSystem'},
    {'1': 'is_assignable', '3': 5, '4': 1, '5': 8, '10': 'isAssignable'},
    {'1': 'permissions', '3': 6, '4': 3, '5': 11, '6': '.moat.v1.Permission', '10': 'permissions'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `RoleDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleDetailDescriptor = $convert.base64Decode(
    'CgpSb2xlRGV0YWlsEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2Rlc2'
    'NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIbCglpc19zeXN0ZW0YBCABKAhSCGlzU3lzdGVt'
    'EiMKDWlzX2Fzc2lnbmFibGUYBSABKAhSDGlzQXNzaWduYWJsZRI1CgtwZXJtaXNzaW9ucxgGIA'
    'MoCzITLm1vYXQudjEuUGVybWlzc2lvblILcGVybWlzc2lvbnMSOQoKY3JlYXRlZF9hdBgHIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GA'
    'ggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');

@$core.Deprecated('Use permissionDescriptor instead')
const Permission$json = {
  '1': 'Permission',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'resource', '3': 2, '4': 1, '5': 9, '10': 'resource'},
    {'1': 'action', '3': 3, '4': 1, '5': 9, '10': 'action'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Permission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionDescriptor = $convert.base64Decode(
    'CgpQZXJtaXNzaW9uEg4KAmlkGAEgASgJUgJpZBIaCghyZXNvdXJjZRgCIAEoCVIIcmVzb3VyY2'
    'USFgoGYWN0aW9uGAMgASgJUgZhY3Rpb24SEgoEbmFtZRgEIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use listRolesRequestDescriptor instead')
const ListRolesRequest$json = {
  '1': 'ListRolesRequest',
  '2': [
    {'1': 'include_system', '3': 1, '4': 1, '5': 8, '10': 'includeSystem'},
    {'1': 'is_assignable', '3': 2, '4': 1, '5': 8, '9': 0, '10': 'isAssignable', '17': true},
  ],
  '8': [
    {'1': '_is_assignable'},
  ],
};

/// Descriptor for `ListRolesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRolesRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0Um9sZXNSZXF1ZXN0EiUKDmluY2x1ZGVfc3lzdGVtGAEgASgIUg1pbmNsdWRlU3lzdG'
    'VtEigKDWlzX2Fzc2lnbmFibGUYAiABKAhIAFIMaXNBc3NpZ25hYmxliAEBQhAKDl9pc19hc3Np'
    'Z25hYmxl');

@$core.Deprecated('Use listRolesResponseDescriptor instead')
const ListRolesResponse$json = {
  '1': 'ListRolesResponse',
  '2': [
    {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.RoleDetail', '10': 'roles'},
  ],
};

/// Descriptor for `ListRolesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRolesResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0Um9sZXNSZXNwb25zZRIpCgVyb2xlcxgBIAMoCzITLm1vYXQudjEuUm9sZURldGFpbF'
    'IFcm9sZXM=');

@$core.Deprecated('Use getRoleRequestDescriptor instead')
const GetRoleRequest$json = {
  '1': 'GetRoleRequest',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 9, '10': 'roleId'},
  ],
};

/// Descriptor for `GetRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoleRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRSb2xlUmVxdWVzdBIXCgdyb2xlX2lkGAEgASgJUgZyb2xlSWQ=');

@$core.Deprecated('Use createRoleRequestDescriptor instead')
const CreateRoleRequest$json = {
  '1': 'CreateRoleRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'is_assignable', '3': 3, '4': 1, '5': 8, '10': 'isAssignable'},
    {'1': 'permission_ids', '3': 4, '4': 3, '5': 9, '10': 'permissionIds'},
  ],
};

/// Descriptor for `CreateRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoleRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVSb2xlUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGA'
    'IgASgJUgtkZXNjcmlwdGlvbhIjCg1pc19hc3NpZ25hYmxlGAMgASgIUgxpc0Fzc2lnbmFibGUS'
    'JQoOcGVybWlzc2lvbl9pZHMYBCADKAlSDXBlcm1pc3Npb25JZHM=');

@$core.Deprecated('Use updateRoleRequestDescriptor instead')
const UpdateRoleRequest$json = {
  '1': 'UpdateRoleRequest',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 9, '10': 'roleId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    {'1': 'is_assignable', '3': 4, '4': 1, '5': 8, '9': 2, '10': 'isAssignable', '17': true},
    {'1': 'permission_ids', '3': 5, '4': 3, '5': 9, '10': 'permissionIds'},
  ],
  '8': [
    {'1': '_name'},
    {'1': '_description'},
    {'1': '_is_assignable'},
  ],
};

/// Descriptor for `UpdateRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRoleRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVSb2xlUmVxdWVzdBIXCgdyb2xlX2lkGAEgASgJUgZyb2xlSWQSFwoEbmFtZRgCIA'
    'EoCUgAUgRuYW1liAEBEiUKC2Rlc2NyaXB0aW9uGAMgASgJSAFSC2Rlc2NyaXB0aW9uiAEBEigK'
    'DWlzX2Fzc2lnbmFibGUYBCABKAhIAlIMaXNBc3NpZ25hYmxliAEBEiUKDnBlcm1pc3Npb25faW'
    'RzGAUgAygJUg1wZXJtaXNzaW9uSWRzQgcKBV9uYW1lQg4KDF9kZXNjcmlwdGlvbkIQCg5faXNf'
    'YXNzaWduYWJsZQ==');

@$core.Deprecated('Use deleteRoleRequestDescriptor instead')
const DeleteRoleRequest$json = {
  '1': 'DeleteRoleRequest',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 9, '10': 'roleId'},
  ],
};

/// Descriptor for `DeleteRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoleRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVSb2xlUmVxdWVzdBIXCgdyb2xlX2lkGAEgASgJUgZyb2xlSWQ=');

@$core.Deprecated('Use deleteRoleResponseDescriptor instead')
const DeleteRoleResponse$json = {
  '1': 'DeleteRoleResponse',
};

/// Descriptor for `DeleteRoleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoleResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVSb2xlUmVzcG9uc2U=');

@$core.Deprecated('Use assignRoleRequestDescriptor instead')
const AssignRoleRequest$json = {
  '1': 'AssignRoleRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 9, '10': 'roleId'},
    {'1': 'location_ids', '3': 3, '4': 3, '5': 9, '10': 'locationIds'},
  ],
};

/// Descriptor for `AssignRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignRoleRequestDescriptor = $convert.base64Decode(
    'ChFBc3NpZ25Sb2xlUmVxdWVzdBIbCgltZW1iZXJfaWQYASABKAlSCG1lbWJlcklkEhcKB3JvbG'
    'VfaWQYAiABKAlSBnJvbGVJZBIhCgxsb2NhdGlvbl9pZHMYAyADKAlSC2xvY2F0aW9uSWRz');

@$core.Deprecated('Use assignRoleResponseDescriptor instead')
const AssignRoleResponse$json = {
  '1': 'AssignRoleResponse',
};

/// Descriptor for `AssignRoleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignRoleResponseDescriptor = $convert.base64Decode(
    'ChJBc3NpZ25Sb2xlUmVzcG9uc2U=');

@$core.Deprecated('Use revokeRoleRequestDescriptor instead')
const RevokeRoleRequest$json = {
  '1': 'RevokeRoleRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 9, '10': 'roleId'},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `RevokeRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revokeRoleRequestDescriptor = $convert.base64Decode(
    'ChFSZXZva2VSb2xlUmVxdWVzdBIbCgltZW1iZXJfaWQYASABKAlSCG1lbWJlcklkEhcKB3JvbG'
    'VfaWQYAiABKAlSBnJvbGVJZBIWCgZyZWFzb24YAyABKAlSBnJlYXNvbg==');

@$core.Deprecated('Use revokeRoleResponseDescriptor instead')
const RevokeRoleResponse$json = {
  '1': 'RevokeRoleResponse',
};

/// Descriptor for `RevokeRoleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revokeRoleResponseDescriptor = $convert.base64Decode(
    'ChJSZXZva2VSb2xlUmVzcG9uc2U=');

@$core.Deprecated('Use getMemberLocationsRequestDescriptor instead')
const GetMemberLocationsRequest$json = {
  '1': 'GetMemberLocationsRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
  ],
};

/// Descriptor for `GetMemberLocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMemberLocationsRequestDescriptor = $convert.base64Decode(
    'ChlHZXRNZW1iZXJMb2NhdGlvbnNSZXF1ZXN0EhsKCW1lbWJlcl9pZBgBIAEoCVIIbWVtYmVySW'
    'Q=');

@$core.Deprecated('Use assignMemberLocationRequestDescriptor instead')
const AssignMemberLocationRequest$json = {
  '1': 'AssignMemberLocationRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
    {'1': 'location_id', '3': 2, '4': 1, '5': 9, '10': 'locationId'},
  ],
};

/// Descriptor for `AssignMemberLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignMemberLocationRequestDescriptor = $convert.base64Decode(
    'ChtBc3NpZ25NZW1iZXJMb2NhdGlvblJlcXVlc3QSGwoJbWVtYmVyX2lkGAEgASgJUghtZW1iZX'
    'JJZBIfCgtsb2NhdGlvbl9pZBgCIAEoCVIKbG9jYXRpb25JZA==');

@$core.Deprecated('Use assignMemberLocationResponseDescriptor instead')
const AssignMemberLocationResponse$json = {
  '1': 'AssignMemberLocationResponse',
};

/// Descriptor for `AssignMemberLocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignMemberLocationResponseDescriptor = $convert.base64Decode(
    'ChxBc3NpZ25NZW1iZXJMb2NhdGlvblJlc3BvbnNl');

@$core.Deprecated('Use revokeMemberLocationRequestDescriptor instead')
const RevokeMemberLocationRequest$json = {
  '1': 'RevokeMemberLocationRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
    {'1': 'location_id', '3': 2, '4': 1, '5': 9, '10': 'locationId'},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `RevokeMemberLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revokeMemberLocationRequestDescriptor = $convert.base64Decode(
    'ChtSZXZva2VNZW1iZXJMb2NhdGlvblJlcXVlc3QSGwoJbWVtYmVyX2lkGAEgASgJUghtZW1iZX'
    'JJZBIfCgtsb2NhdGlvbl9pZBgCIAEoCVIKbG9jYXRpb25JZBIWCgZyZWFzb24YAyABKAlSBnJl'
    'YXNvbg==');

@$core.Deprecated('Use revokeMemberLocationResponseDescriptor instead')
const RevokeMemberLocationResponse$json = {
  '1': 'RevokeMemberLocationResponse',
};

/// Descriptor for `RevokeMemberLocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revokeMemberLocationResponseDescriptor = $convert.base64Decode(
    'ChxSZXZva2VNZW1iZXJMb2NhdGlvblJlc3BvbnNl');

@$core.Deprecated('Use listPermissionsRequestDescriptor instead')
const ListPermissionsRequest$json = {
  '1': 'ListPermissionsRequest',
};

/// Descriptor for `ListPermissionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPermissionsRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0UGVybWlzc2lvbnNSZXF1ZXN0');

@$core.Deprecated('Use listPermissionsResponseDescriptor instead')
const ListPermissionsResponse$json = {
  '1': 'ListPermissionsResponse',
  '2': [
    {'1': 'permissions', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.Permission', '10': 'permissions'},
    {'1': 'condition_types', '3': 2, '4': 3, '5': 11, '6': '.moat.v1.ConditionType', '10': 'conditionTypes'},
  ],
};

/// Descriptor for `ListPermissionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPermissionsResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0UGVybWlzc2lvbnNSZXNwb25zZRI1CgtwZXJtaXNzaW9ucxgBIAMoCzITLm1vYXQudj'
    'EuUGVybWlzc2lvblILcGVybWlzc2lvbnMSPwoPY29uZGl0aW9uX3R5cGVzGAIgAygLMhYubW9h'
    'dC52MS5Db25kaXRpb25UeXBlUg5jb25kaXRpb25UeXBlcw==');

@$core.Deprecated('Use conditionTypeDescriptor instead')
const ConditionType$json = {
  '1': 'ConditionType',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `ConditionType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conditionTypeDescriptor = $convert.base64Decode(
    'Cg1Db25kaXRpb25UeXBlEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2'
    'Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbg==');

@$core.Deprecated('Use validateInvitationRequestDescriptor instead')
const ValidateInvitationRequest$json = {
  '1': 'ValidateInvitationRequest',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'member_id', '3': 2, '4': 1, '5': 9, '10': 'memberId'},
  ],
};

/// Descriptor for `ValidateInvitationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateInvitationRequestDescriptor = $convert.base64Decode(
    'ChlWYWxpZGF0ZUludml0YXRpb25SZXF1ZXN0Eh0KCmNvbXBhbnlfaWQYASABKAlSCWNvbXBhbn'
    'lJZBIbCgltZW1iZXJfaWQYAiABKAlSCG1lbWJlcklk');

@$core.Deprecated('Use invitationInfoDescriptor instead')
const InvitationInfo$json = {
  '1': 'InvitationInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'company_id', '3': 2, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'company_name', '3': 3, '4': 1, '5': 9, '10': 'companyName'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 5, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 6, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `InvitationInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invitationInfoDescriptor = $convert.base64Decode(
    'Cg5JbnZpdGF0aW9uSW5mbxIOCgJpZBgBIAEoCVICaWQSHQoKY29tcGFueV9pZBgCIAEoCVIJY2'
    '9tcGFueUlkEiEKDGNvbXBhbnlfbmFtZRgDIAEoCVILY29tcGFueU5hbWUSFAoFZW1haWwYBCAB'
    'KAlSBWVtYWlsEh0KCmZpcnN0X25hbWUYBSABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25hbWUYBi'
    'ABKAlSCGxhc3ROYW1lEhYKBnN0YXR1cxgHIAEoCVIGc3RhdHVzEjkKCmNyZWF0ZWRfYXQYCCAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use acceptInvitationRequestDescriptor instead')
const AcceptInvitationRequest$json = {
  '1': 'AcceptInvitationRequest',
  '2': [
    {'1': 'company_id', '3': 1, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'member_id', '3': 2, '4': 1, '5': 9, '10': 'memberId'},
    {'1': 'firebase_uid', '3': 3, '4': 1, '5': 9, '10': 'firebaseUid'},
  ],
};

/// Descriptor for `AcceptInvitationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptInvitationRequestDescriptor = $convert.base64Decode(
    'ChdBY2NlcHRJbnZpdGF0aW9uUmVxdWVzdBIdCgpjb21wYW55X2lkGAEgASgJUgljb21wYW55SW'
    'QSGwoJbWVtYmVyX2lkGAIgASgJUghtZW1iZXJJZBIhCgxmaXJlYmFzZV91aWQYAyABKAlSC2Zp'
    'cmViYXNlVWlk');

const $core.Map<$core.String, $core.dynamic> OrganizationServiceBase$json = {
  '1': 'OrganizationService',
  '2': [
    {'1': 'ListMembers', '2': '.moat.v1.ListMembersRequest', '3': '.moat.v1.ListMembersResponse'},
    {'1': 'GetMember', '2': '.moat.v1.GetMemberRequest', '3': '.moat.v1.Member'},
    {'1': 'CreateMember', '2': '.moat.v1.CreateMemberRequest', '3': '.moat.v1.Member'},
    {'1': 'UpdateMember', '2': '.moat.v1.UpdateMemberRequest', '3': '.moat.v1.Member'},
    {'1': 'DeleteMember', '2': '.moat.v1.DeleteMemberRequest', '3': '.moat.v1.DeleteMemberResponse'},
    {'1': 'ListLocations', '2': '.moat.v1.ListLocationsRequest', '3': '.moat.v1.ListLocationsResponse'},
    {'1': 'GetLocation', '2': '.moat.v1.GetLocationRequest', '3': '.moat.v1.Location'},
    {'1': 'CreateLocation', '2': '.moat.v1.CreateLocationRequest', '3': '.moat.v1.Location'},
    {'1': 'UpdateLocation', '2': '.moat.v1.UpdateLocationRequest', '3': '.moat.v1.Location'},
    {'1': 'DeleteLocation', '2': '.moat.v1.DeleteLocationRequest', '3': '.moat.v1.DeleteLocationResponse'},
    {'1': 'GetMyLocations', '2': '.moat.v1.GetMyLocationsRequest', '3': '.moat.v1.ListLocationsResponse'},
    {'1': 'ListRoles', '2': '.moat.v1.ListRolesRequest', '3': '.moat.v1.ListRolesResponse'},
    {'1': 'GetRole', '2': '.moat.v1.GetRoleRequest', '3': '.moat.v1.RoleDetail'},
    {'1': 'CreateRole', '2': '.moat.v1.CreateRoleRequest', '3': '.moat.v1.RoleDetail'},
    {'1': 'UpdateRole', '2': '.moat.v1.UpdateRoleRequest', '3': '.moat.v1.RoleDetail'},
    {'1': 'DeleteRole', '2': '.moat.v1.DeleteRoleRequest', '3': '.moat.v1.DeleteRoleResponse'},
    {'1': 'AssignRole', '2': '.moat.v1.AssignRoleRequest', '3': '.moat.v1.AssignRoleResponse'},
    {'1': 'RevokeRole', '2': '.moat.v1.RevokeRoleRequest', '3': '.moat.v1.RevokeRoleResponse'},
    {'1': 'GetMemberLocations', '2': '.moat.v1.GetMemberLocationsRequest', '3': '.moat.v1.ListLocationsResponse'},
    {'1': 'AssignMemberLocation', '2': '.moat.v1.AssignMemberLocationRequest', '3': '.moat.v1.AssignMemberLocationResponse'},
    {'1': 'RevokeMemberLocation', '2': '.moat.v1.RevokeMemberLocationRequest', '3': '.moat.v1.RevokeMemberLocationResponse'},
    {'1': 'ListPermissions', '2': '.moat.v1.ListPermissionsRequest', '3': '.moat.v1.ListPermissionsResponse'},
    {'1': 'ValidateInvitation', '2': '.moat.v1.ValidateInvitationRequest', '3': '.moat.v1.InvitationInfo'},
    {'1': 'AcceptInvitation', '2': '.moat.v1.AcceptInvitationRequest', '3': '.moat.v1.Member'},
  ],
};

@$core.Deprecated('Use organizationServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> OrganizationServiceBase$messageJson = {
  '.moat.v1.ListMembersRequest': ListMembersRequest$json,
  '.moat.v1.ListMembersResponse': ListMembersResponse$json,
  '.moat.v1.Member': Member$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.moat.v1.MemberRole': MemberRole$json,
  '.moat.v1.GetMemberRequest': GetMemberRequest$json,
  '.moat.v1.CreateMemberRequest': CreateMemberRequest$json,
  '.moat.v1.UpdateMemberRequest': UpdateMemberRequest$json,
  '.moat.v1.DeleteMemberRequest': DeleteMemberRequest$json,
  '.moat.v1.DeleteMemberResponse': DeleteMemberResponse$json,
  '.moat.v1.ListLocationsRequest': ListLocationsRequest$json,
  '.moat.v1.ListLocationsResponse': ListLocationsResponse$json,
  '.moat.v1.Location': Location$json,
  '.moat.v1.GetLocationRequest': GetLocationRequest$json,
  '.moat.v1.CreateLocationRequest': CreateLocationRequest$json,
  '.moat.v1.UpdateLocationRequest': UpdateLocationRequest$json,
  '.moat.v1.DeleteLocationRequest': DeleteLocationRequest$json,
  '.moat.v1.DeleteLocationResponse': DeleteLocationResponse$json,
  '.moat.v1.GetMyLocationsRequest': GetMyLocationsRequest$json,
  '.moat.v1.ListRolesRequest': ListRolesRequest$json,
  '.moat.v1.ListRolesResponse': ListRolesResponse$json,
  '.moat.v1.RoleDetail': RoleDetail$json,
  '.moat.v1.Permission': Permission$json,
  '.moat.v1.GetRoleRequest': GetRoleRequest$json,
  '.moat.v1.CreateRoleRequest': CreateRoleRequest$json,
  '.moat.v1.UpdateRoleRequest': UpdateRoleRequest$json,
  '.moat.v1.DeleteRoleRequest': DeleteRoleRequest$json,
  '.moat.v1.DeleteRoleResponse': DeleteRoleResponse$json,
  '.moat.v1.AssignRoleRequest': AssignRoleRequest$json,
  '.moat.v1.AssignRoleResponse': AssignRoleResponse$json,
  '.moat.v1.RevokeRoleRequest': RevokeRoleRequest$json,
  '.moat.v1.RevokeRoleResponse': RevokeRoleResponse$json,
  '.moat.v1.GetMemberLocationsRequest': GetMemberLocationsRequest$json,
  '.moat.v1.AssignMemberLocationRequest': AssignMemberLocationRequest$json,
  '.moat.v1.AssignMemberLocationResponse': AssignMemberLocationResponse$json,
  '.moat.v1.RevokeMemberLocationRequest': RevokeMemberLocationRequest$json,
  '.moat.v1.RevokeMemberLocationResponse': RevokeMemberLocationResponse$json,
  '.moat.v1.ListPermissionsRequest': ListPermissionsRequest$json,
  '.moat.v1.ListPermissionsResponse': ListPermissionsResponse$json,
  '.moat.v1.ConditionType': ConditionType$json,
  '.moat.v1.ValidateInvitationRequest': ValidateInvitationRequest$json,
  '.moat.v1.InvitationInfo': InvitationInfo$json,
  '.moat.v1.AcceptInvitationRequest': AcceptInvitationRequest$json,
};

/// Descriptor for `OrganizationService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List organizationServiceDescriptor = $convert.base64Decode(
    'ChNPcmdhbml6YXRpb25TZXJ2aWNlEkgKC0xpc3RNZW1iZXJzEhsubW9hdC52MS5MaXN0TWVtYm'
    'Vyc1JlcXVlc3QaHC5tb2F0LnYxLkxpc3RNZW1iZXJzUmVzcG9uc2USNwoJR2V0TWVtYmVyEhku'
    'bW9hdC52MS5HZXRNZW1iZXJSZXF1ZXN0Gg8ubW9hdC52MS5NZW1iZXISPQoMQ3JlYXRlTWVtYm'
    'VyEhwubW9hdC52MS5DcmVhdGVNZW1iZXJSZXF1ZXN0Gg8ubW9hdC52MS5NZW1iZXISPQoMVXBk'
    'YXRlTWVtYmVyEhwubW9hdC52MS5VcGRhdGVNZW1iZXJSZXF1ZXN0Gg8ubW9hdC52MS5NZW1iZX'
    'ISSwoMRGVsZXRlTWVtYmVyEhwubW9hdC52MS5EZWxldGVNZW1iZXJSZXF1ZXN0Gh0ubW9hdC52'
    'MS5EZWxldGVNZW1iZXJSZXNwb25zZRJOCg1MaXN0TG9jYXRpb25zEh0ubW9hdC52MS5MaXN0TG'
    '9jYXRpb25zUmVxdWVzdBoeLm1vYXQudjEuTGlzdExvY2F0aW9uc1Jlc3BvbnNlEj0KC0dldExv'
    'Y2F0aW9uEhsubW9hdC52MS5HZXRMb2NhdGlvblJlcXVlc3QaES5tb2F0LnYxLkxvY2F0aW9uEk'
    'MKDkNyZWF0ZUxvY2F0aW9uEh4ubW9hdC52MS5DcmVhdGVMb2NhdGlvblJlcXVlc3QaES5tb2F0'
    'LnYxLkxvY2F0aW9uEkMKDlVwZGF0ZUxvY2F0aW9uEh4ubW9hdC52MS5VcGRhdGVMb2NhdGlvbl'
    'JlcXVlc3QaES5tb2F0LnYxLkxvY2F0aW9uElEKDkRlbGV0ZUxvY2F0aW9uEh4ubW9hdC52MS5E'
    'ZWxldGVMb2NhdGlvblJlcXVlc3QaHy5tb2F0LnYxLkRlbGV0ZUxvY2F0aW9uUmVzcG9uc2USUA'
    'oOR2V0TXlMb2NhdGlvbnMSHi5tb2F0LnYxLkdldE15TG9jYXRpb25zUmVxdWVzdBoeLm1vYXQu'
    'djEuTGlzdExvY2F0aW9uc1Jlc3BvbnNlEkIKCUxpc3RSb2xlcxIZLm1vYXQudjEuTGlzdFJvbG'
    'VzUmVxdWVzdBoaLm1vYXQudjEuTGlzdFJvbGVzUmVzcG9uc2USNwoHR2V0Um9sZRIXLm1vYXQu'
    'djEuR2V0Um9sZVJlcXVlc3QaEy5tb2F0LnYxLlJvbGVEZXRhaWwSPQoKQ3JlYXRlUm9sZRIaLm'
    '1vYXQudjEuQ3JlYXRlUm9sZVJlcXVlc3QaEy5tb2F0LnYxLlJvbGVEZXRhaWwSPQoKVXBkYXRl'
    'Um9sZRIaLm1vYXQudjEuVXBkYXRlUm9sZVJlcXVlc3QaEy5tb2F0LnYxLlJvbGVEZXRhaWwSRQ'
    'oKRGVsZXRlUm9sZRIaLm1vYXQudjEuRGVsZXRlUm9sZVJlcXVlc3QaGy5tb2F0LnYxLkRlbGV0'
    'ZVJvbGVSZXNwb25zZRJFCgpBc3NpZ25Sb2xlEhoubW9hdC52MS5Bc3NpZ25Sb2xlUmVxdWVzdB'
    'obLm1vYXQudjEuQXNzaWduUm9sZVJlc3BvbnNlEkUKClJldm9rZVJvbGUSGi5tb2F0LnYxLlJl'
    'dm9rZVJvbGVSZXF1ZXN0GhsubW9hdC52MS5SZXZva2VSb2xlUmVzcG9uc2USWAoSR2V0TWVtYm'
    'VyTG9jYXRpb25zEiIubW9hdC52MS5HZXRNZW1iZXJMb2NhdGlvbnNSZXF1ZXN0Gh4ubW9hdC52'
    'MS5MaXN0TG9jYXRpb25zUmVzcG9uc2USYwoUQXNzaWduTWVtYmVyTG9jYXRpb24SJC5tb2F0Ln'
    'YxLkFzc2lnbk1lbWJlckxvY2F0aW9uUmVxdWVzdBolLm1vYXQudjEuQXNzaWduTWVtYmVyTG9j'
    'YXRpb25SZXNwb25zZRJjChRSZXZva2VNZW1iZXJMb2NhdGlvbhIkLm1vYXQudjEuUmV2b2tlTW'
    'VtYmVyTG9jYXRpb25SZXF1ZXN0GiUubW9hdC52MS5SZXZva2VNZW1iZXJMb2NhdGlvblJlc3Bv'
    'bnNlElQKD0xpc3RQZXJtaXNzaW9ucxIfLm1vYXQudjEuTGlzdFBlcm1pc3Npb25zUmVxdWVzdB'
    'ogLm1vYXQudjEuTGlzdFBlcm1pc3Npb25zUmVzcG9uc2USUQoSVmFsaWRhdGVJbnZpdGF0aW9u'
    'EiIubW9hdC52MS5WYWxpZGF0ZUludml0YXRpb25SZXF1ZXN0GhcubW9hdC52MS5JbnZpdGF0aW'
    '9uSW5mbxJFChBBY2NlcHRJbnZpdGF0aW9uEiAubW9hdC52MS5BY2NlcHRJbnZpdGF0aW9uUmVx'
    'dWVzdBoPLm1vYXQudjEuTWVtYmVy');

