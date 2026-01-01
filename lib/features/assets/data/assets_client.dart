import 'package:injectable/injectable.dart';

import '../state/assets_state.dart';

// TODO: Import generated proto client
// import '../../../gen/proto/moat/v1/assets.connect.client.dart';
// import '../../../gen/proto/moat/v1/assets.pb.dart';

/// Client for asset-related API calls
@lazySingleton
class AssetsClient {
  AssetsClient();

  /// List assets with optional filters
  Future<List<Asset>> listAssets({
    required int page,
    required int pageSize,
    List<String>? statuses,
    String? search,
    String? locationId,
    String? sortBy,
    bool? sortDesc,
  }) async {
    // TODO: Use generated client when protos are available
    // final client = AssetServiceClient(_transport);
    // final response = await client.listAssets(
    //   ListAssetsRequest(
    //     pagination: PaginationRequest(page: page, limit: pageSize),
    //     statusFilter: statuses?.map(stringToAssetStatus).toList() ?? [],
    //     search: search,
    //     locationId: locationId,
    //   ),
    // );
    // return response.assets.map(_assetFromProto).toList();

    // Placeholder implementation
    throw UnimplementedError('Proto clients not yet generated');
  }

  /// Get a single asset by ID
  Future<Asset> getAsset(String id) async {
    // TODO: Use generated client when protos are available
    // final client = AssetServiceClient(_transport);
    // final response = await client.getAsset(GetAssetRequest(id: id));
    // return _assetFromProto(response.asset);

    throw UnimplementedError('Proto clients not yet generated');
  }

  /// Create a new asset
  Future<Asset> createAsset({
    required String name,
    String? locationId,
    double? priceValue,
  }) async {
    // TODO: Use generated client when protos are available
    // final client = AssetServiceClient(_transport);
    // final response = await client.createAsset(
    //   CreateAssetRequest(
    //     name: name,
    //     locationId: locationId,
    //     priceValue: priceValue,
    //   ),
    // );
    // return _assetFromProto(response.asset);

    throw UnimplementedError('Proto clients not yet generated');
  }

  /// Update an existing asset
  Future<Asset> updateAsset(Asset asset) async {
    // TODO: Use generated client when protos are available
    throw UnimplementedError('Proto clients not yet generated');
  }

  /// Delete an asset
  Future<void> deleteAsset(String id) async {
    // TODO: Use generated client when protos are available
    // final client = AssetServiceClient(_transport);
    // await client.deleteAsset(DeleteAssetRequest(id: id));

    throw UnimplementedError('Proto clients not yet generated');
  }

  // Helper to convert proto to domain model
  // Asset _assetFromProto(AssetProto proto) {
  //   return Asset(
  //     id: proto.id,
  //     companyId: proto.companyId,
  //     name: proto.name,
  //     status: proto.status.name,
  //     locationId: proto.hasLocationId() ? proto.locationId : null,
  //     locationName: proto.hasLocationName() ? proto.locationName : null,
  //     createdAt: proto.createdAt.toDateTime(),
  //     updatedAt: proto.updatedAt.toDateTime(),
  //   );
  // }
}
