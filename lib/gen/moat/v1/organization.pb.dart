//
//  Generated code. Do not modify.
//  source: moat/v1/organization.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Member extends $pb.GeneratedMessage {
  factory Member({
    $core.String? id,
    $core.String? email,
    $core.String? firstName,
    $core.String? lastName,
    $core.bool? hasAcceptedInvite,
    $core.bool? deleted,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
    $core.Iterable<MemberRole>? roles,
    $core.Iterable<$core.String>? locationIds,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (email != null) {
      $result.email = email;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (hasAcceptedInvite != null) {
      $result.hasAcceptedInvite = hasAcceptedInvite;
    }
    if (deleted != null) {
      $result.deleted = deleted;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (roles != null) {
      $result.roles.addAll(roles);
    }
    if (locationIds != null) {
      $result.locationIds.addAll(locationIds);
    }
    return $result;
  }
  Member._() : super();
  factory Member.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Member.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Member', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'firstName')
    ..aOS(4, _omitFieldNames ? '' : 'lastName')
    ..aOB(5, _omitFieldNames ? '' : 'hasAcceptedInvite')
    ..aOB(6, _omitFieldNames ? '' : 'deleted')
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..pc<MemberRole>(9, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: MemberRole.create)
    ..pPS(10, _omitFieldNames ? '' : 'locationIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Member clone() => Member()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Member copyWith(void Function(Member) updates) => super.copyWith((message) => updates(message as Member)) as Member;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Member create() => Member._();
  Member createEmptyInstance() => create();
  static $pb.PbList<Member> createRepeated() => $pb.PbList<Member>();
  @$core.pragma('dart2js:noInline')
  static Member getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Member>(create);
  static Member? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastName => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hasAcceptedInvite => $_getBF(4);
  @$pb.TagNumber(5)
  set hasAcceptedInvite($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHasAcceptedInvite() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasAcceptedInvite() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get deleted => $_getBF(5);
  @$pb.TagNumber(6)
  set deleted($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeleted() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeleted() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($0.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureCreatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($0.Timestamp v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureUpdatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $pb.PbList<MemberRole> get roles => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get locationIds => $_getList(9);
}

class MemberRole extends $pb.GeneratedMessage {
  factory MemberRole({
    $core.String? id,
    $core.String? name,
    $core.bool? isSystem,
    $core.Iterable<$core.String>? locationIds,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (isSystem != null) {
      $result.isSystem = isSystem;
    }
    if (locationIds != null) {
      $result.locationIds.addAll(locationIds);
    }
    return $result;
  }
  MemberRole._() : super();
  factory MemberRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MemberRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MemberRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'isSystem')
    ..pPS(4, _omitFieldNames ? '' : 'locationIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MemberRole clone() => MemberRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MemberRole copyWith(void Function(MemberRole) updates) => super.copyWith((message) => updates(message as MemberRole)) as MemberRole;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberRole create() => MemberRole._();
  MemberRole createEmptyInstance() => create();
  static $pb.PbList<MemberRole> createRepeated() => $pb.PbList<MemberRole>();
  @$core.pragma('dart2js:noInline')
  static MemberRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MemberRole>(create);
  static MemberRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isSystem => $_getBF(2);
  @$pb.TagNumber(3)
  set isSystem($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsSystem() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSystem() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get locationIds => $_getList(3);
}

class ListMembersRequest extends $pb.GeneratedMessage {
  factory ListMembersRequest({
    $core.String? search,
    $core.bool? includeDeleted,
    $core.bool? includePending,
    $core.String? hasPermission,
    $core.int? limit,
    $core.int? offset,
    $core.String? sortBy,
    $core.String? sortOrder,
  }) {
    final $result = create();
    if (search != null) {
      $result.search = search;
    }
    if (includeDeleted != null) {
      $result.includeDeleted = includeDeleted;
    }
    if (includePending != null) {
      $result.includePending = includePending;
    }
    if (hasPermission != null) {
      $result.hasPermission = hasPermission;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (sortBy != null) {
      $result.sortBy = sortBy;
    }
    if (sortOrder != null) {
      $result.sortOrder = sortOrder;
    }
    return $result;
  }
  ListMembersRequest._() : super();
  factory ListMembersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMembersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMembersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'search')
    ..aOB(2, _omitFieldNames ? '' : 'includeDeleted')
    ..aOB(3, _omitFieldNames ? '' : 'includePending')
    ..aOS(4, _omitFieldNames ? '' : 'hasPermission')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'sortBy')
    ..aOS(8, _omitFieldNames ? '' : 'sortOrder')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMembersRequest clone() => ListMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMembersRequest copyWith(void Function(ListMembersRequest) updates) => super.copyWith((message) => updates(message as ListMembersRequest)) as ListMembersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMembersRequest create() => ListMembersRequest._();
  ListMembersRequest createEmptyInstance() => create();
  static $pb.PbList<ListMembersRequest> createRepeated() => $pb.PbList<ListMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListMembersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMembersRequest>(create);
  static ListMembersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get search => $_getSZ(0);
  @$pb.TagNumber(1)
  set search($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSearch() => $_has(0);
  @$pb.TagNumber(1)
  void clearSearch() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includeDeleted => $_getBF(1);
  @$pb.TagNumber(2)
  set includeDeleted($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIncludeDeleted() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeDeleted() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get includePending => $_getBF(2);
  @$pb.TagNumber(3)
  set includePending($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIncludePending() => $_has(2);
  @$pb.TagNumber(3)
  void clearIncludePending() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get hasPermission => $_getSZ(3);
  @$pb.TagNumber(4)
  set hasPermission($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHasPermission() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasPermission() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get limit => $_getIZ(4);
  @$pb.TagNumber(5)
  set limit($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get offset => $_getIZ(5);
  @$pb.TagNumber(6)
  set offset($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOffset() => $_has(5);
  @$pb.TagNumber(6)
  void clearOffset() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get sortBy => $_getSZ(6);
  @$pb.TagNumber(7)
  set sortBy($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSortBy() => $_has(6);
  @$pb.TagNumber(7)
  void clearSortBy() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get sortOrder => $_getSZ(7);
  @$pb.TagNumber(8)
  set sortOrder($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSortOrder() => $_has(7);
  @$pb.TagNumber(8)
  void clearSortOrder() => $_clearField(8);
}

class ListMembersResponse extends $pb.GeneratedMessage {
  factory ListMembersResponse({
    $core.Iterable<Member>? members,
    $core.int? total,
  }) {
    final $result = create();
    if (members != null) {
      $result.members.addAll(members);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ListMembersResponse._() : super();
  factory ListMembersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMembersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMembersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<Member>(1, _omitFieldNames ? '' : 'members', $pb.PbFieldType.PM, subBuilder: Member.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMembersResponse clone() => ListMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMembersResponse copyWith(void Function(ListMembersResponse) updates) => super.copyWith((message) => updates(message as ListMembersResponse)) as ListMembersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMembersResponse create() => ListMembersResponse._();
  ListMembersResponse createEmptyInstance() => create();
  static $pb.PbList<ListMembersResponse> createRepeated() => $pb.PbList<ListMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListMembersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMembersResponse>(create);
  static ListMembersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Member> get members => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

class GetMemberRequest extends $pb.GeneratedMessage {
  factory GetMemberRequest({
    $core.String? memberId,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    return $result;
  }
  GetMemberRequest._() : super();
  factory GetMemberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMemberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMemberRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'memberId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMemberRequest clone() => GetMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMemberRequest copyWith(void Function(GetMemberRequest) updates) => super.copyWith((message) => updates(message as GetMemberRequest)) as GetMemberRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMemberRequest create() => GetMemberRequest._();
  GetMemberRequest createEmptyInstance() => create();
  static $pb.PbList<GetMemberRequest> createRepeated() => $pb.PbList<GetMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMemberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMemberRequest>(create);
  static GetMemberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get memberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set memberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);
}

class CreateMemberRequest extends $pb.GeneratedMessage {
  factory CreateMemberRequest({
    $core.String? email,
    $core.String? firstName,
    $core.String? lastName,
    $core.Iterable<$core.String>? roleIds,
    $core.Iterable<$core.String>? locationIds,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (roleIds != null) {
      $result.roleIds.addAll(roleIds);
    }
    if (locationIds != null) {
      $result.locationIds.addAll(locationIds);
    }
    return $result;
  }
  CreateMemberRequest._() : super();
  factory CreateMemberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateMemberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateMemberRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'firstName')
    ..aOS(3, _omitFieldNames ? '' : 'lastName')
    ..pPS(4, _omitFieldNames ? '' : 'roleIds')
    ..pPS(5, _omitFieldNames ? '' : 'locationIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateMemberRequest clone() => CreateMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateMemberRequest copyWith(void Function(CreateMemberRequest) updates) => super.copyWith((message) => updates(message as CreateMemberRequest)) as CreateMemberRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateMemberRequest create() => CreateMemberRequest._();
  CreateMemberRequest createEmptyInstance() => create();
  static $pb.PbList<CreateMemberRequest> createRepeated() => $pb.PbList<CreateMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateMemberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateMemberRequest>(create);
  static CreateMemberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get roleIds => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get locationIds => $_getList(4);
}

class UpdateMemberRequest extends $pb.GeneratedMessage {
  factory UpdateMemberRequest({
    $core.String? memberId,
    $core.String? firstName,
    $core.String? lastName,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    return $result;
  }
  UpdateMemberRequest._() : super();
  factory UpdateMemberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMemberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateMemberRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'memberId')
    ..aOS(2, _omitFieldNames ? '' : 'firstName')
    ..aOS(3, _omitFieldNames ? '' : 'lastName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMemberRequest clone() => UpdateMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMemberRequest copyWith(void Function(UpdateMemberRequest) updates) => super.copyWith((message) => updates(message as UpdateMemberRequest)) as UpdateMemberRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateMemberRequest create() => UpdateMemberRequest._();
  UpdateMemberRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateMemberRequest> createRepeated() => $pb.PbList<UpdateMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateMemberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMemberRequest>(create);
  static UpdateMemberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get memberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set memberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => $_clearField(3);
}

class DeleteMemberRequest extends $pb.GeneratedMessage {
  factory DeleteMemberRequest({
    $core.String? memberId,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    return $result;
  }
  DeleteMemberRequest._() : super();
  factory DeleteMemberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteMemberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteMemberRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'memberId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteMemberRequest clone() => DeleteMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteMemberRequest copyWith(void Function(DeleteMemberRequest) updates) => super.copyWith((message) => updates(message as DeleteMemberRequest)) as DeleteMemberRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteMemberRequest create() => DeleteMemberRequest._();
  DeleteMemberRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteMemberRequest> createRepeated() => $pb.PbList<DeleteMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteMemberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteMemberRequest>(create);
  static DeleteMemberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get memberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set memberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);
}

class DeleteMemberResponse extends $pb.GeneratedMessage {
  factory DeleteMemberResponse() => create();
  DeleteMemberResponse._() : super();
  factory DeleteMemberResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteMemberResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteMemberResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteMemberResponse clone() => DeleteMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteMemberResponse copyWith(void Function(DeleteMemberResponse) updates) => super.copyWith((message) => updates(message as DeleteMemberResponse)) as DeleteMemberResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteMemberResponse create() => DeleteMemberResponse._();
  DeleteMemberResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteMemberResponse> createRepeated() => $pb.PbList<DeleteMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteMemberResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteMemberResponse>(create);
  static DeleteMemberResponse? _defaultInstance;
}

class Location extends $pb.GeneratedMessage {
  factory Location({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.String? address,
    $core.String? city,
    $core.String? state,
    $core.String? zipCode,
    $core.String? country,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
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
    if (address != null) {
      $result.address = address;
    }
    if (city != null) {
      $result.city = city;
    }
    if (state != null) {
      $result.state = state;
    }
    if (zipCode != null) {
      $result.zipCode = zipCode;
    }
    if (country != null) {
      $result.country = country;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Location._() : super();
  factory Location.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Location.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Location', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aOS(5, _omitFieldNames ? '' : 'city')
    ..aOS(6, _omitFieldNames ? '' : 'state')
    ..aOS(7, _omitFieldNames ? '' : 'zipCode')
    ..aOS(8, _omitFieldNames ? '' : 'country')
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Location clone() => Location()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Location copyWith(void Function(Location) updates) => super.copyWith((message) => updates(message as Location)) as Location;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  Location createEmptyInstance() => create();
  static $pb.PbList<Location> createRepeated() => $pb.PbList<Location>();
  @$core.pragma('dart2js:noInline')
  static Location getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Location>(create);
  static Location? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get city => $_getSZ(4);
  @$pb.TagNumber(5)
  set city($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCity() => $_has(4);
  @$pb.TagNumber(5)
  void clearCity() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get state => $_getSZ(5);
  @$pb.TagNumber(6)
  set state($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get zipCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set zipCode($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasZipCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearZipCode() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get country => $_getSZ(7);
  @$pb.TagNumber(8)
  set country($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCountry() => $_has(7);
  @$pb.TagNumber(8)
  void clearCountry() => $_clearField(8);

  @$pb.TagNumber(9)
  $0.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($0.Timestamp v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureCreatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.Timestamp get updatedAt => $_getN(9);
  @$pb.TagNumber(10)
  set updatedAt($0.Timestamp v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureUpdatedAt() => $_ensure(9);
}

class ListLocationsRequest extends $pb.GeneratedMessage {
  factory ListLocationsRequest() => create();
  ListLocationsRequest._() : super();
  factory ListLocationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListLocationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListLocationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListLocationsRequest clone() => ListLocationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListLocationsRequest copyWith(void Function(ListLocationsRequest) updates) => super.copyWith((message) => updates(message as ListLocationsRequest)) as ListLocationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLocationsRequest create() => ListLocationsRequest._();
  ListLocationsRequest createEmptyInstance() => create();
  static $pb.PbList<ListLocationsRequest> createRepeated() => $pb.PbList<ListLocationsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListLocationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListLocationsRequest>(create);
  static ListLocationsRequest? _defaultInstance;
}

class ListLocationsResponse extends $pb.GeneratedMessage {
  factory ListLocationsResponse({
    $core.Iterable<Location>? locations,
  }) {
    final $result = create();
    if (locations != null) {
      $result.locations.addAll(locations);
    }
    return $result;
  }
  ListLocationsResponse._() : super();
  factory ListLocationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListLocationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListLocationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<Location>(1, _omitFieldNames ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: Location.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListLocationsResponse clone() => ListLocationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListLocationsResponse copyWith(void Function(ListLocationsResponse) updates) => super.copyWith((message) => updates(message as ListLocationsResponse)) as ListLocationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLocationsResponse create() => ListLocationsResponse._();
  ListLocationsResponse createEmptyInstance() => create();
  static $pb.PbList<ListLocationsResponse> createRepeated() => $pb.PbList<ListLocationsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListLocationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListLocationsResponse>(create);
  static ListLocationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Location> get locations => $_getList(0);
}

class GetLocationRequest extends $pb.GeneratedMessage {
  factory GetLocationRequest({
    $core.String? locationId,
  }) {
    final $result = create();
    if (locationId != null) {
      $result.locationId = locationId;
    }
    return $result;
  }
  GetLocationRequest._() : super();
  factory GetLocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLocationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'locationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLocationRequest clone() => GetLocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLocationRequest copyWith(void Function(GetLocationRequest) updates) => super.copyWith((message) => updates(message as GetLocationRequest)) as GetLocationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLocationRequest create() => GetLocationRequest._();
  GetLocationRequest createEmptyInstance() => create();
  static $pb.PbList<GetLocationRequest> createRepeated() => $pb.PbList<GetLocationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLocationRequest>(create);
  static GetLocationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get locationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set locationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => $_clearField(1);
}

class CreateLocationRequest extends $pb.GeneratedMessage {
  factory CreateLocationRequest({
    $core.String? name,
    $core.String? description,
    $core.String? address,
    $core.String? city,
    $core.String? state,
    $core.String? zipCode,
    $core.String? country,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (address != null) {
      $result.address = address;
    }
    if (city != null) {
      $result.city = city;
    }
    if (state != null) {
      $result.state = state;
    }
    if (zipCode != null) {
      $result.zipCode = zipCode;
    }
    if (country != null) {
      $result.country = country;
    }
    return $result;
  }
  CreateLocationRequest._() : super();
  factory CreateLocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLocationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..aOS(4, _omitFieldNames ? '' : 'city')
    ..aOS(5, _omitFieldNames ? '' : 'state')
    ..aOS(6, _omitFieldNames ? '' : 'zipCode')
    ..aOS(7, _omitFieldNames ? '' : 'country')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLocationRequest clone() => CreateLocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLocationRequest copyWith(void Function(CreateLocationRequest) updates) => super.copyWith((message) => updates(message as CreateLocationRequest)) as CreateLocationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLocationRequest create() => CreateLocationRequest._();
  CreateLocationRequest createEmptyInstance() => create();
  static $pb.PbList<CreateLocationRequest> createRepeated() => $pb.PbList<CreateLocationRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateLocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLocationRequest>(create);
  static CreateLocationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get city => $_getSZ(3);
  @$pb.TagNumber(4)
  set city($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCity() => $_has(3);
  @$pb.TagNumber(4)
  void clearCity() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get state => $_getSZ(4);
  @$pb.TagNumber(5)
  set state($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get zipCode => $_getSZ(5);
  @$pb.TagNumber(6)
  set zipCode($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasZipCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearZipCode() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get country => $_getSZ(6);
  @$pb.TagNumber(7)
  set country($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCountry() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountry() => $_clearField(7);
}

class UpdateLocationRequest extends $pb.GeneratedMessage {
  factory UpdateLocationRequest({
    $core.String? locationId,
    $core.String? name,
    $core.String? description,
    $core.String? address,
    $core.String? city,
    $core.String? state,
    $core.String? zipCode,
    $core.String? country,
  }) {
    final $result = create();
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (address != null) {
      $result.address = address;
    }
    if (city != null) {
      $result.city = city;
    }
    if (state != null) {
      $result.state = state;
    }
    if (zipCode != null) {
      $result.zipCode = zipCode;
    }
    if (country != null) {
      $result.country = country;
    }
    return $result;
  }
  UpdateLocationRequest._() : super();
  factory UpdateLocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLocationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'locationId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aOS(5, _omitFieldNames ? '' : 'city')
    ..aOS(6, _omitFieldNames ? '' : 'state')
    ..aOS(7, _omitFieldNames ? '' : 'zipCode')
    ..aOS(8, _omitFieldNames ? '' : 'country')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLocationRequest clone() => UpdateLocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLocationRequest copyWith(void Function(UpdateLocationRequest) updates) => super.copyWith((message) => updates(message as UpdateLocationRequest)) as UpdateLocationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLocationRequest create() => UpdateLocationRequest._();
  UpdateLocationRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateLocationRequest> createRepeated() => $pb.PbList<UpdateLocationRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateLocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLocationRequest>(create);
  static UpdateLocationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get locationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set locationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get city => $_getSZ(4);
  @$pb.TagNumber(5)
  set city($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCity() => $_has(4);
  @$pb.TagNumber(5)
  void clearCity() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get state => $_getSZ(5);
  @$pb.TagNumber(6)
  set state($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get zipCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set zipCode($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasZipCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearZipCode() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get country => $_getSZ(7);
  @$pb.TagNumber(8)
  set country($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCountry() => $_has(7);
  @$pb.TagNumber(8)
  void clearCountry() => $_clearField(8);
}

class DeleteLocationRequest extends $pb.GeneratedMessage {
  factory DeleteLocationRequest({
    $core.String? locationId,
  }) {
    final $result = create();
    if (locationId != null) {
      $result.locationId = locationId;
    }
    return $result;
  }
  DeleteLocationRequest._() : super();
  factory DeleteLocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLocationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'locationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLocationRequest clone() => DeleteLocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLocationRequest copyWith(void Function(DeleteLocationRequest) updates) => super.copyWith((message) => updates(message as DeleteLocationRequest)) as DeleteLocationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLocationRequest create() => DeleteLocationRequest._();
  DeleteLocationRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteLocationRequest> createRepeated() => $pb.PbList<DeleteLocationRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteLocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLocationRequest>(create);
  static DeleteLocationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get locationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set locationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => $_clearField(1);
}

class DeleteLocationResponse extends $pb.GeneratedMessage {
  factory DeleteLocationResponse() => create();
  DeleteLocationResponse._() : super();
  factory DeleteLocationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLocationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLocationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLocationResponse clone() => DeleteLocationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLocationResponse copyWith(void Function(DeleteLocationResponse) updates) => super.copyWith((message) => updates(message as DeleteLocationResponse)) as DeleteLocationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLocationResponse create() => DeleteLocationResponse._();
  DeleteLocationResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteLocationResponse> createRepeated() => $pb.PbList<DeleteLocationResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteLocationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLocationResponse>(create);
  static DeleteLocationResponse? _defaultInstance;
}

class GetMyLocationsRequest extends $pb.GeneratedMessage {
  factory GetMyLocationsRequest() => create();
  GetMyLocationsRequest._() : super();
  factory GetMyLocationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMyLocationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMyLocationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMyLocationsRequest clone() => GetMyLocationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMyLocationsRequest copyWith(void Function(GetMyLocationsRequest) updates) => super.copyWith((message) => updates(message as GetMyLocationsRequest)) as GetMyLocationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMyLocationsRequest create() => GetMyLocationsRequest._();
  GetMyLocationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetMyLocationsRequest> createRepeated() => $pb.PbList<GetMyLocationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMyLocationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMyLocationsRequest>(create);
  static GetMyLocationsRequest? _defaultInstance;
}

/// RoleDetail extends the basic Role with additional fields for management.
class RoleDetail extends $pb.GeneratedMessage {
  factory RoleDetail({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.bool? isSystem,
    $core.bool? isAssignable,
    $core.Iterable<Permission>? permissions,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
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
    if (isSystem != null) {
      $result.isSystem = isSystem;
    }
    if (isAssignable != null) {
      $result.isAssignable = isAssignable;
    }
    if (permissions != null) {
      $result.permissions.addAll(permissions);
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  RoleDetail._() : super();
  factory RoleDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoleDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOB(4, _omitFieldNames ? '' : 'isSystem')
    ..aOB(5, _omitFieldNames ? '' : 'isAssignable')
    ..pc<Permission>(6, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM, subBuilder: Permission.create)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleDetail clone() => RoleDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleDetail copyWith(void Function(RoleDetail) updates) => super.copyWith((message) => updates(message as RoleDetail)) as RoleDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoleDetail create() => RoleDetail._();
  RoleDetail createEmptyInstance() => create();
  static $pb.PbList<RoleDetail> createRepeated() => $pb.PbList<RoleDetail>();
  @$core.pragma('dart2js:noInline')
  static RoleDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoleDetail>(create);
  static RoleDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isSystem => $_getBF(3);
  @$pb.TagNumber(4)
  set isSystem($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsSystem() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsSystem() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isAssignable => $_getBF(4);
  @$pb.TagNumber(5)
  set isAssignable($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsAssignable() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAssignable() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<Permission> get permissions => $_getList(5);

  @$pb.TagNumber(7)
  $0.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($0.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureCreatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($0.Timestamp v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureUpdatedAt() => $_ensure(7);
}

class Permission extends $pb.GeneratedMessage {
  factory Permission({
    $core.String? id,
    $core.String? resource,
    $core.String? action,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    if (action != null) {
      $result.action = action;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  Permission._() : super();
  factory Permission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Permission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Permission', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'resource')
    ..aOS(3, _omitFieldNames ? '' : 'action')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Permission clone() => Permission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Permission copyWith(void Function(Permission) updates) => super.copyWith((message) => updates(message as Permission)) as Permission;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Permission create() => Permission._();
  Permission createEmptyInstance() => create();
  static $pb.PbList<Permission> createRepeated() => $pb.PbList<Permission>();
  @$core.pragma('dart2js:noInline')
  static Permission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Permission>(create);
  static Permission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get resource => $_getSZ(1);
  @$pb.TagNumber(2)
  set resource($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get action => $_getSZ(2);
  @$pb.TagNumber(3)
  set action($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);
}

class ListRolesRequest extends $pb.GeneratedMessage {
  factory ListRolesRequest({
    $core.bool? includeSystem,
    $core.bool? isAssignable,
  }) {
    final $result = create();
    if (includeSystem != null) {
      $result.includeSystem = includeSystem;
    }
    if (isAssignable != null) {
      $result.isAssignable = isAssignable;
    }
    return $result;
  }
  ListRolesRequest._() : super();
  factory ListRolesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRolesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRolesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'includeSystem')
    ..aOB(2, _omitFieldNames ? '' : 'isAssignable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRolesRequest clone() => ListRolesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRolesRequest copyWith(void Function(ListRolesRequest) updates) => super.copyWith((message) => updates(message as ListRolesRequest)) as ListRolesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRolesRequest create() => ListRolesRequest._();
  ListRolesRequest createEmptyInstance() => create();
  static $pb.PbList<ListRolesRequest> createRepeated() => $pb.PbList<ListRolesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListRolesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRolesRequest>(create);
  static ListRolesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get includeSystem => $_getBF(0);
  @$pb.TagNumber(1)
  set includeSystem($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIncludeSystem() => $_has(0);
  @$pb.TagNumber(1)
  void clearIncludeSystem() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAssignable => $_getBF(1);
  @$pb.TagNumber(2)
  set isAssignable($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAssignable() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAssignable() => $_clearField(2);
}

class ListRolesResponse extends $pb.GeneratedMessage {
  factory ListRolesResponse({
    $core.Iterable<RoleDetail>? roles,
  }) {
    final $result = create();
    if (roles != null) {
      $result.roles.addAll(roles);
    }
    return $result;
  }
  ListRolesResponse._() : super();
  factory ListRolesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRolesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRolesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<RoleDetail>(1, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: RoleDetail.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRolesResponse clone() => ListRolesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRolesResponse copyWith(void Function(ListRolesResponse) updates) => super.copyWith((message) => updates(message as ListRolesResponse)) as ListRolesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRolesResponse create() => ListRolesResponse._();
  ListRolesResponse createEmptyInstance() => create();
  static $pb.PbList<ListRolesResponse> createRepeated() => $pb.PbList<ListRolesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListRolesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRolesResponse>(create);
  static ListRolesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RoleDetail> get roles => $_getList(0);
}

class GetRoleRequest extends $pb.GeneratedMessage {
  factory GetRoleRequest({
    $core.String? roleId,
  }) {
    final $result = create();
    if (roleId != null) {
      $result.roleId = roleId;
    }
    return $result;
  }
  GetRoleRequest._() : super();
  factory GetRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoleRequest clone() => GetRoleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoleRequest copyWith(void Function(GetRoleRequest) updates) => super.copyWith((message) => updates(message as GetRoleRequest)) as GetRoleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoleRequest create() => GetRoleRequest._();
  GetRoleRequest createEmptyInstance() => create();
  static $pb.PbList<GetRoleRequest> createRepeated() => $pb.PbList<GetRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoleRequest>(create);
  static GetRoleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => $_clearField(1);
}

class CreateRoleRequest extends $pb.GeneratedMessage {
  factory CreateRoleRequest({
    $core.String? name,
    $core.String? description,
    $core.bool? isAssignable,
    $core.Iterable<$core.String>? permissionIds,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isAssignable != null) {
      $result.isAssignable = isAssignable;
    }
    if (permissionIds != null) {
      $result.permissionIds.addAll(permissionIds);
    }
    return $result;
  }
  CreateRoleRequest._() : super();
  factory CreateRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRoleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOB(3, _omitFieldNames ? '' : 'isAssignable')
    ..pPS(4, _omitFieldNames ? '' : 'permissionIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRoleRequest clone() => CreateRoleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRoleRequest copyWith(void Function(CreateRoleRequest) updates) => super.copyWith((message) => updates(message as CreateRoleRequest)) as CreateRoleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoleRequest create() => CreateRoleRequest._();
  CreateRoleRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRoleRequest> createRepeated() => $pb.PbList<CreateRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRoleRequest>(create);
  static CreateRoleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAssignable => $_getBF(2);
  @$pb.TagNumber(3)
  set isAssignable($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAssignable() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAssignable() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get permissionIds => $_getList(3);
}

class UpdateRoleRequest extends $pb.GeneratedMessage {
  factory UpdateRoleRequest({
    $core.String? roleId,
    $core.String? name,
    $core.String? description,
    $core.bool? isAssignable,
    $core.Iterable<$core.String>? permissionIds,
  }) {
    final $result = create();
    if (roleId != null) {
      $result.roleId = roleId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isAssignable != null) {
      $result.isAssignable = isAssignable;
    }
    if (permissionIds != null) {
      $result.permissionIds.addAll(permissionIds);
    }
    return $result;
  }
  UpdateRoleRequest._() : super();
  factory UpdateRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateRoleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOB(4, _omitFieldNames ? '' : 'isAssignable')
    ..pPS(5, _omitFieldNames ? '' : 'permissionIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRoleRequest clone() => UpdateRoleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRoleRequest copyWith(void Function(UpdateRoleRequest) updates) => super.copyWith((message) => updates(message as UpdateRoleRequest)) as UpdateRoleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRoleRequest create() => UpdateRoleRequest._();
  UpdateRoleRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateRoleRequest> createRepeated() => $pb.PbList<UpdateRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRoleRequest>(create);
  static UpdateRoleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isAssignable => $_getBF(3);
  @$pb.TagNumber(4)
  set isAssignable($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsAssignable() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAssignable() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get permissionIds => $_getList(4);
}

class DeleteRoleRequest extends $pb.GeneratedMessage {
  factory DeleteRoleRequest({
    $core.String? roleId,
  }) {
    final $result = create();
    if (roleId != null) {
      $result.roleId = roleId;
    }
    return $result;
  }
  DeleteRoleRequest._() : super();
  factory DeleteRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteRoleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRoleRequest clone() => DeleteRoleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRoleRequest copyWith(void Function(DeleteRoleRequest) updates) => super.copyWith((message) => updates(message as DeleteRoleRequest)) as DeleteRoleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRoleRequest create() => DeleteRoleRequest._();
  DeleteRoleRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRoleRequest> createRepeated() => $pb.PbList<DeleteRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRoleRequest>(create);
  static DeleteRoleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => $_clearField(1);
}

class DeleteRoleResponse extends $pb.GeneratedMessage {
  factory DeleteRoleResponse() => create();
  DeleteRoleResponse._() : super();
  factory DeleteRoleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRoleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteRoleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRoleResponse clone() => DeleteRoleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRoleResponse copyWith(void Function(DeleteRoleResponse) updates) => super.copyWith((message) => updates(message as DeleteRoleResponse)) as DeleteRoleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRoleResponse create() => DeleteRoleResponse._();
  DeleteRoleResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteRoleResponse> createRepeated() => $pb.PbList<DeleteRoleResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteRoleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRoleResponse>(create);
  static DeleteRoleResponse? _defaultInstance;
}

class AssignRoleRequest extends $pb.GeneratedMessage {
  factory AssignRoleRequest({
    $core.String? memberId,
    $core.String? roleId,
    $core.Iterable<$core.String>? locationIds,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    if (roleId != null) {
      $result.roleId = roleId;
    }
    if (locationIds != null) {
      $result.locationIds.addAll(locationIds);
    }
    return $result;
  }
  AssignRoleRequest._() : super();
  factory AssignRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssignRoleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'memberId')
    ..aOS(2, _omitFieldNames ? '' : 'roleId')
    ..pPS(3, _omitFieldNames ? '' : 'locationIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignRoleRequest clone() => AssignRoleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignRoleRequest copyWith(void Function(AssignRoleRequest) updates) => super.copyWith((message) => updates(message as AssignRoleRequest)) as AssignRoleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignRoleRequest create() => AssignRoleRequest._();
  AssignRoleRequest createEmptyInstance() => create();
  static $pb.PbList<AssignRoleRequest> createRepeated() => $pb.PbList<AssignRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static AssignRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignRoleRequest>(create);
  static AssignRoleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get memberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set memberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roleId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roleId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get locationIds => $_getList(2);
}

class AssignRoleResponse extends $pb.GeneratedMessage {
  factory AssignRoleResponse() => create();
  AssignRoleResponse._() : super();
  factory AssignRoleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignRoleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssignRoleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignRoleResponse clone() => AssignRoleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignRoleResponse copyWith(void Function(AssignRoleResponse) updates) => super.copyWith((message) => updates(message as AssignRoleResponse)) as AssignRoleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignRoleResponse create() => AssignRoleResponse._();
  AssignRoleResponse createEmptyInstance() => create();
  static $pb.PbList<AssignRoleResponse> createRepeated() => $pb.PbList<AssignRoleResponse>();
  @$core.pragma('dart2js:noInline')
  static AssignRoleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignRoleResponse>(create);
  static AssignRoleResponse? _defaultInstance;
}

class RevokeRoleRequest extends $pb.GeneratedMessage {
  factory RevokeRoleRequest({
    $core.String? memberId,
    $core.String? roleId,
    $core.String? reason,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    if (roleId != null) {
      $result.roleId = roleId;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  RevokeRoleRequest._() : super();
  factory RevokeRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RevokeRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RevokeRoleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'memberId')
    ..aOS(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RevokeRoleRequest clone() => RevokeRoleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RevokeRoleRequest copyWith(void Function(RevokeRoleRequest) updates) => super.copyWith((message) => updates(message as RevokeRoleRequest)) as RevokeRoleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevokeRoleRequest create() => RevokeRoleRequest._();
  RevokeRoleRequest createEmptyInstance() => create();
  static $pb.PbList<RevokeRoleRequest> createRepeated() => $pb.PbList<RevokeRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static RevokeRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RevokeRoleRequest>(create);
  static RevokeRoleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get memberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set memberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roleId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roleId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);
}

class RevokeRoleResponse extends $pb.GeneratedMessage {
  factory RevokeRoleResponse() => create();
  RevokeRoleResponse._() : super();
  factory RevokeRoleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RevokeRoleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RevokeRoleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RevokeRoleResponse clone() => RevokeRoleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RevokeRoleResponse copyWith(void Function(RevokeRoleResponse) updates) => super.copyWith((message) => updates(message as RevokeRoleResponse)) as RevokeRoleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevokeRoleResponse create() => RevokeRoleResponse._();
  RevokeRoleResponse createEmptyInstance() => create();
  static $pb.PbList<RevokeRoleResponse> createRepeated() => $pb.PbList<RevokeRoleResponse>();
  @$core.pragma('dart2js:noInline')
  static RevokeRoleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RevokeRoleResponse>(create);
  static RevokeRoleResponse? _defaultInstance;
}

class GetMemberLocationsRequest extends $pb.GeneratedMessage {
  factory GetMemberLocationsRequest({
    $core.String? memberId,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    return $result;
  }
  GetMemberLocationsRequest._() : super();
  factory GetMemberLocationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMemberLocationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMemberLocationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'memberId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMemberLocationsRequest clone() => GetMemberLocationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMemberLocationsRequest copyWith(void Function(GetMemberLocationsRequest) updates) => super.copyWith((message) => updates(message as GetMemberLocationsRequest)) as GetMemberLocationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMemberLocationsRequest create() => GetMemberLocationsRequest._();
  GetMemberLocationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetMemberLocationsRequest> createRepeated() => $pb.PbList<GetMemberLocationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMemberLocationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMemberLocationsRequest>(create);
  static GetMemberLocationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get memberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set memberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);
}

class AssignMemberLocationRequest extends $pb.GeneratedMessage {
  factory AssignMemberLocationRequest({
    $core.String? memberId,
    $core.String? locationId,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    return $result;
  }
  AssignMemberLocationRequest._() : super();
  factory AssignMemberLocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignMemberLocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssignMemberLocationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'memberId')
    ..aOS(2, _omitFieldNames ? '' : 'locationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignMemberLocationRequest clone() => AssignMemberLocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignMemberLocationRequest copyWith(void Function(AssignMemberLocationRequest) updates) => super.copyWith((message) => updates(message as AssignMemberLocationRequest)) as AssignMemberLocationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignMemberLocationRequest create() => AssignMemberLocationRequest._();
  AssignMemberLocationRequest createEmptyInstance() => create();
  static $pb.PbList<AssignMemberLocationRequest> createRepeated() => $pb.PbList<AssignMemberLocationRequest>();
  @$core.pragma('dart2js:noInline')
  static AssignMemberLocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignMemberLocationRequest>(create);
  static AssignMemberLocationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get memberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set memberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get locationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set locationId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocationId() => $_clearField(2);
}

class AssignMemberLocationResponse extends $pb.GeneratedMessage {
  factory AssignMemberLocationResponse() => create();
  AssignMemberLocationResponse._() : super();
  factory AssignMemberLocationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignMemberLocationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssignMemberLocationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignMemberLocationResponse clone() => AssignMemberLocationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignMemberLocationResponse copyWith(void Function(AssignMemberLocationResponse) updates) => super.copyWith((message) => updates(message as AssignMemberLocationResponse)) as AssignMemberLocationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignMemberLocationResponse create() => AssignMemberLocationResponse._();
  AssignMemberLocationResponse createEmptyInstance() => create();
  static $pb.PbList<AssignMemberLocationResponse> createRepeated() => $pb.PbList<AssignMemberLocationResponse>();
  @$core.pragma('dart2js:noInline')
  static AssignMemberLocationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignMemberLocationResponse>(create);
  static AssignMemberLocationResponse? _defaultInstance;
}

class RevokeMemberLocationRequest extends $pb.GeneratedMessage {
  factory RevokeMemberLocationRequest({
    $core.String? memberId,
    $core.String? locationId,
    $core.String? reason,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  RevokeMemberLocationRequest._() : super();
  factory RevokeMemberLocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RevokeMemberLocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RevokeMemberLocationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'memberId')
    ..aOS(2, _omitFieldNames ? '' : 'locationId')
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RevokeMemberLocationRequest clone() => RevokeMemberLocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RevokeMemberLocationRequest copyWith(void Function(RevokeMemberLocationRequest) updates) => super.copyWith((message) => updates(message as RevokeMemberLocationRequest)) as RevokeMemberLocationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevokeMemberLocationRequest create() => RevokeMemberLocationRequest._();
  RevokeMemberLocationRequest createEmptyInstance() => create();
  static $pb.PbList<RevokeMemberLocationRequest> createRepeated() => $pb.PbList<RevokeMemberLocationRequest>();
  @$core.pragma('dart2js:noInline')
  static RevokeMemberLocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RevokeMemberLocationRequest>(create);
  static RevokeMemberLocationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get memberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set memberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get locationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set locationId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocationId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);
}

class RevokeMemberLocationResponse extends $pb.GeneratedMessage {
  factory RevokeMemberLocationResponse() => create();
  RevokeMemberLocationResponse._() : super();
  factory RevokeMemberLocationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RevokeMemberLocationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RevokeMemberLocationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RevokeMemberLocationResponse clone() => RevokeMemberLocationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RevokeMemberLocationResponse copyWith(void Function(RevokeMemberLocationResponse) updates) => super.copyWith((message) => updates(message as RevokeMemberLocationResponse)) as RevokeMemberLocationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevokeMemberLocationResponse create() => RevokeMemberLocationResponse._();
  RevokeMemberLocationResponse createEmptyInstance() => create();
  static $pb.PbList<RevokeMemberLocationResponse> createRepeated() => $pb.PbList<RevokeMemberLocationResponse>();
  @$core.pragma('dart2js:noInline')
  static RevokeMemberLocationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RevokeMemberLocationResponse>(create);
  static RevokeMemberLocationResponse? _defaultInstance;
}

class ListPermissionsRequest extends $pb.GeneratedMessage {
  factory ListPermissionsRequest() => create();
  ListPermissionsRequest._() : super();
  factory ListPermissionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPermissionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPermissionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPermissionsRequest clone() => ListPermissionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPermissionsRequest copyWith(void Function(ListPermissionsRequest) updates) => super.copyWith((message) => updates(message as ListPermissionsRequest)) as ListPermissionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPermissionsRequest create() => ListPermissionsRequest._();
  ListPermissionsRequest createEmptyInstance() => create();
  static $pb.PbList<ListPermissionsRequest> createRepeated() => $pb.PbList<ListPermissionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPermissionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPermissionsRequest>(create);
  static ListPermissionsRequest? _defaultInstance;
}

class ListPermissionsResponse extends $pb.GeneratedMessage {
  factory ListPermissionsResponse({
    $core.Iterable<Permission>? permissions,
    $core.Iterable<ConditionType>? conditionTypes,
  }) {
    final $result = create();
    if (permissions != null) {
      $result.permissions.addAll(permissions);
    }
    if (conditionTypes != null) {
      $result.conditionTypes.addAll(conditionTypes);
    }
    return $result;
  }
  ListPermissionsResponse._() : super();
  factory ListPermissionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPermissionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPermissionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<Permission>(1, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM, subBuilder: Permission.create)
    ..pc<ConditionType>(2, _omitFieldNames ? '' : 'conditionTypes', $pb.PbFieldType.PM, subBuilder: ConditionType.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPermissionsResponse clone() => ListPermissionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPermissionsResponse copyWith(void Function(ListPermissionsResponse) updates) => super.copyWith((message) => updates(message as ListPermissionsResponse)) as ListPermissionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPermissionsResponse create() => ListPermissionsResponse._();
  ListPermissionsResponse createEmptyInstance() => create();
  static $pb.PbList<ListPermissionsResponse> createRepeated() => $pb.PbList<ListPermissionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPermissionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPermissionsResponse>(create);
  static ListPermissionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Permission> get permissions => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<ConditionType> get conditionTypes => $_getList(1);
}

class ConditionType extends $pb.GeneratedMessage {
  factory ConditionType({
    $core.String? id,
    $core.String? name,
    $core.String? description,
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
    return $result;
  }
  ConditionType._() : super();
  factory ConditionType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConditionType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConditionType', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConditionType clone() => ConditionType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConditionType copyWith(void Function(ConditionType) updates) => super.copyWith((message) => updates(message as ConditionType)) as ConditionType;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConditionType create() => ConditionType._();
  ConditionType createEmptyInstance() => create();
  static $pb.PbList<ConditionType> createRepeated() => $pb.PbList<ConditionType>();
  @$core.pragma('dart2js:noInline')
  static ConditionType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConditionType>(create);
  static ConditionType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);
}

class ValidateInvitationRequest extends $pb.GeneratedMessage {
  factory ValidateInvitationRequest({
    $core.String? companyId,
    $core.String? memberId,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (memberId != null) {
      $result.memberId = memberId;
    }
    return $result;
  }
  ValidateInvitationRequest._() : super();
  factory ValidateInvitationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateInvitationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateInvitationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..aOS(2, _omitFieldNames ? '' : 'memberId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateInvitationRequest clone() => ValidateInvitationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateInvitationRequest copyWith(void Function(ValidateInvitationRequest) updates) => super.copyWith((message) => updates(message as ValidateInvitationRequest)) as ValidateInvitationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateInvitationRequest create() => ValidateInvitationRequest._();
  ValidateInvitationRequest createEmptyInstance() => create();
  static $pb.PbList<ValidateInvitationRequest> createRepeated() => $pb.PbList<ValidateInvitationRequest>();
  @$core.pragma('dart2js:noInline')
  static ValidateInvitationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateInvitationRequest>(create);
  static ValidateInvitationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get memberId => $_getSZ(1);
  @$pb.TagNumber(2)
  set memberId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMemberId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMemberId() => $_clearField(2);
}

class InvitationInfo extends $pb.GeneratedMessage {
  factory InvitationInfo({
    $core.String? id,
    $core.String? companyId,
    $core.String? companyName,
    $core.String? email,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? status,
    $0.Timestamp? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (companyName != null) {
      $result.companyName = companyName;
    }
    if (email != null) {
      $result.email = email;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (status != null) {
      $result.status = status;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  InvitationInfo._() : super();
  factory InvitationInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InvitationInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InvitationInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'companyId')
    ..aOS(3, _omitFieldNames ? '' : 'companyName')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'firstName')
    ..aOS(6, _omitFieldNames ? '' : 'lastName')
    ..aOS(7, _omitFieldNames ? '' : 'status')
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InvitationInfo clone() => InvitationInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InvitationInfo copyWith(void Function(InvitationInfo) updates) => super.copyWith((message) => updates(message as InvitationInfo)) as InvitationInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvitationInfo create() => InvitationInfo._();
  InvitationInfo createEmptyInstance() => create();
  static $pb.PbList<InvitationInfo> createRepeated() => $pb.PbList<InvitationInfo>();
  @$core.pragma('dart2js:noInline')
  static InvitationInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InvitationInfo>(create);
  static InvitationInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get companyName => $_getSZ(2);
  @$pb.TagNumber(3)
  set companyName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCompanyName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompanyName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get firstName => $_getSZ(4);
  @$pb.TagNumber(5)
  set firstName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFirstName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get lastName => $_getSZ(5);
  @$pb.TagNumber(6)
  set lastName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastName() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($0.Timestamp v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureCreatedAt() => $_ensure(7);
}

class AcceptInvitationRequest extends $pb.GeneratedMessage {
  factory AcceptInvitationRequest({
    $core.String? companyId,
    $core.String? memberId,
    $core.String? firebaseUid,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (memberId != null) {
      $result.memberId = memberId;
    }
    if (firebaseUid != null) {
      $result.firebaseUid = firebaseUid;
    }
    return $result;
  }
  AcceptInvitationRequest._() : super();
  factory AcceptInvitationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptInvitationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AcceptInvitationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..aOS(2, _omitFieldNames ? '' : 'memberId')
    ..aOS(3, _omitFieldNames ? '' : 'firebaseUid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AcceptInvitationRequest clone() => AcceptInvitationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AcceptInvitationRequest copyWith(void Function(AcceptInvitationRequest) updates) => super.copyWith((message) => updates(message as AcceptInvitationRequest)) as AcceptInvitationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptInvitationRequest create() => AcceptInvitationRequest._();
  AcceptInvitationRequest createEmptyInstance() => create();
  static $pb.PbList<AcceptInvitationRequest> createRepeated() => $pb.PbList<AcceptInvitationRequest>();
  @$core.pragma('dart2js:noInline')
  static AcceptInvitationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AcceptInvitationRequest>(create);
  static AcceptInvitationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get memberId => $_getSZ(1);
  @$pb.TagNumber(2)
  set memberId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMemberId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMemberId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get firebaseUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set firebaseUid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirebaseUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirebaseUid() => $_clearField(3);
}

/// OrganizationService handles organization, member, location, and role management.
class OrganizationServiceApi {
  $pb.RpcClient _client;
  OrganizationServiceApi(this._client);

  /// ListMembers returns paginated list of members in the company.
  $async.Future<ListMembersResponse> listMembers($pb.ClientContext? ctx, ListMembersRequest request) =>
    _client.invoke<ListMembersResponse>(ctx, 'OrganizationService', 'ListMembers', request, ListMembersResponse())
  ;
  /// GetMember returns details for a specific member.
  $async.Future<Member> getMember($pb.ClientContext? ctx, GetMemberRequest request) =>
    _client.invoke<Member>(ctx, 'OrganizationService', 'GetMember', request, Member())
  ;
  /// CreateMember creates a new member (invitation flow).
  $async.Future<Member> createMember($pb.ClientContext? ctx, CreateMemberRequest request) =>
    _client.invoke<Member>(ctx, 'OrganizationService', 'CreateMember', request, Member())
  ;
  /// UpdateMember updates a member's profile.
  $async.Future<Member> updateMember($pb.ClientContext? ctx, UpdateMemberRequest request) =>
    _client.invoke<Member>(ctx, 'OrganizationService', 'UpdateMember', request, Member())
  ;
  /// DeleteMember soft-deletes a member.
  $async.Future<DeleteMemberResponse> deleteMember($pb.ClientContext? ctx, DeleteMemberRequest request) =>
    _client.invoke<DeleteMemberResponse>(ctx, 'OrganizationService', 'DeleteMember', request, DeleteMemberResponse())
  ;
  /// ListLocations returns all locations for the company.
  $async.Future<ListLocationsResponse> listLocations($pb.ClientContext? ctx, ListLocationsRequest request) =>
    _client.invoke<ListLocationsResponse>(ctx, 'OrganizationService', 'ListLocations', request, ListLocationsResponse())
  ;
  /// GetLocation returns details for a specific location.
  $async.Future<Location> getLocation($pb.ClientContext? ctx, GetLocationRequest request) =>
    _client.invoke<Location>(ctx, 'OrganizationService', 'GetLocation', request, Location())
  ;
  /// CreateLocation creates a new location.
  $async.Future<Location> createLocation($pb.ClientContext? ctx, CreateLocationRequest request) =>
    _client.invoke<Location>(ctx, 'OrganizationService', 'CreateLocation', request, Location())
  ;
  /// UpdateLocation updates a location.
  $async.Future<Location> updateLocation($pb.ClientContext? ctx, UpdateLocationRequest request) =>
    _client.invoke<Location>(ctx, 'OrganizationService', 'UpdateLocation', request, Location())
  ;
  /// DeleteLocation deletes a location.
  $async.Future<DeleteLocationResponse> deleteLocation($pb.ClientContext? ctx, DeleteLocationRequest request) =>
    _client.invoke<DeleteLocationResponse>(ctx, 'OrganizationService', 'DeleteLocation', request, DeleteLocationResponse())
  ;
  /// GetMyLocations returns locations the current user has access to.
  $async.Future<ListLocationsResponse> getMyLocations($pb.ClientContext? ctx, GetMyLocationsRequest request) =>
    _client.invoke<ListLocationsResponse>(ctx, 'OrganizationService', 'GetMyLocations', request, ListLocationsResponse())
  ;
  /// ListRoles returns all roles for the company.
  $async.Future<ListRolesResponse> listRoles($pb.ClientContext? ctx, ListRolesRequest request) =>
    _client.invoke<ListRolesResponse>(ctx, 'OrganizationService', 'ListRoles', request, ListRolesResponse())
  ;
  /// GetRole returns details for a specific role.
  $async.Future<RoleDetail> getRole($pb.ClientContext? ctx, GetRoleRequest request) =>
    _client.invoke<RoleDetail>(ctx, 'OrganizationService', 'GetRole', request, RoleDetail())
  ;
  /// CreateRole creates a new role.
  $async.Future<RoleDetail> createRole($pb.ClientContext? ctx, CreateRoleRequest request) =>
    _client.invoke<RoleDetail>(ctx, 'OrganizationService', 'CreateRole', request, RoleDetail())
  ;
  /// UpdateRole updates a role.
  $async.Future<RoleDetail> updateRole($pb.ClientContext? ctx, UpdateRoleRequest request) =>
    _client.invoke<RoleDetail>(ctx, 'OrganizationService', 'UpdateRole', request, RoleDetail())
  ;
  /// DeleteRole deletes a role.
  $async.Future<DeleteRoleResponse> deleteRole($pb.ClientContext? ctx, DeleteRoleRequest request) =>
    _client.invoke<DeleteRoleResponse>(ctx, 'OrganizationService', 'DeleteRole', request, DeleteRoleResponse())
  ;
  /// AssignRole assigns a role to a member.
  $async.Future<AssignRoleResponse> assignRole($pb.ClientContext? ctx, AssignRoleRequest request) =>
    _client.invoke<AssignRoleResponse>(ctx, 'OrganizationService', 'AssignRole', request, AssignRoleResponse())
  ;
  /// RevokeRole revokes a role from a member.
  $async.Future<RevokeRoleResponse> revokeRole($pb.ClientContext? ctx, RevokeRoleRequest request) =>
    _client.invoke<RevokeRoleResponse>(ctx, 'OrganizationService', 'RevokeRole', request, RevokeRoleResponse())
  ;
  /// GetMemberLocations returns locations a member has access to.
  $async.Future<ListLocationsResponse> getMemberLocations($pb.ClientContext? ctx, GetMemberLocationsRequest request) =>
    _client.invoke<ListLocationsResponse>(ctx, 'OrganizationService', 'GetMemberLocations', request, ListLocationsResponse())
  ;
  /// AssignMemberLocation assigns a location to a member.
  $async.Future<AssignMemberLocationResponse> assignMemberLocation($pb.ClientContext? ctx, AssignMemberLocationRequest request) =>
    _client.invoke<AssignMemberLocationResponse>(ctx, 'OrganizationService', 'AssignMemberLocation', request, AssignMemberLocationResponse())
  ;
  /// RevokeMemberLocation revokes a location from a member.
  $async.Future<RevokeMemberLocationResponse> revokeMemberLocation($pb.ClientContext? ctx, RevokeMemberLocationRequest request) =>
    _client.invoke<RevokeMemberLocationResponse>(ctx, 'OrganizationService', 'RevokeMemberLocation', request, RevokeMemberLocationResponse())
  ;
  /// ListPermissions returns all available permissions.
  $async.Future<ListPermissionsResponse> listPermissions($pb.ClientContext? ctx, ListPermissionsRequest request) =>
    _client.invoke<ListPermissionsResponse>(ctx, 'OrganizationService', 'ListPermissions', request, ListPermissionsResponse())
  ;
  /// ValidateInvitation validates an invitation link.
  $async.Future<InvitationInfo> validateInvitation($pb.ClientContext? ctx, ValidateInvitationRequest request) =>
    _client.invoke<InvitationInfo>(ctx, 'OrganizationService', 'ValidateInvitation', request, InvitationInfo())
  ;
  /// AcceptInvitation accepts an invitation.
  $async.Future<Member> acceptInvitation($pb.ClientContext? ctx, AcceptInvitationRequest request) =>
    _client.invoke<Member>(ctx, 'OrganizationService', 'AcceptInvitation', request, Member())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
