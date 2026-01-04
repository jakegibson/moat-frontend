import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/asset.pb.dart';

/// ConnectRPC client for AssetService.
///
/// Uses generated protobuf types and the ConnectRPC transport for type-safe
/// RPC calls.
@lazySingleton
class AssetServiceClient {
  final Client _client;

  AssetServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.AssetService';

  // ============================================================================
  // Core CRUD RPCs
  // ============================================================================

  Future<Asset> createAsset(CreateAssetRequest request) {
    return _client.unary(
      Spec<CreateAssetRequest, Asset>(
        '$_service/CreateAsset',
        StreamType.unary,
        CreateAssetRequest.create,
        Asset.create,
      ),
      request,
    );
  }

  Future<AssetWithDetails> getAsset(GetAssetRequest request) {
    return _client.unary(
      Spec<GetAssetRequest, AssetWithDetails>(
        '$_service/GetAsset',
        StreamType.unary,
        GetAssetRequest.create,
        AssetWithDetails.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<Asset> updateAsset(UpdateAssetRequest request) {
    return _client.unary(
      Spec<UpdateAssetRequest, Asset>(
        '$_service/UpdateAsset',
        StreamType.unary,
        UpdateAssetRequest.create,
        Asset.create,
      ),
      request,
    );
  }

  Future<DeleteAssetResponse> deleteAsset(DeleteAssetRequest request) {
    return _client.unary(
      Spec<DeleteAssetRequest, DeleteAssetResponse>(
        '$_service/DeleteAsset',
        StreamType.unary,
        DeleteAssetRequest.create,
        DeleteAssetResponse.create,
      ),
      request,
    );
  }

  Future<ListAssetsResponse> listAssets(ListAssetsRequest request) {
    return _client.unary(
      Spec<ListAssetsRequest, ListAssetsResponse>(
        '$_service/ListAssets',
        StreamType.unary,
        ListAssetsRequest.create,
        ListAssetsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Bulk Operations RPCs
  // ============================================================================

  Future<BulkUpdateAssetsResponse> bulkUpdateAssets(
      BulkUpdateAssetsRequest request) {
    return _client.unary(
      Spec<BulkUpdateAssetsRequest, BulkUpdateAssetsResponse>(
        '$_service/BulkUpdateAssets',
        StreamType.unary,
        BulkUpdateAssetsRequest.create,
        BulkUpdateAssetsResponse.create,
      ),
      request,
    );
  }

  Future<BulkDeleteAssetsResponse> bulkDeleteAssets(
      BulkDeleteAssetsRequest request) {
    return _client.unary(
      Spec<BulkDeleteAssetsRequest, BulkDeleteAssetsResponse>(
        '$_service/BulkDeleteAssets',
        StreamType.unary,
        BulkDeleteAssetsRequest.create,
        BulkDeleteAssetsResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Support RPCs
  // ============================================================================

  Future<GetAssetLocationsResponse> getAssetLocations(
      GetAssetLocationsRequest request) {
    return _client.unary(
      Spec<GetAssetLocationsRequest, GetAssetLocationsResponse>(
        '$_service/GetAssetLocations',
        StreamType.unary,
        GetAssetLocationsRequest.create,
        GetAssetLocationsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GetAssetDivisionsResponse> getAssetDivisions(
      GetAssetDivisionsRequest request) {
    return _client.unary(
      Spec<GetAssetDivisionsRequest, GetAssetDivisionsResponse>(
        '$_service/GetAssetDivisions',
        StreamType.unary,
        GetAssetDivisionsRequest.create,
        GetAssetDivisionsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<AssetStatistics> getAssetStatistics(
      GetAssetStatisticsRequest request) {
    return _client.unary(
      Spec<GetAssetStatisticsRequest, AssetStatistics>(
        '$_service/GetAssetStatistics',
        StreamType.unary,
        GetAssetStatisticsRequest.create,
        AssetStatistics.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Asset Files RPCs
  // ============================================================================

  Future<GetAssetFileUploadUrlResponse> getAssetFileUploadUrl(
      GetAssetFileUploadUrlRequest request) {
    return _client.unary(
      Spec<GetAssetFileUploadUrlRequest, GetAssetFileUploadUrlResponse>(
        '$_service/GetAssetFileUploadUrl',
        StreamType.unary,
        GetAssetFileUploadUrlRequest.create,
        GetAssetFileUploadUrlResponse.create,
      ),
      request,
    );
  }

  Future<AssetFile> confirmAssetFileUpload(
      ConfirmAssetFileUploadRequest request) {
    return _client.unary(
      Spec<ConfirmAssetFileUploadRequest, AssetFile>(
        '$_service/ConfirmAssetFileUpload',
        StreamType.unary,
        ConfirmAssetFileUploadRequest.create,
        AssetFile.create,
      ),
      request,
    );
  }

  Future<ListAssetFilesResponse> listAssetFiles(ListAssetFilesRequest request) {
    return _client.unary(
      Spec<ListAssetFilesRequest, ListAssetFilesResponse>(
        '$_service/ListAssetFiles',
        StreamType.unary,
        ListAssetFilesRequest.create,
        ListAssetFilesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<DeleteAssetFileResponse> deleteAssetFile(
      DeleteAssetFileRequest request) {
    return _client.unary(
      Spec<DeleteAssetFileRequest, DeleteAssetFileResponse>(
        '$_service/DeleteAssetFile',
        StreamType.unary,
        DeleteAssetFileRequest.create,
        DeleteAssetFileResponse.create,
      ),
      request,
    );
  }

  Future<AssetFile> updateAssetFile(UpdateAssetFileRequest request) {
    return _client.unary(
      Spec<UpdateAssetFileRequest, AssetFile>(
        '$_service/UpdateAssetFile',
        StreamType.unary,
        UpdateAssetFileRequest.create,
        AssetFile.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Asset Messages (Document Chat) RPCs
  // ============================================================================

  Future<ListAssetMessagesResponse> listAssetMessages(
      ListAssetMessagesRequest request) {
    return _client.unary(
      Spec<ListAssetMessagesRequest, ListAssetMessagesResponse>(
        '$_service/ListAssetMessages',
        StreamType.unary,
        ListAssetMessagesRequest.create,
        ListAssetMessagesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<CreateAssetMessageResponse> createAssetMessage(
      CreateAssetMessageRequest request) {
    return _client.unary(
      Spec<CreateAssetMessageRequest, CreateAssetMessageResponse>(
        '$_service/CreateAssetMessage',
        StreamType.unary,
        CreateAssetMessageRequest.create,
        CreateAssetMessageResponse.create,
      ),
      request,
    );
  }
}
