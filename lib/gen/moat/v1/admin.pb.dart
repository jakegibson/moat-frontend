//
//  Generated code. Do not modify.
//  source: moat/v1/admin.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/struct.pb.dart' as $1;
import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'admin.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'admin.pbenum.dart';

class SSODomain extends $pb.GeneratedMessage {
  factory SSODomain({
    $core.String? id,
    $core.String? domain,
    $core.String? companyId,
    $core.String? companyName,
    $core.Iterable<$core.String>? allowedAuthProviders,
    $core.bool? autoJoinEnabled,
    $core.String? defaultRoleId,
    $core.String? defaultRoleName,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (domain != null) {
      $result.domain = domain;
    }
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (companyName != null) {
      $result.companyName = companyName;
    }
    if (allowedAuthProviders != null) {
      $result.allowedAuthProviders.addAll(allowedAuthProviders);
    }
    if (autoJoinEnabled != null) {
      $result.autoJoinEnabled = autoJoinEnabled;
    }
    if (defaultRoleId != null) {
      $result.defaultRoleId = defaultRoleId;
    }
    if (defaultRoleName != null) {
      $result.defaultRoleName = defaultRoleName;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  SSODomain._() : super();
  factory SSODomain.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SSODomain.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SSODomain', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'domain')
    ..aOS(3, _omitFieldNames ? '' : 'companyId')
    ..aOS(4, _omitFieldNames ? '' : 'companyName')
    ..pPS(5, _omitFieldNames ? '' : 'allowedAuthProviders')
    ..aOB(6, _omitFieldNames ? '' : 'autoJoinEnabled')
    ..aOS(7, _omitFieldNames ? '' : 'defaultRoleId')
    ..aOS(8, _omitFieldNames ? '' : 'defaultRoleName')
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SSODomain clone() => SSODomain()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SSODomain copyWith(void Function(SSODomain) updates) => super.copyWith((message) => updates(message as SSODomain)) as SSODomain;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SSODomain create() => SSODomain._();
  SSODomain createEmptyInstance() => create();
  static $pb.PbList<SSODomain> createRepeated() => $pb.PbList<SSODomain>();
  @$core.pragma('dart2js:noInline')
  static SSODomain getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SSODomain>(create);
  static SSODomain? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get domain => $_getSZ(1);
  @$pb.TagNumber(2)
  set domain($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDomain() => $_has(1);
  @$pb.TagNumber(2)
  void clearDomain() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get companyId => $_getSZ(2);
  @$pb.TagNumber(3)
  set companyId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCompanyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompanyId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get companyName => $_getSZ(3);
  @$pb.TagNumber(4)
  set companyName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompanyName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompanyName() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get allowedAuthProviders => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get autoJoinEnabled => $_getBF(5);
  @$pb.TagNumber(6)
  set autoJoinEnabled($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAutoJoinEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearAutoJoinEnabled() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get defaultRoleId => $_getSZ(6);
  @$pb.TagNumber(7)
  set defaultRoleId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDefaultRoleId() => $_has(6);
  @$pb.TagNumber(7)
  void clearDefaultRoleId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get defaultRoleName => $_getSZ(7);
  @$pb.TagNumber(8)
  set defaultRoleName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDefaultRoleName() => $_has(7);
  @$pb.TagNumber(8)
  void clearDefaultRoleName() => $_clearField(8);

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

class ListSSODomainsRequest extends $pb.GeneratedMessage {
  factory ListSSODomainsRequest({
    $core.String? companyId,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    return $result;
  }
  ListSSODomainsRequest._() : super();
  factory ListSSODomainsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSSODomainsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSSODomainsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSSODomainsRequest clone() => ListSSODomainsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSSODomainsRequest copyWith(void Function(ListSSODomainsRequest) updates) => super.copyWith((message) => updates(message as ListSSODomainsRequest)) as ListSSODomainsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSSODomainsRequest create() => ListSSODomainsRequest._();
  ListSSODomainsRequest createEmptyInstance() => create();
  static $pb.PbList<ListSSODomainsRequest> createRepeated() => $pb.PbList<ListSSODomainsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSSODomainsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSSODomainsRequest>(create);
  static ListSSODomainsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);
}

class ListSSODomainsResponse extends $pb.GeneratedMessage {
  factory ListSSODomainsResponse({
    $core.Iterable<SSODomain>? domains,
  }) {
    final $result = create();
    if (domains != null) {
      $result.domains.addAll(domains);
    }
    return $result;
  }
  ListSSODomainsResponse._() : super();
  factory ListSSODomainsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSSODomainsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSSODomainsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<SSODomain>(1, _omitFieldNames ? '' : 'domains', $pb.PbFieldType.PM, subBuilder: SSODomain.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSSODomainsResponse clone() => ListSSODomainsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSSODomainsResponse copyWith(void Function(ListSSODomainsResponse) updates) => super.copyWith((message) => updates(message as ListSSODomainsResponse)) as ListSSODomainsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSSODomainsResponse create() => ListSSODomainsResponse._();
  ListSSODomainsResponse createEmptyInstance() => create();
  static $pb.PbList<ListSSODomainsResponse> createRepeated() => $pb.PbList<ListSSODomainsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSSODomainsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSSODomainsResponse>(create);
  static ListSSODomainsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SSODomain> get domains => $_getList(0);
}

class GetSSODomainRequest extends $pb.GeneratedMessage {
  factory GetSSODomainRequest({
    $core.String? domainId,
  }) {
    final $result = create();
    if (domainId != null) {
      $result.domainId = domainId;
    }
    return $result;
  }
  GetSSODomainRequest._() : super();
  factory GetSSODomainRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSSODomainRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSSODomainRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'domainId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSSODomainRequest clone() => GetSSODomainRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSSODomainRequest copyWith(void Function(GetSSODomainRequest) updates) => super.copyWith((message) => updates(message as GetSSODomainRequest)) as GetSSODomainRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSSODomainRequest create() => GetSSODomainRequest._();
  GetSSODomainRequest createEmptyInstance() => create();
  static $pb.PbList<GetSSODomainRequest> createRepeated() => $pb.PbList<GetSSODomainRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSSODomainRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSSODomainRequest>(create);
  static GetSSODomainRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get domainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set domainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDomainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDomainId() => $_clearField(1);
}

class CreateSSODomainRequest extends $pb.GeneratedMessage {
  factory CreateSSODomainRequest({
    $core.String? domain,
    $core.String? companyId,
    $core.Iterable<$core.String>? allowedAuthProviders,
    $core.bool? autoJoinEnabled,
    $core.String? defaultRoleId,
  }) {
    final $result = create();
    if (domain != null) {
      $result.domain = domain;
    }
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (allowedAuthProviders != null) {
      $result.allowedAuthProviders.addAll(allowedAuthProviders);
    }
    if (autoJoinEnabled != null) {
      $result.autoJoinEnabled = autoJoinEnabled;
    }
    if (defaultRoleId != null) {
      $result.defaultRoleId = defaultRoleId;
    }
    return $result;
  }
  CreateSSODomainRequest._() : super();
  factory CreateSSODomainRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSSODomainRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSSODomainRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'domain')
    ..aOS(2, _omitFieldNames ? '' : 'companyId')
    ..pPS(3, _omitFieldNames ? '' : 'allowedAuthProviders')
    ..aOB(4, _omitFieldNames ? '' : 'autoJoinEnabled')
    ..aOS(5, _omitFieldNames ? '' : 'defaultRoleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSSODomainRequest clone() => CreateSSODomainRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSSODomainRequest copyWith(void Function(CreateSSODomainRequest) updates) => super.copyWith((message) => updates(message as CreateSSODomainRequest)) as CreateSSODomainRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSSODomainRequest create() => CreateSSODomainRequest._();
  CreateSSODomainRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSSODomainRequest> createRepeated() => $pb.PbList<CreateSSODomainRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSSODomainRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSSODomainRequest>(create);
  static CreateSSODomainRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get domain => $_getSZ(0);
  @$pb.TagNumber(1)
  set domain($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDomain() => $_has(0);
  @$pb.TagNumber(1)
  void clearDomain() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get allowedAuthProviders => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get autoJoinEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set autoJoinEnabled($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAutoJoinEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoJoinEnabled() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get defaultRoleId => $_getSZ(4);
  @$pb.TagNumber(5)
  set defaultRoleId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDefaultRoleId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefaultRoleId() => $_clearField(5);
}

class UpdateSSODomainRequest extends $pb.GeneratedMessage {
  factory UpdateSSODomainRequest({
    $core.String? domainId,
    $core.String? domain,
    $core.Iterable<$core.String>? allowedAuthProviders,
    $core.bool? autoJoinEnabled,
    $core.String? defaultRoleId,
  }) {
    final $result = create();
    if (domainId != null) {
      $result.domainId = domainId;
    }
    if (domain != null) {
      $result.domain = domain;
    }
    if (allowedAuthProviders != null) {
      $result.allowedAuthProviders.addAll(allowedAuthProviders);
    }
    if (autoJoinEnabled != null) {
      $result.autoJoinEnabled = autoJoinEnabled;
    }
    if (defaultRoleId != null) {
      $result.defaultRoleId = defaultRoleId;
    }
    return $result;
  }
  UpdateSSODomainRequest._() : super();
  factory UpdateSSODomainRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSSODomainRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSSODomainRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'domainId')
    ..aOS(2, _omitFieldNames ? '' : 'domain')
    ..pPS(3, _omitFieldNames ? '' : 'allowedAuthProviders')
    ..aOB(4, _omitFieldNames ? '' : 'autoJoinEnabled')
    ..aOS(5, _omitFieldNames ? '' : 'defaultRoleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSSODomainRequest clone() => UpdateSSODomainRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSSODomainRequest copyWith(void Function(UpdateSSODomainRequest) updates) => super.copyWith((message) => updates(message as UpdateSSODomainRequest)) as UpdateSSODomainRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSSODomainRequest create() => UpdateSSODomainRequest._();
  UpdateSSODomainRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSSODomainRequest> createRepeated() => $pb.PbList<UpdateSSODomainRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSSODomainRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSSODomainRequest>(create);
  static UpdateSSODomainRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get domainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set domainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDomainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDomainId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get domain => $_getSZ(1);
  @$pb.TagNumber(2)
  set domain($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDomain() => $_has(1);
  @$pb.TagNumber(2)
  void clearDomain() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get allowedAuthProviders => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get autoJoinEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set autoJoinEnabled($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAutoJoinEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoJoinEnabled() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get defaultRoleId => $_getSZ(4);
  @$pb.TagNumber(5)
  set defaultRoleId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDefaultRoleId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefaultRoleId() => $_clearField(5);
}

class DeleteSSODomainRequest extends $pb.GeneratedMessage {
  factory DeleteSSODomainRequest({
    $core.String? domainId,
  }) {
    final $result = create();
    if (domainId != null) {
      $result.domainId = domainId;
    }
    return $result;
  }
  DeleteSSODomainRequest._() : super();
  factory DeleteSSODomainRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSSODomainRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSSODomainRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'domainId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSSODomainRequest clone() => DeleteSSODomainRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSSODomainRequest copyWith(void Function(DeleteSSODomainRequest) updates) => super.copyWith((message) => updates(message as DeleteSSODomainRequest)) as DeleteSSODomainRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSSODomainRequest create() => DeleteSSODomainRequest._();
  DeleteSSODomainRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSSODomainRequest> createRepeated() => $pb.PbList<DeleteSSODomainRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSSODomainRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSSODomainRequest>(create);
  static DeleteSSODomainRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get domainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set domainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDomainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDomainId() => $_clearField(1);
}

class DeleteSSODomainResponse extends $pb.GeneratedMessage {
  factory DeleteSSODomainResponse() => create();
  DeleteSSODomainResponse._() : super();
  factory DeleteSSODomainResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSSODomainResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSSODomainResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSSODomainResponse clone() => DeleteSSODomainResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSSODomainResponse copyWith(void Function(DeleteSSODomainResponse) updates) => super.copyWith((message) => updates(message as DeleteSSODomainResponse)) as DeleteSSODomainResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSSODomainResponse create() => DeleteSSODomainResponse._();
  DeleteSSODomainResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteSSODomainResponse> createRepeated() => $pb.PbList<DeleteSSODomainResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteSSODomainResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSSODomainResponse>(create);
  static DeleteSSODomainResponse? _defaultInstance;
}

class PromptTemplate extends $pb.GeneratedMessage {
  factory PromptTemplate({
    $core.String? id,
    $core.String? key,
    $core.String? name,
    $core.String? description,
    PromptCategory? category,
    $core.int? versionCount,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (key != null) {
      $result.key = key;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (category != null) {
      $result.category = category;
    }
    if (versionCount != null) {
      $result.versionCount = versionCount;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  PromptTemplate._() : super();
  factory PromptTemplate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromptTemplate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromptTemplate', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'key')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..e<PromptCategory>(5, _omitFieldNames ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: PromptCategory.PROMPT_CATEGORY_UNSPECIFIED, valueOf: PromptCategory.valueOf, enumValues: PromptCategory.values)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'versionCount', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromptTemplate clone() => PromptTemplate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromptTemplate copyWith(void Function(PromptTemplate) updates) => super.copyWith((message) => updates(message as PromptTemplate)) as PromptTemplate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromptTemplate create() => PromptTemplate._();
  PromptTemplate createEmptyInstance() => create();
  static $pb.PbList<PromptTemplate> createRepeated() => $pb.PbList<PromptTemplate>();
  @$core.pragma('dart2js:noInline')
  static PromptTemplate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromptTemplate>(create);
  static PromptTemplate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  PromptCategory get category => $_getN(4);
  @$pb.TagNumber(5)
  set category(PromptCategory v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get versionCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set versionCount($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVersionCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersionCount() => $_clearField(6);

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

class PromptVersion extends $pb.GeneratedMessage {
  factory PromptVersion({
    $core.String? id,
    $core.String? templateId,
    $core.int? version,
    $core.String? content,
    $core.Iterable<Environment>? activeEnvironments,
    $core.String? notes,
    $core.String? modelName,
    $1.Struct? generationConfig,
    $0.Timestamp? createdAt,
    VersionStats? stats,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (templateId != null) {
      $result.templateId = templateId;
    }
    if (version != null) {
      $result.version = version;
    }
    if (content != null) {
      $result.content = content;
    }
    if (activeEnvironments != null) {
      $result.activeEnvironments.addAll(activeEnvironments);
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (modelName != null) {
      $result.modelName = modelName;
    }
    if (generationConfig != null) {
      $result.generationConfig = generationConfig;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (stats != null) {
      $result.stats = stats;
    }
    return $result;
  }
  PromptVersion._() : super();
  factory PromptVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromptVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromptVersion', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'templateId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..pc<Environment>(5, _omitFieldNames ? '' : 'activeEnvironments', $pb.PbFieldType.KE, valueOf: Environment.valueOf, enumValues: Environment.values, defaultEnumValue: Environment.ENVIRONMENT_UNSPECIFIED)
    ..aOS(6, _omitFieldNames ? '' : 'notes')
    ..aOS(7, _omitFieldNames ? '' : 'modelName')
    ..aOM<$1.Struct>(8, _omitFieldNames ? '' : 'generationConfig', subBuilder: $1.Struct.create)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<VersionStats>(10, _omitFieldNames ? '' : 'stats', subBuilder: VersionStats.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromptVersion clone() => PromptVersion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromptVersion copyWith(void Function(PromptVersion) updates) => super.copyWith((message) => updates(message as PromptVersion)) as PromptVersion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromptVersion create() => PromptVersion._();
  PromptVersion createEmptyInstance() => create();
  static $pb.PbList<PromptVersion> createRepeated() => $pb.PbList<PromptVersion>();
  @$core.pragma('dart2js:noInline')
  static PromptVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromptVersion>(create);
  static PromptVersion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get templateId => $_getSZ(1);
  @$pb.TagNumber(2)
  set templateId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTemplateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTemplateId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<Environment> get activeEnvironments => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get modelName => $_getSZ(6);
  @$pb.TagNumber(7)
  set modelName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasModelName() => $_has(6);
  @$pb.TagNumber(7)
  void clearModelName() => $_clearField(7);

  @$pb.TagNumber(8)
  $1.Struct get generationConfig => $_getN(7);
  @$pb.TagNumber(8)
  set generationConfig($1.Struct v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasGenerationConfig() => $_has(7);
  @$pb.TagNumber(8)
  void clearGenerationConfig() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Struct ensureGenerationConfig() => $_ensure(7);

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
  VersionStats get stats => $_getN(9);
  @$pb.TagNumber(10)
  set stats(VersionStats v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasStats() => $_has(9);
  @$pb.TagNumber(10)
  void clearStats() => $_clearField(10);
  @$pb.TagNumber(10)
  VersionStats ensureStats() => $_ensure(9);
}

class VersionStats extends $pb.GeneratedMessage {
  factory VersionStats({
    $core.int? totalUses,
    $core.int? successful,
    $core.int? failed,
    $core.double? avgLatencyMs,
  }) {
    final $result = create();
    if (totalUses != null) {
      $result.totalUses = totalUses;
    }
    if (successful != null) {
      $result.successful = successful;
    }
    if (failed != null) {
      $result.failed = failed;
    }
    if (avgLatencyMs != null) {
      $result.avgLatencyMs = avgLatencyMs;
    }
    return $result;
  }
  VersionStats._() : super();
  factory VersionStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VersionStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VersionStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'totalUses', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'successful', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'failed', $pb.PbFieldType.O3)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'avgLatencyMs', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VersionStats clone() => VersionStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VersionStats copyWith(void Function(VersionStats) updates) => super.copyWith((message) => updates(message as VersionStats)) as VersionStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VersionStats create() => VersionStats._();
  VersionStats createEmptyInstance() => create();
  static $pb.PbList<VersionStats> createRepeated() => $pb.PbList<VersionStats>();
  @$core.pragma('dart2js:noInline')
  static VersionStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VersionStats>(create);
  static VersionStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalUses => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalUses($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalUses() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalUses() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get successful => $_getIZ(1);
  @$pb.TagNumber(2)
  set successful($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessful() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessful() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get failed => $_getIZ(2);
  @$pb.TagNumber(3)
  set failed($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFailed() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailed() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get avgLatencyMs => $_getN(3);
  @$pb.TagNumber(4)
  set avgLatencyMs($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvgLatencyMs() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvgLatencyMs() => $_clearField(4);
}

class ActiveVersionInfo extends $pb.GeneratedMessage {
  factory ActiveVersionInfo({
    $core.int? versionNumber,
    $core.String? versionId,
  }) {
    final $result = create();
    if (versionNumber != null) {
      $result.versionNumber = versionNumber;
    }
    if (versionId != null) {
      $result.versionId = versionId;
    }
    return $result;
  }
  ActiveVersionInfo._() : super();
  factory ActiveVersionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveVersionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveVersionInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'versionNumber', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'versionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveVersionInfo clone() => ActiveVersionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveVersionInfo copyWith(void Function(ActiveVersionInfo) updates) => super.copyWith((message) => updates(message as ActiveVersionInfo)) as ActiveVersionInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveVersionInfo create() => ActiveVersionInfo._();
  ActiveVersionInfo createEmptyInstance() => create();
  static $pb.PbList<ActiveVersionInfo> createRepeated() => $pb.PbList<ActiveVersionInfo>();
  @$core.pragma('dart2js:noInline')
  static ActiveVersionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveVersionInfo>(create);
  static ActiveVersionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get versionNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set versionNumber($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersionNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersionNumber() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get versionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set versionId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionId() => $_clearField(2);
}

class PromptTemplateDetail extends $pb.GeneratedMessage {
  factory PromptTemplateDetail({
    PromptTemplate? template,
    $core.Iterable<PromptVersion>? versions,
    $pb.PbMap<$core.String, ActiveVersionInfo>? activeVersions,
  }) {
    final $result = create();
    if (template != null) {
      $result.template = template;
    }
    if (versions != null) {
      $result.versions.addAll(versions);
    }
    if (activeVersions != null) {
      $result.activeVersions.addAll(activeVersions);
    }
    return $result;
  }
  PromptTemplateDetail._() : super();
  factory PromptTemplateDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromptTemplateDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromptTemplateDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOM<PromptTemplate>(1, _omitFieldNames ? '' : 'template', subBuilder: PromptTemplate.create)
    ..pc<PromptVersion>(2, _omitFieldNames ? '' : 'versions', $pb.PbFieldType.PM, subBuilder: PromptVersion.create)
    ..m<$core.String, ActiveVersionInfo>(3, _omitFieldNames ? '' : 'activeVersions', entryClassName: 'PromptTemplateDetail.ActiveVersionsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: ActiveVersionInfo.create, valueDefaultOrMaker: ActiveVersionInfo.getDefault, packageName: const $pb.PackageName('moat.v1'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromptTemplateDetail clone() => PromptTemplateDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromptTemplateDetail copyWith(void Function(PromptTemplateDetail) updates) => super.copyWith((message) => updates(message as PromptTemplateDetail)) as PromptTemplateDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromptTemplateDetail create() => PromptTemplateDetail._();
  PromptTemplateDetail createEmptyInstance() => create();
  static $pb.PbList<PromptTemplateDetail> createRepeated() => $pb.PbList<PromptTemplateDetail>();
  @$core.pragma('dart2js:noInline')
  static PromptTemplateDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromptTemplateDetail>(create);
  static PromptTemplateDetail? _defaultInstance;

  @$pb.TagNumber(1)
  PromptTemplate get template => $_getN(0);
  @$pb.TagNumber(1)
  set template(PromptTemplate v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplate() => $_clearField(1);
  @$pb.TagNumber(1)
  PromptTemplate ensureTemplate() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<PromptVersion> get versions => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, ActiveVersionInfo> get activeVersions => $_getMap(2);
}

class ListPromptTemplatesRequest extends $pb.GeneratedMessage {
  factory ListPromptTemplatesRequest({
    PromptCategory? category,
    $core.String? search,
  }) {
    final $result = create();
    if (category != null) {
      $result.category = category;
    }
    if (search != null) {
      $result.search = search;
    }
    return $result;
  }
  ListPromptTemplatesRequest._() : super();
  factory ListPromptTemplatesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPromptTemplatesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPromptTemplatesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..e<PromptCategory>(1, _omitFieldNames ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: PromptCategory.PROMPT_CATEGORY_UNSPECIFIED, valueOf: PromptCategory.valueOf, enumValues: PromptCategory.values)
    ..aOS(2, _omitFieldNames ? '' : 'search')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPromptTemplatesRequest clone() => ListPromptTemplatesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPromptTemplatesRequest copyWith(void Function(ListPromptTemplatesRequest) updates) => super.copyWith((message) => updates(message as ListPromptTemplatesRequest)) as ListPromptTemplatesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPromptTemplatesRequest create() => ListPromptTemplatesRequest._();
  ListPromptTemplatesRequest createEmptyInstance() => create();
  static $pb.PbList<ListPromptTemplatesRequest> createRepeated() => $pb.PbList<ListPromptTemplatesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPromptTemplatesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPromptTemplatesRequest>(create);
  static ListPromptTemplatesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  PromptCategory get category => $_getN(0);
  @$pb.TagNumber(1)
  set category(PromptCategory v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get search => $_getSZ(1);
  @$pb.TagNumber(2)
  set search($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSearch() => $_has(1);
  @$pb.TagNumber(2)
  void clearSearch() => $_clearField(2);
}

class ListPromptTemplatesResponse extends $pb.GeneratedMessage {
  factory ListPromptTemplatesResponse({
    $core.Iterable<PromptTemplate>? templates,
  }) {
    final $result = create();
    if (templates != null) {
      $result.templates.addAll(templates);
    }
    return $result;
  }
  ListPromptTemplatesResponse._() : super();
  factory ListPromptTemplatesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPromptTemplatesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPromptTemplatesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<PromptTemplate>(1, _omitFieldNames ? '' : 'templates', $pb.PbFieldType.PM, subBuilder: PromptTemplate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPromptTemplatesResponse clone() => ListPromptTemplatesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPromptTemplatesResponse copyWith(void Function(ListPromptTemplatesResponse) updates) => super.copyWith((message) => updates(message as ListPromptTemplatesResponse)) as ListPromptTemplatesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPromptTemplatesResponse create() => ListPromptTemplatesResponse._();
  ListPromptTemplatesResponse createEmptyInstance() => create();
  static $pb.PbList<ListPromptTemplatesResponse> createRepeated() => $pb.PbList<ListPromptTemplatesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPromptTemplatesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPromptTemplatesResponse>(create);
  static ListPromptTemplatesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PromptTemplate> get templates => $_getList(0);
}

class GetPromptTemplateRequest extends $pb.GeneratedMessage {
  factory GetPromptTemplateRequest({
    $core.String? templateId,
  }) {
    final $result = create();
    if (templateId != null) {
      $result.templateId = templateId;
    }
    return $result;
  }
  GetPromptTemplateRequest._() : super();
  factory GetPromptTemplateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPromptTemplateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPromptTemplateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'templateId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPromptTemplateRequest clone() => GetPromptTemplateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPromptTemplateRequest copyWith(void Function(GetPromptTemplateRequest) updates) => super.copyWith((message) => updates(message as GetPromptTemplateRequest)) as GetPromptTemplateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPromptTemplateRequest create() => GetPromptTemplateRequest._();
  GetPromptTemplateRequest createEmptyInstance() => create();
  static $pb.PbList<GetPromptTemplateRequest> createRepeated() => $pb.PbList<GetPromptTemplateRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPromptTemplateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPromptTemplateRequest>(create);
  static GetPromptTemplateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get templateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set templateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplateId() => $_clearField(1);
}

class CreatePromptTemplateRequest extends $pb.GeneratedMessage {
  factory CreatePromptTemplateRequest({
    $core.String? key,
    $core.String? name,
    $core.String? description,
    PromptCategory? category,
    $core.String? initialContent,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (category != null) {
      $result.category = category;
    }
    if (initialContent != null) {
      $result.initialContent = initialContent;
    }
    return $result;
  }
  CreatePromptTemplateRequest._() : super();
  factory CreatePromptTemplateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePromptTemplateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePromptTemplateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..e<PromptCategory>(4, _omitFieldNames ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: PromptCategory.PROMPT_CATEGORY_UNSPECIFIED, valueOf: PromptCategory.valueOf, enumValues: PromptCategory.values)
    ..aOS(5, _omitFieldNames ? '' : 'initialContent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePromptTemplateRequest clone() => CreatePromptTemplateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePromptTemplateRequest copyWith(void Function(CreatePromptTemplateRequest) updates) => super.copyWith((message) => updates(message as CreatePromptTemplateRequest)) as CreatePromptTemplateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePromptTemplateRequest create() => CreatePromptTemplateRequest._();
  CreatePromptTemplateRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePromptTemplateRequest> createRepeated() => $pb.PbList<CreatePromptTemplateRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePromptTemplateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePromptTemplateRequest>(create);
  static CreatePromptTemplateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);

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
  PromptCategory get category => $_getN(3);
  @$pb.TagNumber(4)
  set category(PromptCategory v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get initialContent => $_getSZ(4);
  @$pb.TagNumber(5)
  set initialContent($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInitialContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearInitialContent() => $_clearField(5);
}

class UpdatePromptTemplateRequest extends $pb.GeneratedMessage {
  factory UpdatePromptTemplateRequest({
    $core.String? templateId,
    $core.String? name,
    $core.String? description,
    PromptCategory? category,
  }) {
    final $result = create();
    if (templateId != null) {
      $result.templateId = templateId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (category != null) {
      $result.category = category;
    }
    return $result;
  }
  UpdatePromptTemplateRequest._() : super();
  factory UpdatePromptTemplateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePromptTemplateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePromptTemplateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'templateId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..e<PromptCategory>(4, _omitFieldNames ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: PromptCategory.PROMPT_CATEGORY_UNSPECIFIED, valueOf: PromptCategory.valueOf, enumValues: PromptCategory.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePromptTemplateRequest clone() => UpdatePromptTemplateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePromptTemplateRequest copyWith(void Function(UpdatePromptTemplateRequest) updates) => super.copyWith((message) => updates(message as UpdatePromptTemplateRequest)) as UpdatePromptTemplateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePromptTemplateRequest create() => UpdatePromptTemplateRequest._();
  UpdatePromptTemplateRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePromptTemplateRequest> createRepeated() => $pb.PbList<UpdatePromptTemplateRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePromptTemplateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePromptTemplateRequest>(create);
  static UpdatePromptTemplateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get templateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set templateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplateId() => $_clearField(1);

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
  PromptCategory get category => $_getN(3);
  @$pb.TagNumber(4)
  set category(PromptCategory v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);
}

class DeletePromptTemplateRequest extends $pb.GeneratedMessage {
  factory DeletePromptTemplateRequest({
    $core.String? templateId,
  }) {
    final $result = create();
    if (templateId != null) {
      $result.templateId = templateId;
    }
    return $result;
  }
  DeletePromptTemplateRequest._() : super();
  factory DeletePromptTemplateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePromptTemplateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePromptTemplateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'templateId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePromptTemplateRequest clone() => DeletePromptTemplateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePromptTemplateRequest copyWith(void Function(DeletePromptTemplateRequest) updates) => super.copyWith((message) => updates(message as DeletePromptTemplateRequest)) as DeletePromptTemplateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePromptTemplateRequest create() => DeletePromptTemplateRequest._();
  DeletePromptTemplateRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePromptTemplateRequest> createRepeated() => $pb.PbList<DeletePromptTemplateRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePromptTemplateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePromptTemplateRequest>(create);
  static DeletePromptTemplateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get templateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set templateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplateId() => $_clearField(1);
}

class DeletePromptTemplateResponse extends $pb.GeneratedMessage {
  factory DeletePromptTemplateResponse() => create();
  DeletePromptTemplateResponse._() : super();
  factory DeletePromptTemplateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePromptTemplateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePromptTemplateResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePromptTemplateResponse clone() => DeletePromptTemplateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePromptTemplateResponse copyWith(void Function(DeletePromptTemplateResponse) updates) => super.copyWith((message) => updates(message as DeletePromptTemplateResponse)) as DeletePromptTemplateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePromptTemplateResponse create() => DeletePromptTemplateResponse._();
  DeletePromptTemplateResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePromptTemplateResponse> createRepeated() => $pb.PbList<DeletePromptTemplateResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePromptTemplateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePromptTemplateResponse>(create);
  static DeletePromptTemplateResponse? _defaultInstance;
}

class CreatePromptVersionRequest extends $pb.GeneratedMessage {
  factory CreatePromptVersionRequest({
    $core.String? templateId,
    $core.String? content,
    $core.String? notes,
    $core.String? modelName,
    $1.Struct? generationConfig,
  }) {
    final $result = create();
    if (templateId != null) {
      $result.templateId = templateId;
    }
    if (content != null) {
      $result.content = content;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (modelName != null) {
      $result.modelName = modelName;
    }
    if (generationConfig != null) {
      $result.generationConfig = generationConfig;
    }
    return $result;
  }
  CreatePromptVersionRequest._() : super();
  factory CreatePromptVersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePromptVersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePromptVersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'templateId')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'notes')
    ..aOS(4, _omitFieldNames ? '' : 'modelName')
    ..aOM<$1.Struct>(5, _omitFieldNames ? '' : 'generationConfig', subBuilder: $1.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePromptVersionRequest clone() => CreatePromptVersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePromptVersionRequest copyWith(void Function(CreatePromptVersionRequest) updates) => super.copyWith((message) => updates(message as CreatePromptVersionRequest)) as CreatePromptVersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePromptVersionRequest create() => CreatePromptVersionRequest._();
  CreatePromptVersionRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePromptVersionRequest> createRepeated() => $pb.PbList<CreatePromptVersionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePromptVersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePromptVersionRequest>(create);
  static CreatePromptVersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get templateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set templateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplateId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get notes => $_getSZ(2);
  @$pb.TagNumber(3)
  set notes($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNotes() => $_has(2);
  @$pb.TagNumber(3)
  void clearNotes() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get modelName => $_getSZ(3);
  @$pb.TagNumber(4)
  set modelName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModelName() => $_has(3);
  @$pb.TagNumber(4)
  void clearModelName() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.Struct get generationConfig => $_getN(4);
  @$pb.TagNumber(5)
  set generationConfig($1.Struct v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGenerationConfig() => $_has(4);
  @$pb.TagNumber(5)
  void clearGenerationConfig() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Struct ensureGenerationConfig() => $_ensure(4);
}

class ActivatePromptVersionRequest extends $pb.GeneratedMessage {
  factory ActivatePromptVersionRequest({
    $core.String? templateId,
    $core.int? versionNumber,
    Environment? environment,
  }) {
    final $result = create();
    if (templateId != null) {
      $result.templateId = templateId;
    }
    if (versionNumber != null) {
      $result.versionNumber = versionNumber;
    }
    if (environment != null) {
      $result.environment = environment;
    }
    return $result;
  }
  ActivatePromptVersionRequest._() : super();
  factory ActivatePromptVersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActivatePromptVersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActivatePromptVersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'templateId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'versionNumber', $pb.PbFieldType.O3)
    ..e<Environment>(3, _omitFieldNames ? '' : 'environment', $pb.PbFieldType.OE, defaultOrMaker: Environment.ENVIRONMENT_UNSPECIFIED, valueOf: Environment.valueOf, enumValues: Environment.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActivatePromptVersionRequest clone() => ActivatePromptVersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActivatePromptVersionRequest copyWith(void Function(ActivatePromptVersionRequest) updates) => super.copyWith((message) => updates(message as ActivatePromptVersionRequest)) as ActivatePromptVersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivatePromptVersionRequest create() => ActivatePromptVersionRequest._();
  ActivatePromptVersionRequest createEmptyInstance() => create();
  static $pb.PbList<ActivatePromptVersionRequest> createRepeated() => $pb.PbList<ActivatePromptVersionRequest>();
  @$core.pragma('dart2js:noInline')
  static ActivatePromptVersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActivatePromptVersionRequest>(create);
  static ActivatePromptVersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get templateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set templateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplateId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get versionNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set versionNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersionNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionNumber() => $_clearField(2);

  @$pb.TagNumber(3)
  Environment get environment => $_getN(2);
  @$pb.TagNumber(3)
  set environment(Environment v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnvironment() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnvironment() => $_clearField(3);
}

class ActivatePromptVersionResponse extends $pb.GeneratedMessage {
  factory ActivatePromptVersionResponse() => create();
  ActivatePromptVersionResponse._() : super();
  factory ActivatePromptVersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActivatePromptVersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActivatePromptVersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActivatePromptVersionResponse clone() => ActivatePromptVersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActivatePromptVersionResponse copyWith(void Function(ActivatePromptVersionResponse) updates) => super.copyWith((message) => updates(message as ActivatePromptVersionResponse)) as ActivatePromptVersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivatePromptVersionResponse create() => ActivatePromptVersionResponse._();
  ActivatePromptVersionResponse createEmptyInstance() => create();
  static $pb.PbList<ActivatePromptVersionResponse> createRepeated() => $pb.PbList<ActivatePromptVersionResponse>();
  @$core.pragma('dart2js:noInline')
  static ActivatePromptVersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActivatePromptVersionResponse>(create);
  static ActivatePromptVersionResponse? _defaultInstance;
}

class DeactivatePromptVersionRequest extends $pb.GeneratedMessage {
  factory DeactivatePromptVersionRequest({
    $core.String? templateId,
    $core.int? versionNumber,
    Environment? environment,
  }) {
    final $result = create();
    if (templateId != null) {
      $result.templateId = templateId;
    }
    if (versionNumber != null) {
      $result.versionNumber = versionNumber;
    }
    if (environment != null) {
      $result.environment = environment;
    }
    return $result;
  }
  DeactivatePromptVersionRequest._() : super();
  factory DeactivatePromptVersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeactivatePromptVersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeactivatePromptVersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'templateId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'versionNumber', $pb.PbFieldType.O3)
    ..e<Environment>(3, _omitFieldNames ? '' : 'environment', $pb.PbFieldType.OE, defaultOrMaker: Environment.ENVIRONMENT_UNSPECIFIED, valueOf: Environment.valueOf, enumValues: Environment.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeactivatePromptVersionRequest clone() => DeactivatePromptVersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeactivatePromptVersionRequest copyWith(void Function(DeactivatePromptVersionRequest) updates) => super.copyWith((message) => updates(message as DeactivatePromptVersionRequest)) as DeactivatePromptVersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeactivatePromptVersionRequest create() => DeactivatePromptVersionRequest._();
  DeactivatePromptVersionRequest createEmptyInstance() => create();
  static $pb.PbList<DeactivatePromptVersionRequest> createRepeated() => $pb.PbList<DeactivatePromptVersionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeactivatePromptVersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeactivatePromptVersionRequest>(create);
  static DeactivatePromptVersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get templateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set templateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplateId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get versionNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set versionNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersionNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionNumber() => $_clearField(2);

  @$pb.TagNumber(3)
  Environment get environment => $_getN(2);
  @$pb.TagNumber(3)
  set environment(Environment v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnvironment() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnvironment() => $_clearField(3);
}

class DeactivatePromptVersionResponse extends $pb.GeneratedMessage {
  factory DeactivatePromptVersionResponse() => create();
  DeactivatePromptVersionResponse._() : super();
  factory DeactivatePromptVersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeactivatePromptVersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeactivatePromptVersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeactivatePromptVersionResponse clone() => DeactivatePromptVersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeactivatePromptVersionResponse copyWith(void Function(DeactivatePromptVersionResponse) updates) => super.copyWith((message) => updates(message as DeactivatePromptVersionResponse)) as DeactivatePromptVersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeactivatePromptVersionResponse create() => DeactivatePromptVersionResponse._();
  DeactivatePromptVersionResponse createEmptyInstance() => create();
  static $pb.PbList<DeactivatePromptVersionResponse> createRepeated() => $pb.PbList<DeactivatePromptVersionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeactivatePromptVersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeactivatePromptVersionResponse>(create);
  static DeactivatePromptVersionResponse? _defaultInstance;
}

class PromotePromptVersionRequest extends $pb.GeneratedMessage {
  factory PromotePromptVersionRequest({
    $core.String? templateId,
    $core.int? versionNumber,
    Environment? fromEnvironment,
    Environment? toEnvironment,
  }) {
    final $result = create();
    if (templateId != null) {
      $result.templateId = templateId;
    }
    if (versionNumber != null) {
      $result.versionNumber = versionNumber;
    }
    if (fromEnvironment != null) {
      $result.fromEnvironment = fromEnvironment;
    }
    if (toEnvironment != null) {
      $result.toEnvironment = toEnvironment;
    }
    return $result;
  }
  PromotePromptVersionRequest._() : super();
  factory PromotePromptVersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromotePromptVersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromotePromptVersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'templateId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'versionNumber', $pb.PbFieldType.O3)
    ..e<Environment>(3, _omitFieldNames ? '' : 'fromEnvironment', $pb.PbFieldType.OE, defaultOrMaker: Environment.ENVIRONMENT_UNSPECIFIED, valueOf: Environment.valueOf, enumValues: Environment.values)
    ..e<Environment>(4, _omitFieldNames ? '' : 'toEnvironment', $pb.PbFieldType.OE, defaultOrMaker: Environment.ENVIRONMENT_UNSPECIFIED, valueOf: Environment.valueOf, enumValues: Environment.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromotePromptVersionRequest clone() => PromotePromptVersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromotePromptVersionRequest copyWith(void Function(PromotePromptVersionRequest) updates) => super.copyWith((message) => updates(message as PromotePromptVersionRequest)) as PromotePromptVersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromotePromptVersionRequest create() => PromotePromptVersionRequest._();
  PromotePromptVersionRequest createEmptyInstance() => create();
  static $pb.PbList<PromotePromptVersionRequest> createRepeated() => $pb.PbList<PromotePromptVersionRequest>();
  @$core.pragma('dart2js:noInline')
  static PromotePromptVersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromotePromptVersionRequest>(create);
  static PromotePromptVersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get templateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set templateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemplateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplateId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get versionNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set versionNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersionNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionNumber() => $_clearField(2);

  @$pb.TagNumber(3)
  Environment get fromEnvironment => $_getN(2);
  @$pb.TagNumber(3)
  set fromEnvironment(Environment v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFromEnvironment() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromEnvironment() => $_clearField(3);

  @$pb.TagNumber(4)
  Environment get toEnvironment => $_getN(3);
  @$pb.TagNumber(4)
  set toEnvironment(Environment v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasToEnvironment() => $_has(3);
  @$pb.TagNumber(4)
  void clearToEnvironment() => $_clearField(4);
}

class PromotePromptVersionResponse extends $pb.GeneratedMessage {
  factory PromotePromptVersionResponse() => create();
  PromotePromptVersionResponse._() : super();
  factory PromotePromptVersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromotePromptVersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromotePromptVersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromotePromptVersionResponse clone() => PromotePromptVersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromotePromptVersionResponse copyWith(void Function(PromotePromptVersionResponse) updates) => super.copyWith((message) => updates(message as PromotePromptVersionResponse)) as PromotePromptVersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromotePromptVersionResponse create() => PromotePromptVersionResponse._();
  PromotePromptVersionResponse createEmptyInstance() => create();
  static $pb.PbList<PromotePromptVersionResponse> createRepeated() => $pb.PbList<PromotePromptVersionResponse>();
  @$core.pragma('dart2js:noInline')
  static PromotePromptVersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromotePromptVersionResponse>(create);
  static PromotePromptVersionResponse? _defaultInstance;
}

class TokenUsage extends $pb.GeneratedMessage {
  factory TokenUsage({
    $core.int? prompt,
    $core.int? completion,
    $core.int? total,
  }) {
    final $result = create();
    if (prompt != null) {
      $result.prompt = prompt;
    }
    if (completion != null) {
      $result.completion = completion;
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  TokenUsage._() : super();
  factory TokenUsage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenUsage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TokenUsage', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'prompt', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'completion', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenUsage clone() => TokenUsage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenUsage copyWith(void Function(TokenUsage) updates) => super.copyWith((message) => updates(message as TokenUsage)) as TokenUsage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenUsage create() => TokenUsage._();
  TokenUsage createEmptyInstance() => create();
  static $pb.PbList<TokenUsage> createRepeated() => $pb.PbList<TokenUsage>();
  @$core.pragma('dart2js:noInline')
  static TokenUsage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenUsage>(create);
  static TokenUsage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get prompt => $_getIZ(0);
  @$pb.TagNumber(1)
  set prompt($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrompt() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrompt() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get completion => $_getIZ(1);
  @$pb.TagNumber(2)
  set completion($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompletion() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompletion() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => $_clearField(3);
}

class Generation extends $pb.GeneratedMessage {
  factory Generation({
    $core.String? id,
    $core.String? companyId,
    $core.String? companyName,
    $core.String? assetId,
    $core.String? assetName,
    $core.String? fileId,
    $core.String? generationType,
    $core.bool? success,
    $core.String? error,
    $core.String? status,
    $core.int? latencyMs,
    TokenUsage? tokens,
    $core.double? costUsd,
    $0.Timestamp? createdAt,
    $0.Timestamp? completedAt,
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
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (assetName != null) {
      $result.assetName = assetName;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (generationType != null) {
      $result.generationType = generationType;
    }
    if (success != null) {
      $result.success = success;
    }
    if (error != null) {
      $result.error = error;
    }
    if (status != null) {
      $result.status = status;
    }
    if (latencyMs != null) {
      $result.latencyMs = latencyMs;
    }
    if (tokens != null) {
      $result.tokens = tokens;
    }
    if (costUsd != null) {
      $result.costUsd = costUsd;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (completedAt != null) {
      $result.completedAt = completedAt;
    }
    return $result;
  }
  Generation._() : super();
  factory Generation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Generation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Generation', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'companyId')
    ..aOS(3, _omitFieldNames ? '' : 'companyName')
    ..aOS(4, _omitFieldNames ? '' : 'assetId')
    ..aOS(5, _omitFieldNames ? '' : 'assetName')
    ..aOS(6, _omitFieldNames ? '' : 'fileId')
    ..aOS(7, _omitFieldNames ? '' : 'generationType')
    ..aOB(8, _omitFieldNames ? '' : 'success')
    ..aOS(9, _omitFieldNames ? '' : 'error')
    ..aOS(10, _omitFieldNames ? '' : 'status')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'latencyMs', $pb.PbFieldType.O3)
    ..aOM<TokenUsage>(12, _omitFieldNames ? '' : 'tokens', subBuilder: TokenUsage.create)
    ..a<$core.double>(13, _omitFieldNames ? '' : 'costUsd', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(14, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(15, _omitFieldNames ? '' : 'completedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Generation clone() => Generation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Generation copyWith(void Function(Generation) updates) => super.copyWith((message) => updates(message as Generation)) as Generation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Generation create() => Generation._();
  Generation createEmptyInstance() => create();
  static $pb.PbList<Generation> createRepeated() => $pb.PbList<Generation>();
  @$core.pragma('dart2js:noInline')
  static Generation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Generation>(create);
  static Generation? _defaultInstance;

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
  $core.String get assetId => $_getSZ(3);
  @$pb.TagNumber(4)
  set assetId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAssetId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAssetId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get assetName => $_getSZ(4);
  @$pb.TagNumber(5)
  set assetName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAssetName() => $_has(4);
  @$pb.TagNumber(5)
  void clearAssetName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get fileId => $_getSZ(5);
  @$pb.TagNumber(6)
  set fileId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFileId() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get generationType => $_getSZ(6);
  @$pb.TagNumber(7)
  set generationType($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGenerationType() => $_has(6);
  @$pb.TagNumber(7)
  void clearGenerationType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get success => $_getBF(7);
  @$pb.TagNumber(8)
  set success($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSuccess() => $_has(7);
  @$pb.TagNumber(8)
  void clearSuccess() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get error => $_getSZ(8);
  @$pb.TagNumber(9)
  set error($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasError() => $_has(8);
  @$pb.TagNumber(9)
  void clearError() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get status => $_getSZ(9);
  @$pb.TagNumber(10)
  set status($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get latencyMs => $_getIZ(10);
  @$pb.TagNumber(11)
  set latencyMs($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLatencyMs() => $_has(10);
  @$pb.TagNumber(11)
  void clearLatencyMs() => $_clearField(11);

  @$pb.TagNumber(12)
  TokenUsage get tokens => $_getN(11);
  @$pb.TagNumber(12)
  set tokens(TokenUsage v) { $_setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasTokens() => $_has(11);
  @$pb.TagNumber(12)
  void clearTokens() => $_clearField(12);
  @$pb.TagNumber(12)
  TokenUsage ensureTokens() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.double get costUsd => $_getN(12);
  @$pb.TagNumber(13)
  set costUsd($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCostUsd() => $_has(12);
  @$pb.TagNumber(13)
  void clearCostUsd() => $_clearField(13);

  @$pb.TagNumber(14)
  $0.Timestamp get createdAt => $_getN(13);
  @$pb.TagNumber(14)
  set createdAt($0.Timestamp v) { $_setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCreatedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearCreatedAt() => $_clearField(14);
  @$pb.TagNumber(14)
  $0.Timestamp ensureCreatedAt() => $_ensure(13);

  @$pb.TagNumber(15)
  $0.Timestamp get completedAt => $_getN(14);
  @$pb.TagNumber(15)
  set completedAt($0.Timestamp v) { $_setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCompletedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearCompletedAt() => $_clearField(15);
  @$pb.TagNumber(15)
  $0.Timestamp ensureCompletedAt() => $_ensure(14);
}

class GenerationDetail extends $pb.GeneratedMessage {
  factory GenerationDetail({
    Generation? generation,
    $core.String? promptVersionId,
    $core.int? promptVersionNumber,
    $1.Struct? modelDetails,
    $1.Struct? llmRequest,
    $1.Struct? llmResponse,
    $1.Struct? changesMade,
  }) {
    final $result = create();
    if (generation != null) {
      $result.generation = generation;
    }
    if (promptVersionId != null) {
      $result.promptVersionId = promptVersionId;
    }
    if (promptVersionNumber != null) {
      $result.promptVersionNumber = promptVersionNumber;
    }
    if (modelDetails != null) {
      $result.modelDetails = modelDetails;
    }
    if (llmRequest != null) {
      $result.llmRequest = llmRequest;
    }
    if (llmResponse != null) {
      $result.llmResponse = llmResponse;
    }
    if (changesMade != null) {
      $result.changesMade = changesMade;
    }
    return $result;
  }
  GenerationDetail._() : super();
  factory GenerationDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerationDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerationDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOM<Generation>(1, _omitFieldNames ? '' : 'generation', subBuilder: Generation.create)
    ..aOS(2, _omitFieldNames ? '' : 'promptVersionId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'promptVersionNumber', $pb.PbFieldType.O3)
    ..aOM<$1.Struct>(4, _omitFieldNames ? '' : 'modelDetails', subBuilder: $1.Struct.create)
    ..aOM<$1.Struct>(5, _omitFieldNames ? '' : 'llmRequest', subBuilder: $1.Struct.create)
    ..aOM<$1.Struct>(6, _omitFieldNames ? '' : 'llmResponse', subBuilder: $1.Struct.create)
    ..aOM<$1.Struct>(7, _omitFieldNames ? '' : 'changesMade', subBuilder: $1.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerationDetail clone() => GenerationDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerationDetail copyWith(void Function(GenerationDetail) updates) => super.copyWith((message) => updates(message as GenerationDetail)) as GenerationDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerationDetail create() => GenerationDetail._();
  GenerationDetail createEmptyInstance() => create();
  static $pb.PbList<GenerationDetail> createRepeated() => $pb.PbList<GenerationDetail>();
  @$core.pragma('dart2js:noInline')
  static GenerationDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerationDetail>(create);
  static GenerationDetail? _defaultInstance;

  @$pb.TagNumber(1)
  Generation get generation => $_getN(0);
  @$pb.TagNumber(1)
  set generation(Generation v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGeneration() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeneration() => $_clearField(1);
  @$pb.TagNumber(1)
  Generation ensureGeneration() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get promptVersionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set promptVersionId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPromptVersionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPromptVersionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get promptVersionNumber => $_getIZ(2);
  @$pb.TagNumber(3)
  set promptVersionNumber($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPromptVersionNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearPromptVersionNumber() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.Struct get modelDetails => $_getN(3);
  @$pb.TagNumber(4)
  set modelDetails($1.Struct v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasModelDetails() => $_has(3);
  @$pb.TagNumber(4)
  void clearModelDetails() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Struct ensureModelDetails() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Struct get llmRequest => $_getN(4);
  @$pb.TagNumber(5)
  set llmRequest($1.Struct v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLlmRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearLlmRequest() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Struct ensureLlmRequest() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Struct get llmResponse => $_getN(5);
  @$pb.TagNumber(6)
  set llmResponse($1.Struct v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLlmResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearLlmResponse() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Struct ensureLlmResponse() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Struct get changesMade => $_getN(6);
  @$pb.TagNumber(7)
  set changesMade($1.Struct v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasChangesMade() => $_has(6);
  @$pb.TagNumber(7)
  void clearChangesMade() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Struct ensureChangesMade() => $_ensure(6);
}

class GenerationTypeStats extends $pb.GeneratedMessage {
  factory GenerationTypeStats({
    $core.String? type,
    $core.int? count,
    $core.int? successful,
    $core.int? failed,
    $core.double? avgLatencyMs,
    $fixnum.Int64? totalTokens,
    $core.double? totalCostUsd,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (count != null) {
      $result.count = count;
    }
    if (successful != null) {
      $result.successful = successful;
    }
    if (failed != null) {
      $result.failed = failed;
    }
    if (avgLatencyMs != null) {
      $result.avgLatencyMs = avgLatencyMs;
    }
    if (totalTokens != null) {
      $result.totalTokens = totalTokens;
    }
    if (totalCostUsd != null) {
      $result.totalCostUsd = totalCostUsd;
    }
    return $result;
  }
  GenerationTypeStats._() : super();
  factory GenerationTypeStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerationTypeStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerationTypeStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'successful', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'failed', $pb.PbFieldType.O3)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'avgLatencyMs', $pb.PbFieldType.OD)
    ..aInt64(6, _omitFieldNames ? '' : 'totalTokens')
    ..a<$core.double>(7, _omitFieldNames ? '' : 'totalCostUsd', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerationTypeStats clone() => GenerationTypeStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerationTypeStats copyWith(void Function(GenerationTypeStats) updates) => super.copyWith((message) => updates(message as GenerationTypeStats)) as GenerationTypeStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerationTypeStats create() => GenerationTypeStats._();
  GenerationTypeStats createEmptyInstance() => create();
  static $pb.PbList<GenerationTypeStats> createRepeated() => $pb.PbList<GenerationTypeStats>();
  @$core.pragma('dart2js:noInline')
  static GenerationTypeStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerationTypeStats>(create);
  static GenerationTypeStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get successful => $_getIZ(2);
  @$pb.TagNumber(3)
  set successful($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccessful() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccessful() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get failed => $_getIZ(3);
  @$pb.TagNumber(4)
  set failed($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFailed() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailed() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get avgLatencyMs => $_getN(4);
  @$pb.TagNumber(5)
  set avgLatencyMs($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvgLatencyMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvgLatencyMs() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalTokens => $_getI64(5);
  @$pb.TagNumber(6)
  set totalTokens($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalTokens() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalTokens() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get totalCostUsd => $_getN(6);
  @$pb.TagNumber(7)
  set totalCostUsd($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalCostUsd() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalCostUsd() => $_clearField(7);
}

class DailyTrend extends $pb.GeneratedMessage {
  factory DailyTrend({
    $core.String? date,
    $core.int? count,
    $core.int? successful,
    $core.int? failed,
    $core.double? totalCostUsd,
  }) {
    final $result = create();
    if (date != null) {
      $result.date = date;
    }
    if (count != null) {
      $result.count = count;
    }
    if (successful != null) {
      $result.successful = successful;
    }
    if (failed != null) {
      $result.failed = failed;
    }
    if (totalCostUsd != null) {
      $result.totalCostUsd = totalCostUsd;
    }
    return $result;
  }
  DailyTrend._() : super();
  factory DailyTrend.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DailyTrend.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DailyTrend', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'date')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'successful', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'failed', $pb.PbFieldType.O3)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'totalCostUsd', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DailyTrend clone() => DailyTrend()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DailyTrend copyWith(void Function(DailyTrend) updates) => super.copyWith((message) => updates(message as DailyTrend)) as DailyTrend;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DailyTrend create() => DailyTrend._();
  DailyTrend createEmptyInstance() => create();
  static $pb.PbList<DailyTrend> createRepeated() => $pb.PbList<DailyTrend>();
  @$core.pragma('dart2js:noInline')
  static DailyTrend getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DailyTrend>(create);
  static DailyTrend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get date => $_getSZ(0);
  @$pb.TagNumber(1)
  set date($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get successful => $_getIZ(2);
  @$pb.TagNumber(3)
  set successful($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccessful() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccessful() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get failed => $_getIZ(3);
  @$pb.TagNumber(4)
  set failed($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFailed() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailed() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get totalCostUsd => $_getN(4);
  @$pb.TagNumber(5)
  set totalCostUsd($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalCostUsd() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalCostUsd() => $_clearField(5);
}

class GenerationStats extends $pb.GeneratedMessage {
  factory GenerationStats({
    $core.int? totalGenerations,
    $core.int? successful,
    $core.int? failed,
    $core.double? successRate,
    $core.double? avgLatencyMs,
    $fixnum.Int64? totalTokens,
    $core.double? totalCostUsd,
    $core.int? uniqueCompanies,
    $core.int? uniqueAssets,
    $core.Iterable<GenerationTypeStats>? byType,
    $core.Iterable<DailyTrend>? dailyTrends,
  }) {
    final $result = create();
    if (totalGenerations != null) {
      $result.totalGenerations = totalGenerations;
    }
    if (successful != null) {
      $result.successful = successful;
    }
    if (failed != null) {
      $result.failed = failed;
    }
    if (successRate != null) {
      $result.successRate = successRate;
    }
    if (avgLatencyMs != null) {
      $result.avgLatencyMs = avgLatencyMs;
    }
    if (totalTokens != null) {
      $result.totalTokens = totalTokens;
    }
    if (totalCostUsd != null) {
      $result.totalCostUsd = totalCostUsd;
    }
    if (uniqueCompanies != null) {
      $result.uniqueCompanies = uniqueCompanies;
    }
    if (uniqueAssets != null) {
      $result.uniqueAssets = uniqueAssets;
    }
    if (byType != null) {
      $result.byType.addAll(byType);
    }
    if (dailyTrends != null) {
      $result.dailyTrends.addAll(dailyTrends);
    }
    return $result;
  }
  GenerationStats._() : super();
  factory GenerationStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerationStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerationStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'totalGenerations', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'successful', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'failed', $pb.PbFieldType.O3)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'successRate', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'avgLatencyMs', $pb.PbFieldType.OD)
    ..aInt64(6, _omitFieldNames ? '' : 'totalTokens')
    ..a<$core.double>(7, _omitFieldNames ? '' : 'totalCostUsd', $pb.PbFieldType.OD)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'uniqueCompanies', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'uniqueAssets', $pb.PbFieldType.O3)
    ..pc<GenerationTypeStats>(10, _omitFieldNames ? '' : 'byType', $pb.PbFieldType.PM, subBuilder: GenerationTypeStats.create)
    ..pc<DailyTrend>(11, _omitFieldNames ? '' : 'dailyTrends', $pb.PbFieldType.PM, subBuilder: DailyTrend.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerationStats clone() => GenerationStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerationStats copyWith(void Function(GenerationStats) updates) => super.copyWith((message) => updates(message as GenerationStats)) as GenerationStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerationStats create() => GenerationStats._();
  GenerationStats createEmptyInstance() => create();
  static $pb.PbList<GenerationStats> createRepeated() => $pb.PbList<GenerationStats>();
  @$core.pragma('dart2js:noInline')
  static GenerationStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerationStats>(create);
  static GenerationStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalGenerations => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalGenerations($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalGenerations() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalGenerations() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get successful => $_getIZ(1);
  @$pb.TagNumber(2)
  set successful($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessful() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessful() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get failed => $_getIZ(2);
  @$pb.TagNumber(3)
  set failed($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFailed() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailed() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get successRate => $_getN(3);
  @$pb.TagNumber(4)
  set successRate($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSuccessRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuccessRate() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get avgLatencyMs => $_getN(4);
  @$pb.TagNumber(5)
  set avgLatencyMs($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvgLatencyMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvgLatencyMs() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalTokens => $_getI64(5);
  @$pb.TagNumber(6)
  set totalTokens($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalTokens() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalTokens() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get totalCostUsd => $_getN(6);
  @$pb.TagNumber(7)
  set totalCostUsd($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalCostUsd() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalCostUsd() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get uniqueCompanies => $_getIZ(7);
  @$pb.TagNumber(8)
  set uniqueCompanies($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUniqueCompanies() => $_has(7);
  @$pb.TagNumber(8)
  void clearUniqueCompanies() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get uniqueAssets => $_getIZ(8);
  @$pb.TagNumber(9)
  set uniqueAssets($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUniqueAssets() => $_has(8);
  @$pb.TagNumber(9)
  void clearUniqueAssets() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbList<GenerationTypeStats> get byType => $_getList(9);

  @$pb.TagNumber(11)
  $pb.PbList<DailyTrend> get dailyTrends => $_getList(10);
}

class GetGenerationStatsRequest extends $pb.GeneratedMessage {
  factory GetGenerationStatsRequest({
    $core.String? companyId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.String? generationType,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (endDate != null) {
      $result.endDate = endDate;
    }
    if (generationType != null) {
      $result.generationType = generationType;
    }
    return $result;
  }
  GetGenerationStatsRequest._() : super();
  factory GetGenerationStatsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGenerationStatsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGenerationStatsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'endDate', subBuilder: $0.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'generationType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGenerationStatsRequest clone() => GetGenerationStatsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGenerationStatsRequest copyWith(void Function(GetGenerationStatsRequest) updates) => super.copyWith((message) => updates(message as GetGenerationStatsRequest)) as GetGenerationStatsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGenerationStatsRequest create() => GetGenerationStatsRequest._();
  GetGenerationStatsRequest createEmptyInstance() => create();
  static $pb.PbList<GetGenerationStatsRequest> createRepeated() => $pb.PbList<GetGenerationStatsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGenerationStatsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGenerationStatsRequest>(create);
  static GetGenerationStatsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($0.Timestamp v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Timestamp get endDate => $_getN(2);
  @$pb.TagNumber(3)
  set endDate($0.Timestamp v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureEndDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get generationType => $_getSZ(3);
  @$pb.TagNumber(4)
  set generationType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGenerationType() => $_has(3);
  @$pb.TagNumber(4)
  void clearGenerationType() => $_clearField(4);
}

class ListGenerationsRequest extends $pb.GeneratedMessage {
  factory ListGenerationsRequest({
    $core.String? companyId,
    $core.String? assetId,
    $core.String? generationType,
    $core.bool? success,
    $core.String? status,
    $core.int? limit,
    $core.int? offset,
    $core.String? sortBy,
    $core.String? sortOrder,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (generationType != null) {
      $result.generationType = generationType;
    }
    if (success != null) {
      $result.success = success;
    }
    if (status != null) {
      $result.status = status;
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
  ListGenerationsRequest._() : super();
  factory ListGenerationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListGenerationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListGenerationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..aOS(2, _omitFieldNames ? '' : 'assetId')
    ..aOS(3, _omitFieldNames ? '' : 'generationType')
    ..aOB(4, _omitFieldNames ? '' : 'success')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'sortBy')
    ..aOS(9, _omitFieldNames ? '' : 'sortOrder')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListGenerationsRequest clone() => ListGenerationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListGenerationsRequest copyWith(void Function(ListGenerationsRequest) updates) => super.copyWith((message) => updates(message as ListGenerationsRequest)) as ListGenerationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListGenerationsRequest create() => ListGenerationsRequest._();
  ListGenerationsRequest createEmptyInstance() => create();
  static $pb.PbList<ListGenerationsRequest> createRepeated() => $pb.PbList<ListGenerationsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListGenerationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListGenerationsRequest>(create);
  static ListGenerationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get generationType => $_getSZ(2);
  @$pb.TagNumber(3)
  set generationType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGenerationType() => $_has(2);
  @$pb.TagNumber(3)
  void clearGenerationType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get success => $_getBF(3);
  @$pb.TagNumber(4)
  set success($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSuccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuccess() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get limit => $_getIZ(5);
  @$pb.TagNumber(6)
  set limit($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearLimit() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get offset => $_getIZ(6);
  @$pb.TagNumber(7)
  set offset($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOffset() => $_has(6);
  @$pb.TagNumber(7)
  void clearOffset() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get sortBy => $_getSZ(7);
  @$pb.TagNumber(8)
  set sortBy($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSortBy() => $_has(7);
  @$pb.TagNumber(8)
  void clearSortBy() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get sortOrder => $_getSZ(8);
  @$pb.TagNumber(9)
  set sortOrder($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSortOrder() => $_has(8);
  @$pb.TagNumber(9)
  void clearSortOrder() => $_clearField(9);
}

class ListGenerationsResponse extends $pb.GeneratedMessage {
  factory ListGenerationsResponse({
    $core.Iterable<Generation>? generations,
    $core.int? total,
  }) {
    final $result = create();
    if (generations != null) {
      $result.generations.addAll(generations);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ListGenerationsResponse._() : super();
  factory ListGenerationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListGenerationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListGenerationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<Generation>(1, _omitFieldNames ? '' : 'generations', $pb.PbFieldType.PM, subBuilder: Generation.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListGenerationsResponse clone() => ListGenerationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListGenerationsResponse copyWith(void Function(ListGenerationsResponse) updates) => super.copyWith((message) => updates(message as ListGenerationsResponse)) as ListGenerationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListGenerationsResponse create() => ListGenerationsResponse._();
  ListGenerationsResponse createEmptyInstance() => create();
  static $pb.PbList<ListGenerationsResponse> createRepeated() => $pb.PbList<ListGenerationsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListGenerationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListGenerationsResponse>(create);
  static ListGenerationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Generation> get generations => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

class GetGenerationRequest extends $pb.GeneratedMessage {
  factory GetGenerationRequest({
    $core.String? generationId,
  }) {
    final $result = create();
    if (generationId != null) {
      $result.generationId = generationId;
    }
    return $result;
  }
  GetGenerationRequest._() : super();
  factory GetGenerationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGenerationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGenerationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'generationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGenerationRequest clone() => GetGenerationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGenerationRequest copyWith(void Function(GetGenerationRequest) updates) => super.copyWith((message) => updates(message as GetGenerationRequest)) as GetGenerationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGenerationRequest create() => GetGenerationRequest._();
  GetGenerationRequest createEmptyInstance() => create();
  static $pb.PbList<GetGenerationRequest> createRepeated() => $pb.PbList<GetGenerationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGenerationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGenerationRequest>(create);
  static GetGenerationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get generationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set generationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGenerationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGenerationId() => $_clearField(1);
}

class GetRecentErrorsRequest extends $pb.GeneratedMessage {
  factory GetRecentErrorsRequest({
    $core.int? limit,
    $core.String? companyId,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (companyId != null) {
      $result.companyId = companyId;
    }
    return $result;
  }
  GetRecentErrorsRequest._() : super();
  factory GetRecentErrorsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRecentErrorsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRecentErrorsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'companyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRecentErrorsRequest clone() => GetRecentErrorsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRecentErrorsRequest copyWith(void Function(GetRecentErrorsRequest) updates) => super.copyWith((message) => updates(message as GetRecentErrorsRequest)) as GetRecentErrorsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecentErrorsRequest create() => GetRecentErrorsRequest._();
  GetRecentErrorsRequest createEmptyInstance() => create();
  static $pb.PbList<GetRecentErrorsRequest> createRepeated() => $pb.PbList<GetRecentErrorsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRecentErrorsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRecentErrorsRequest>(create);
  static GetRecentErrorsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyId() => $_clearField(2);
}

class GenerationError extends $pb.GeneratedMessage {
  factory GenerationError({
    $core.String? id,
    $core.String? generationType,
    $core.String? error,
    $core.String? companyName,
    $core.String? assetName,
    $0.Timestamp? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (generationType != null) {
      $result.generationType = generationType;
    }
    if (error != null) {
      $result.error = error;
    }
    if (companyName != null) {
      $result.companyName = companyName;
    }
    if (assetName != null) {
      $result.assetName = assetName;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  GenerationError._() : super();
  factory GenerationError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerationError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerationError', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'generationType')
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..aOS(4, _omitFieldNames ? '' : 'companyName')
    ..aOS(5, _omitFieldNames ? '' : 'assetName')
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerationError clone() => GenerationError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerationError copyWith(void Function(GenerationError) updates) => super.copyWith((message) => updates(message as GenerationError)) as GenerationError;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerationError create() => GenerationError._();
  GenerationError createEmptyInstance() => create();
  static $pb.PbList<GenerationError> createRepeated() => $pb.PbList<GenerationError>();
  @$core.pragma('dart2js:noInline')
  static GenerationError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerationError>(create);
  static GenerationError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get generationType => $_getSZ(1);
  @$pb.TagNumber(2)
  set generationType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGenerationType() => $_has(1);
  @$pb.TagNumber(2)
  void clearGenerationType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get companyName => $_getSZ(3);
  @$pb.TagNumber(4)
  set companyName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompanyName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompanyName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get assetName => $_getSZ(4);
  @$pb.TagNumber(5)
  set assetName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAssetName() => $_has(4);
  @$pb.TagNumber(5)
  void clearAssetName() => $_clearField(5);

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
}

class GetRecentErrorsResponse extends $pb.GeneratedMessage {
  factory GetRecentErrorsResponse({
    $core.Iterable<GenerationError>? errors,
  }) {
    final $result = create();
    if (errors != null) {
      $result.errors.addAll(errors);
    }
    return $result;
  }
  GetRecentErrorsResponse._() : super();
  factory GetRecentErrorsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRecentErrorsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRecentErrorsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<GenerationError>(1, _omitFieldNames ? '' : 'errors', $pb.PbFieldType.PM, subBuilder: GenerationError.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRecentErrorsResponse clone() => GetRecentErrorsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRecentErrorsResponse copyWith(void Function(GetRecentErrorsResponse) updates) => super.copyWith((message) => updates(message as GetRecentErrorsResponse)) as GetRecentErrorsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecentErrorsResponse create() => GetRecentErrorsResponse._();
  GetRecentErrorsResponse createEmptyInstance() => create();
  static $pb.PbList<GetRecentErrorsResponse> createRepeated() => $pb.PbList<GetRecentErrorsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRecentErrorsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRecentErrorsResponse>(create);
  static GetRecentErrorsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GenerationError> get errors => $_getList(0);
}

class GetAssetAIHistoryRequest extends $pb.GeneratedMessage {
  factory GetAssetAIHistoryRequest({
    $core.String? assetId,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    return $result;
  }
  GetAssetAIHistoryRequest._() : super();
  factory GetAssetAIHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetAIHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetAIHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetAIHistoryRequest clone() => GetAssetAIHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetAIHistoryRequest copyWith(void Function(GetAssetAIHistoryRequest) updates) => super.copyWith((message) => updates(message as GetAssetAIHistoryRequest)) as GetAssetAIHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetAIHistoryRequest create() => GetAssetAIHistoryRequest._();
  GetAssetAIHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssetAIHistoryRequest> createRepeated() => $pb.PbList<GetAssetAIHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssetAIHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetAIHistoryRequest>(create);
  static GetAssetAIHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => $_clearField(1);
}

class AssetAIHistory extends $pb.GeneratedMessage {
  factory AssetAIHistory({
    $core.String? assetId,
    $core.String? assetName,
    $core.Iterable<Generation>? generations,
    $core.int? totalGenerations,
    $core.int? successful,
    $core.int? failed,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (assetName != null) {
      $result.assetName = assetName;
    }
    if (generations != null) {
      $result.generations.addAll(generations);
    }
    if (totalGenerations != null) {
      $result.totalGenerations = totalGenerations;
    }
    if (successful != null) {
      $result.successful = successful;
    }
    if (failed != null) {
      $result.failed = failed;
    }
    return $result;
  }
  AssetAIHistory._() : super();
  factory AssetAIHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetAIHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetAIHistory', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..aOS(2, _omitFieldNames ? '' : 'assetName')
    ..pc<Generation>(3, _omitFieldNames ? '' : 'generations', $pb.PbFieldType.PM, subBuilder: Generation.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'totalGenerations', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'successful', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'failed', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetAIHistory clone() => AssetAIHistory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetAIHistory copyWith(void Function(AssetAIHistory) updates) => super.copyWith((message) => updates(message as AssetAIHistory)) as AssetAIHistory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetAIHistory create() => AssetAIHistory._();
  AssetAIHistory createEmptyInstance() => create();
  static $pb.PbList<AssetAIHistory> createRepeated() => $pb.PbList<AssetAIHistory>();
  @$core.pragma('dart2js:noInline')
  static AssetAIHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetAIHistory>(create);
  static AssetAIHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetName => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Generation> get generations => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get totalGenerations => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalGenerations($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalGenerations() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalGenerations() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get successful => $_getIZ(4);
  @$pb.TagNumber(5)
  set successful($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSuccessful() => $_has(4);
  @$pb.TagNumber(5)
  void clearSuccessful() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get failed => $_getIZ(5);
  @$pb.TagNumber(6)
  set failed($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFailed() => $_has(5);
  @$pb.TagNumber(6)
  void clearFailed() => $_clearField(6);
}

class FieldCompleteness extends $pb.GeneratedMessage {
  factory FieldCompleteness({
    $core.String? fieldName,
    $core.int? filledCount,
    $core.int? missingCount,
    $core.double? completionPercentage,
  }) {
    final $result = create();
    if (fieldName != null) {
      $result.fieldName = fieldName;
    }
    if (filledCount != null) {
      $result.filledCount = filledCount;
    }
    if (missingCount != null) {
      $result.missingCount = missingCount;
    }
    if (completionPercentage != null) {
      $result.completionPercentage = completionPercentage;
    }
    return $result;
  }
  FieldCompleteness._() : super();
  factory FieldCompleteness.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FieldCompleteness.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FieldCompleteness', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fieldName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'filledCount', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'missingCount', $pb.PbFieldType.O3)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'completionPercentage', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FieldCompleteness clone() => FieldCompleteness()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FieldCompleteness copyWith(void Function(FieldCompleteness) updates) => super.copyWith((message) => updates(message as FieldCompleteness)) as FieldCompleteness;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldCompleteness create() => FieldCompleteness._();
  FieldCompleteness createEmptyInstance() => create();
  static $pb.PbList<FieldCompleteness> createRepeated() => $pb.PbList<FieldCompleteness>();
  @$core.pragma('dart2js:noInline')
  static FieldCompleteness getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FieldCompleteness>(create);
  static FieldCompleteness? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fieldName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fieldName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get filledCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set filledCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilledCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilledCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get missingCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set missingCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMissingCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMissingCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get completionPercentage => $_getN(3);
  @$pb.TagNumber(4)
  set completionPercentage($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompletionPercentage() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompletionPercentage() => $_clearField(4);
}

class CriticalFieldsCompletion extends $pb.GeneratedMessage {
  factory CriticalFieldsCompletion({
    $core.double? warrantyFields,
    $core.double? identificationFields,
    $core.double? valueFields,
    $core.double? locationFields,
  }) {
    final $result = create();
    if (warrantyFields != null) {
      $result.warrantyFields = warrantyFields;
    }
    if (identificationFields != null) {
      $result.identificationFields = identificationFields;
    }
    if (valueFields != null) {
      $result.valueFields = valueFields;
    }
    if (locationFields != null) {
      $result.locationFields = locationFields;
    }
    return $result;
  }
  CriticalFieldsCompletion._() : super();
  factory CriticalFieldsCompletion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CriticalFieldsCompletion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CriticalFieldsCompletion', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'warrantyFields', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'identificationFields', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'valueFields', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'locationFields', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CriticalFieldsCompletion clone() => CriticalFieldsCompletion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CriticalFieldsCompletion copyWith(void Function(CriticalFieldsCompletion) updates) => super.copyWith((message) => updates(message as CriticalFieldsCompletion)) as CriticalFieldsCompletion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CriticalFieldsCompletion create() => CriticalFieldsCompletion._();
  CriticalFieldsCompletion createEmptyInstance() => create();
  static $pb.PbList<CriticalFieldsCompletion> createRepeated() => $pb.PbList<CriticalFieldsCompletion>();
  @$core.pragma('dart2js:noInline')
  static CriticalFieldsCompletion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CriticalFieldsCompletion>(create);
  static CriticalFieldsCompletion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get warrantyFields => $_getN(0);
  @$pb.TagNumber(1)
  set warrantyFields($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWarrantyFields() => $_has(0);
  @$pb.TagNumber(1)
  void clearWarrantyFields() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get identificationFields => $_getN(1);
  @$pb.TagNumber(2)
  set identificationFields($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentificationFields() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentificationFields() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get valueFields => $_getN(2);
  @$pb.TagNumber(3)
  set valueFields($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValueFields() => $_has(2);
  @$pb.TagNumber(3)
  void clearValueFields() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get locationFields => $_getN(3);
  @$pb.TagNumber(4)
  set locationFields($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocationFields() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocationFields() => $_clearField(4);
}

class GapAnalysisResponse extends $pb.GeneratedMessage {
  factory GapAnalysisResponse({
    $core.String? companyId,
    $core.String? companyName,
    $core.int? totalAssets,
    $core.Iterable<FieldCompleteness>? fieldCompleteness,
    $core.double? overallCompletionPercentage,
    CriticalFieldsCompletion? criticalFields,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (companyName != null) {
      $result.companyName = companyName;
    }
    if (totalAssets != null) {
      $result.totalAssets = totalAssets;
    }
    if (fieldCompleteness != null) {
      $result.fieldCompleteness.addAll(fieldCompleteness);
    }
    if (overallCompletionPercentage != null) {
      $result.overallCompletionPercentage = overallCompletionPercentage;
    }
    if (criticalFields != null) {
      $result.criticalFields = criticalFields;
    }
    return $result;
  }
  GapAnalysisResponse._() : super();
  factory GapAnalysisResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GapAnalysisResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GapAnalysisResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..aOS(2, _omitFieldNames ? '' : 'companyName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'totalAssets', $pb.PbFieldType.O3)
    ..pc<FieldCompleteness>(4, _omitFieldNames ? '' : 'fieldCompleteness', $pb.PbFieldType.PM, subBuilder: FieldCompleteness.create)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'overallCompletionPercentage', $pb.PbFieldType.OD)
    ..aOM<CriticalFieldsCompletion>(6, _omitFieldNames ? '' : 'criticalFields', subBuilder: CriticalFieldsCompletion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GapAnalysisResponse clone() => GapAnalysisResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GapAnalysisResponse copyWith(void Function(GapAnalysisResponse) updates) => super.copyWith((message) => updates(message as GapAnalysisResponse)) as GapAnalysisResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GapAnalysisResponse create() => GapAnalysisResponse._();
  GapAnalysisResponse createEmptyInstance() => create();
  static $pb.PbList<GapAnalysisResponse> createRepeated() => $pb.PbList<GapAnalysisResponse>();
  @$core.pragma('dart2js:noInline')
  static GapAnalysisResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GapAnalysisResponse>(create);
  static GapAnalysisResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalAssets => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalAssets($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalAssets() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalAssets() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<FieldCompleteness> get fieldCompleteness => $_getList(3);

  @$pb.TagNumber(5)
  $core.double get overallCompletionPercentage => $_getN(4);
  @$pb.TagNumber(5)
  set overallCompletionPercentage($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOverallCompletionPercentage() => $_has(4);
  @$pb.TagNumber(5)
  void clearOverallCompletionPercentage() => $_clearField(5);

  @$pb.TagNumber(6)
  CriticalFieldsCompletion get criticalFields => $_getN(5);
  @$pb.TagNumber(6)
  set criticalFields(CriticalFieldsCompletion v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCriticalFields() => $_has(5);
  @$pb.TagNumber(6)
  void clearCriticalFields() => $_clearField(6);
  @$pb.TagNumber(6)
  CriticalFieldsCompletion ensureCriticalFields() => $_ensure(5);
}

class GetAssetGapAnalysisRequest extends $pb.GeneratedMessage {
  factory GetAssetGapAnalysisRequest({
    $core.String? companyId,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    return $result;
  }
  GetAssetGapAnalysisRequest._() : super();
  factory GetAssetGapAnalysisRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetGapAnalysisRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetGapAnalysisRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetGapAnalysisRequest clone() => GetAssetGapAnalysisRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetGapAnalysisRequest copyWith(void Function(GetAssetGapAnalysisRequest) updates) => super.copyWith((message) => updates(message as GetAssetGapAnalysisRequest)) as GetAssetGapAnalysisRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetGapAnalysisRequest create() => GetAssetGapAnalysisRequest._();
  GetAssetGapAnalysisRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssetGapAnalysisRequest> createRepeated() => $pb.PbList<GetAssetGapAnalysisRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssetGapAnalysisRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetGapAnalysisRequest>(create);
  static GetAssetGapAnalysisRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);
}

class AssetMissingField extends $pb.GeneratedMessage {
  factory AssetMissingField({
    $core.String? assetId,
    $core.String? assetName,
    $core.Iterable<$core.String>? missingFields,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (assetName != null) {
      $result.assetName = assetName;
    }
    if (missingFields != null) {
      $result.missingFields.addAll(missingFields);
    }
    return $result;
  }
  AssetMissingField._() : super();
  factory AssetMissingField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetMissingField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetMissingField', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..aOS(2, _omitFieldNames ? '' : 'assetName')
    ..pPS(3, _omitFieldNames ? '' : 'missingFields')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetMissingField clone() => AssetMissingField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetMissingField copyWith(void Function(AssetMissingField) updates) => super.copyWith((message) => updates(message as AssetMissingField)) as AssetMissingField;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetMissingField create() => AssetMissingField._();
  AssetMissingField createEmptyInstance() => create();
  static $pb.PbList<AssetMissingField> createRepeated() => $pb.PbList<AssetMissingField>();
  @$core.pragma('dart2js:noInline')
  static AssetMissingField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetMissingField>(create);
  static AssetMissingField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetName => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get missingFields => $_getList(2);
}

class GetAssetsMissingFieldsRequest extends $pb.GeneratedMessage {
  factory GetAssetsMissingFieldsRequest({
    $core.String? companyId,
    $core.Iterable<$core.String>? fieldNames,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (fieldNames != null) {
      $result.fieldNames.addAll(fieldNames);
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetAssetsMissingFieldsRequest._() : super();
  factory GetAssetsMissingFieldsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetsMissingFieldsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetsMissingFieldsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..pPS(2, _omitFieldNames ? '' : 'fieldNames')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetsMissingFieldsRequest clone() => GetAssetsMissingFieldsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetsMissingFieldsRequest copyWith(void Function(GetAssetsMissingFieldsRequest) updates) => super.copyWith((message) => updates(message as GetAssetsMissingFieldsRequest)) as GetAssetsMissingFieldsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetsMissingFieldsRequest create() => GetAssetsMissingFieldsRequest._();
  GetAssetsMissingFieldsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssetsMissingFieldsRequest> createRepeated() => $pb.PbList<GetAssetsMissingFieldsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssetsMissingFieldsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetsMissingFieldsRequest>(create);
  static GetAssetsMissingFieldsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get fieldNames => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get offset => $_getIZ(3);
  @$pb.TagNumber(4)
  set offset($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOffset() => $_has(3);
  @$pb.TagNumber(4)
  void clearOffset() => $_clearField(4);
}

class GetAssetsMissingFieldsResponse extends $pb.GeneratedMessage {
  factory GetAssetsMissingFieldsResponse({
    $core.Iterable<AssetMissingField>? assets,
    $core.int? total,
  }) {
    final $result = create();
    if (assets != null) {
      $result.assets.addAll(assets);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  GetAssetsMissingFieldsResponse._() : super();
  factory GetAssetsMissingFieldsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetsMissingFieldsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetsMissingFieldsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<AssetMissingField>(1, _omitFieldNames ? '' : 'assets', $pb.PbFieldType.PM, subBuilder: AssetMissingField.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetsMissingFieldsResponse clone() => GetAssetsMissingFieldsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetsMissingFieldsResponse copyWith(void Function(GetAssetsMissingFieldsResponse) updates) => super.copyWith((message) => updates(message as GetAssetsMissingFieldsResponse)) as GetAssetsMissingFieldsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetsMissingFieldsResponse create() => GetAssetsMissingFieldsResponse._();
  GetAssetsMissingFieldsResponse createEmptyInstance() => create();
  static $pb.PbList<GetAssetsMissingFieldsResponse> createRepeated() => $pb.PbList<GetAssetsMissingFieldsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAssetsMissingFieldsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetsMissingFieldsResponse>(create);
  static GetAssetsMissingFieldsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AssetMissingField> get assets => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

class AssetStats extends $pb.GeneratedMessage {
  factory AssetStats({
    $core.int? total,
    $pb.PbMap<$core.String, $core.int>? byStatus,
    $pb.PbMap<$core.String, $core.int>? byProcessStatus,
    $core.int? withWarranties,
    $core.int? withFiles,
    $core.int? createdLast30Days,
  }) {
    final $result = create();
    if (total != null) {
      $result.total = total;
    }
    if (byStatus != null) {
      $result.byStatus.addAll(byStatus);
    }
    if (byProcessStatus != null) {
      $result.byProcessStatus.addAll(byProcessStatus);
    }
    if (withWarranties != null) {
      $result.withWarranties = withWarranties;
    }
    if (withFiles != null) {
      $result.withFiles = withFiles;
    }
    if (createdLast30Days != null) {
      $result.createdLast30Days = createdLast30Days;
    }
    return $result;
  }
  AssetStats._() : super();
  factory AssetStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..m<$core.String, $core.int>(2, _omitFieldNames ? '' : 'byStatus', entryClassName: 'AssetStats.ByStatusEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('moat.v1'))
    ..m<$core.String, $core.int>(3, _omitFieldNames ? '' : 'byProcessStatus', entryClassName: 'AssetStats.ByProcessStatusEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('moat.v1'))
    ..a<$core.int>(4, _omitFieldNames ? '' : 'withWarranties', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'withFiles', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'createdLast30Days', $pb.PbFieldType.O3, protoName: 'created_last_30_days')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetStats clone() => AssetStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetStats copyWith(void Function(AssetStats) updates) => super.copyWith((message) => updates(message as AssetStats)) as AssetStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetStats create() => AssetStats._();
  AssetStats createEmptyInstance() => create();
  static $pb.PbList<AssetStats> createRepeated() => $pb.PbList<AssetStats>();
  @$core.pragma('dart2js:noInline')
  static AssetStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetStats>(create);
  static AssetStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.int> get byStatus => $_getMap(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.int> get byProcessStatus => $_getMap(2);

  @$pb.TagNumber(4)
  $core.int get withWarranties => $_getIZ(3);
  @$pb.TagNumber(4)
  set withWarranties($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWithWarranties() => $_has(3);
  @$pb.TagNumber(4)
  void clearWithWarranties() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get withFiles => $_getIZ(4);
  @$pb.TagNumber(5)
  set withFiles($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWithFiles() => $_has(4);
  @$pb.TagNumber(5)
  void clearWithFiles() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get createdLast30Days => $_getIZ(5);
  @$pb.TagNumber(6)
  set createdLast30Days($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedLast30Days() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedLast30Days() => $_clearField(6);
}

class MemberStats extends $pb.GeneratedMessage {
  factory MemberStats({
    $core.int? total,
    $core.int? active,
    $core.int? pending,
    $core.int? deleted,
    $core.int? createdLast30Days,
  }) {
    final $result = create();
    if (total != null) {
      $result.total = total;
    }
    if (active != null) {
      $result.active = active;
    }
    if (pending != null) {
      $result.pending = pending;
    }
    if (deleted != null) {
      $result.deleted = deleted;
    }
    if (createdLast30Days != null) {
      $result.createdLast30Days = createdLast30Days;
    }
    return $result;
  }
  MemberStats._() : super();
  factory MemberStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MemberStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MemberStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'active', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pending', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'deleted', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'createdLast30Days', $pb.PbFieldType.O3, protoName: 'created_last_30_days')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MemberStats clone() => MemberStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MemberStats copyWith(void Function(MemberStats) updates) => super.copyWith((message) => updates(message as MemberStats)) as MemberStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberStats create() => MemberStats._();
  MemberStats createEmptyInstance() => create();
  static $pb.PbList<MemberStats> createRepeated() => $pb.PbList<MemberStats>();
  @$core.pragma('dart2js:noInline')
  static MemberStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MemberStats>(create);
  static MemberStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get active => $_getIZ(1);
  @$pb.TagNumber(2)
  set active($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pending => $_getIZ(2);
  @$pb.TagNumber(3)
  set pending($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPending() => $_has(2);
  @$pb.TagNumber(3)
  void clearPending() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get deleted => $_getIZ(3);
  @$pb.TagNumber(4)
  set deleted($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeleted() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeleted() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get createdLast30Days => $_getIZ(4);
  @$pb.TagNumber(5)
  set createdLast30Days($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedLast30Days() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedLast30Days() => $_clearField(5);
}

class TaskStats extends $pb.GeneratedMessage {
  factory TaskStats({
    $core.int? total,
    $pb.PbMap<$core.String, $core.int>? byStatus,
    $core.int? overdue,
    $core.int? createdLast30Days,
    $core.int? completedLast30Days,
  }) {
    final $result = create();
    if (total != null) {
      $result.total = total;
    }
    if (byStatus != null) {
      $result.byStatus.addAll(byStatus);
    }
    if (overdue != null) {
      $result.overdue = overdue;
    }
    if (createdLast30Days != null) {
      $result.createdLast30Days = createdLast30Days;
    }
    if (completedLast30Days != null) {
      $result.completedLast30Days = completedLast30Days;
    }
    return $result;
  }
  TaskStats._() : super();
  factory TaskStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..m<$core.String, $core.int>(2, _omitFieldNames ? '' : 'byStatus', entryClassName: 'TaskStats.ByStatusEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('moat.v1'))
    ..a<$core.int>(3, _omitFieldNames ? '' : 'overdue', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'createdLast30Days', $pb.PbFieldType.O3, protoName: 'created_last_30_days')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'completedLast30Days', $pb.PbFieldType.O3, protoName: 'completed_last_30_days')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskStats clone() => TaskStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskStats copyWith(void Function(TaskStats) updates) => super.copyWith((message) => updates(message as TaskStats)) as TaskStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskStats create() => TaskStats._();
  TaskStats createEmptyInstance() => create();
  static $pb.PbList<TaskStats> createRepeated() => $pb.PbList<TaskStats>();
  @$core.pragma('dart2js:noInline')
  static TaskStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskStats>(create);
  static TaskStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.int> get byStatus => $_getMap(1);

  @$pb.TagNumber(3)
  $core.int get overdue => $_getIZ(2);
  @$pb.TagNumber(3)
  set overdue($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOverdue() => $_has(2);
  @$pb.TagNumber(3)
  void clearOverdue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get createdLast30Days => $_getIZ(3);
  @$pb.TagNumber(4)
  set createdLast30Days($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedLast30Days() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedLast30Days() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get completedLast30Days => $_getIZ(4);
  @$pb.TagNumber(5)
  set completedLast30Days($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCompletedLast30Days() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompletedLast30Days() => $_clearField(5);
}

class FileStats extends $pb.GeneratedMessage {
  factory FileStats({
    $core.int? total,
    $fixnum.Int64? totalSizeBytes,
    $pb.PbMap<$core.String, $core.int>? byType,
    $core.int? uploadedLast30Days,
  }) {
    final $result = create();
    if (total != null) {
      $result.total = total;
    }
    if (totalSizeBytes != null) {
      $result.totalSizeBytes = totalSizeBytes;
    }
    if (byType != null) {
      $result.byType.addAll(byType);
    }
    if (uploadedLast30Days != null) {
      $result.uploadedLast30Days = uploadedLast30Days;
    }
    return $result;
  }
  FileStats._() : super();
  factory FileStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..aInt64(2, _omitFieldNames ? '' : 'totalSizeBytes')
    ..m<$core.String, $core.int>(3, _omitFieldNames ? '' : 'byType', entryClassName: 'FileStats.ByTypeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('moat.v1'))
    ..a<$core.int>(4, _omitFieldNames ? '' : 'uploadedLast30Days', $pb.PbFieldType.O3, protoName: 'uploaded_last_30_days')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileStats clone() => FileStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileStats copyWith(void Function(FileStats) updates) => super.copyWith((message) => updates(message as FileStats)) as FileStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileStats create() => FileStats._();
  FileStats createEmptyInstance() => create();
  static $pb.PbList<FileStats> createRepeated() => $pb.PbList<FileStats>();
  @$core.pragma('dart2js:noInline')
  static FileStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileStats>(create);
  static FileStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalSizeBytes => $_getI64(1);
  @$pb.TagNumber(2)
  set totalSizeBytes($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalSizeBytes() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalSizeBytes() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.int> get byType => $_getMap(2);

  @$pb.TagNumber(4)
  $core.int get uploadedLast30Days => $_getIZ(3);
  @$pb.TagNumber(4)
  set uploadedLast30Days($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUploadedLast30Days() => $_has(3);
  @$pb.TagNumber(4)
  void clearUploadedLast30Days() => $_clearField(4);
}

class CompanyStats extends $pb.GeneratedMessage {
  factory CompanyStats({
    $core.int? total,
    $core.int? active,
    $core.int? createdLast30Days,
  }) {
    final $result = create();
    if (total != null) {
      $result.total = total;
    }
    if (active != null) {
      $result.active = active;
    }
    if (createdLast30Days != null) {
      $result.createdLast30Days = createdLast30Days;
    }
    return $result;
  }
  CompanyStats._() : super();
  factory CompanyStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompanyStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompanyStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'active', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'createdLast30Days', $pb.PbFieldType.O3, protoName: 'created_last_30_days')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompanyStats clone() => CompanyStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompanyStats copyWith(void Function(CompanyStats) updates) => super.copyWith((message) => updates(message as CompanyStats)) as CompanyStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanyStats create() => CompanyStats._();
  CompanyStats createEmptyInstance() => create();
  static $pb.PbList<CompanyStats> createRepeated() => $pb.PbList<CompanyStats>();
  @$core.pragma('dart2js:noInline')
  static CompanyStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompanyStats>(create);
  static CompanyStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get active => $_getIZ(1);
  @$pb.TagNumber(2)
  set active($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get createdLast30Days => $_getIZ(2);
  @$pb.TagNumber(3)
  set createdLast30Days($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedLast30Days() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedLast30Days() => $_clearField(3);
}

class CompanySystemStats extends $pb.GeneratedMessage {
  factory CompanySystemStats({
    $core.String? companyId,
    $core.String? companyName,
    $core.int? assetCount,
    $core.int? memberCount,
    $core.int? taskCount,
    $core.int? fileCount,
    $fixnum.Int64? storageBytes,
    $0.Timestamp? createdAt,
    $0.Timestamp? lastActivity,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (companyName != null) {
      $result.companyName = companyName;
    }
    if (assetCount != null) {
      $result.assetCount = assetCount;
    }
    if (memberCount != null) {
      $result.memberCount = memberCount;
    }
    if (taskCount != null) {
      $result.taskCount = taskCount;
    }
    if (fileCount != null) {
      $result.fileCount = fileCount;
    }
    if (storageBytes != null) {
      $result.storageBytes = storageBytes;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (lastActivity != null) {
      $result.lastActivity = lastActivity;
    }
    return $result;
  }
  CompanySystemStats._() : super();
  factory CompanySystemStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompanySystemStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompanySystemStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..aOS(2, _omitFieldNames ? '' : 'companyName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'assetCount', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'memberCount', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'taskCount', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'fileCount', $pb.PbFieldType.O3)
    ..aInt64(7, _omitFieldNames ? '' : 'storageBytes')
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'lastActivity', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompanySystemStats clone() => CompanySystemStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompanySystemStats copyWith(void Function(CompanySystemStats) updates) => super.copyWith((message) => updates(message as CompanySystemStats)) as CompanySystemStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanySystemStats create() => CompanySystemStats._();
  CompanySystemStats createEmptyInstance() => create();
  static $pb.PbList<CompanySystemStats> createRepeated() => $pb.PbList<CompanySystemStats>();
  @$core.pragma('dart2js:noInline')
  static CompanySystemStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompanySystemStats>(create);
  static CompanySystemStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get assetCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set assetCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssetCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get memberCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set memberCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMemberCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get taskCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set taskCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTaskCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearTaskCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get fileCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set fileCount($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFileCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileCount() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get storageBytes => $_getI64(6);
  @$pb.TagNumber(7)
  set storageBytes($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStorageBytes() => $_has(6);
  @$pb.TagNumber(7)
  void clearStorageBytes() => $_clearField(7);

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

  @$pb.TagNumber(9)
  $0.Timestamp get lastActivity => $_getN(8);
  @$pb.TagNumber(9)
  set lastActivity($0.Timestamp v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLastActivity() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastActivity() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureLastActivity() => $_ensure(8);
}

class SystemOverviewResponse extends $pb.GeneratedMessage {
  factory SystemOverviewResponse({
    AssetStats? assets,
    MemberStats? members,
    TaskStats? tasks,
    FileStats? files,
    CompanyStats? companies,
    $core.Iterable<CompanySystemStats>? byCompany,
  }) {
    final $result = create();
    if (assets != null) {
      $result.assets = assets;
    }
    if (members != null) {
      $result.members = members;
    }
    if (tasks != null) {
      $result.tasks = tasks;
    }
    if (files != null) {
      $result.files = files;
    }
    if (companies != null) {
      $result.companies = companies;
    }
    if (byCompany != null) {
      $result.byCompany.addAll(byCompany);
    }
    return $result;
  }
  SystemOverviewResponse._() : super();
  factory SystemOverviewResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SystemOverviewResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SystemOverviewResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOM<AssetStats>(1, _omitFieldNames ? '' : 'assets', subBuilder: AssetStats.create)
    ..aOM<MemberStats>(2, _omitFieldNames ? '' : 'members', subBuilder: MemberStats.create)
    ..aOM<TaskStats>(3, _omitFieldNames ? '' : 'tasks', subBuilder: TaskStats.create)
    ..aOM<FileStats>(4, _omitFieldNames ? '' : 'files', subBuilder: FileStats.create)
    ..aOM<CompanyStats>(5, _omitFieldNames ? '' : 'companies', subBuilder: CompanyStats.create)
    ..pc<CompanySystemStats>(6, _omitFieldNames ? '' : 'byCompany', $pb.PbFieldType.PM, subBuilder: CompanySystemStats.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SystemOverviewResponse clone() => SystemOverviewResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SystemOverviewResponse copyWith(void Function(SystemOverviewResponse) updates) => super.copyWith((message) => updates(message as SystemOverviewResponse)) as SystemOverviewResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemOverviewResponse create() => SystemOverviewResponse._();
  SystemOverviewResponse createEmptyInstance() => create();
  static $pb.PbList<SystemOverviewResponse> createRepeated() => $pb.PbList<SystemOverviewResponse>();
  @$core.pragma('dart2js:noInline')
  static SystemOverviewResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SystemOverviewResponse>(create);
  static SystemOverviewResponse? _defaultInstance;

  @$pb.TagNumber(1)
  AssetStats get assets => $_getN(0);
  @$pb.TagNumber(1)
  set assets(AssetStats v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssets() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssets() => $_clearField(1);
  @$pb.TagNumber(1)
  AssetStats ensureAssets() => $_ensure(0);

  @$pb.TagNumber(2)
  MemberStats get members => $_getN(1);
  @$pb.TagNumber(2)
  set members(MemberStats v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMembers() => $_has(1);
  @$pb.TagNumber(2)
  void clearMembers() => $_clearField(2);
  @$pb.TagNumber(2)
  MemberStats ensureMembers() => $_ensure(1);

  @$pb.TagNumber(3)
  TaskStats get tasks => $_getN(2);
  @$pb.TagNumber(3)
  set tasks(TaskStats v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTasks() => $_has(2);
  @$pb.TagNumber(3)
  void clearTasks() => $_clearField(3);
  @$pb.TagNumber(3)
  TaskStats ensureTasks() => $_ensure(2);

  @$pb.TagNumber(4)
  FileStats get files => $_getN(3);
  @$pb.TagNumber(4)
  set files(FileStats v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFiles() => $_has(3);
  @$pb.TagNumber(4)
  void clearFiles() => $_clearField(4);
  @$pb.TagNumber(4)
  FileStats ensureFiles() => $_ensure(3);

  @$pb.TagNumber(5)
  CompanyStats get companies => $_getN(4);
  @$pb.TagNumber(5)
  set companies(CompanyStats v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCompanies() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompanies() => $_clearField(5);
  @$pb.TagNumber(5)
  CompanyStats ensureCompanies() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<CompanySystemStats> get byCompany => $_getList(5);
}

class GetSystemOverviewRequest extends $pb.GeneratedMessage {
  factory GetSystemOverviewRequest() => create();
  GetSystemOverviewRequest._() : super();
  factory GetSystemOverviewRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSystemOverviewRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSystemOverviewRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSystemOverviewRequest clone() => GetSystemOverviewRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSystemOverviewRequest copyWith(void Function(GetSystemOverviewRequest) updates) => super.copyWith((message) => updates(message as GetSystemOverviewRequest)) as GetSystemOverviewRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSystemOverviewRequest create() => GetSystemOverviewRequest._();
  GetSystemOverviewRequest createEmptyInstance() => create();
  static $pb.PbList<GetSystemOverviewRequest> createRepeated() => $pb.PbList<GetSystemOverviewRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSystemOverviewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSystemOverviewRequest>(create);
  static GetSystemOverviewRequest? _defaultInstance;
}

class CompanySummary extends $pb.GeneratedMessage {
  factory CompanySummary({
    $core.String? companyId,
    $core.String? companyName,
    $core.int? assetCount,
    $core.int? memberCount,
    $core.int? locationCount,
    $core.double? storageGb,
    $core.int? aiGenerationCount,
    $core.double? aiCostUsd,
    $0.Timestamp? createdAt,
  }) {
    final $result = create();
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (companyName != null) {
      $result.companyName = companyName;
    }
    if (assetCount != null) {
      $result.assetCount = assetCount;
    }
    if (memberCount != null) {
      $result.memberCount = memberCount;
    }
    if (locationCount != null) {
      $result.locationCount = locationCount;
    }
    if (storageGb != null) {
      $result.storageGb = storageGb;
    }
    if (aiGenerationCount != null) {
      $result.aiGenerationCount = aiGenerationCount;
    }
    if (aiCostUsd != null) {
      $result.aiCostUsd = aiCostUsd;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  CompanySummary._() : super();
  factory CompanySummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompanySummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompanySummary', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'companyId')
    ..aOS(2, _omitFieldNames ? '' : 'companyName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'assetCount', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'memberCount', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'locationCount', $pb.PbFieldType.O3)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'storageGb', $pb.PbFieldType.OD)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'aiGenerationCount', $pb.PbFieldType.O3)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'aiCostUsd', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompanySummary clone() => CompanySummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompanySummary copyWith(void Function(CompanySummary) updates) => super.copyWith((message) => updates(message as CompanySummary)) as CompanySummary;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanySummary create() => CompanySummary._();
  CompanySummary createEmptyInstance() => create();
  static $pb.PbList<CompanySummary> createRepeated() => $pb.PbList<CompanySummary>();
  @$core.pragma('dart2js:noInline')
  static CompanySummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompanySummary>(create);
  static CompanySummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get assetCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set assetCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssetCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get memberCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set memberCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMemberCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get locationCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set locationCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLocationCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocationCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get storageGb => $_getN(5);
  @$pb.TagNumber(6)
  set storageGb($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStorageGb() => $_has(5);
  @$pb.TagNumber(6)
  void clearStorageGb() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get aiGenerationCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set aiGenerationCount($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAiGenerationCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearAiGenerationCount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get aiCostUsd => $_getN(7);
  @$pb.TagNumber(8)
  set aiCostUsd($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAiCostUsd() => $_has(7);
  @$pb.TagNumber(8)
  void clearAiCostUsd() => $_clearField(8);

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
}

class GetCompanySummariesRequest extends $pb.GeneratedMessage {
  factory GetCompanySummariesRequest({
    $core.String? search,
    $core.String? sortBy,
    $core.String? sortOrder,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (search != null) {
      $result.search = search;
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
    return $result;
  }
  GetCompanySummariesRequest._() : super();
  factory GetCompanySummariesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCompanySummariesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCompanySummariesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'search')
    ..aOS(2, _omitFieldNames ? '' : 'sortBy')
    ..aOS(3, _omitFieldNames ? '' : 'sortOrder')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCompanySummariesRequest clone() => GetCompanySummariesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCompanySummariesRequest copyWith(void Function(GetCompanySummariesRequest) updates) => super.copyWith((message) => updates(message as GetCompanySummariesRequest)) as GetCompanySummariesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCompanySummariesRequest create() => GetCompanySummariesRequest._();
  GetCompanySummariesRequest createEmptyInstance() => create();
  static $pb.PbList<GetCompanySummariesRequest> createRepeated() => $pb.PbList<GetCompanySummariesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCompanySummariesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCompanySummariesRequest>(create);
  static GetCompanySummariesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get search => $_getSZ(0);
  @$pb.TagNumber(1)
  set search($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSearch() => $_has(0);
  @$pb.TagNumber(1)
  void clearSearch() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sortBy => $_getSZ(1);
  @$pb.TagNumber(2)
  set sortBy($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSortBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearSortBy() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get sortOrder => $_getSZ(2);
  @$pb.TagNumber(3)
  set sortOrder($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSortOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearSortOrder() => $_clearField(3);

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

class GetCompanySummariesResponse extends $pb.GeneratedMessage {
  factory GetCompanySummariesResponse({
    $core.Iterable<CompanySummary>? companies,
    $core.int? total,
  }) {
    final $result = create();
    if (companies != null) {
      $result.companies.addAll(companies);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  GetCompanySummariesResponse._() : super();
  factory GetCompanySummariesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCompanySummariesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCompanySummariesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<CompanySummary>(1, _omitFieldNames ? '' : 'companies', $pb.PbFieldType.PM, subBuilder: CompanySummary.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCompanySummariesResponse clone() => GetCompanySummariesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCompanySummariesResponse copyWith(void Function(GetCompanySummariesResponse) updates) => super.copyWith((message) => updates(message as GetCompanySummariesResponse)) as GetCompanySummariesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCompanySummariesResponse create() => GetCompanySummariesResponse._();
  GetCompanySummariesResponse createEmptyInstance() => create();
  static $pb.PbList<GetCompanySummariesResponse> createRepeated() => $pb.PbList<GetCompanySummariesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCompanySummariesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCompanySummariesResponse>(create);
  static GetCompanySummariesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CompanySummary> get companies => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

/// AdminService provides platform-wide administrative functionality.
/// Requires admin privileges (user must belong to ADMIN_COMPANY_ID).
class AdminServiceApi {
  $pb.RpcClient _client;
  AdminServiceApi(this._client);

  /// ListSSODomains returns all SSO domains, optionally filtered by company.
  $async.Future<ListSSODomainsResponse> listSSODomains($pb.ClientContext? ctx, ListSSODomainsRequest request) =>
    _client.invoke<ListSSODomainsResponse>(ctx, 'AdminService', 'ListSSODomains', request, ListSSODomainsResponse())
  ;
  /// GetSSODomain returns a specific SSO domain.
  $async.Future<SSODomain> getSSODomain($pb.ClientContext? ctx, GetSSODomainRequest request) =>
    _client.invoke<SSODomain>(ctx, 'AdminService', 'GetSSODomain', request, SSODomain())
  ;
  /// CreateSSODomain creates a new SSO domain mapping.
  $async.Future<SSODomain> createSSODomain($pb.ClientContext? ctx, CreateSSODomainRequest request) =>
    _client.invoke<SSODomain>(ctx, 'AdminService', 'CreateSSODomain', request, SSODomain())
  ;
  /// UpdateSSODomain updates an SSO domain.
  $async.Future<SSODomain> updateSSODomain($pb.ClientContext? ctx, UpdateSSODomainRequest request) =>
    _client.invoke<SSODomain>(ctx, 'AdminService', 'UpdateSSODomain', request, SSODomain())
  ;
  /// DeleteSSODomain deletes an SSO domain.
  $async.Future<DeleteSSODomainResponse> deleteSSODomain($pb.ClientContext? ctx, DeleteSSODomainRequest request) =>
    _client.invoke<DeleteSSODomainResponse>(ctx, 'AdminService', 'DeleteSSODomain', request, DeleteSSODomainResponse())
  ;
  /// ListPromptTemplates returns all prompt templates.
  $async.Future<ListPromptTemplatesResponse> listPromptTemplates($pb.ClientContext? ctx, ListPromptTemplatesRequest request) =>
    _client.invoke<ListPromptTemplatesResponse>(ctx, 'AdminService', 'ListPromptTemplates', request, ListPromptTemplatesResponse())
  ;
  /// GetPromptTemplate returns a specific prompt template with versions.
  $async.Future<PromptTemplateDetail> getPromptTemplate($pb.ClientContext? ctx, GetPromptTemplateRequest request) =>
    _client.invoke<PromptTemplateDetail>(ctx, 'AdminService', 'GetPromptTemplate', request, PromptTemplateDetail())
  ;
  /// CreatePromptTemplate creates a new prompt template.
  $async.Future<PromptTemplate> createPromptTemplate($pb.ClientContext? ctx, CreatePromptTemplateRequest request) =>
    _client.invoke<PromptTemplate>(ctx, 'AdminService', 'CreatePromptTemplate', request, PromptTemplate())
  ;
  /// UpdatePromptTemplate updates a prompt template.
  $async.Future<PromptTemplate> updatePromptTemplate($pb.ClientContext? ctx, UpdatePromptTemplateRequest request) =>
    _client.invoke<PromptTemplate>(ctx, 'AdminService', 'UpdatePromptTemplate', request, PromptTemplate())
  ;
  /// DeletePromptTemplate deletes a prompt template.
  $async.Future<DeletePromptTemplateResponse> deletePromptTemplate($pb.ClientContext? ctx, DeletePromptTemplateRequest request) =>
    _client.invoke<DeletePromptTemplateResponse>(ctx, 'AdminService', 'DeletePromptTemplate', request, DeletePromptTemplateResponse())
  ;
  /// CreatePromptVersion creates a new version of a prompt template.
  $async.Future<PromptVersion> createPromptVersion($pb.ClientContext? ctx, CreatePromptVersionRequest request) =>
    _client.invoke<PromptVersion>(ctx, 'AdminService', 'CreatePromptVersion', request, PromptVersion())
  ;
  /// ActivatePromptVersion activates a prompt version for an environment.
  $async.Future<ActivatePromptVersionResponse> activatePromptVersion($pb.ClientContext? ctx, ActivatePromptVersionRequest request) =>
    _client.invoke<ActivatePromptVersionResponse>(ctx, 'AdminService', 'ActivatePromptVersion', request, ActivatePromptVersionResponse())
  ;
  /// DeactivatePromptVersion deactivates a prompt version for an environment.
  $async.Future<DeactivatePromptVersionResponse> deactivatePromptVersion($pb.ClientContext? ctx, DeactivatePromptVersionRequest request) =>
    _client.invoke<DeactivatePromptVersionResponse>(ctx, 'AdminService', 'DeactivatePromptVersion', request, DeactivatePromptVersionResponse())
  ;
  /// PromotePromptVersion promotes a version from one environment to another.
  $async.Future<PromotePromptVersionResponse> promotePromptVersion($pb.ClientContext? ctx, PromotePromptVersionRequest request) =>
    _client.invoke<PromotePromptVersionResponse>(ctx, 'AdminService', 'PromotePromptVersion', request, PromotePromptVersionResponse())
  ;
  /// GetGenerationStats returns aggregate statistics for AI generations.
  $async.Future<GenerationStats> getGenerationStats($pb.ClientContext? ctx, GetGenerationStatsRequest request) =>
    _client.invoke<GenerationStats>(ctx, 'AdminService', 'GetGenerationStats', request, GenerationStats())
  ;
  /// ListGenerations returns paginated AI generation records.
  $async.Future<ListGenerationsResponse> listGenerations($pb.ClientContext? ctx, ListGenerationsRequest request) =>
    _client.invoke<ListGenerationsResponse>(ctx, 'AdminService', 'ListGenerations', request, ListGenerationsResponse())
  ;
  /// GetGeneration returns details for a specific generation.
  $async.Future<GenerationDetail> getGeneration($pb.ClientContext? ctx, GetGenerationRequest request) =>
    _client.invoke<GenerationDetail>(ctx, 'AdminService', 'GetGeneration', request, GenerationDetail())
  ;
  /// GetRecentErrors returns recent AI generation errors.
  $async.Future<GetRecentErrorsResponse> getRecentErrors($pb.ClientContext? ctx, GetRecentErrorsRequest request) =>
    _client.invoke<GetRecentErrorsResponse>(ctx, 'AdminService', 'GetRecentErrors', request, GetRecentErrorsResponse())
  ;
  /// GetAssetAIHistory returns AI processing history for an asset.
  $async.Future<AssetAIHistory> getAssetAIHistory($pb.ClientContext? ctx, GetAssetAIHistoryRequest request) =>
    _client.invoke<AssetAIHistory>(ctx, 'AdminService', 'GetAssetAIHistory', request, AssetAIHistory())
  ;
  /// GetAssetGapAnalysis returns field completeness analysis for a company.
  $async.Future<GapAnalysisResponse> getAssetGapAnalysis($pb.ClientContext? ctx, GetAssetGapAnalysisRequest request) =>
    _client.invoke<GapAnalysisResponse>(ctx, 'AdminService', 'GetAssetGapAnalysis', request, GapAnalysisResponse())
  ;
  /// GetAssetsMissingFields returns assets missing specific fields.
  $async.Future<GetAssetsMissingFieldsResponse> getAssetsMissingFields($pb.ClientContext? ctx, GetAssetsMissingFieldsRequest request) =>
    _client.invoke<GetAssetsMissingFieldsResponse>(ctx, 'AdminService', 'GetAssetsMissingFields', request, GetAssetsMissingFieldsResponse())
  ;
  /// GetSystemOverview returns platform-wide statistics.
  $async.Future<SystemOverviewResponse> getSystemOverview($pb.ClientContext? ctx, GetSystemOverviewRequest request) =>
    _client.invoke<SystemOverviewResponse>(ctx, 'AdminService', 'GetSystemOverview', request, SystemOverviewResponse())
  ;
  /// GetCompanySummaries returns summary stats for all companies.
  $async.Future<GetCompanySummariesResponse> getCompanySummaries($pb.ClientContext? ctx, GetCompanySummariesRequest request) =>
    _client.invoke<GetCompanySummariesResponse>(ctx, 'AdminService', 'GetCompanySummaries', request, GetCompanySummariesResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
