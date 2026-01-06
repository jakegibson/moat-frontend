//
//  Generated code. Do not modify.
//  source: moat/v1/warranty_coverage.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/struct.pb.dart' as $1;
import '../../google/protobuf/timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class WarrantyCoverage extends $pb.GeneratedMessage {
  factory WarrantyCoverage({
    $core.String? id,
    $core.String? assetId,
    $core.String? companyId,
    $core.String? name,
    $core.String? description,
    $core.int? expirationInMonths,
    $core.int? pageNumber,
    $core.String? fileId,
    $1.Struct? details,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.String? status,
    $core.bool? isExpired,
    $core.int? daysRemaining,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (assetId != null) {
      $result.assetId = assetId;
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
    if (expirationInMonths != null) {
      $result.expirationInMonths = expirationInMonths;
    }
    if (pageNumber != null) {
      $result.pageNumber = pageNumber;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (details != null) {
      $result.details = details;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (endDate != null) {
      $result.endDate = endDate;
    }
    if (status != null) {
      $result.status = status;
    }
    if (isExpired != null) {
      $result.isExpired = isExpired;
    }
    if (daysRemaining != null) {
      $result.daysRemaining = daysRemaining;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  WarrantyCoverage._() : super();
  factory WarrantyCoverage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WarrantyCoverage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WarrantyCoverage', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'assetId')
    ..aOS(3, _omitFieldNames ? '' : 'companyId')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'expirationInMonths', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'fileId')
    ..aOM<$1.Struct>(9, _omitFieldNames ? '' : 'details', subBuilder: $1.Struct.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'startDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'endDate', subBuilder: $0.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'status')
    ..aOB(13, _omitFieldNames ? '' : 'isExpired')
    ..a<$core.int>(14, _omitFieldNames ? '' : 'daysRemaining', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(15, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(16, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WarrantyCoverage clone() => WarrantyCoverage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WarrantyCoverage copyWith(void Function(WarrantyCoverage) updates) => super.copyWith((message) => updates(message as WarrantyCoverage)) as WarrantyCoverage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WarrantyCoverage create() => WarrantyCoverage._();
  WarrantyCoverage createEmptyInstance() => create();
  static $pb.PbList<WarrantyCoverage> createRepeated() => $pb.PbList<WarrantyCoverage>();
  @$core.pragma('dart2js:noInline')
  static WarrantyCoverage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WarrantyCoverage>(create);
  static WarrantyCoverage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get companyId => $_getSZ(2);
  @$pb.TagNumber(3)
  set companyId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCompanyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompanyId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get expirationInMonths => $_getIZ(5);
  @$pb.TagNumber(6)
  set expirationInMonths($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpirationInMonths() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpirationInMonths() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get pageNumber => $_getIZ(6);
  @$pb.TagNumber(7)
  set pageNumber($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPageNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearPageNumber() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get fileId => $_getSZ(7);
  @$pb.TagNumber(8)
  set fileId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFileId() => $_has(7);
  @$pb.TagNumber(8)
  void clearFileId() => $_clearField(8);

  @$pb.TagNumber(9)
  $1.Struct get details => $_getN(8);
  @$pb.TagNumber(9)
  set details($1.Struct v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDetails() => $_has(8);
  @$pb.TagNumber(9)
  void clearDetails() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Struct ensureDetails() => $_ensure(8);

  /// Computed dates (calculated from asset warranty_start_date + expiration_in_months)
  @$pb.TagNumber(10)
  $0.Timestamp get startDate => $_getN(9);
  @$pb.TagNumber(10)
  set startDate($0.Timestamp v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasStartDate() => $_has(9);
  @$pb.TagNumber(10)
  void clearStartDate() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureStartDate() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.Timestamp get endDate => $_getN(10);
  @$pb.TagNumber(11)
  set endDate($0.Timestamp v) { $_setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasEndDate() => $_has(10);
  @$pb.TagNumber(11)
  void clearEndDate() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureEndDate() => $_ensure(10);

  /// Status
  @$pb.TagNumber(12)
  $core.String get status => $_getSZ(11);
  @$pb.TagNumber(12)
  set status($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isExpired => $_getBF(12);
  @$pb.TagNumber(13)
  set isExpired($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsExpired() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsExpired() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get daysRemaining => $_getIZ(13);
  @$pb.TagNumber(14)
  set daysRemaining($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasDaysRemaining() => $_has(13);
  @$pb.TagNumber(14)
  void clearDaysRemaining() => $_clearField(14);

  /// Timestamps
  @$pb.TagNumber(15)
  $0.Timestamp get createdAt => $_getN(14);
  @$pb.TagNumber(15)
  set createdAt($0.Timestamp v) { $_setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCreatedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearCreatedAt() => $_clearField(15);
  @$pb.TagNumber(15)
  $0.Timestamp ensureCreatedAt() => $_ensure(14);

  @$pb.TagNumber(16)
  $0.Timestamp get updatedAt => $_getN(15);
  @$pb.TagNumber(16)
  set updatedAt($0.Timestamp v) { $_setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasUpdatedAt() => $_has(15);
  @$pb.TagNumber(16)
  void clearUpdatedAt() => $_clearField(16);
  @$pb.TagNumber(16)
  $0.Timestamp ensureUpdatedAt() => $_ensure(15);
}

class GetWarrantyCoverageRequest extends $pb.GeneratedMessage {
  factory GetWarrantyCoverageRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetWarrantyCoverageRequest._() : super();
  factory GetWarrantyCoverageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetWarrantyCoverageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetWarrantyCoverageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetWarrantyCoverageRequest clone() => GetWarrantyCoverageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetWarrantyCoverageRequest copyWith(void Function(GetWarrantyCoverageRequest) updates) => super.copyWith((message) => updates(message as GetWarrantyCoverageRequest)) as GetWarrantyCoverageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetWarrantyCoverageRequest create() => GetWarrantyCoverageRequest._();
  GetWarrantyCoverageRequest createEmptyInstance() => create();
  static $pb.PbList<GetWarrantyCoverageRequest> createRepeated() => $pb.PbList<GetWarrantyCoverageRequest>();
  @$core.pragma('dart2js:noInline')
  static GetWarrantyCoverageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetWarrantyCoverageRequest>(create);
  static GetWarrantyCoverageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class ListWarrantyCoveragesRequest extends $pb.GeneratedMessage {
  factory ListWarrantyCoveragesRequest({
    $core.String? assetId,
    $core.String? status,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  ListWarrantyCoveragesRequest._() : super();
  factory ListWarrantyCoveragesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListWarrantyCoveragesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListWarrantyCoveragesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListWarrantyCoveragesRequest clone() => ListWarrantyCoveragesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListWarrantyCoveragesRequest copyWith(void Function(ListWarrantyCoveragesRequest) updates) => super.copyWith((message) => updates(message as ListWarrantyCoveragesRequest)) as ListWarrantyCoveragesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListWarrantyCoveragesRequest create() => ListWarrantyCoveragesRequest._();
  ListWarrantyCoveragesRequest createEmptyInstance() => create();
  static $pb.PbList<ListWarrantyCoveragesRequest> createRepeated() => $pb.PbList<ListWarrantyCoveragesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListWarrantyCoveragesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListWarrantyCoveragesRequest>(create);
  static ListWarrantyCoveragesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

class ListWarrantyCoveragesResponse extends $pb.GeneratedMessage {
  factory ListWarrantyCoveragesResponse({
    $core.Iterable<WarrantyCoverage>? coverages,
    $core.int? totalCount,
  }) {
    final $result = create();
    if (coverages != null) {
      $result.coverages.addAll(coverages);
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    return $result;
  }
  ListWarrantyCoveragesResponse._() : super();
  factory ListWarrantyCoveragesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListWarrantyCoveragesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListWarrantyCoveragesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<WarrantyCoverage>(1, _omitFieldNames ? '' : 'coverages', $pb.PbFieldType.PM, subBuilder: WarrantyCoverage.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListWarrantyCoveragesResponse clone() => ListWarrantyCoveragesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListWarrantyCoveragesResponse copyWith(void Function(ListWarrantyCoveragesResponse) updates) => super.copyWith((message) => updates(message as ListWarrantyCoveragesResponse)) as ListWarrantyCoveragesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListWarrantyCoveragesResponse create() => ListWarrantyCoveragesResponse._();
  ListWarrantyCoveragesResponse createEmptyInstance() => create();
  static $pb.PbList<ListWarrantyCoveragesResponse> createRepeated() => $pb.PbList<ListWarrantyCoveragesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListWarrantyCoveragesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListWarrantyCoveragesResponse>(create);
  static ListWarrantyCoveragesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WarrantyCoverage> get coverages => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);
}

class CreateWarrantyCoverageRequest extends $pb.GeneratedMessage {
  factory CreateWarrantyCoverageRequest({
    $core.String? assetId,
    $core.String? name,
    $core.String? description,
    $core.int? expirationInMonths,
    $core.int? pageNumber,
    $core.String? fileId,
    $1.Struct? details,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (expirationInMonths != null) {
      $result.expirationInMonths = expirationInMonths;
    }
    if (pageNumber != null) {
      $result.pageNumber = pageNumber;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (details != null) {
      $result.details = details;
    }
    return $result;
  }
  CreateWarrantyCoverageRequest._() : super();
  factory CreateWarrantyCoverageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateWarrantyCoverageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateWarrantyCoverageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'expirationInMonths', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'fileId')
    ..aOM<$1.Struct>(7, _omitFieldNames ? '' : 'details', subBuilder: $1.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateWarrantyCoverageRequest clone() => CreateWarrantyCoverageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateWarrantyCoverageRequest copyWith(void Function(CreateWarrantyCoverageRequest) updates) => super.copyWith((message) => updates(message as CreateWarrantyCoverageRequest)) as CreateWarrantyCoverageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateWarrantyCoverageRequest create() => CreateWarrantyCoverageRequest._();
  CreateWarrantyCoverageRequest createEmptyInstance() => create();
  static $pb.PbList<CreateWarrantyCoverageRequest> createRepeated() => $pb.PbList<CreateWarrantyCoverageRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateWarrantyCoverageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateWarrantyCoverageRequest>(create);
  static CreateWarrantyCoverageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => $_clearField(1);

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
  $core.int get expirationInMonths => $_getIZ(3);
  @$pb.TagNumber(4)
  set expirationInMonths($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpirationInMonths() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpirationInMonths() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get pageNumber => $_getIZ(4);
  @$pb.TagNumber(5)
  set pageNumber($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPageNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPageNumber() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get fileId => $_getSZ(5);
  @$pb.TagNumber(6)
  set fileId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFileId() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileId() => $_clearField(6);

  @$pb.TagNumber(7)
  $1.Struct get details => $_getN(6);
  @$pb.TagNumber(7)
  set details($1.Struct v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDetails() => $_has(6);
  @$pb.TagNumber(7)
  void clearDetails() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Struct ensureDetails() => $_ensure(6);
}

class UpdateWarrantyCoverageRequest extends $pb.GeneratedMessage {
  factory UpdateWarrantyCoverageRequest({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.int? expirationInMonths,
    $core.int? pageNumber,
    $core.String? fileId,
    $1.Struct? details,
    $core.bool? updateFileAll,
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
    if (expirationInMonths != null) {
      $result.expirationInMonths = expirationInMonths;
    }
    if (pageNumber != null) {
      $result.pageNumber = pageNumber;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (details != null) {
      $result.details = details;
    }
    if (updateFileAll != null) {
      $result.updateFileAll = updateFileAll;
    }
    return $result;
  }
  UpdateWarrantyCoverageRequest._() : super();
  factory UpdateWarrantyCoverageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateWarrantyCoverageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateWarrantyCoverageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'expirationInMonths', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'fileId')
    ..aOM<$1.Struct>(7, _omitFieldNames ? '' : 'details', subBuilder: $1.Struct.create)
    ..aOB(8, _omitFieldNames ? '' : 'updateFileAll')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateWarrantyCoverageRequest clone() => UpdateWarrantyCoverageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateWarrantyCoverageRequest copyWith(void Function(UpdateWarrantyCoverageRequest) updates) => super.copyWith((message) => updates(message as UpdateWarrantyCoverageRequest)) as UpdateWarrantyCoverageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateWarrantyCoverageRequest create() => UpdateWarrantyCoverageRequest._();
  UpdateWarrantyCoverageRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateWarrantyCoverageRequest> createRepeated() => $pb.PbList<UpdateWarrantyCoverageRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateWarrantyCoverageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateWarrantyCoverageRequest>(create);
  static UpdateWarrantyCoverageRequest? _defaultInstance;

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
  $core.int get expirationInMonths => $_getIZ(3);
  @$pb.TagNumber(4)
  set expirationInMonths($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpirationInMonths() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpirationInMonths() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get pageNumber => $_getIZ(4);
  @$pb.TagNumber(5)
  set pageNumber($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPageNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPageNumber() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get fileId => $_getSZ(5);
  @$pb.TagNumber(6)
  set fileId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFileId() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileId() => $_clearField(6);

  @$pb.TagNumber(7)
  $1.Struct get details => $_getN(6);
  @$pb.TagNumber(7)
  set details($1.Struct v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDetails() => $_has(6);
  @$pb.TagNumber(7)
  void clearDetails() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Struct ensureDetails() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get updateFileAll => $_getBF(7);
  @$pb.TagNumber(8)
  set updateFileAll($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdateFileAll() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateFileAll() => $_clearField(8);
}

class DeleteWarrantyCoverageRequest extends $pb.GeneratedMessage {
  factory DeleteWarrantyCoverageRequest({
    $core.String? id,
    $core.String? reason,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  DeleteWarrantyCoverageRequest._() : super();
  factory DeleteWarrantyCoverageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteWarrantyCoverageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteWarrantyCoverageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteWarrantyCoverageRequest clone() => DeleteWarrantyCoverageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteWarrantyCoverageRequest copyWith(void Function(DeleteWarrantyCoverageRequest) updates) => super.copyWith((message) => updates(message as DeleteWarrantyCoverageRequest)) as DeleteWarrantyCoverageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteWarrantyCoverageRequest create() => DeleteWarrantyCoverageRequest._();
  DeleteWarrantyCoverageRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteWarrantyCoverageRequest> createRepeated() => $pb.PbList<DeleteWarrantyCoverageRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteWarrantyCoverageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteWarrantyCoverageRequest>(create);
  static DeleteWarrantyCoverageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);
}

class DeleteWarrantyCoverageResponse extends $pb.GeneratedMessage {
  factory DeleteWarrantyCoverageResponse() => create();
  DeleteWarrantyCoverageResponse._() : super();
  factory DeleteWarrantyCoverageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteWarrantyCoverageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteWarrantyCoverageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteWarrantyCoverageResponse clone() => DeleteWarrantyCoverageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteWarrantyCoverageResponse copyWith(void Function(DeleteWarrantyCoverageResponse) updates) => super.copyWith((message) => updates(message as DeleteWarrantyCoverageResponse)) as DeleteWarrantyCoverageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteWarrantyCoverageResponse create() => DeleteWarrantyCoverageResponse._();
  DeleteWarrantyCoverageResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteWarrantyCoverageResponse> createRepeated() => $pb.PbList<DeleteWarrantyCoverageResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteWarrantyCoverageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteWarrantyCoverageResponse>(create);
  static DeleteWarrantyCoverageResponse? _defaultInstance;
}

/// WarrantyCoverageHistory represents a resolution action for an expiring/expired warranty.
class WarrantyCoverageHistory extends $pb.GeneratedMessage {
  factory WarrantyCoverageHistory({
    $core.String? id,
    $core.String? coverageId,
    $core.String? assetId,
    $core.String? type,
    $core.String? description,
    $core.String? userId,
    $core.String? userName,
    $0.Timestamp? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (coverageId != null) {
      $result.coverageId = coverageId;
    }
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (description != null) {
      $result.description = description;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  WarrantyCoverageHistory._() : super();
  factory WarrantyCoverageHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WarrantyCoverageHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WarrantyCoverageHistory', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'coverageId')
    ..aOS(3, _omitFieldNames ? '' : 'assetId')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'userId')
    ..aOS(7, _omitFieldNames ? '' : 'userName')
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WarrantyCoverageHistory clone() => WarrantyCoverageHistory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WarrantyCoverageHistory copyWith(void Function(WarrantyCoverageHistory) updates) => super.copyWith((message) => updates(message as WarrantyCoverageHistory)) as WarrantyCoverageHistory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WarrantyCoverageHistory create() => WarrantyCoverageHistory._();
  WarrantyCoverageHistory createEmptyInstance() => create();
  static $pb.PbList<WarrantyCoverageHistory> createRepeated() => $pb.PbList<WarrantyCoverageHistory>();
  @$core.pragma('dart2js:noInline')
  static WarrantyCoverageHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WarrantyCoverageHistory>(create);
  static WarrantyCoverageHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get coverageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set coverageId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCoverageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoverageId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get assetId => $_getSZ(2);
  @$pb.TagNumber(3)
  set assetId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get userId => $_getSZ(5);
  @$pb.TagNumber(6)
  set userId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get userName => $_getSZ(6);
  @$pb.TagNumber(7)
  set userName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUserName() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserName() => $_clearField(7);

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

class AddCoverageHistoryRequest extends $pb.GeneratedMessage {
  factory AddCoverageHistoryRequest({
    $core.String? coverageId,
    $core.String? type,
    $core.String? description,
  }) {
    final $result = create();
    if (coverageId != null) {
      $result.coverageId = coverageId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  AddCoverageHistoryRequest._() : super();
  factory AddCoverageHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCoverageHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddCoverageHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'coverageId')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCoverageHistoryRequest clone() => AddCoverageHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCoverageHistoryRequest copyWith(void Function(AddCoverageHistoryRequest) updates) => super.copyWith((message) => updates(message as AddCoverageHistoryRequest)) as AddCoverageHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCoverageHistoryRequest create() => AddCoverageHistoryRequest._();
  AddCoverageHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<AddCoverageHistoryRequest> createRepeated() => $pb.PbList<AddCoverageHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static AddCoverageHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCoverageHistoryRequest>(create);
  static AddCoverageHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coverageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set coverageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCoverageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoverageId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);
}

class GetCoverageHistoryRequest extends $pb.GeneratedMessage {
  factory GetCoverageHistoryRequest({
    $core.String? coverageId,
  }) {
    final $result = create();
    if (coverageId != null) {
      $result.coverageId = coverageId;
    }
    return $result;
  }
  GetCoverageHistoryRequest._() : super();
  factory GetCoverageHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCoverageHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCoverageHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'coverageId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCoverageHistoryRequest clone() => GetCoverageHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCoverageHistoryRequest copyWith(void Function(GetCoverageHistoryRequest) updates) => super.copyWith((message) => updates(message as GetCoverageHistoryRequest)) as GetCoverageHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCoverageHistoryRequest create() => GetCoverageHistoryRequest._();
  GetCoverageHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetCoverageHistoryRequest> createRepeated() => $pb.PbList<GetCoverageHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCoverageHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCoverageHistoryRequest>(create);
  static GetCoverageHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coverageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set coverageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCoverageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoverageId() => $_clearField(1);
}

class GetCoverageHistoryResponse extends $pb.GeneratedMessage {
  factory GetCoverageHistoryResponse({
    $core.Iterable<WarrantyCoverageHistory>? history,
  }) {
    final $result = create();
    if (history != null) {
      $result.history.addAll(history);
    }
    return $result;
  }
  GetCoverageHistoryResponse._() : super();
  factory GetCoverageHistoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCoverageHistoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCoverageHistoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<WarrantyCoverageHistory>(1, _omitFieldNames ? '' : 'history', $pb.PbFieldType.PM, subBuilder: WarrantyCoverageHistory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCoverageHistoryResponse clone() => GetCoverageHistoryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCoverageHistoryResponse copyWith(void Function(GetCoverageHistoryResponse) updates) => super.copyWith((message) => updates(message as GetCoverageHistoryResponse)) as GetCoverageHistoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCoverageHistoryResponse create() => GetCoverageHistoryResponse._();
  GetCoverageHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetCoverageHistoryResponse> createRepeated() => $pb.PbList<GetCoverageHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCoverageHistoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCoverageHistoryResponse>(create);
  static GetCoverageHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WarrantyCoverageHistory> get history => $_getList(0);
}

/// WarrantyCoverageService handles warranty coverage CRUD operations.
class WarrantyCoverageServiceApi {
  $pb.RpcClient _client;
  WarrantyCoverageServiceApi(this._client);

  /// GetWarrantyCoverage returns a single warranty coverage by ID.
  $async.Future<WarrantyCoverage> getWarrantyCoverage($pb.ClientContext? ctx, GetWarrantyCoverageRequest request) =>
    _client.invoke<WarrantyCoverage>(ctx, 'WarrantyCoverageService', 'GetWarrantyCoverage', request, WarrantyCoverage())
  ;
  /// ListWarrantyCoverages returns all warranty coverages for an asset.
  $async.Future<ListWarrantyCoveragesResponse> listWarrantyCoverages($pb.ClientContext? ctx, ListWarrantyCoveragesRequest request) =>
    _client.invoke<ListWarrantyCoveragesResponse>(ctx, 'WarrantyCoverageService', 'ListWarrantyCoverages', request, ListWarrantyCoveragesResponse())
  ;
  /// CreateWarrantyCoverage creates a new warranty coverage.
  $async.Future<WarrantyCoverage> createWarrantyCoverage($pb.ClientContext? ctx, CreateWarrantyCoverageRequest request) =>
    _client.invoke<WarrantyCoverage>(ctx, 'WarrantyCoverageService', 'CreateWarrantyCoverage', request, WarrantyCoverage())
  ;
  /// UpdateWarrantyCoverage updates an existing warranty coverage.
  $async.Future<WarrantyCoverage> updateWarrantyCoverage($pb.ClientContext? ctx, UpdateWarrantyCoverageRequest request) =>
    _client.invoke<WarrantyCoverage>(ctx, 'WarrantyCoverageService', 'UpdateWarrantyCoverage', request, WarrantyCoverage())
  ;
  /// DeleteWarrantyCoverage soft-deletes a warranty coverage.
  $async.Future<DeleteWarrantyCoverageResponse> deleteWarrantyCoverage($pb.ClientContext? ctx, DeleteWarrantyCoverageRequest request) =>
    _client.invoke<DeleteWarrantyCoverageResponse>(ctx, 'WarrantyCoverageService', 'DeleteWarrantyCoverage', request, DeleteWarrantyCoverageResponse())
  ;
  /// AddCoverageHistory adds a resolution history entry to a warranty coverage.
  $async.Future<WarrantyCoverageHistory> addCoverageHistory($pb.ClientContext? ctx, AddCoverageHistoryRequest request) =>
    _client.invoke<WarrantyCoverageHistory>(ctx, 'WarrantyCoverageService', 'AddCoverageHistory', request, WarrantyCoverageHistory())
  ;
  /// GetCoverageHistory returns the resolution history for a warranty coverage.
  $async.Future<GetCoverageHistoryResponse> getCoverageHistory($pb.ClientContext? ctx, GetCoverageHistoryRequest request) =>
    _client.invoke<GetCoverageHistoryResponse>(ctx, 'WarrantyCoverageService', 'GetCoverageHistory', request, GetCoverageHistoryResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
