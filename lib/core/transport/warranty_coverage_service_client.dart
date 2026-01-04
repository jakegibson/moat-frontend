import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/warranty_coverage.pb.dart';

/// ConnectRPC client for WarrantyCoverageService.
///
/// Uses generated protobuf types and the ConnectRPC transport for type-safe
/// RPC calls.
@lazySingleton
class WarrantyCoverageServiceClient {
  final Client _client;

  WarrantyCoverageServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.WarrantyCoverageService';

  // ============================================================================
  // Warranty Coverage CRUD RPCs
  // ============================================================================

  Future<WarrantyCoverage> getWarrantyCoverage(GetWarrantyCoverageRequest request) {
    return _client.unary(
      Spec<GetWarrantyCoverageRequest, WarrantyCoverage>(
        '$_service/GetWarrantyCoverage',
        StreamType.unary,
        GetWarrantyCoverageRequest.create,
        WarrantyCoverage.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<ListWarrantyCoveragesResponse> listWarrantyCoverages(
      ListWarrantyCoveragesRequest request) {
    return _client.unary(
      Spec<ListWarrantyCoveragesRequest, ListWarrantyCoveragesResponse>(
        '$_service/ListWarrantyCoverages',
        StreamType.unary,
        ListWarrantyCoveragesRequest.create,
        ListWarrantyCoveragesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<WarrantyCoverage> createWarrantyCoverage(
      CreateWarrantyCoverageRequest request) {
    return _client.unary(
      Spec<CreateWarrantyCoverageRequest, WarrantyCoverage>(
        '$_service/CreateWarrantyCoverage',
        StreamType.unary,
        CreateWarrantyCoverageRequest.create,
        WarrantyCoverage.create,
      ),
      request,
    );
  }

  Future<WarrantyCoverage> updateWarrantyCoverage(
      UpdateWarrantyCoverageRequest request) {
    return _client.unary(
      Spec<UpdateWarrantyCoverageRequest, WarrantyCoverage>(
        '$_service/UpdateWarrantyCoverage',
        StreamType.unary,
        UpdateWarrantyCoverageRequest.create,
        WarrantyCoverage.create,
      ),
      request,
    );
  }

  Future<DeleteWarrantyCoverageResponse> deleteWarrantyCoverage(
      DeleteWarrantyCoverageRequest request) {
    return _client.unary(
      Spec<DeleteWarrantyCoverageRequest, DeleteWarrantyCoverageResponse>(
        '$_service/DeleteWarrantyCoverage',
        StreamType.unary,
        DeleteWarrantyCoverageRequest.create,
        DeleteWarrantyCoverageResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Warranty Coverage History RPCs
  // ============================================================================

  Future<WarrantyCoverageHistory> addCoverageHistory(
      AddCoverageHistoryRequest request) {
    return _client.unary(
      Spec<AddCoverageHistoryRequest, WarrantyCoverageHistory>(
        '$_service/AddCoverageHistory',
        StreamType.unary,
        AddCoverageHistoryRequest.create,
        WarrantyCoverageHistory.create,
      ),
      request,
    );
  }

  Future<GetCoverageHistoryResponse> getCoverageHistory(
      GetCoverageHistoryRequest request) {
    return _client.unary(
      Spec<GetCoverageHistoryRequest, GetCoverageHistoryResponse>(
        '$_service/GetCoverageHistory',
        StreamType.unary,
        GetCoverageHistoryRequest.create,
        GetCoverageHistoryResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }
}
