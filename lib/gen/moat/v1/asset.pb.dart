//
//  Generated code. Do not modify.
//  source: moat/v1/asset.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'asset.pbenum.dart';

export 'asset.pbenum.dart';

class Asset extends $pb.GeneratedMessage {
  factory Asset({
    $core.String? id,
    $core.String? companyId,
    $core.String? name,
    $core.String? technicalName,
    $core.String? notes,
    $core.String? divisionOfConstruction,
    $core.String? internalId,
    AssetStatus? status,
    AssetProcessStatus? processStatus,
    $core.String? locationId,
    $core.String? floorLocation,
    $core.String? serviceArea,
    $core.String? provider,
    $core.String? manufacturer,
    $core.String? serialNumber,
    $core.String? modelNumber,
    $core.String? aiSerialNumber,
    $core.String? aiModelNumber,
    $core.double? priceValue,
    $core.double? purchasePrice,
    $core.double? aiPriceValue,
    $0.Timestamp? startDate,
    $0.Timestamp? substantialCompletionDate,
    $0.Timestamp? documentDate,
    $0.Timestamp? dueDate,
    $0.Timestamp? installationDate,
    $0.Timestamp? invoiceDate,
    $0.Timestamp? purchaseDate,
    $core.int? warrantyDurationMonths,
    $0.Timestamp? warrantyStartDate,
    $0.Timestamp? warrantyEndDate,
    $0.Timestamp? aiWarrantyStartDate,
    $core.bool? ignoreWarrantyStartDate,
    $core.bool? allCoveragesResolvedAndExpired,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (technicalName != null) {
      $result.technicalName = technicalName;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (divisionOfConstruction != null) {
      $result.divisionOfConstruction = divisionOfConstruction;
    }
    if (internalId != null) {
      $result.internalId = internalId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (processStatus != null) {
      $result.processStatus = processStatus;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (floorLocation != null) {
      $result.floorLocation = floorLocation;
    }
    if (serviceArea != null) {
      $result.serviceArea = serviceArea;
    }
    if (provider != null) {
      $result.provider = provider;
    }
    if (manufacturer != null) {
      $result.manufacturer = manufacturer;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (modelNumber != null) {
      $result.modelNumber = modelNumber;
    }
    if (aiSerialNumber != null) {
      $result.aiSerialNumber = aiSerialNumber;
    }
    if (aiModelNumber != null) {
      $result.aiModelNumber = aiModelNumber;
    }
    if (priceValue != null) {
      $result.priceValue = priceValue;
    }
    if (purchasePrice != null) {
      $result.purchasePrice = purchasePrice;
    }
    if (aiPriceValue != null) {
      $result.aiPriceValue = aiPriceValue;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (substantialCompletionDate != null) {
      $result.substantialCompletionDate = substantialCompletionDate;
    }
    if (documentDate != null) {
      $result.documentDate = documentDate;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (installationDate != null) {
      $result.installationDate = installationDate;
    }
    if (invoiceDate != null) {
      $result.invoiceDate = invoiceDate;
    }
    if (purchaseDate != null) {
      $result.purchaseDate = purchaseDate;
    }
    if (warrantyDurationMonths != null) {
      $result.warrantyDurationMonths = warrantyDurationMonths;
    }
    if (warrantyStartDate != null) {
      $result.warrantyStartDate = warrantyStartDate;
    }
    if (warrantyEndDate != null) {
      $result.warrantyEndDate = warrantyEndDate;
    }
    if (aiWarrantyStartDate != null) {
      $result.aiWarrantyStartDate = aiWarrantyStartDate;
    }
    if (ignoreWarrantyStartDate != null) {
      $result.ignoreWarrantyStartDate = ignoreWarrantyStartDate;
    }
    if (allCoveragesResolvedAndExpired != null) {
      $result.allCoveragesResolvedAndExpired = allCoveragesResolvedAndExpired;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Asset._() : super();
  factory Asset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Asset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Asset', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'companyId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'technicalName')
    ..aOS(5, _omitFieldNames ? '' : 'notes')
    ..aOS(6, _omitFieldNames ? '' : 'divisionOfConstruction')
    ..aOS(7, _omitFieldNames ? '' : 'internalId')
    ..e<AssetStatus>(8, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: AssetStatus.ASSET_STATUS_UNSPECIFIED, valueOf: AssetStatus.valueOf, enumValues: AssetStatus.values)
    ..e<AssetProcessStatus>(9, _omitFieldNames ? '' : 'processStatus', $pb.PbFieldType.OE, defaultOrMaker: AssetProcessStatus.ASSET_PROCESS_STATUS_UNSPECIFIED, valueOf: AssetProcessStatus.valueOf, enumValues: AssetProcessStatus.values)
    ..aOS(10, _omitFieldNames ? '' : 'locationId')
    ..aOS(11, _omitFieldNames ? '' : 'floorLocation')
    ..aOS(12, _omitFieldNames ? '' : 'serviceArea')
    ..aOS(13, _omitFieldNames ? '' : 'provider')
    ..aOS(14, _omitFieldNames ? '' : 'manufacturer')
    ..aOS(15, _omitFieldNames ? '' : 'serialNumber')
    ..aOS(16, _omitFieldNames ? '' : 'modelNumber')
    ..aOS(17, _omitFieldNames ? '' : 'aiSerialNumber')
    ..aOS(18, _omitFieldNames ? '' : 'aiModelNumber')
    ..a<$core.double>(19, _omitFieldNames ? '' : 'priceValue', $pb.PbFieldType.OD)
    ..a<$core.double>(20, _omitFieldNames ? '' : 'purchasePrice', $pb.PbFieldType.OD)
    ..a<$core.double>(21, _omitFieldNames ? '' : 'aiPriceValue', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(22, _omitFieldNames ? '' : 'startDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(23, _omitFieldNames ? '' : 'substantialCompletionDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(24, _omitFieldNames ? '' : 'documentDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(25, _omitFieldNames ? '' : 'dueDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(26, _omitFieldNames ? '' : 'installationDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(27, _omitFieldNames ? '' : 'invoiceDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(28, _omitFieldNames ? '' : 'purchaseDate', subBuilder: $0.Timestamp.create)
    ..a<$core.int>(29, _omitFieldNames ? '' : 'warrantyDurationMonths', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(30, _omitFieldNames ? '' : 'warrantyStartDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(31, _omitFieldNames ? '' : 'warrantyEndDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(32, _omitFieldNames ? '' : 'aiWarrantyStartDate', subBuilder: $0.Timestamp.create)
    ..aOB(33, _omitFieldNames ? '' : 'ignoreWarrantyStartDate')
    ..aOB(34, _omitFieldNames ? '' : 'allCoveragesResolvedAndExpired')
    ..aOM<$0.Timestamp>(35, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(36, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Asset clone() => Asset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Asset copyWith(void Function(Asset) updates) => super.copyWith((message) => updates(message as Asset)) as Asset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  Asset createEmptyInstance() => create();
  static $pb.PbList<Asset> createRepeated() => $pb.PbList<Asset>();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyId() => clearField(2);

  /// Basic info
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get technicalName => $_getSZ(3);
  @$pb.TagNumber(4)
  set technicalName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTechnicalName() => $_has(3);
  @$pb.TagNumber(4)
  void clearTechnicalName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get notes => $_getSZ(4);
  @$pb.TagNumber(5)
  set notes($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotes() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotes() => clearField(5);

  /// Classification
  @$pb.TagNumber(6)
  $core.String get divisionOfConstruction => $_getSZ(5);
  @$pb.TagNumber(6)
  set divisionOfConstruction($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDivisionOfConstruction() => $_has(5);
  @$pb.TagNumber(6)
  void clearDivisionOfConstruction() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get internalId => $_getSZ(6);
  @$pb.TagNumber(7)
  set internalId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInternalId() => $_has(6);
  @$pb.TagNumber(7)
  void clearInternalId() => clearField(7);

  /// Status
  @$pb.TagNumber(8)
  AssetStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(AssetStatus v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);

  @$pb.TagNumber(9)
  AssetProcessStatus get processStatus => $_getN(8);
  @$pb.TagNumber(9)
  set processStatus(AssetProcessStatus v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasProcessStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearProcessStatus() => clearField(9);

  /// Location
  @$pb.TagNumber(10)
  $core.String get locationId => $_getSZ(9);
  @$pb.TagNumber(10)
  set locationId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLocationId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLocationId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get floorLocation => $_getSZ(10);
  @$pb.TagNumber(11)
  set floorLocation($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasFloorLocation() => $_has(10);
  @$pb.TagNumber(11)
  void clearFloorLocation() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get serviceArea => $_getSZ(11);
  @$pb.TagNumber(12)
  set serviceArea($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasServiceArea() => $_has(11);
  @$pb.TagNumber(12)
  void clearServiceArea() => clearField(12);

  /// Vendor information
  @$pb.TagNumber(13)
  $core.String get provider => $_getSZ(12);
  @$pb.TagNumber(13)
  set provider($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasProvider() => $_has(12);
  @$pb.TagNumber(13)
  void clearProvider() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get manufacturer => $_getSZ(13);
  @$pb.TagNumber(14)
  set manufacturer($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasManufacturer() => $_has(13);
  @$pb.TagNumber(14)
  void clearManufacturer() => clearField(14);

  /// Identification
  @$pb.TagNumber(15)
  $core.String get serialNumber => $_getSZ(14);
  @$pb.TagNumber(15)
  set serialNumber($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSerialNumber() => $_has(14);
  @$pb.TagNumber(15)
  void clearSerialNumber() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get modelNumber => $_getSZ(15);
  @$pb.TagNumber(16)
  set modelNumber($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasModelNumber() => $_has(15);
  @$pb.TagNumber(16)
  void clearModelNumber() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get aiSerialNumber => $_getSZ(16);
  @$pb.TagNumber(17)
  set aiSerialNumber($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasAiSerialNumber() => $_has(16);
  @$pb.TagNumber(17)
  void clearAiSerialNumber() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get aiModelNumber => $_getSZ(17);
  @$pb.TagNumber(18)
  set aiModelNumber($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasAiModelNumber() => $_has(17);
  @$pb.TagNumber(18)
  void clearAiModelNumber() => clearField(18);

  /// Pricing
  @$pb.TagNumber(19)
  $core.double get priceValue => $_getN(18);
  @$pb.TagNumber(19)
  set priceValue($core.double v) { $_setDouble(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasPriceValue() => $_has(18);
  @$pb.TagNumber(19)
  void clearPriceValue() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get purchasePrice => $_getN(19);
  @$pb.TagNumber(20)
  set purchasePrice($core.double v) { $_setDouble(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasPurchasePrice() => $_has(19);
  @$pb.TagNumber(20)
  void clearPurchasePrice() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get aiPriceValue => $_getN(20);
  @$pb.TagNumber(21)
  set aiPriceValue($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasAiPriceValue() => $_has(20);
  @$pb.TagNumber(21)
  void clearAiPriceValue() => clearField(21);

  /// Important dates
  @$pb.TagNumber(22)
  $0.Timestamp get startDate => $_getN(21);
  @$pb.TagNumber(22)
  set startDate($0.Timestamp v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasStartDate() => $_has(21);
  @$pb.TagNumber(22)
  void clearStartDate() => clearField(22);
  @$pb.TagNumber(22)
  $0.Timestamp ensureStartDate() => $_ensure(21);

  @$pb.TagNumber(23)
  $0.Timestamp get substantialCompletionDate => $_getN(22);
  @$pb.TagNumber(23)
  set substantialCompletionDate($0.Timestamp v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasSubstantialCompletionDate() => $_has(22);
  @$pb.TagNumber(23)
  void clearSubstantialCompletionDate() => clearField(23);
  @$pb.TagNumber(23)
  $0.Timestamp ensureSubstantialCompletionDate() => $_ensure(22);

  @$pb.TagNumber(24)
  $0.Timestamp get documentDate => $_getN(23);
  @$pb.TagNumber(24)
  set documentDate($0.Timestamp v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasDocumentDate() => $_has(23);
  @$pb.TagNumber(24)
  void clearDocumentDate() => clearField(24);
  @$pb.TagNumber(24)
  $0.Timestamp ensureDocumentDate() => $_ensure(23);

  @$pb.TagNumber(25)
  $0.Timestamp get dueDate => $_getN(24);
  @$pb.TagNumber(25)
  set dueDate($0.Timestamp v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasDueDate() => $_has(24);
  @$pb.TagNumber(25)
  void clearDueDate() => clearField(25);
  @$pb.TagNumber(25)
  $0.Timestamp ensureDueDate() => $_ensure(24);

  @$pb.TagNumber(26)
  $0.Timestamp get installationDate => $_getN(25);
  @$pb.TagNumber(26)
  set installationDate($0.Timestamp v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasInstallationDate() => $_has(25);
  @$pb.TagNumber(26)
  void clearInstallationDate() => clearField(26);
  @$pb.TagNumber(26)
  $0.Timestamp ensureInstallationDate() => $_ensure(25);

  @$pb.TagNumber(27)
  $0.Timestamp get invoiceDate => $_getN(26);
  @$pb.TagNumber(27)
  set invoiceDate($0.Timestamp v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasInvoiceDate() => $_has(26);
  @$pb.TagNumber(27)
  void clearInvoiceDate() => clearField(27);
  @$pb.TagNumber(27)
  $0.Timestamp ensureInvoiceDate() => $_ensure(26);

  @$pb.TagNumber(28)
  $0.Timestamp get purchaseDate => $_getN(27);
  @$pb.TagNumber(28)
  set purchaseDate($0.Timestamp v) { setField(28, v); }
  @$pb.TagNumber(28)
  $core.bool hasPurchaseDate() => $_has(27);
  @$pb.TagNumber(28)
  void clearPurchaseDate() => clearField(28);
  @$pb.TagNumber(28)
  $0.Timestamp ensurePurchaseDate() => $_ensure(27);

  /// Warranty info
  @$pb.TagNumber(29)
  $core.int get warrantyDurationMonths => $_getIZ(28);
  @$pb.TagNumber(29)
  set warrantyDurationMonths($core.int v) { $_setSignedInt32(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasWarrantyDurationMonths() => $_has(28);
  @$pb.TagNumber(29)
  void clearWarrantyDurationMonths() => clearField(29);

  @$pb.TagNumber(30)
  $0.Timestamp get warrantyStartDate => $_getN(29);
  @$pb.TagNumber(30)
  set warrantyStartDate($0.Timestamp v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasWarrantyStartDate() => $_has(29);
  @$pb.TagNumber(30)
  void clearWarrantyStartDate() => clearField(30);
  @$pb.TagNumber(30)
  $0.Timestamp ensureWarrantyStartDate() => $_ensure(29);

  @$pb.TagNumber(31)
  $0.Timestamp get warrantyEndDate => $_getN(30);
  @$pb.TagNumber(31)
  set warrantyEndDate($0.Timestamp v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasWarrantyEndDate() => $_has(30);
  @$pb.TagNumber(31)
  void clearWarrantyEndDate() => clearField(31);
  @$pb.TagNumber(31)
  $0.Timestamp ensureWarrantyEndDate() => $_ensure(30);

  @$pb.TagNumber(32)
  $0.Timestamp get aiWarrantyStartDate => $_getN(31);
  @$pb.TagNumber(32)
  set aiWarrantyStartDate($0.Timestamp v) { setField(32, v); }
  @$pb.TagNumber(32)
  $core.bool hasAiWarrantyStartDate() => $_has(31);
  @$pb.TagNumber(32)
  void clearAiWarrantyStartDate() => clearField(32);
  @$pb.TagNumber(32)
  $0.Timestamp ensureAiWarrantyStartDate() => $_ensure(31);

  @$pb.TagNumber(33)
  $core.bool get ignoreWarrantyStartDate => $_getBF(32);
  @$pb.TagNumber(33)
  set ignoreWarrantyStartDate($core.bool v) { $_setBool(32, v); }
  @$pb.TagNumber(33)
  $core.bool hasIgnoreWarrantyStartDate() => $_has(32);
  @$pb.TagNumber(33)
  void clearIgnoreWarrantyStartDate() => clearField(33);

  /// Computed/cached fields
  @$pb.TagNumber(34)
  $core.bool get allCoveragesResolvedAndExpired => $_getBF(33);
  @$pb.TagNumber(34)
  set allCoveragesResolvedAndExpired($core.bool v) { $_setBool(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasAllCoveragesResolvedAndExpired() => $_has(33);
  @$pb.TagNumber(34)
  void clearAllCoveragesResolvedAndExpired() => clearField(34);

  /// Timestamps
  @$pb.TagNumber(35)
  $0.Timestamp get createdAt => $_getN(34);
  @$pb.TagNumber(35)
  set createdAt($0.Timestamp v) { setField(35, v); }
  @$pb.TagNumber(35)
  $core.bool hasCreatedAt() => $_has(34);
  @$pb.TagNumber(35)
  void clearCreatedAt() => clearField(35);
  @$pb.TagNumber(35)
  $0.Timestamp ensureCreatedAt() => $_ensure(34);

  @$pb.TagNumber(36)
  $0.Timestamp get updatedAt => $_getN(35);
  @$pb.TagNumber(36)
  set updatedAt($0.Timestamp v) { setField(36, v); }
  @$pb.TagNumber(36)
  $core.bool hasUpdatedAt() => $_has(35);
  @$pb.TagNumber(36)
  void clearUpdatedAt() => clearField(36);
  @$pb.TagNumber(36)
  $0.Timestamp ensureUpdatedAt() => $_ensure(35);
}

/// Asset with joined data for list/detail views
class AssetWithDetails extends $pb.GeneratedMessage {
  factory AssetWithDetails({
    $core.String? id,
    $core.String? companyId,
    $core.String? name,
    $core.String? technicalName,
    $core.String? notes,
    $core.String? divisionOfConstruction,
    $core.String? internalId,
    AssetStatus? status,
    AssetProcessStatus? processStatus,
    $core.String? locationId,
    $core.String? locationName,
    $core.String? floorLocation,
    $core.String? serviceArea,
    $core.String? provider,
    $core.String? manufacturer,
    $core.String? serialNumber,
    $core.String? modelNumber,
    $core.String? aiSerialNumber,
    $core.String? aiModelNumber,
    $core.double? priceValue,
    $core.double? purchasePrice,
    $core.double? aiPriceValue,
    $0.Timestamp? startDate,
    $0.Timestamp? substantialCompletionDate,
    $0.Timestamp? documentDate,
    $0.Timestamp? dueDate,
    $0.Timestamp? installationDate,
    $0.Timestamp? invoiceDate,
    $0.Timestamp? purchaseDate,
    $core.int? warrantyDurationMonths,
    $0.Timestamp? warrantyStartDate,
    $0.Timestamp? warrantyEndDate,
    $0.Timestamp? aiWarrantyStartDate,
    $core.bool? ignoreWarrantyStartDate,
    $core.bool? allCoveragesResolvedAndExpired,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
    $core.int? fileCount,
    $core.int? messageCount,
    $core.int? warrantyCoverageCount,
    $core.int? valueEstimateCount,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (companyId != null) {
      $result.companyId = companyId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (technicalName != null) {
      $result.technicalName = technicalName;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (divisionOfConstruction != null) {
      $result.divisionOfConstruction = divisionOfConstruction;
    }
    if (internalId != null) {
      $result.internalId = internalId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (processStatus != null) {
      $result.processStatus = processStatus;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (locationName != null) {
      $result.locationName = locationName;
    }
    if (floorLocation != null) {
      $result.floorLocation = floorLocation;
    }
    if (serviceArea != null) {
      $result.serviceArea = serviceArea;
    }
    if (provider != null) {
      $result.provider = provider;
    }
    if (manufacturer != null) {
      $result.manufacturer = manufacturer;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (modelNumber != null) {
      $result.modelNumber = modelNumber;
    }
    if (aiSerialNumber != null) {
      $result.aiSerialNumber = aiSerialNumber;
    }
    if (aiModelNumber != null) {
      $result.aiModelNumber = aiModelNumber;
    }
    if (priceValue != null) {
      $result.priceValue = priceValue;
    }
    if (purchasePrice != null) {
      $result.purchasePrice = purchasePrice;
    }
    if (aiPriceValue != null) {
      $result.aiPriceValue = aiPriceValue;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (substantialCompletionDate != null) {
      $result.substantialCompletionDate = substantialCompletionDate;
    }
    if (documentDate != null) {
      $result.documentDate = documentDate;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (installationDate != null) {
      $result.installationDate = installationDate;
    }
    if (invoiceDate != null) {
      $result.invoiceDate = invoiceDate;
    }
    if (purchaseDate != null) {
      $result.purchaseDate = purchaseDate;
    }
    if (warrantyDurationMonths != null) {
      $result.warrantyDurationMonths = warrantyDurationMonths;
    }
    if (warrantyStartDate != null) {
      $result.warrantyStartDate = warrantyStartDate;
    }
    if (warrantyEndDate != null) {
      $result.warrantyEndDate = warrantyEndDate;
    }
    if (aiWarrantyStartDate != null) {
      $result.aiWarrantyStartDate = aiWarrantyStartDate;
    }
    if (ignoreWarrantyStartDate != null) {
      $result.ignoreWarrantyStartDate = ignoreWarrantyStartDate;
    }
    if (allCoveragesResolvedAndExpired != null) {
      $result.allCoveragesResolvedAndExpired = allCoveragesResolvedAndExpired;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (fileCount != null) {
      $result.fileCount = fileCount;
    }
    if (messageCount != null) {
      $result.messageCount = messageCount;
    }
    if (warrantyCoverageCount != null) {
      $result.warrantyCoverageCount = warrantyCoverageCount;
    }
    if (valueEstimateCount != null) {
      $result.valueEstimateCount = valueEstimateCount;
    }
    return $result;
  }
  AssetWithDetails._() : super();
  factory AssetWithDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetWithDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetWithDetails', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'companyId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'technicalName')
    ..aOS(5, _omitFieldNames ? '' : 'notes')
    ..aOS(6, _omitFieldNames ? '' : 'divisionOfConstruction')
    ..aOS(7, _omitFieldNames ? '' : 'internalId')
    ..e<AssetStatus>(8, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: AssetStatus.ASSET_STATUS_UNSPECIFIED, valueOf: AssetStatus.valueOf, enumValues: AssetStatus.values)
    ..e<AssetProcessStatus>(9, _omitFieldNames ? '' : 'processStatus', $pb.PbFieldType.OE, defaultOrMaker: AssetProcessStatus.ASSET_PROCESS_STATUS_UNSPECIFIED, valueOf: AssetProcessStatus.valueOf, enumValues: AssetProcessStatus.values)
    ..aOS(10, _omitFieldNames ? '' : 'locationId')
    ..aOS(11, _omitFieldNames ? '' : 'locationName')
    ..aOS(12, _omitFieldNames ? '' : 'floorLocation')
    ..aOS(13, _omitFieldNames ? '' : 'serviceArea')
    ..aOS(14, _omitFieldNames ? '' : 'provider')
    ..aOS(15, _omitFieldNames ? '' : 'manufacturer')
    ..aOS(16, _omitFieldNames ? '' : 'serialNumber')
    ..aOS(17, _omitFieldNames ? '' : 'modelNumber')
    ..aOS(18, _omitFieldNames ? '' : 'aiSerialNumber')
    ..aOS(19, _omitFieldNames ? '' : 'aiModelNumber')
    ..a<$core.double>(20, _omitFieldNames ? '' : 'priceValue', $pb.PbFieldType.OD)
    ..a<$core.double>(21, _omitFieldNames ? '' : 'purchasePrice', $pb.PbFieldType.OD)
    ..a<$core.double>(22, _omitFieldNames ? '' : 'aiPriceValue', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(23, _omitFieldNames ? '' : 'startDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(24, _omitFieldNames ? '' : 'substantialCompletionDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(25, _omitFieldNames ? '' : 'documentDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(26, _omitFieldNames ? '' : 'dueDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(27, _omitFieldNames ? '' : 'installationDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(28, _omitFieldNames ? '' : 'invoiceDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(29, _omitFieldNames ? '' : 'purchaseDate', subBuilder: $0.Timestamp.create)
    ..a<$core.int>(30, _omitFieldNames ? '' : 'warrantyDurationMonths', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(31, _omitFieldNames ? '' : 'warrantyStartDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(32, _omitFieldNames ? '' : 'warrantyEndDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(33, _omitFieldNames ? '' : 'aiWarrantyStartDate', subBuilder: $0.Timestamp.create)
    ..aOB(34, _omitFieldNames ? '' : 'ignoreWarrantyStartDate')
    ..aOB(35, _omitFieldNames ? '' : 'allCoveragesResolvedAndExpired')
    ..aOM<$0.Timestamp>(36, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(37, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..a<$core.int>(38, _omitFieldNames ? '' : 'fileCount', $pb.PbFieldType.O3)
    ..a<$core.int>(39, _omitFieldNames ? '' : 'messageCount', $pb.PbFieldType.O3)
    ..a<$core.int>(40, _omitFieldNames ? '' : 'warrantyCoverageCount', $pb.PbFieldType.O3)
    ..a<$core.int>(41, _omitFieldNames ? '' : 'valueEstimateCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetWithDetails clone() => AssetWithDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetWithDetails copyWith(void Function(AssetWithDetails) updates) => super.copyWith((message) => updates(message as AssetWithDetails)) as AssetWithDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetWithDetails create() => AssetWithDetails._();
  AssetWithDetails createEmptyInstance() => create();
  static $pb.PbList<AssetWithDetails> createRepeated() => $pb.PbList<AssetWithDetails>();
  @$core.pragma('dart2js:noInline')
  static AssetWithDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetWithDetails>(create);
  static AssetWithDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get companyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set companyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompanyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompanyId() => clearField(2);

  /// Basic info
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get technicalName => $_getSZ(3);
  @$pb.TagNumber(4)
  set technicalName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTechnicalName() => $_has(3);
  @$pb.TagNumber(4)
  void clearTechnicalName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get notes => $_getSZ(4);
  @$pb.TagNumber(5)
  set notes($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotes() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotes() => clearField(5);

  /// Classification
  @$pb.TagNumber(6)
  $core.String get divisionOfConstruction => $_getSZ(5);
  @$pb.TagNumber(6)
  set divisionOfConstruction($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDivisionOfConstruction() => $_has(5);
  @$pb.TagNumber(6)
  void clearDivisionOfConstruction() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get internalId => $_getSZ(6);
  @$pb.TagNumber(7)
  set internalId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInternalId() => $_has(6);
  @$pb.TagNumber(7)
  void clearInternalId() => clearField(7);

  /// Status
  @$pb.TagNumber(8)
  AssetStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(AssetStatus v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);

  @$pb.TagNumber(9)
  AssetProcessStatus get processStatus => $_getN(8);
  @$pb.TagNumber(9)
  set processStatus(AssetProcessStatus v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasProcessStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearProcessStatus() => clearField(9);

  /// Location
  @$pb.TagNumber(10)
  $core.String get locationId => $_getSZ(9);
  @$pb.TagNumber(10)
  set locationId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLocationId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLocationId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get locationName => $_getSZ(10);
  @$pb.TagNumber(11)
  set locationName($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLocationName() => $_has(10);
  @$pb.TagNumber(11)
  void clearLocationName() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get floorLocation => $_getSZ(11);
  @$pb.TagNumber(12)
  set floorLocation($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasFloorLocation() => $_has(11);
  @$pb.TagNumber(12)
  void clearFloorLocation() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get serviceArea => $_getSZ(12);
  @$pb.TagNumber(13)
  set serviceArea($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasServiceArea() => $_has(12);
  @$pb.TagNumber(13)
  void clearServiceArea() => clearField(13);

  /// Vendor information
  @$pb.TagNumber(14)
  $core.String get provider => $_getSZ(13);
  @$pb.TagNumber(14)
  set provider($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasProvider() => $_has(13);
  @$pb.TagNumber(14)
  void clearProvider() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get manufacturer => $_getSZ(14);
  @$pb.TagNumber(15)
  set manufacturer($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasManufacturer() => $_has(14);
  @$pb.TagNumber(15)
  void clearManufacturer() => clearField(15);

  /// Identification
  @$pb.TagNumber(16)
  $core.String get serialNumber => $_getSZ(15);
  @$pb.TagNumber(16)
  set serialNumber($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasSerialNumber() => $_has(15);
  @$pb.TagNumber(16)
  void clearSerialNumber() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get modelNumber => $_getSZ(16);
  @$pb.TagNumber(17)
  set modelNumber($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasModelNumber() => $_has(16);
  @$pb.TagNumber(17)
  void clearModelNumber() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get aiSerialNumber => $_getSZ(17);
  @$pb.TagNumber(18)
  set aiSerialNumber($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasAiSerialNumber() => $_has(17);
  @$pb.TagNumber(18)
  void clearAiSerialNumber() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get aiModelNumber => $_getSZ(18);
  @$pb.TagNumber(19)
  set aiModelNumber($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasAiModelNumber() => $_has(18);
  @$pb.TagNumber(19)
  void clearAiModelNumber() => clearField(19);

  /// Pricing
  @$pb.TagNumber(20)
  $core.double get priceValue => $_getN(19);
  @$pb.TagNumber(20)
  set priceValue($core.double v) { $_setDouble(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasPriceValue() => $_has(19);
  @$pb.TagNumber(20)
  void clearPriceValue() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get purchasePrice => $_getN(20);
  @$pb.TagNumber(21)
  set purchasePrice($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasPurchasePrice() => $_has(20);
  @$pb.TagNumber(21)
  void clearPurchasePrice() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get aiPriceValue => $_getN(21);
  @$pb.TagNumber(22)
  set aiPriceValue($core.double v) { $_setDouble(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasAiPriceValue() => $_has(21);
  @$pb.TagNumber(22)
  void clearAiPriceValue() => clearField(22);

  /// Important dates
  @$pb.TagNumber(23)
  $0.Timestamp get startDate => $_getN(22);
  @$pb.TagNumber(23)
  set startDate($0.Timestamp v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasStartDate() => $_has(22);
  @$pb.TagNumber(23)
  void clearStartDate() => clearField(23);
  @$pb.TagNumber(23)
  $0.Timestamp ensureStartDate() => $_ensure(22);

  @$pb.TagNumber(24)
  $0.Timestamp get substantialCompletionDate => $_getN(23);
  @$pb.TagNumber(24)
  set substantialCompletionDate($0.Timestamp v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasSubstantialCompletionDate() => $_has(23);
  @$pb.TagNumber(24)
  void clearSubstantialCompletionDate() => clearField(24);
  @$pb.TagNumber(24)
  $0.Timestamp ensureSubstantialCompletionDate() => $_ensure(23);

  @$pb.TagNumber(25)
  $0.Timestamp get documentDate => $_getN(24);
  @$pb.TagNumber(25)
  set documentDate($0.Timestamp v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasDocumentDate() => $_has(24);
  @$pb.TagNumber(25)
  void clearDocumentDate() => clearField(25);
  @$pb.TagNumber(25)
  $0.Timestamp ensureDocumentDate() => $_ensure(24);

  @$pb.TagNumber(26)
  $0.Timestamp get dueDate => $_getN(25);
  @$pb.TagNumber(26)
  set dueDate($0.Timestamp v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasDueDate() => $_has(25);
  @$pb.TagNumber(26)
  void clearDueDate() => clearField(26);
  @$pb.TagNumber(26)
  $0.Timestamp ensureDueDate() => $_ensure(25);

  @$pb.TagNumber(27)
  $0.Timestamp get installationDate => $_getN(26);
  @$pb.TagNumber(27)
  set installationDate($0.Timestamp v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasInstallationDate() => $_has(26);
  @$pb.TagNumber(27)
  void clearInstallationDate() => clearField(27);
  @$pb.TagNumber(27)
  $0.Timestamp ensureInstallationDate() => $_ensure(26);

  @$pb.TagNumber(28)
  $0.Timestamp get invoiceDate => $_getN(27);
  @$pb.TagNumber(28)
  set invoiceDate($0.Timestamp v) { setField(28, v); }
  @$pb.TagNumber(28)
  $core.bool hasInvoiceDate() => $_has(27);
  @$pb.TagNumber(28)
  void clearInvoiceDate() => clearField(28);
  @$pb.TagNumber(28)
  $0.Timestamp ensureInvoiceDate() => $_ensure(27);

  @$pb.TagNumber(29)
  $0.Timestamp get purchaseDate => $_getN(28);
  @$pb.TagNumber(29)
  set purchaseDate($0.Timestamp v) { setField(29, v); }
  @$pb.TagNumber(29)
  $core.bool hasPurchaseDate() => $_has(28);
  @$pb.TagNumber(29)
  void clearPurchaseDate() => clearField(29);
  @$pb.TagNumber(29)
  $0.Timestamp ensurePurchaseDate() => $_ensure(28);

  /// Warranty info
  @$pb.TagNumber(30)
  $core.int get warrantyDurationMonths => $_getIZ(29);
  @$pb.TagNumber(30)
  set warrantyDurationMonths($core.int v) { $_setSignedInt32(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasWarrantyDurationMonths() => $_has(29);
  @$pb.TagNumber(30)
  void clearWarrantyDurationMonths() => clearField(30);

  @$pb.TagNumber(31)
  $0.Timestamp get warrantyStartDate => $_getN(30);
  @$pb.TagNumber(31)
  set warrantyStartDate($0.Timestamp v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasWarrantyStartDate() => $_has(30);
  @$pb.TagNumber(31)
  void clearWarrantyStartDate() => clearField(31);
  @$pb.TagNumber(31)
  $0.Timestamp ensureWarrantyStartDate() => $_ensure(30);

  @$pb.TagNumber(32)
  $0.Timestamp get warrantyEndDate => $_getN(31);
  @$pb.TagNumber(32)
  set warrantyEndDate($0.Timestamp v) { setField(32, v); }
  @$pb.TagNumber(32)
  $core.bool hasWarrantyEndDate() => $_has(31);
  @$pb.TagNumber(32)
  void clearWarrantyEndDate() => clearField(32);
  @$pb.TagNumber(32)
  $0.Timestamp ensureWarrantyEndDate() => $_ensure(31);

  @$pb.TagNumber(33)
  $0.Timestamp get aiWarrantyStartDate => $_getN(32);
  @$pb.TagNumber(33)
  set aiWarrantyStartDate($0.Timestamp v) { setField(33, v); }
  @$pb.TagNumber(33)
  $core.bool hasAiWarrantyStartDate() => $_has(32);
  @$pb.TagNumber(33)
  void clearAiWarrantyStartDate() => clearField(33);
  @$pb.TagNumber(33)
  $0.Timestamp ensureAiWarrantyStartDate() => $_ensure(32);

  @$pb.TagNumber(34)
  $core.bool get ignoreWarrantyStartDate => $_getBF(33);
  @$pb.TagNumber(34)
  set ignoreWarrantyStartDate($core.bool v) { $_setBool(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasIgnoreWarrantyStartDate() => $_has(33);
  @$pb.TagNumber(34)
  void clearIgnoreWarrantyStartDate() => clearField(34);

  /// Computed/cached fields
  @$pb.TagNumber(35)
  $core.bool get allCoveragesResolvedAndExpired => $_getBF(34);
  @$pb.TagNumber(35)
  set allCoveragesResolvedAndExpired($core.bool v) { $_setBool(34, v); }
  @$pb.TagNumber(35)
  $core.bool hasAllCoveragesResolvedAndExpired() => $_has(34);
  @$pb.TagNumber(35)
  void clearAllCoveragesResolvedAndExpired() => clearField(35);

  /// Timestamps
  @$pb.TagNumber(36)
  $0.Timestamp get createdAt => $_getN(35);
  @$pb.TagNumber(36)
  set createdAt($0.Timestamp v) { setField(36, v); }
  @$pb.TagNumber(36)
  $core.bool hasCreatedAt() => $_has(35);
  @$pb.TagNumber(36)
  void clearCreatedAt() => clearField(36);
  @$pb.TagNumber(36)
  $0.Timestamp ensureCreatedAt() => $_ensure(35);

  @$pb.TagNumber(37)
  $0.Timestamp get updatedAt => $_getN(36);
  @$pb.TagNumber(37)
  set updatedAt($0.Timestamp v) { setField(37, v); }
  @$pb.TagNumber(37)
  $core.bool hasUpdatedAt() => $_has(36);
  @$pb.TagNumber(37)
  void clearUpdatedAt() => clearField(37);
  @$pb.TagNumber(37)
  $0.Timestamp ensureUpdatedAt() => $_ensure(36);

  /// Computed counts (from joins)
  @$pb.TagNumber(38)
  $core.int get fileCount => $_getIZ(37);
  @$pb.TagNumber(38)
  set fileCount($core.int v) { $_setSignedInt32(37, v); }
  @$pb.TagNumber(38)
  $core.bool hasFileCount() => $_has(37);
  @$pb.TagNumber(38)
  void clearFileCount() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get messageCount => $_getIZ(38);
  @$pb.TagNumber(39)
  set messageCount($core.int v) { $_setSignedInt32(38, v); }
  @$pb.TagNumber(39)
  $core.bool hasMessageCount() => $_has(38);
  @$pb.TagNumber(39)
  void clearMessageCount() => clearField(39);

  @$pb.TagNumber(40)
  $core.int get warrantyCoverageCount => $_getIZ(39);
  @$pb.TagNumber(40)
  set warrantyCoverageCount($core.int v) { $_setSignedInt32(39, v); }
  @$pb.TagNumber(40)
  $core.bool hasWarrantyCoverageCount() => $_has(39);
  @$pb.TagNumber(40)
  void clearWarrantyCoverageCount() => clearField(40);

  @$pb.TagNumber(41)
  $core.int get valueEstimateCount => $_getIZ(40);
  @$pb.TagNumber(41)
  set valueEstimateCount($core.int v) { $_setSignedInt32(40, v); }
  @$pb.TagNumber(41)
  $core.bool hasValueEstimateCount() => $_has(40);
  @$pb.TagNumber(41)
  void clearValueEstimateCount() => clearField(41);
}

class CreateAssetRequest extends $pb.GeneratedMessage {
  factory CreateAssetRequest({
    $core.String? name,
    $core.String? technicalName,
    $core.String? notes,
    $core.String? divisionOfConstruction,
    $core.String? internalId,
    AssetStatus? status,
    $core.String? locationId,
    $core.String? floorLocation,
    $core.String? serviceArea,
    $core.String? provider,
    $core.String? manufacturer,
    $core.String? serialNumber,
    $core.String? modelNumber,
    $core.double? priceValue,
    $core.double? purchasePrice,
    $0.Timestamp? startDate,
    $0.Timestamp? substantialCompletionDate,
    $0.Timestamp? documentDate,
    $0.Timestamp? dueDate,
    $0.Timestamp? installationDate,
    $0.Timestamp? invoiceDate,
    $0.Timestamp? purchaseDate,
    $core.int? warrantyDurationMonths,
    $0.Timestamp? warrantyStartDate,
    $0.Timestamp? warrantyEndDate,
    $core.bool? ignoreWarrantyStartDate,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (technicalName != null) {
      $result.technicalName = technicalName;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (divisionOfConstruction != null) {
      $result.divisionOfConstruction = divisionOfConstruction;
    }
    if (internalId != null) {
      $result.internalId = internalId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (floorLocation != null) {
      $result.floorLocation = floorLocation;
    }
    if (serviceArea != null) {
      $result.serviceArea = serviceArea;
    }
    if (provider != null) {
      $result.provider = provider;
    }
    if (manufacturer != null) {
      $result.manufacturer = manufacturer;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (modelNumber != null) {
      $result.modelNumber = modelNumber;
    }
    if (priceValue != null) {
      $result.priceValue = priceValue;
    }
    if (purchasePrice != null) {
      $result.purchasePrice = purchasePrice;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (substantialCompletionDate != null) {
      $result.substantialCompletionDate = substantialCompletionDate;
    }
    if (documentDate != null) {
      $result.documentDate = documentDate;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (installationDate != null) {
      $result.installationDate = installationDate;
    }
    if (invoiceDate != null) {
      $result.invoiceDate = invoiceDate;
    }
    if (purchaseDate != null) {
      $result.purchaseDate = purchaseDate;
    }
    if (warrantyDurationMonths != null) {
      $result.warrantyDurationMonths = warrantyDurationMonths;
    }
    if (warrantyStartDate != null) {
      $result.warrantyStartDate = warrantyStartDate;
    }
    if (warrantyEndDate != null) {
      $result.warrantyEndDate = warrantyEndDate;
    }
    if (ignoreWarrantyStartDate != null) {
      $result.ignoreWarrantyStartDate = ignoreWarrantyStartDate;
    }
    return $result;
  }
  CreateAssetRequest._() : super();
  factory CreateAssetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAssetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAssetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'technicalName')
    ..aOS(3, _omitFieldNames ? '' : 'notes')
    ..aOS(4, _omitFieldNames ? '' : 'divisionOfConstruction')
    ..aOS(5, _omitFieldNames ? '' : 'internalId')
    ..e<AssetStatus>(6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: AssetStatus.ASSET_STATUS_UNSPECIFIED, valueOf: AssetStatus.valueOf, enumValues: AssetStatus.values)
    ..aOS(7, _omitFieldNames ? '' : 'locationId')
    ..aOS(8, _omitFieldNames ? '' : 'floorLocation')
    ..aOS(9, _omitFieldNames ? '' : 'serviceArea')
    ..aOS(10, _omitFieldNames ? '' : 'provider')
    ..aOS(11, _omitFieldNames ? '' : 'manufacturer')
    ..aOS(12, _omitFieldNames ? '' : 'serialNumber')
    ..aOS(13, _omitFieldNames ? '' : 'modelNumber')
    ..a<$core.double>(14, _omitFieldNames ? '' : 'priceValue', $pb.PbFieldType.OD)
    ..a<$core.double>(15, _omitFieldNames ? '' : 'purchasePrice', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(16, _omitFieldNames ? '' : 'startDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(17, _omitFieldNames ? '' : 'substantialCompletionDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(18, _omitFieldNames ? '' : 'documentDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(19, _omitFieldNames ? '' : 'dueDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(20, _omitFieldNames ? '' : 'installationDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(21, _omitFieldNames ? '' : 'invoiceDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(22, _omitFieldNames ? '' : 'purchaseDate', subBuilder: $0.Timestamp.create)
    ..a<$core.int>(23, _omitFieldNames ? '' : 'warrantyDurationMonths', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(24, _omitFieldNames ? '' : 'warrantyStartDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(25, _omitFieldNames ? '' : 'warrantyEndDate', subBuilder: $0.Timestamp.create)
    ..aOB(26, _omitFieldNames ? '' : 'ignoreWarrantyStartDate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAssetRequest clone() => CreateAssetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAssetRequest copyWith(void Function(CreateAssetRequest) updates) => super.copyWith((message) => updates(message as CreateAssetRequest)) as CreateAssetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAssetRequest create() => CreateAssetRequest._();
  CreateAssetRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAssetRequest> createRepeated() => $pb.PbList<CreateAssetRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAssetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAssetRequest>(create);
  static CreateAssetRequest? _defaultInstance;

  /// Basic info
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get technicalName => $_getSZ(1);
  @$pb.TagNumber(2)
  set technicalName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTechnicalName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTechnicalName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get notes => $_getSZ(2);
  @$pb.TagNumber(3)
  set notes($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNotes() => $_has(2);
  @$pb.TagNumber(3)
  void clearNotes() => clearField(3);

  /// Classification
  @$pb.TagNumber(4)
  $core.String get divisionOfConstruction => $_getSZ(3);
  @$pb.TagNumber(4)
  set divisionOfConstruction($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDivisionOfConstruction() => $_has(3);
  @$pb.TagNumber(4)
  void clearDivisionOfConstruction() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get internalId => $_getSZ(4);
  @$pb.TagNumber(5)
  set internalId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInternalId() => $_has(4);
  @$pb.TagNumber(5)
  void clearInternalId() => clearField(5);

  /// Status
  @$pb.TagNumber(6)
  AssetStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(AssetStatus v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  /// Location
  @$pb.TagNumber(7)
  $core.String get locationId => $_getSZ(6);
  @$pb.TagNumber(7)
  set locationId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLocationId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLocationId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get floorLocation => $_getSZ(7);
  @$pb.TagNumber(8)
  set floorLocation($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFloorLocation() => $_has(7);
  @$pb.TagNumber(8)
  void clearFloorLocation() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get serviceArea => $_getSZ(8);
  @$pb.TagNumber(9)
  set serviceArea($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasServiceArea() => $_has(8);
  @$pb.TagNumber(9)
  void clearServiceArea() => clearField(9);

  /// Vendor information
  @$pb.TagNumber(10)
  $core.String get provider => $_getSZ(9);
  @$pb.TagNumber(10)
  set provider($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasProvider() => $_has(9);
  @$pb.TagNumber(10)
  void clearProvider() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get manufacturer => $_getSZ(10);
  @$pb.TagNumber(11)
  set manufacturer($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasManufacturer() => $_has(10);
  @$pb.TagNumber(11)
  void clearManufacturer() => clearField(11);

  /// Identification
  @$pb.TagNumber(12)
  $core.String get serialNumber => $_getSZ(11);
  @$pb.TagNumber(12)
  set serialNumber($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSerialNumber() => $_has(11);
  @$pb.TagNumber(12)
  void clearSerialNumber() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get modelNumber => $_getSZ(12);
  @$pb.TagNumber(13)
  set modelNumber($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasModelNumber() => $_has(12);
  @$pb.TagNumber(13)
  void clearModelNumber() => clearField(13);

  /// Pricing
  @$pb.TagNumber(14)
  $core.double get priceValue => $_getN(13);
  @$pb.TagNumber(14)
  set priceValue($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasPriceValue() => $_has(13);
  @$pb.TagNumber(14)
  void clearPriceValue() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get purchasePrice => $_getN(14);
  @$pb.TagNumber(15)
  set purchasePrice($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasPurchasePrice() => $_has(14);
  @$pb.TagNumber(15)
  void clearPurchasePrice() => clearField(15);

  /// Important dates
  @$pb.TagNumber(16)
  $0.Timestamp get startDate => $_getN(15);
  @$pb.TagNumber(16)
  set startDate($0.Timestamp v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasStartDate() => $_has(15);
  @$pb.TagNumber(16)
  void clearStartDate() => clearField(16);
  @$pb.TagNumber(16)
  $0.Timestamp ensureStartDate() => $_ensure(15);

  @$pb.TagNumber(17)
  $0.Timestamp get substantialCompletionDate => $_getN(16);
  @$pb.TagNumber(17)
  set substantialCompletionDate($0.Timestamp v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasSubstantialCompletionDate() => $_has(16);
  @$pb.TagNumber(17)
  void clearSubstantialCompletionDate() => clearField(17);
  @$pb.TagNumber(17)
  $0.Timestamp ensureSubstantialCompletionDate() => $_ensure(16);

  @$pb.TagNumber(18)
  $0.Timestamp get documentDate => $_getN(17);
  @$pb.TagNumber(18)
  set documentDate($0.Timestamp v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasDocumentDate() => $_has(17);
  @$pb.TagNumber(18)
  void clearDocumentDate() => clearField(18);
  @$pb.TagNumber(18)
  $0.Timestamp ensureDocumentDate() => $_ensure(17);

  @$pb.TagNumber(19)
  $0.Timestamp get dueDate => $_getN(18);
  @$pb.TagNumber(19)
  set dueDate($0.Timestamp v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasDueDate() => $_has(18);
  @$pb.TagNumber(19)
  void clearDueDate() => clearField(19);
  @$pb.TagNumber(19)
  $0.Timestamp ensureDueDate() => $_ensure(18);

  @$pb.TagNumber(20)
  $0.Timestamp get installationDate => $_getN(19);
  @$pb.TagNumber(20)
  set installationDate($0.Timestamp v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasInstallationDate() => $_has(19);
  @$pb.TagNumber(20)
  void clearInstallationDate() => clearField(20);
  @$pb.TagNumber(20)
  $0.Timestamp ensureInstallationDate() => $_ensure(19);

  @$pb.TagNumber(21)
  $0.Timestamp get invoiceDate => $_getN(20);
  @$pb.TagNumber(21)
  set invoiceDate($0.Timestamp v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasInvoiceDate() => $_has(20);
  @$pb.TagNumber(21)
  void clearInvoiceDate() => clearField(21);
  @$pb.TagNumber(21)
  $0.Timestamp ensureInvoiceDate() => $_ensure(20);

  @$pb.TagNumber(22)
  $0.Timestamp get purchaseDate => $_getN(21);
  @$pb.TagNumber(22)
  set purchaseDate($0.Timestamp v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasPurchaseDate() => $_has(21);
  @$pb.TagNumber(22)
  void clearPurchaseDate() => clearField(22);
  @$pb.TagNumber(22)
  $0.Timestamp ensurePurchaseDate() => $_ensure(21);

  /// Warranty info
  @$pb.TagNumber(23)
  $core.int get warrantyDurationMonths => $_getIZ(22);
  @$pb.TagNumber(23)
  set warrantyDurationMonths($core.int v) { $_setSignedInt32(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasWarrantyDurationMonths() => $_has(22);
  @$pb.TagNumber(23)
  void clearWarrantyDurationMonths() => clearField(23);

  @$pb.TagNumber(24)
  $0.Timestamp get warrantyStartDate => $_getN(23);
  @$pb.TagNumber(24)
  set warrantyStartDate($0.Timestamp v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasWarrantyStartDate() => $_has(23);
  @$pb.TagNumber(24)
  void clearWarrantyStartDate() => clearField(24);
  @$pb.TagNumber(24)
  $0.Timestamp ensureWarrantyStartDate() => $_ensure(23);

  @$pb.TagNumber(25)
  $0.Timestamp get warrantyEndDate => $_getN(24);
  @$pb.TagNumber(25)
  set warrantyEndDate($0.Timestamp v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasWarrantyEndDate() => $_has(24);
  @$pb.TagNumber(25)
  void clearWarrantyEndDate() => clearField(25);
  @$pb.TagNumber(25)
  $0.Timestamp ensureWarrantyEndDate() => $_ensure(24);

  @$pb.TagNumber(26)
  $core.bool get ignoreWarrantyStartDate => $_getBF(25);
  @$pb.TagNumber(26)
  set ignoreWarrantyStartDate($core.bool v) { $_setBool(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasIgnoreWarrantyStartDate() => $_has(25);
  @$pb.TagNumber(26)
  void clearIgnoreWarrantyStartDate() => clearField(26);
}

class GetAssetRequest extends $pb.GeneratedMessage {
  factory GetAssetRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetAssetRequest._() : super();
  factory GetAssetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetRequest clone() => GetAssetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetRequest copyWith(void Function(GetAssetRequest) updates) => super.copyWith((message) => updates(message as GetAssetRequest)) as GetAssetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetRequest create() => GetAssetRequest._();
  GetAssetRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssetRequest> createRepeated() => $pb.PbList<GetAssetRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetRequest>(create);
  static GetAssetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class UpdateAssetRequest extends $pb.GeneratedMessage {
  factory UpdateAssetRequest({
    $core.String? id,
    $core.String? name,
    $core.String? technicalName,
    $core.String? notes,
    $core.String? divisionOfConstruction,
    $core.String? internalId,
    AssetStatus? status,
    $core.String? locationId,
    $core.String? floorLocation,
    $core.String? serviceArea,
    $core.String? provider,
    $core.String? manufacturer,
    $core.String? serialNumber,
    $core.String? modelNumber,
    $core.double? priceValue,
    $core.double? purchasePrice,
    $0.Timestamp? startDate,
    $0.Timestamp? substantialCompletionDate,
    $0.Timestamp? documentDate,
    $0.Timestamp? dueDate,
    $0.Timestamp? installationDate,
    $0.Timestamp? invoiceDate,
    $0.Timestamp? purchaseDate,
    $core.int? warrantyDurationMonths,
    $0.Timestamp? warrantyStartDate,
    $0.Timestamp? warrantyEndDate,
    $core.bool? ignoreWarrantyStartDate,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (technicalName != null) {
      $result.technicalName = technicalName;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (divisionOfConstruction != null) {
      $result.divisionOfConstruction = divisionOfConstruction;
    }
    if (internalId != null) {
      $result.internalId = internalId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (floorLocation != null) {
      $result.floorLocation = floorLocation;
    }
    if (serviceArea != null) {
      $result.serviceArea = serviceArea;
    }
    if (provider != null) {
      $result.provider = provider;
    }
    if (manufacturer != null) {
      $result.manufacturer = manufacturer;
    }
    if (serialNumber != null) {
      $result.serialNumber = serialNumber;
    }
    if (modelNumber != null) {
      $result.modelNumber = modelNumber;
    }
    if (priceValue != null) {
      $result.priceValue = priceValue;
    }
    if (purchasePrice != null) {
      $result.purchasePrice = purchasePrice;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (substantialCompletionDate != null) {
      $result.substantialCompletionDate = substantialCompletionDate;
    }
    if (documentDate != null) {
      $result.documentDate = documentDate;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (installationDate != null) {
      $result.installationDate = installationDate;
    }
    if (invoiceDate != null) {
      $result.invoiceDate = invoiceDate;
    }
    if (purchaseDate != null) {
      $result.purchaseDate = purchaseDate;
    }
    if (warrantyDurationMonths != null) {
      $result.warrantyDurationMonths = warrantyDurationMonths;
    }
    if (warrantyStartDate != null) {
      $result.warrantyStartDate = warrantyStartDate;
    }
    if (warrantyEndDate != null) {
      $result.warrantyEndDate = warrantyEndDate;
    }
    if (ignoreWarrantyStartDate != null) {
      $result.ignoreWarrantyStartDate = ignoreWarrantyStartDate;
    }
    return $result;
  }
  UpdateAssetRequest._() : super();
  factory UpdateAssetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAssetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAssetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'technicalName')
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..aOS(5, _omitFieldNames ? '' : 'divisionOfConstruction')
    ..aOS(6, _omitFieldNames ? '' : 'internalId')
    ..e<AssetStatus>(7, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: AssetStatus.ASSET_STATUS_UNSPECIFIED, valueOf: AssetStatus.valueOf, enumValues: AssetStatus.values)
    ..aOS(8, _omitFieldNames ? '' : 'locationId')
    ..aOS(9, _omitFieldNames ? '' : 'floorLocation')
    ..aOS(10, _omitFieldNames ? '' : 'serviceArea')
    ..aOS(11, _omitFieldNames ? '' : 'provider')
    ..aOS(12, _omitFieldNames ? '' : 'manufacturer')
    ..aOS(13, _omitFieldNames ? '' : 'serialNumber')
    ..aOS(14, _omitFieldNames ? '' : 'modelNumber')
    ..a<$core.double>(15, _omitFieldNames ? '' : 'priceValue', $pb.PbFieldType.OD)
    ..a<$core.double>(16, _omitFieldNames ? '' : 'purchasePrice', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(17, _omitFieldNames ? '' : 'startDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(18, _omitFieldNames ? '' : 'substantialCompletionDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(19, _omitFieldNames ? '' : 'documentDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(20, _omitFieldNames ? '' : 'dueDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(21, _omitFieldNames ? '' : 'installationDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(22, _omitFieldNames ? '' : 'invoiceDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(23, _omitFieldNames ? '' : 'purchaseDate', subBuilder: $0.Timestamp.create)
    ..a<$core.int>(24, _omitFieldNames ? '' : 'warrantyDurationMonths', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(25, _omitFieldNames ? '' : 'warrantyStartDate', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(26, _omitFieldNames ? '' : 'warrantyEndDate', subBuilder: $0.Timestamp.create)
    ..aOB(27, _omitFieldNames ? '' : 'ignoreWarrantyStartDate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAssetRequest clone() => UpdateAssetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAssetRequest copyWith(void Function(UpdateAssetRequest) updates) => super.copyWith((message) => updates(message as UpdateAssetRequest)) as UpdateAssetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssetRequest create() => UpdateAssetRequest._();
  UpdateAssetRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAssetRequest> createRepeated() => $pb.PbList<UpdateAssetRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssetRequest>(create);
  static UpdateAssetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// Basic info (all optional - only provided fields are updated)
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get technicalName => $_getSZ(2);
  @$pb.TagNumber(3)
  set technicalName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTechnicalName() => $_has(2);
  @$pb.TagNumber(3)
  void clearTechnicalName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => clearField(4);

  /// Classification
  @$pb.TagNumber(5)
  $core.String get divisionOfConstruction => $_getSZ(4);
  @$pb.TagNumber(5)
  set divisionOfConstruction($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDivisionOfConstruction() => $_has(4);
  @$pb.TagNumber(5)
  void clearDivisionOfConstruction() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get internalId => $_getSZ(5);
  @$pb.TagNumber(6)
  set internalId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInternalId() => $_has(5);
  @$pb.TagNumber(6)
  void clearInternalId() => clearField(6);

  /// Status
  @$pb.TagNumber(7)
  AssetStatus get status => $_getN(6);
  @$pb.TagNumber(7)
  set status(AssetStatus v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  /// Location
  @$pb.TagNumber(8)
  $core.String get locationId => $_getSZ(7);
  @$pb.TagNumber(8)
  set locationId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLocationId() => $_has(7);
  @$pb.TagNumber(8)
  void clearLocationId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get floorLocation => $_getSZ(8);
  @$pb.TagNumber(9)
  set floorLocation($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFloorLocation() => $_has(8);
  @$pb.TagNumber(9)
  void clearFloorLocation() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get serviceArea => $_getSZ(9);
  @$pb.TagNumber(10)
  set serviceArea($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasServiceArea() => $_has(9);
  @$pb.TagNumber(10)
  void clearServiceArea() => clearField(10);

  /// Vendor information
  @$pb.TagNumber(11)
  $core.String get provider => $_getSZ(10);
  @$pb.TagNumber(11)
  set provider($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasProvider() => $_has(10);
  @$pb.TagNumber(11)
  void clearProvider() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get manufacturer => $_getSZ(11);
  @$pb.TagNumber(12)
  set manufacturer($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasManufacturer() => $_has(11);
  @$pb.TagNumber(12)
  void clearManufacturer() => clearField(12);

  /// Identification
  @$pb.TagNumber(13)
  $core.String get serialNumber => $_getSZ(12);
  @$pb.TagNumber(13)
  set serialNumber($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSerialNumber() => $_has(12);
  @$pb.TagNumber(13)
  void clearSerialNumber() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get modelNumber => $_getSZ(13);
  @$pb.TagNumber(14)
  set modelNumber($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasModelNumber() => $_has(13);
  @$pb.TagNumber(14)
  void clearModelNumber() => clearField(14);

  /// Pricing
  @$pb.TagNumber(15)
  $core.double get priceValue => $_getN(14);
  @$pb.TagNumber(15)
  set priceValue($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasPriceValue() => $_has(14);
  @$pb.TagNumber(15)
  void clearPriceValue() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get purchasePrice => $_getN(15);
  @$pb.TagNumber(16)
  set purchasePrice($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasPurchasePrice() => $_has(15);
  @$pb.TagNumber(16)
  void clearPurchasePrice() => clearField(16);

  /// Important dates
  @$pb.TagNumber(17)
  $0.Timestamp get startDate => $_getN(16);
  @$pb.TagNumber(17)
  set startDate($0.Timestamp v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasStartDate() => $_has(16);
  @$pb.TagNumber(17)
  void clearStartDate() => clearField(17);
  @$pb.TagNumber(17)
  $0.Timestamp ensureStartDate() => $_ensure(16);

  @$pb.TagNumber(18)
  $0.Timestamp get substantialCompletionDate => $_getN(17);
  @$pb.TagNumber(18)
  set substantialCompletionDate($0.Timestamp v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasSubstantialCompletionDate() => $_has(17);
  @$pb.TagNumber(18)
  void clearSubstantialCompletionDate() => clearField(18);
  @$pb.TagNumber(18)
  $0.Timestamp ensureSubstantialCompletionDate() => $_ensure(17);

  @$pb.TagNumber(19)
  $0.Timestamp get documentDate => $_getN(18);
  @$pb.TagNumber(19)
  set documentDate($0.Timestamp v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasDocumentDate() => $_has(18);
  @$pb.TagNumber(19)
  void clearDocumentDate() => clearField(19);
  @$pb.TagNumber(19)
  $0.Timestamp ensureDocumentDate() => $_ensure(18);

  @$pb.TagNumber(20)
  $0.Timestamp get dueDate => $_getN(19);
  @$pb.TagNumber(20)
  set dueDate($0.Timestamp v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasDueDate() => $_has(19);
  @$pb.TagNumber(20)
  void clearDueDate() => clearField(20);
  @$pb.TagNumber(20)
  $0.Timestamp ensureDueDate() => $_ensure(19);

  @$pb.TagNumber(21)
  $0.Timestamp get installationDate => $_getN(20);
  @$pb.TagNumber(21)
  set installationDate($0.Timestamp v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasInstallationDate() => $_has(20);
  @$pb.TagNumber(21)
  void clearInstallationDate() => clearField(21);
  @$pb.TagNumber(21)
  $0.Timestamp ensureInstallationDate() => $_ensure(20);

  @$pb.TagNumber(22)
  $0.Timestamp get invoiceDate => $_getN(21);
  @$pb.TagNumber(22)
  set invoiceDate($0.Timestamp v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasInvoiceDate() => $_has(21);
  @$pb.TagNumber(22)
  void clearInvoiceDate() => clearField(22);
  @$pb.TagNumber(22)
  $0.Timestamp ensureInvoiceDate() => $_ensure(21);

  @$pb.TagNumber(23)
  $0.Timestamp get purchaseDate => $_getN(22);
  @$pb.TagNumber(23)
  set purchaseDate($0.Timestamp v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasPurchaseDate() => $_has(22);
  @$pb.TagNumber(23)
  void clearPurchaseDate() => clearField(23);
  @$pb.TagNumber(23)
  $0.Timestamp ensurePurchaseDate() => $_ensure(22);

  /// Warranty info
  @$pb.TagNumber(24)
  $core.int get warrantyDurationMonths => $_getIZ(23);
  @$pb.TagNumber(24)
  set warrantyDurationMonths($core.int v) { $_setSignedInt32(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasWarrantyDurationMonths() => $_has(23);
  @$pb.TagNumber(24)
  void clearWarrantyDurationMonths() => clearField(24);

  @$pb.TagNumber(25)
  $0.Timestamp get warrantyStartDate => $_getN(24);
  @$pb.TagNumber(25)
  set warrantyStartDate($0.Timestamp v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasWarrantyStartDate() => $_has(24);
  @$pb.TagNumber(25)
  void clearWarrantyStartDate() => clearField(25);
  @$pb.TagNumber(25)
  $0.Timestamp ensureWarrantyStartDate() => $_ensure(24);

  @$pb.TagNumber(26)
  $0.Timestamp get warrantyEndDate => $_getN(25);
  @$pb.TagNumber(26)
  set warrantyEndDate($0.Timestamp v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasWarrantyEndDate() => $_has(25);
  @$pb.TagNumber(26)
  void clearWarrantyEndDate() => clearField(26);
  @$pb.TagNumber(26)
  $0.Timestamp ensureWarrantyEndDate() => $_ensure(25);

  @$pb.TagNumber(27)
  $core.bool get ignoreWarrantyStartDate => $_getBF(26);
  @$pb.TagNumber(27)
  set ignoreWarrantyStartDate($core.bool v) { $_setBool(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasIgnoreWarrantyStartDate() => $_has(26);
  @$pb.TagNumber(27)
  void clearIgnoreWarrantyStartDate() => clearField(27);
}

class DeleteAssetRequest extends $pb.GeneratedMessage {
  factory DeleteAssetRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteAssetRequest._() : super();
  factory DeleteAssetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAssetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAssetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAssetRequest clone() => DeleteAssetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAssetRequest copyWith(void Function(DeleteAssetRequest) updates) => super.copyWith((message) => updates(message as DeleteAssetRequest)) as DeleteAssetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAssetRequest create() => DeleteAssetRequest._();
  DeleteAssetRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAssetRequest> createRepeated() => $pb.PbList<DeleteAssetRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAssetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAssetRequest>(create);
  static DeleteAssetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteAssetResponse extends $pb.GeneratedMessage {
  factory DeleteAssetResponse() => create();
  DeleteAssetResponse._() : super();
  factory DeleteAssetResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAssetResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAssetResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAssetResponse clone() => DeleteAssetResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAssetResponse copyWith(void Function(DeleteAssetResponse) updates) => super.copyWith((message) => updates(message as DeleteAssetResponse)) as DeleteAssetResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAssetResponse create() => DeleteAssetResponse._();
  DeleteAssetResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteAssetResponse> createRepeated() => $pb.PbList<DeleteAssetResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteAssetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAssetResponse>(create);
  static DeleteAssetResponse? _defaultInstance;
}

class ListAssetsRequest extends $pb.GeneratedMessage {
  factory ListAssetsRequest({
    $core.Iterable<$core.String>? locationIds,
    $core.Iterable<AssetStatus>? statuses,
    $core.Iterable<$core.String>? divisionCodes,
    $core.String? search,
    $core.bool? hasActiveWarranty,
    $core.bool? warrantyExpiringSoon,
    $0.Timestamp? createdAfter,
    $0.Timestamp? createdBefore,
    $core.String? sortBy,
    $core.String? sortOrder,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (locationIds != null) {
      $result.locationIds.addAll(locationIds);
    }
    if (statuses != null) {
      $result.statuses.addAll(statuses);
    }
    if (divisionCodes != null) {
      $result.divisionCodes.addAll(divisionCodes);
    }
    if (search != null) {
      $result.search = search;
    }
    if (hasActiveWarranty != null) {
      $result.hasActiveWarranty = hasActiveWarranty;
    }
    if (warrantyExpiringSoon != null) {
      $result.warrantyExpiringSoon = warrantyExpiringSoon;
    }
    if (createdAfter != null) {
      $result.createdAfter = createdAfter;
    }
    if (createdBefore != null) {
      $result.createdBefore = createdBefore;
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
  ListAssetsRequest._() : super();
  factory ListAssetsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAssetsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAssetsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'locationIds')
    ..pc<AssetStatus>(2, _omitFieldNames ? '' : 'statuses', $pb.PbFieldType.KE, valueOf: AssetStatus.valueOf, enumValues: AssetStatus.values, defaultEnumValue: AssetStatus.ASSET_STATUS_UNSPECIFIED)
    ..pPS(3, _omitFieldNames ? '' : 'divisionCodes')
    ..aOS(4, _omitFieldNames ? '' : 'search')
    ..aOB(5, _omitFieldNames ? '' : 'hasActiveWarranty')
    ..aOB(6, _omitFieldNames ? '' : 'warrantyExpiringSoon')
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'createdAfter', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'createdBefore', subBuilder: $0.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'sortBy')
    ..aOS(10, _omitFieldNames ? '' : 'sortOrder')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAssetsRequest clone() => ListAssetsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAssetsRequest copyWith(void Function(ListAssetsRequest) updates) => super.copyWith((message) => updates(message as ListAssetsRequest)) as ListAssetsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAssetsRequest create() => ListAssetsRequest._();
  ListAssetsRequest createEmptyInstance() => create();
  static $pb.PbList<ListAssetsRequest> createRepeated() => $pb.PbList<ListAssetsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAssetsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAssetsRequest>(create);
  static ListAssetsRequest? _defaultInstance;

  /// Filters
  @$pb.TagNumber(1)
  $core.List<$core.String> get locationIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<AssetStatus> get statuses => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get divisionCodes => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get search => $_getSZ(3);
  @$pb.TagNumber(4)
  set search($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSearch() => $_has(3);
  @$pb.TagNumber(4)
  void clearSearch() => clearField(4);

  /// Warranty filters
  @$pb.TagNumber(5)
  $core.bool get hasActiveWarranty => $_getBF(4);
  @$pb.TagNumber(5)
  set hasActiveWarranty($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHasActiveWarranty() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasActiveWarranty() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get warrantyExpiringSoon => $_getBF(5);
  @$pb.TagNumber(6)
  set warrantyExpiringSoon($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWarrantyExpiringSoon() => $_has(5);
  @$pb.TagNumber(6)
  void clearWarrantyExpiringSoon() => clearField(6);

  /// Date range filters
  @$pb.TagNumber(7)
  $0.Timestamp get createdAfter => $_getN(6);
  @$pb.TagNumber(7)
  set createdAfter($0.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAfter() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAfter() => clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureCreatedAfter() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Timestamp get createdBefore => $_getN(7);
  @$pb.TagNumber(8)
  set createdBefore($0.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedBefore() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedBefore() => clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureCreatedBefore() => $_ensure(7);

  /// Sorting
  @$pb.TagNumber(9)
  $core.String get sortBy => $_getSZ(8);
  @$pb.TagNumber(9)
  set sortBy($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSortBy() => $_has(8);
  @$pb.TagNumber(9)
  void clearSortBy() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get sortOrder => $_getSZ(9);
  @$pb.TagNumber(10)
  set sortOrder($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSortOrder() => $_has(9);
  @$pb.TagNumber(10)
  void clearSortOrder() => clearField(10);

  /// Pagination
  @$pb.TagNumber(11)
  $core.int get limit => $_getIZ(10);
  @$pb.TagNumber(11)
  set limit($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLimit() => $_has(10);
  @$pb.TagNumber(11)
  void clearLimit() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get offset => $_getIZ(11);
  @$pb.TagNumber(12)
  set offset($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasOffset() => $_has(11);
  @$pb.TagNumber(12)
  void clearOffset() => clearField(12);
}

class ListAssetsResponse extends $pb.GeneratedMessage {
  factory ListAssetsResponse({
    $core.Iterable<AssetWithDetails>? items,
    $core.int? total,
    $core.int? page,
    $core.int? pageSize,
    $core.int? totalPages,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (total != null) {
      $result.total = total;
    }
    if (page != null) {
      $result.page = page;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (totalPages != null) {
      $result.totalPages = totalPages;
    }
    return $result;
  }
  ListAssetsResponse._() : super();
  factory ListAssetsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAssetsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAssetsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<AssetWithDetails>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: AssetWithDetails.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'totalPages', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAssetsResponse clone() => ListAssetsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAssetsResponse copyWith(void Function(ListAssetsResponse) updates) => super.copyWith((message) => updates(message as ListAssetsResponse)) as ListAssetsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAssetsResponse create() => ListAssetsResponse._();
  ListAssetsResponse createEmptyInstance() => create();
  static $pb.PbList<ListAssetsResponse> createRepeated() => $pb.PbList<ListAssetsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAssetsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAssetsResponse>(create);
  static ListAssetsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AssetWithDetails> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get pageSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set pageSize($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPageSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalPages => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalPages($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalPages() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalPages() => clearField(5);
}

class BulkUpdateAssetsRequest extends $pb.GeneratedMessage {
  factory BulkUpdateAssetsRequest({
    $core.Iterable<$core.String>? ids,
    AssetStatus? status,
    $core.String? locationId,
    $core.String? divisionOfConstruction,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (status != null) {
      $result.status = status;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (divisionOfConstruction != null) {
      $result.divisionOfConstruction = divisionOfConstruction;
    }
    return $result;
  }
  BulkUpdateAssetsRequest._() : super();
  factory BulkUpdateAssetsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkUpdateAssetsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkUpdateAssetsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..e<AssetStatus>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: AssetStatus.ASSET_STATUS_UNSPECIFIED, valueOf: AssetStatus.valueOf, enumValues: AssetStatus.values)
    ..aOS(3, _omitFieldNames ? '' : 'locationId')
    ..aOS(4, _omitFieldNames ? '' : 'divisionOfConstruction')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkUpdateAssetsRequest clone() => BulkUpdateAssetsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkUpdateAssetsRequest copyWith(void Function(BulkUpdateAssetsRequest) updates) => super.copyWith((message) => updates(message as BulkUpdateAssetsRequest)) as BulkUpdateAssetsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkUpdateAssetsRequest create() => BulkUpdateAssetsRequest._();
  BulkUpdateAssetsRequest createEmptyInstance() => create();
  static $pb.PbList<BulkUpdateAssetsRequest> createRepeated() => $pb.PbList<BulkUpdateAssetsRequest>();
  @$core.pragma('dart2js:noInline')
  static BulkUpdateAssetsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkUpdateAssetsRequest>(create);
  static BulkUpdateAssetsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);

  /// Fields to update (all optional - only provided fields are updated)
  @$pb.TagNumber(2)
  AssetStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(AssetStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get locationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set locationId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocationId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get divisionOfConstruction => $_getSZ(3);
  @$pb.TagNumber(4)
  set divisionOfConstruction($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDivisionOfConstruction() => $_has(3);
  @$pb.TagNumber(4)
  void clearDivisionOfConstruction() => clearField(4);
}

class BulkUpdateAssetsResponse extends $pb.GeneratedMessage {
  factory BulkUpdateAssetsResponse({
    $core.int? updatedCount,
    $core.Iterable<$core.String>? failedIds,
  }) {
    final $result = create();
    if (updatedCount != null) {
      $result.updatedCount = updatedCount;
    }
    if (failedIds != null) {
      $result.failedIds.addAll(failedIds);
    }
    return $result;
  }
  BulkUpdateAssetsResponse._() : super();
  factory BulkUpdateAssetsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkUpdateAssetsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkUpdateAssetsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'updatedCount', $pb.PbFieldType.O3)
    ..pPS(2, _omitFieldNames ? '' : 'failedIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkUpdateAssetsResponse clone() => BulkUpdateAssetsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkUpdateAssetsResponse copyWith(void Function(BulkUpdateAssetsResponse) updates) => super.copyWith((message) => updates(message as BulkUpdateAssetsResponse)) as BulkUpdateAssetsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkUpdateAssetsResponse create() => BulkUpdateAssetsResponse._();
  BulkUpdateAssetsResponse createEmptyInstance() => create();
  static $pb.PbList<BulkUpdateAssetsResponse> createRepeated() => $pb.PbList<BulkUpdateAssetsResponse>();
  @$core.pragma('dart2js:noInline')
  static BulkUpdateAssetsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkUpdateAssetsResponse>(create);
  static BulkUpdateAssetsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get updatedCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set updatedCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdatedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdatedCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get failedIds => $_getList(1);
}

class BulkDeleteAssetsRequest extends $pb.GeneratedMessage {
  factory BulkDeleteAssetsRequest({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  BulkDeleteAssetsRequest._() : super();
  factory BulkDeleteAssetsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkDeleteAssetsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkDeleteAssetsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkDeleteAssetsRequest clone() => BulkDeleteAssetsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkDeleteAssetsRequest copyWith(void Function(BulkDeleteAssetsRequest) updates) => super.copyWith((message) => updates(message as BulkDeleteAssetsRequest)) as BulkDeleteAssetsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkDeleteAssetsRequest create() => BulkDeleteAssetsRequest._();
  BulkDeleteAssetsRequest createEmptyInstance() => create();
  static $pb.PbList<BulkDeleteAssetsRequest> createRepeated() => $pb.PbList<BulkDeleteAssetsRequest>();
  @$core.pragma('dart2js:noInline')
  static BulkDeleteAssetsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkDeleteAssetsRequest>(create);
  static BulkDeleteAssetsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

class BulkDeleteAssetsResponse extends $pb.GeneratedMessage {
  factory BulkDeleteAssetsResponse({
    $core.int? deletedCount,
    $core.Iterable<$core.String>? failedIds,
  }) {
    final $result = create();
    if (deletedCount != null) {
      $result.deletedCount = deletedCount;
    }
    if (failedIds != null) {
      $result.failedIds.addAll(failedIds);
    }
    return $result;
  }
  BulkDeleteAssetsResponse._() : super();
  factory BulkDeleteAssetsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BulkDeleteAssetsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BulkDeleteAssetsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deletedCount', $pb.PbFieldType.O3)
    ..pPS(2, _omitFieldNames ? '' : 'failedIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BulkDeleteAssetsResponse clone() => BulkDeleteAssetsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BulkDeleteAssetsResponse copyWith(void Function(BulkDeleteAssetsResponse) updates) => super.copyWith((message) => updates(message as BulkDeleteAssetsResponse)) as BulkDeleteAssetsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BulkDeleteAssetsResponse create() => BulkDeleteAssetsResponse._();
  BulkDeleteAssetsResponse createEmptyInstance() => create();
  static $pb.PbList<BulkDeleteAssetsResponse> createRepeated() => $pb.PbList<BulkDeleteAssetsResponse>();
  @$core.pragma('dart2js:noInline')
  static BulkDeleteAssetsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BulkDeleteAssetsResponse>(create);
  static BulkDeleteAssetsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deletedCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set deletedCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeletedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeletedCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get failedIds => $_getList(1);
}

class AssetLocation extends $pb.GeneratedMessage {
  factory AssetLocation({
    $core.String? id,
    $core.String? name,
    $core.String? address,
    $core.int? assetCount,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    if (assetCount != null) {
      $result.assetCount = assetCount;
    }
    return $result;
  }
  AssetLocation._() : super();
  factory AssetLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'assetCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetLocation clone() => AssetLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetLocation copyWith(void Function(AssetLocation) updates) => super.copyWith((message) => updates(message as AssetLocation)) as AssetLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetLocation create() => AssetLocation._();
  AssetLocation createEmptyInstance() => create();
  static $pb.PbList<AssetLocation> createRepeated() => $pb.PbList<AssetLocation>();
  @$core.pragma('dart2js:noInline')
  static AssetLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetLocation>(create);
  static AssetLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get assetCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set assetCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAssetCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAssetCount() => clearField(4);
}

class GetAssetLocationsRequest extends $pb.GeneratedMessage {
  factory GetAssetLocationsRequest() => create();
  GetAssetLocationsRequest._() : super();
  factory GetAssetLocationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetLocationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetLocationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetLocationsRequest clone() => GetAssetLocationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetLocationsRequest copyWith(void Function(GetAssetLocationsRequest) updates) => super.copyWith((message) => updates(message as GetAssetLocationsRequest)) as GetAssetLocationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetLocationsRequest create() => GetAssetLocationsRequest._();
  GetAssetLocationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssetLocationsRequest> createRepeated() => $pb.PbList<GetAssetLocationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssetLocationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetLocationsRequest>(create);
  static GetAssetLocationsRequest? _defaultInstance;
}

class GetAssetLocationsResponse extends $pb.GeneratedMessage {
  factory GetAssetLocationsResponse({
    $core.Iterable<AssetLocation>? locations,
  }) {
    final $result = create();
    if (locations != null) {
      $result.locations.addAll(locations);
    }
    return $result;
  }
  GetAssetLocationsResponse._() : super();
  factory GetAssetLocationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetLocationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetLocationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<AssetLocation>(1, _omitFieldNames ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: AssetLocation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetLocationsResponse clone() => GetAssetLocationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetLocationsResponse copyWith(void Function(GetAssetLocationsResponse) updates) => super.copyWith((message) => updates(message as GetAssetLocationsResponse)) as GetAssetLocationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetLocationsResponse create() => GetAssetLocationsResponse._();
  GetAssetLocationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetAssetLocationsResponse> createRepeated() => $pb.PbList<GetAssetLocationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAssetLocationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetLocationsResponse>(create);
  static GetAssetLocationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AssetLocation> get locations => $_getList(0);
}

/// CSI Division codes
class AssetDivision extends $pb.GeneratedMessage {
  factory AssetDivision({
    $core.String? code,
    $core.String? name,
    $core.String? parentCode,
    $core.int? level,
    $core.int? assetCount,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (name != null) {
      $result.name = name;
    }
    if (parentCode != null) {
      $result.parentCode = parentCode;
    }
    if (level != null) {
      $result.level = level;
    }
    if (assetCount != null) {
      $result.assetCount = assetCount;
    }
    return $result;
  }
  AssetDivision._() : super();
  factory AssetDivision.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetDivision.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetDivision', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'parentCode')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'level', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'assetCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetDivision clone() => AssetDivision()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetDivision copyWith(void Function(AssetDivision) updates) => super.copyWith((message) => updates(message as AssetDivision)) as AssetDivision;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetDivision create() => AssetDivision._();
  AssetDivision createEmptyInstance() => create();
  static $pb.PbList<AssetDivision> createRepeated() => $pb.PbList<AssetDivision>();
  @$core.pragma('dart2js:noInline')
  static AssetDivision getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetDivision>(create);
  static AssetDivision? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get parentCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set parentCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasParentCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get assetCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set assetCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAssetCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAssetCount() => clearField(5);
}

class GetAssetDivisionsRequest extends $pb.GeneratedMessage {
  factory GetAssetDivisionsRequest({
    $core.int? level,
  }) {
    final $result = create();
    if (level != null) {
      $result.level = level;
    }
    return $result;
  }
  GetAssetDivisionsRequest._() : super();
  factory GetAssetDivisionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetDivisionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetDivisionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'level', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetDivisionsRequest clone() => GetAssetDivisionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetDivisionsRequest copyWith(void Function(GetAssetDivisionsRequest) updates) => super.copyWith((message) => updates(message as GetAssetDivisionsRequest)) as GetAssetDivisionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetDivisionsRequest create() => GetAssetDivisionsRequest._();
  GetAssetDivisionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssetDivisionsRequest> createRepeated() => $pb.PbList<GetAssetDivisionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssetDivisionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetDivisionsRequest>(create);
  static GetAssetDivisionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);
}

class GetAssetDivisionsResponse extends $pb.GeneratedMessage {
  factory GetAssetDivisionsResponse({
    $core.Iterable<AssetDivision>? divisions,
  }) {
    final $result = create();
    if (divisions != null) {
      $result.divisions.addAll(divisions);
    }
    return $result;
  }
  GetAssetDivisionsResponse._() : super();
  factory GetAssetDivisionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetDivisionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetDivisionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<AssetDivision>(1, _omitFieldNames ? '' : 'divisions', $pb.PbFieldType.PM, subBuilder: AssetDivision.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetDivisionsResponse clone() => GetAssetDivisionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetDivisionsResponse copyWith(void Function(GetAssetDivisionsResponse) updates) => super.copyWith((message) => updates(message as GetAssetDivisionsResponse)) as GetAssetDivisionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetDivisionsResponse create() => GetAssetDivisionsResponse._();
  GetAssetDivisionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetAssetDivisionsResponse> createRepeated() => $pb.PbList<GetAssetDivisionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAssetDivisionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetDivisionsResponse>(create);
  static GetAssetDivisionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AssetDivision> get divisions => $_getList(0);
}

class GetAssetStatisticsRequest extends $pb.GeneratedMessage {
  factory GetAssetStatisticsRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetAssetStatisticsRequest._() : super();
  factory GetAssetStatisticsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetStatisticsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetStatisticsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetStatisticsRequest clone() => GetAssetStatisticsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetStatisticsRequest copyWith(void Function(GetAssetStatisticsRequest) updates) => super.copyWith((message) => updates(message as GetAssetStatisticsRequest)) as GetAssetStatisticsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetStatisticsRequest create() => GetAssetStatisticsRequest._();
  GetAssetStatisticsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssetStatisticsRequest> createRepeated() => $pb.PbList<GetAssetStatisticsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssetStatisticsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetStatisticsRequest>(create);
  static GetAssetStatisticsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class AssetStatistics extends $pb.GeneratedMessage {
  factory AssetStatistics({
    $core.String? assetId,
    $core.int? totalTasks,
    $core.int? openTasks,
    $core.int? completedTasks,
    $core.int? fileCount,
    $core.int? warrantyCoverageCount,
    $core.double? totalValue,
    $0.Timestamp? nextWarrantyExpiry,
    $0.Timestamp? lastTaskCompletedAt,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (totalTasks != null) {
      $result.totalTasks = totalTasks;
    }
    if (openTasks != null) {
      $result.openTasks = openTasks;
    }
    if (completedTasks != null) {
      $result.completedTasks = completedTasks;
    }
    if (fileCount != null) {
      $result.fileCount = fileCount;
    }
    if (warrantyCoverageCount != null) {
      $result.warrantyCoverageCount = warrantyCoverageCount;
    }
    if (totalValue != null) {
      $result.totalValue = totalValue;
    }
    if (nextWarrantyExpiry != null) {
      $result.nextWarrantyExpiry = nextWarrantyExpiry;
    }
    if (lastTaskCompletedAt != null) {
      $result.lastTaskCompletedAt = lastTaskCompletedAt;
    }
    return $result;
  }
  AssetStatistics._() : super();
  factory AssetStatistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetStatistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetStatistics', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'openTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'completedTasks', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'fileCount', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'warrantyCoverageCount', $pb.PbFieldType.O3)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'totalValue', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'nextWarrantyExpiry', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'lastTaskCompletedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetStatistics clone() => AssetStatistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetStatistics copyWith(void Function(AssetStatistics) updates) => super.copyWith((message) => updates(message as AssetStatistics)) as AssetStatistics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetStatistics create() => AssetStatistics._();
  AssetStatistics createEmptyInstance() => create();
  static $pb.PbList<AssetStatistics> createRepeated() => $pb.PbList<AssetStatistics>();
  @$core.pragma('dart2js:noInline')
  static AssetStatistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetStatistics>(create);
  static AssetStatistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalTasks => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalTasks($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalTasks() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalTasks() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get openTasks => $_getIZ(2);
  @$pb.TagNumber(3)
  set openTasks($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOpenTasks() => $_has(2);
  @$pb.TagNumber(3)
  void clearOpenTasks() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get completedTasks => $_getIZ(3);
  @$pb.TagNumber(4)
  set completedTasks($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompletedTasks() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompletedTasks() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get fileCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set fileCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get warrantyCoverageCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set warrantyCoverageCount($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWarrantyCoverageCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearWarrantyCoverageCount() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get totalValue => $_getN(6);
  @$pb.TagNumber(7)
  set totalValue($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalValue() => clearField(7);

  @$pb.TagNumber(8)
  $0.Timestamp get nextWarrantyExpiry => $_getN(7);
  @$pb.TagNumber(8)
  set nextWarrantyExpiry($0.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasNextWarrantyExpiry() => $_has(7);
  @$pb.TagNumber(8)
  void clearNextWarrantyExpiry() => clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureNextWarrantyExpiry() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Timestamp get lastTaskCompletedAt => $_getN(8);
  @$pb.TagNumber(9)
  set lastTaskCompletedAt($0.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLastTaskCompletedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastTaskCompletedAt() => clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureLastTaskCompletedAt() => $_ensure(8);
}

class AssetFile extends $pb.GeneratedMessage {
  factory AssetFile({
    $core.String? id,
    $core.String? assetId,
    $core.String? fileName,
    $core.String? contentType,
    $fixnum.Int64? sizeBytes,
    $core.String? url,
    $core.String? caption,
    $core.int? displayOrder,
    $core.String? extractedText,
    $core.String? aiSummary,
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
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (sizeBytes != null) {
      $result.sizeBytes = sizeBytes;
    }
    if (url != null) {
      $result.url = url;
    }
    if (caption != null) {
      $result.caption = caption;
    }
    if (displayOrder != null) {
      $result.displayOrder = displayOrder;
    }
    if (extractedText != null) {
      $result.extractedText = extractedText;
    }
    if (aiSummary != null) {
      $result.aiSummary = aiSummary;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  AssetFile._() : super();
  factory AssetFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetFile', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'assetId')
    ..aOS(3, _omitFieldNames ? '' : 'fileName')
    ..aOS(4, _omitFieldNames ? '' : 'contentType')
    ..aInt64(5, _omitFieldNames ? '' : 'sizeBytes')
    ..aOS(6, _omitFieldNames ? '' : 'url')
    ..aOS(7, _omitFieldNames ? '' : 'caption')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'displayOrder', $pb.PbFieldType.O3)
    ..aOS(9, _omitFieldNames ? '' : 'extractedText')
    ..aOS(10, _omitFieldNames ? '' : 'aiSummary')
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(12, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetFile clone() => AssetFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetFile copyWith(void Function(AssetFile) updates) => super.copyWith((message) => updates(message as AssetFile)) as AssetFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetFile create() => AssetFile._();
  AssetFile createEmptyInstance() => create();
  static $pb.PbList<AssetFile> createRepeated() => $pb.PbList<AssetFile>();
  @$core.pragma('dart2js:noInline')
  static AssetFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetFile>(create);
  static AssetFile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get contentType => $_getSZ(3);
  @$pb.TagNumber(4)
  set contentType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContentType() => $_has(3);
  @$pb.TagNumber(4)
  void clearContentType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get sizeBytes => $_getI64(4);
  @$pb.TagNumber(5)
  set sizeBytes($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSizeBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearSizeBytes() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get caption => $_getSZ(6);
  @$pb.TagNumber(7)
  set caption($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCaption() => $_has(6);
  @$pb.TagNumber(7)
  void clearCaption() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get displayOrder => $_getIZ(7);
  @$pb.TagNumber(8)
  set displayOrder($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDisplayOrder() => $_has(7);
  @$pb.TagNumber(8)
  void clearDisplayOrder() => clearField(8);

  /// AI-extracted metadata
  @$pb.TagNumber(9)
  $core.String get extractedText => $_getSZ(8);
  @$pb.TagNumber(9)
  set extractedText($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasExtractedText() => $_has(8);
  @$pb.TagNumber(9)
  void clearExtractedText() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get aiSummary => $_getSZ(9);
  @$pb.TagNumber(10)
  set aiSummary($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAiSummary() => $_has(9);
  @$pb.TagNumber(10)
  void clearAiSummary() => clearField(10);

  @$pb.TagNumber(11)
  $0.Timestamp get createdAt => $_getN(10);
  @$pb.TagNumber(11)
  set createdAt($0.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureCreatedAt() => $_ensure(10);

  @$pb.TagNumber(12)
  $0.Timestamp get updatedAt => $_getN(11);
  @$pb.TagNumber(12)
  set updatedAt($0.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdatedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearUpdatedAt() => clearField(12);
  @$pb.TagNumber(12)
  $0.Timestamp ensureUpdatedAt() => $_ensure(11);
}

class GetAssetFileUploadUrlRequest extends $pb.GeneratedMessage {
  factory GetAssetFileUploadUrlRequest({
    $core.String? assetId,
    $core.String? fileName,
    $core.String? contentType,
    $fixnum.Int64? sizeBytes,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (sizeBytes != null) {
      $result.sizeBytes = sizeBytes;
    }
    return $result;
  }
  GetAssetFileUploadUrlRequest._() : super();
  factory GetAssetFileUploadUrlRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetFileUploadUrlRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetFileUploadUrlRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..aOS(3, _omitFieldNames ? '' : 'contentType')
    ..aInt64(4, _omitFieldNames ? '' : 'sizeBytes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetFileUploadUrlRequest clone() => GetAssetFileUploadUrlRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetFileUploadUrlRequest copyWith(void Function(GetAssetFileUploadUrlRequest) updates) => super.copyWith((message) => updates(message as GetAssetFileUploadUrlRequest)) as GetAssetFileUploadUrlRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetFileUploadUrlRequest create() => GetAssetFileUploadUrlRequest._();
  GetAssetFileUploadUrlRequest createEmptyInstance() => create();
  static $pb.PbList<GetAssetFileUploadUrlRequest> createRepeated() => $pb.PbList<GetAssetFileUploadUrlRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAssetFileUploadUrlRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetFileUploadUrlRequest>(create);
  static GetAssetFileUploadUrlRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get contentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set contentType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearContentType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sizeBytes => $_getI64(3);
  @$pb.TagNumber(4)
  set sizeBytes($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSizeBytes() => $_has(3);
  @$pb.TagNumber(4)
  void clearSizeBytes() => clearField(4);
}

class GetAssetFileUploadUrlResponse extends $pb.GeneratedMessage {
  factory GetAssetFileUploadUrlResponse({
    $core.String? uploadUrl,
    $core.String? fileId,
    $0.Timestamp? expiresAt,
  }) {
    final $result = create();
    if (uploadUrl != null) {
      $result.uploadUrl = uploadUrl;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    return $result;
  }
  GetAssetFileUploadUrlResponse._() : super();
  factory GetAssetFileUploadUrlResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAssetFileUploadUrlResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAssetFileUploadUrlResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uploadUrl')
    ..aOS(2, _omitFieldNames ? '' : 'fileId')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'expiresAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAssetFileUploadUrlResponse clone() => GetAssetFileUploadUrlResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAssetFileUploadUrlResponse copyWith(void Function(GetAssetFileUploadUrlResponse) updates) => super.copyWith((message) => updates(message as GetAssetFileUploadUrlResponse)) as GetAssetFileUploadUrlResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAssetFileUploadUrlResponse create() => GetAssetFileUploadUrlResponse._();
  GetAssetFileUploadUrlResponse createEmptyInstance() => create();
  static $pb.PbList<GetAssetFileUploadUrlResponse> createRepeated() => $pb.PbList<GetAssetFileUploadUrlResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAssetFileUploadUrlResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAssetFileUploadUrlResponse>(create);
  static GetAssetFileUploadUrlResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uploadUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set uploadUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUploadUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUploadUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileId => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileId() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get expiresAt => $_getN(2);
  @$pb.TagNumber(3)
  set expiresAt($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpiresAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresAt() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureExpiresAt() => $_ensure(2);
}

class ConfirmAssetFileUploadRequest extends $pb.GeneratedMessage {
  factory ConfirmAssetFileUploadRequest({
    $core.String? fileId,
    $core.String? assetId,
    $core.String? caption,
  }) {
    final $result = create();
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (caption != null) {
      $result.caption = caption;
    }
    return $result;
  }
  ConfirmAssetFileUploadRequest._() : super();
  factory ConfirmAssetFileUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfirmAssetFileUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfirmAssetFileUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId')
    ..aOS(2, _omitFieldNames ? '' : 'assetId')
    ..aOS(3, _omitFieldNames ? '' : 'caption')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfirmAssetFileUploadRequest clone() => ConfirmAssetFileUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfirmAssetFileUploadRequest copyWith(void Function(ConfirmAssetFileUploadRequest) updates) => super.copyWith((message) => updates(message as ConfirmAssetFileUploadRequest)) as ConfirmAssetFileUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfirmAssetFileUploadRequest create() => ConfirmAssetFileUploadRequest._();
  ConfirmAssetFileUploadRequest createEmptyInstance() => create();
  static $pb.PbList<ConfirmAssetFileUploadRequest> createRepeated() => $pb.PbList<ConfirmAssetFileUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static ConfirmAssetFileUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfirmAssetFileUploadRequest>(create);
  static ConfirmAssetFileUploadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get caption => $_getSZ(2);
  @$pb.TagNumber(3)
  set caption($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCaption() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaption() => clearField(3);
}

class ListAssetFilesRequest extends $pb.GeneratedMessage {
  factory ListAssetFilesRequest({
    $core.String? assetId,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  ListAssetFilesRequest._() : super();
  factory ListAssetFilesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAssetFilesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAssetFilesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAssetFilesRequest clone() => ListAssetFilesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAssetFilesRequest copyWith(void Function(ListAssetFilesRequest) updates) => super.copyWith((message) => updates(message as ListAssetFilesRequest)) as ListAssetFilesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAssetFilesRequest create() => ListAssetFilesRequest._();
  ListAssetFilesRequest createEmptyInstance() => create();
  static $pb.PbList<ListAssetFilesRequest> createRepeated() => $pb.PbList<ListAssetFilesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAssetFilesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAssetFilesRequest>(create);
  static ListAssetFilesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);
}

class ListAssetFilesResponse extends $pb.GeneratedMessage {
  factory ListAssetFilesResponse({
    $core.Iterable<AssetFile>? files,
    $core.int? total,
  }) {
    final $result = create();
    if (files != null) {
      $result.files.addAll(files);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ListAssetFilesResponse._() : super();
  factory ListAssetFilesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAssetFilesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAssetFilesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<AssetFile>(1, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM, subBuilder: AssetFile.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAssetFilesResponse clone() => ListAssetFilesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAssetFilesResponse copyWith(void Function(ListAssetFilesResponse) updates) => super.copyWith((message) => updates(message as ListAssetFilesResponse)) as ListAssetFilesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAssetFilesResponse create() => ListAssetFilesResponse._();
  ListAssetFilesResponse createEmptyInstance() => create();
  static $pb.PbList<ListAssetFilesResponse> createRepeated() => $pb.PbList<ListAssetFilesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAssetFilesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAssetFilesResponse>(create);
  static ListAssetFilesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AssetFile> get files => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

class DeleteAssetFileRequest extends $pb.GeneratedMessage {
  factory DeleteAssetFileRequest({
    $core.String? id,
    $core.String? assetId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (assetId != null) {
      $result.assetId = assetId;
    }
    return $result;
  }
  DeleteAssetFileRequest._() : super();
  factory DeleteAssetFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAssetFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAssetFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'assetId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAssetFileRequest clone() => DeleteAssetFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAssetFileRequest copyWith(void Function(DeleteAssetFileRequest) updates) => super.copyWith((message) => updates(message as DeleteAssetFileRequest)) as DeleteAssetFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAssetFileRequest create() => DeleteAssetFileRequest._();
  DeleteAssetFileRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAssetFileRequest> createRepeated() => $pb.PbList<DeleteAssetFileRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAssetFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAssetFileRequest>(create);
  static DeleteAssetFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetId() => clearField(2);
}

class DeleteAssetFileResponse extends $pb.GeneratedMessage {
  factory DeleteAssetFileResponse() => create();
  DeleteAssetFileResponse._() : super();
  factory DeleteAssetFileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAssetFileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAssetFileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAssetFileResponse clone() => DeleteAssetFileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAssetFileResponse copyWith(void Function(DeleteAssetFileResponse) updates) => super.copyWith((message) => updates(message as DeleteAssetFileResponse)) as DeleteAssetFileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAssetFileResponse create() => DeleteAssetFileResponse._();
  DeleteAssetFileResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteAssetFileResponse> createRepeated() => $pb.PbList<DeleteAssetFileResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteAssetFileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAssetFileResponse>(create);
  static DeleteAssetFileResponse? _defaultInstance;
}

class UpdateAssetFileRequest extends $pb.GeneratedMessage {
  factory UpdateAssetFileRequest({
    $core.String? id,
    $core.String? assetId,
    $core.String? caption,
    $core.int? displayOrder,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (assetId != null) {
      $result.assetId = assetId;
    }
    if (caption != null) {
      $result.caption = caption;
    }
    if (displayOrder != null) {
      $result.displayOrder = displayOrder;
    }
    return $result;
  }
  UpdateAssetFileRequest._() : super();
  factory UpdateAssetFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAssetFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAssetFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'assetId')
    ..aOS(3, _omitFieldNames ? '' : 'caption')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'displayOrder', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAssetFileRequest clone() => UpdateAssetFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAssetFileRequest copyWith(void Function(UpdateAssetFileRequest) updates) => super.copyWith((message) => updates(message as UpdateAssetFileRequest)) as UpdateAssetFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssetFileRequest create() => UpdateAssetFileRequest._();
  UpdateAssetFileRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAssetFileRequest> createRepeated() => $pb.PbList<UpdateAssetFileRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssetFileRequest>(create);
  static UpdateAssetFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get caption => $_getSZ(2);
  @$pb.TagNumber(3)
  set caption($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCaption() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaption() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get displayOrder => $_getIZ(3);
  @$pb.TagNumber(4)
  set displayOrder($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisplayOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisplayOrder() => clearField(4);
}

class AssetServiceApi {
  $pb.RpcClient _client;
  AssetServiceApi(this._client);

  $async.Future<Asset> createAsset($pb.ClientContext? ctx, CreateAssetRequest request) =>
    _client.invoke<Asset>(ctx, 'AssetService', 'CreateAsset', request, Asset())
  ;
  $async.Future<AssetWithDetails> getAsset($pb.ClientContext? ctx, GetAssetRequest request) =>
    _client.invoke<AssetWithDetails>(ctx, 'AssetService', 'GetAsset', request, AssetWithDetails())
  ;
  $async.Future<Asset> updateAsset($pb.ClientContext? ctx, UpdateAssetRequest request) =>
    _client.invoke<Asset>(ctx, 'AssetService', 'UpdateAsset', request, Asset())
  ;
  $async.Future<DeleteAssetResponse> deleteAsset($pb.ClientContext? ctx, DeleteAssetRequest request) =>
    _client.invoke<DeleteAssetResponse>(ctx, 'AssetService', 'DeleteAsset', request, DeleteAssetResponse())
  ;
  $async.Future<ListAssetsResponse> listAssets($pb.ClientContext? ctx, ListAssetsRequest request) =>
    _client.invoke<ListAssetsResponse>(ctx, 'AssetService', 'ListAssets', request, ListAssetsResponse())
  ;
  $async.Future<BulkUpdateAssetsResponse> bulkUpdateAssets($pb.ClientContext? ctx, BulkUpdateAssetsRequest request) =>
    _client.invoke<BulkUpdateAssetsResponse>(ctx, 'AssetService', 'BulkUpdateAssets', request, BulkUpdateAssetsResponse())
  ;
  $async.Future<BulkDeleteAssetsResponse> bulkDeleteAssets($pb.ClientContext? ctx, BulkDeleteAssetsRequest request) =>
    _client.invoke<BulkDeleteAssetsResponse>(ctx, 'AssetService', 'BulkDeleteAssets', request, BulkDeleteAssetsResponse())
  ;
  $async.Future<GetAssetLocationsResponse> getAssetLocations($pb.ClientContext? ctx, GetAssetLocationsRequest request) =>
    _client.invoke<GetAssetLocationsResponse>(ctx, 'AssetService', 'GetAssetLocations', request, GetAssetLocationsResponse())
  ;
  $async.Future<GetAssetDivisionsResponse> getAssetDivisions($pb.ClientContext? ctx, GetAssetDivisionsRequest request) =>
    _client.invoke<GetAssetDivisionsResponse>(ctx, 'AssetService', 'GetAssetDivisions', request, GetAssetDivisionsResponse())
  ;
  $async.Future<AssetStatistics> getAssetStatistics($pb.ClientContext? ctx, GetAssetStatisticsRequest request) =>
    _client.invoke<AssetStatistics>(ctx, 'AssetService', 'GetAssetStatistics', request, AssetStatistics())
  ;
  $async.Future<GetAssetFileUploadUrlResponse> getAssetFileUploadUrl($pb.ClientContext? ctx, GetAssetFileUploadUrlRequest request) =>
    _client.invoke<GetAssetFileUploadUrlResponse>(ctx, 'AssetService', 'GetAssetFileUploadUrl', request, GetAssetFileUploadUrlResponse())
  ;
  $async.Future<AssetFile> confirmAssetFileUpload($pb.ClientContext? ctx, ConfirmAssetFileUploadRequest request) =>
    _client.invoke<AssetFile>(ctx, 'AssetService', 'ConfirmAssetFileUpload', request, AssetFile())
  ;
  $async.Future<ListAssetFilesResponse> listAssetFiles($pb.ClientContext? ctx, ListAssetFilesRequest request) =>
    _client.invoke<ListAssetFilesResponse>(ctx, 'AssetService', 'ListAssetFiles', request, ListAssetFilesResponse())
  ;
  $async.Future<DeleteAssetFileResponse> deleteAssetFile($pb.ClientContext? ctx, DeleteAssetFileRequest request) =>
    _client.invoke<DeleteAssetFileResponse>(ctx, 'AssetService', 'DeleteAssetFile', request, DeleteAssetFileResponse())
  ;
  $async.Future<AssetFile> updateAssetFile($pb.ClientContext? ctx, UpdateAssetFileRequest request) =>
    _client.invoke<AssetFile>(ctx, 'AssetService', 'UpdateAssetFile', request, AssetFile())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
