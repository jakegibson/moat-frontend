import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

import '../../../core/transport/asset_service_client.dart';
import '../../../gen/google/protobuf/timestamp.pb.dart' as ts_pb;
import '../../../gen/moat/v1/asset.pb.dart' as pb;
import 'assets_models.dart';

/// Client for asset-related API calls.
///
/// Uses the ConnectRPC AssetServiceClient and converts between protobuf
/// types and domain models.
@lazySingleton
class AssetsClient {
  final AssetServiceClient _rpc;

  AssetsClient(this._rpc);

  // ============================================================================
  // List and Get
  // ============================================================================

  /// List assets with optional filters and pagination.
  Future<PaginatedAssets> listAssets({
    int limit = 25,
    int offset = 0,
    List<String>? statuses,
    String? search,
    String? locationId,
    String? divisionCode,
    String? sortBy,
    bool sortDesc = false,
  }) async {
    final request = pb.ListAssetsRequest(
      limit: limit,
      offset: offset,
    );

    if (statuses != null && statuses.isNotEmpty) {
      request.statuses.addAll(statuses.map(_toProtoStatus));
    }
    if (search != null && search.isNotEmpty) {
      request.search = search;
    }
    if (locationId != null) {
      request.locationIds.add(locationId);
    }
    if (divisionCode != null) {
      request.divisionCodes.add(divisionCode);
    }
    if (sortBy != null) {
      request.sortBy = sortBy;
      request.sortOrder = sortDesc ? 'desc' : 'asc';
    }

    final response = await _rpc.listAssets(request);

    return PaginatedAssets(
      items: response.items.map(_fromProtoAssetWithDetails).toList(),
      total: response.total,
      limit: limit,
      offset: offset,
    );
  }

  /// Get a single asset by ID.
  Future<Asset> getAsset(String id) async {
    final request = pb.GetAssetRequest(id: id);
    final response = await _rpc.getAsset(request);
    return _fromProtoAssetWithDetails(response);
  }

  // ============================================================================
  // Create, Update, Delete
  // ============================================================================

  /// Create a new asset.
  Future<Asset> createAsset({
    required String name,
    required String locationId,
    String? technicalName,
    String? notes,
    String? divisionOfConstruction,
    String? manufacturer,
    String? serialNumber,
    String? modelNumber,
    double? priceValue,
    DateTime? purchaseDate,
    DateTime? warrantyStartDate,
    int? warrantyDurationMonths,
  }) async {
    final request = pb.CreateAssetRequest(
      name: name,
      locationId: locationId,
    );

    if (technicalName != null) request.technicalName = technicalName;
    if (notes != null) request.notes = notes;
    if (divisionOfConstruction != null) {
      request.divisionOfConstruction = divisionOfConstruction;
    }
    if (manufacturer != null) request.manufacturer = manufacturer;
    if (serialNumber != null) request.serialNumber = serialNumber;
    if (modelNumber != null) request.modelNumber = modelNumber;
    if (priceValue != null) request.priceValue = priceValue;
    if (purchaseDate != null) {
      request.purchaseDate = _toTimestamp(purchaseDate);
    }
    if (warrantyStartDate != null) {
      request.warrantyStartDate = _toTimestamp(warrantyStartDate);
    }
    if (warrantyDurationMonths != null) {
      request.warrantyDurationMonths = warrantyDurationMonths;
    }

    final response = await _rpc.createAsset(request);
    return _fromProtoAsset(response);
  }

  /// Update an existing asset.
  Future<Asset> updateAsset(Asset asset) async {
    final request = pb.UpdateAssetRequest(id: asset.id);

    request.name = asset.name;
    if (asset.locationId != null) request.locationId = asset.locationId!;
    if (asset.technicalName != null) {
      request.technicalName = asset.technicalName!;
    }
    if (asset.notes != null) request.notes = asset.notes!;
    if (asset.divisionOfConstruction != null) {
      request.divisionOfConstruction = asset.divisionOfConstruction!;
    }
    if (asset.manufacturer != null) request.manufacturer = asset.manufacturer!;
    if (asset.serialNumber != null) request.serialNumber = asset.serialNumber!;
    if (asset.modelNumber != null) request.modelNumber = asset.modelNumber!;
    if (asset.priceValue != null) request.priceValue = asset.priceValue!;
    if (asset.purchaseDate != null) {
      request.purchaseDate = _toTimestamp(asset.purchaseDate!);
    }
    if (asset.warrantyStartDate != null) {
      request.warrantyStartDate = _toTimestamp(asset.warrantyStartDate!);
    }
    if (asset.warrantyDurationMonths != null) {
      request.warrantyDurationMonths = asset.warrantyDurationMonths!;
    }
    request.status = _toProtoStatus(asset.status);

    final response = await _rpc.updateAsset(request);
    return _fromProtoAsset(response);
  }

  /// Delete an asset.
  Future<void> deleteAsset(String id) async {
    final request = pb.DeleteAssetRequest(id: id);
    await _rpc.deleteAsset(request);
  }

  // ============================================================================
  // Conversion helpers
  // ============================================================================

  Asset _fromProtoAsset(pb.Asset proto) {
    return Asset(
      id: proto.id,
      companyId: proto.companyId,
      name: proto.name,
      status: _fromProtoStatus(proto.status),
      processStatus: _fromProtoProcessStatus(proto.processStatus),
      technicalName: proto.hasTechnicalName() ? proto.technicalName : null,
      notes: proto.hasNotes() ? proto.notes : null,
      locationId: proto.hasLocationId() ? proto.locationId : null,
      // Note: pb.Asset doesn't have locationName, only AssetWithDetails does
      floorLocation: proto.hasFloorLocation() ? proto.floorLocation : null,
      serviceArea: proto.hasServiceArea() ? proto.serviceArea : null,
      internalId: proto.hasInternalId() ? proto.internalId : null,
      divisionOfConstruction:
          proto.hasDivisionOfConstruction() ? proto.divisionOfConstruction : null,
      provider: proto.hasProvider() ? proto.provider : null,
      manufacturer: proto.hasManufacturer() ? proto.manufacturer : null,
      serialNumber: proto.hasSerialNumber() ? proto.serialNumber : null,
      modelNumber: proto.hasModelNumber() ? proto.modelNumber : null,
      aiSerialNumber: proto.hasAiSerialNumber() ? proto.aiSerialNumber : null,
      aiModelNumber: proto.hasAiModelNumber() ? proto.aiModelNumber : null,
      priceValue: proto.hasPriceValue() ? proto.priceValue : null,
      purchasePrice: proto.hasPurchasePrice() ? proto.purchasePrice : null,
      aiPriceValue: proto.hasAiPriceValue() ? proto.aiPriceValue : null,
      startDate: proto.hasStartDate() ? _fromTimestamp(proto.startDate) : null,
      substantialCompletionDate: proto.hasSubstantialCompletionDate()
          ? _fromTimestamp(proto.substantialCompletionDate)
          : null,
      documentDate:
          proto.hasDocumentDate() ? _fromTimestamp(proto.documentDate) : null,
      dueDate: proto.hasDueDate() ? _fromTimestamp(proto.dueDate) : null,
      installationDate: proto.hasInstallationDate()
          ? _fromTimestamp(proto.installationDate)
          : null,
      invoiceDate:
          proto.hasInvoiceDate() ? _fromTimestamp(proto.invoiceDate) : null,
      purchaseDate:
          proto.hasPurchaseDate() ? _fromTimestamp(proto.purchaseDate) : null,
      warrantyDurationMonths:
          proto.hasWarrantyDurationMonths() ? proto.warrantyDurationMonths : null,
      warrantyStartDate: proto.hasWarrantyStartDate()
          ? _fromTimestamp(proto.warrantyStartDate)
          : null,
      warrantyEndDate: proto.hasWarrantyEndDate()
          ? _fromTimestamp(proto.warrantyEndDate)
          : null,
      aiWarrantyStartDate: proto.hasAiWarrantyStartDate()
          ? _fromTimestamp(proto.aiWarrantyStartDate)
          : null,
      ignoreWarrantyStartDate: proto.ignoreWarrantyStartDate,
      allCoveragesResolvedAndExpired: proto.allCoveragesResolvedAndExpired,
      createdAt: proto.hasCreatedAt()
          ? _fromTimestamp(proto.createdAt)
          : DateTime.now(),
      updatedAt: proto.hasUpdatedAt()
          ? _fromTimestamp(proto.updatedAt)
          : DateTime.now(),
    );
  }

  /// AssetWithDetails is a flat structure with all fields directly accessible.
  Asset _fromProtoAssetWithDetails(pb.AssetWithDetails proto) {
    return Asset(
      id: proto.id,
      companyId: proto.companyId,
      name: proto.name,
      status: _fromProtoStatus(proto.status),
      processStatus: _fromProtoProcessStatus(proto.processStatus),
      technicalName: proto.hasTechnicalName() ? proto.technicalName : null,
      notes: proto.hasNotes() ? proto.notes : null,
      locationId: proto.hasLocationId() ? proto.locationId : null,
      locationName: proto.hasLocationName() ? proto.locationName : null,
      floorLocation: proto.hasFloorLocation() ? proto.floorLocation : null,
      serviceArea: proto.hasServiceArea() ? proto.serviceArea : null,
      internalId: proto.hasInternalId() ? proto.internalId : null,
      divisionOfConstruction:
          proto.hasDivisionOfConstruction() ? proto.divisionOfConstruction : null,
      provider: proto.hasProvider() ? proto.provider : null,
      manufacturer: proto.hasManufacturer() ? proto.manufacturer : null,
      serialNumber: proto.hasSerialNumber() ? proto.serialNumber : null,
      modelNumber: proto.hasModelNumber() ? proto.modelNumber : null,
      aiSerialNumber: proto.hasAiSerialNumber() ? proto.aiSerialNumber : null,
      aiModelNumber: proto.hasAiModelNumber() ? proto.aiModelNumber : null,
      priceValue: proto.hasPriceValue() ? proto.priceValue : null,
      purchasePrice: proto.hasPurchasePrice() ? proto.purchasePrice : null,
      aiPriceValue: proto.hasAiPriceValue() ? proto.aiPriceValue : null,
      startDate: proto.hasStartDate() ? _fromTimestamp(proto.startDate) : null,
      substantialCompletionDate: proto.hasSubstantialCompletionDate()
          ? _fromTimestamp(proto.substantialCompletionDate)
          : null,
      documentDate:
          proto.hasDocumentDate() ? _fromTimestamp(proto.documentDate) : null,
      dueDate: proto.hasDueDate() ? _fromTimestamp(proto.dueDate) : null,
      installationDate: proto.hasInstallationDate()
          ? _fromTimestamp(proto.installationDate)
          : null,
      invoiceDate:
          proto.hasInvoiceDate() ? _fromTimestamp(proto.invoiceDate) : null,
      purchaseDate:
          proto.hasPurchaseDate() ? _fromTimestamp(proto.purchaseDate) : null,
      warrantyDurationMonths:
          proto.hasWarrantyDurationMonths() ? proto.warrantyDurationMonths : null,
      warrantyStartDate: proto.hasWarrantyStartDate()
          ? _fromTimestamp(proto.warrantyStartDate)
          : null,
      warrantyEndDate: proto.hasWarrantyEndDate()
          ? _fromTimestamp(proto.warrantyEndDate)
          : null,
      aiWarrantyStartDate: proto.hasAiWarrantyStartDate()
          ? _fromTimestamp(proto.aiWarrantyStartDate)
          : null,
      ignoreWarrantyStartDate: proto.ignoreWarrantyStartDate,
      allCoveragesResolvedAndExpired: proto.allCoveragesResolvedAndExpired,
      createdAt: proto.hasCreatedAt()
          ? _fromTimestamp(proto.createdAt)
          : DateTime.now(),
      updatedAt: proto.hasUpdatedAt()
          ? _fromTimestamp(proto.updatedAt)
          : DateTime.now(),
    );
  }

  String _fromProtoStatus(pb.AssetStatus status) {
    switch (status) {
      case pb.AssetStatus.ASSET_STATUS_ACTIVE:
        return AssetStatus.active;
      case pb.AssetStatus.ASSET_STATUS_INACTIVE:
        return AssetStatus.inactive;
      case pb.AssetStatus.ASSET_STATUS_RETIRED:
        return AssetStatus.retired;
      case pb.AssetStatus.ASSET_STATUS_DISPOSED:
        return AssetStatus.disposed;
      case pb.AssetStatus.ASSET_STATUS_DRAFT:
        return AssetStatus.draft;
      default:
        return AssetStatus.active;
    }
  }

  pb.AssetStatus _toProtoStatus(String status) {
    switch (status) {
      case AssetStatus.active:
        return pb.AssetStatus.ASSET_STATUS_ACTIVE;
      case AssetStatus.inactive:
        return pb.AssetStatus.ASSET_STATUS_INACTIVE;
      case AssetStatus.retired:
        return pb.AssetStatus.ASSET_STATUS_RETIRED;
      case AssetStatus.disposed:
        return pb.AssetStatus.ASSET_STATUS_DISPOSED;
      case AssetStatus.draft:
        return pb.AssetStatus.ASSET_STATUS_DRAFT;
      default:
        return pb.AssetStatus.ASSET_STATUS_ACTIVE;
    }
  }

  String _fromProtoProcessStatus(pb.AssetProcessStatus status) {
    switch (status) {
      case pb.AssetProcessStatus.ASSET_PROCESS_STATUS_PENDING:
      case pb.AssetProcessStatus.ASSET_PROCESS_STATUS_PROCESSING:
        return AssetProcessStatus.processing;
      case pb.AssetProcessStatus.ASSET_PROCESS_STATUS_COMPLETED:
        return AssetProcessStatus.completed;
      case pb.AssetProcessStatus.ASSET_PROCESS_STATUS_FAILED:
        return AssetProcessStatus.failed;
      default:
        return AssetProcessStatus.completed;
    }
  }

  ts_pb.Timestamp _toTimestamp(DateTime dt) {
    return ts_pb.Timestamp(
      seconds: Int64(dt.millisecondsSinceEpoch ~/ 1000),
      nanos: (dt.millisecondsSinceEpoch % 1000) * 1000000,
    );
  }

  DateTime _fromTimestamp(ts_pb.Timestamp ts) {
    return DateTime.fromMillisecondsSinceEpoch(
      ts.seconds.toInt() * 1000 + ts.nanos ~/ 1000000,
    );
  }

  // ============================================================================
  // Asset Files (Documents/PDFs)
  // ============================================================================

  /// List files (documents) for an asset.
  Future<List<AssetFile>> listAssetFiles(
    String assetId, {
    int limit = 50,
    int offset = 0,
  }) async {
    final request = pb.ListAssetFilesRequest(
      assetId: assetId,
      limit: limit,
      offset: offset,
    );

    final response = await _rpc.listAssetFiles(request);
    return response.files.map(_fromProtoAssetFile).toList();
  }

  AssetFile _fromProtoAssetFile(pb.AssetFile proto) {
    return AssetFile(
      id: proto.id,
      assetId: proto.assetId,
      fileName: proto.fileName,
      contentType: proto.contentType,
      sizeBytes: proto.sizeBytes.toInt(),
      url: proto.url,
      caption: null, // TODO: Add caption field to AssetFile proto
      createdAt: proto.hasCreatedAt()
          ? _fromTimestamp(proto.createdAt)
          : DateTime.now(),
      updatedAt: proto.hasUpdatedAt()
          ? _fromTimestamp(proto.updatedAt)
          : DateTime.now(),
    );
  }

  // ============================================================================
  // Asset Messages (Document Chat)
  // ============================================================================

  /// List messages for an asset.
  Future<List<AssetMessage>> listAssetMessages(
    String assetId, {
    int limit = 50,
    int offset = 0,
  }) async {
    final request = pb.ListAssetMessagesRequest(
      assetId: assetId,
      limit: limit,
      offset: offset,
    );

    final response = await _rpc.listAssetMessages(request);
    return response.messages.map(_fromProtoAssetMessage).toList();
  }

  /// Create a new message and trigger AI response.
  Future<AssetMessage> createAssetMessage(String assetId, String prompt) async {
    final request = pb.CreateAssetMessageRequest(
      assetId: assetId,
      prompt: prompt,
    );

    final response = await _rpc.createAssetMessage(request);
    return _fromProtoAssetMessage(response.message);
  }

  AssetMessage _fromProtoAssetMessage(pb.AssetMessage proto) {
    return AssetMessage(
      id: proto.id,
      assetId: proto.assetId,
      prompt: proto.prompt,
      response: proto.hasResponse() ? proto.response : null,
      createdAt: proto.hasCreatedAt()
          ? _fromTimestamp(proto.createdAt)
          : DateTime.now(),
    );
  }
}
