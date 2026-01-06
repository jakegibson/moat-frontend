import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/analytics.pb.dart';

/// ConnectRPC client for DashboardService.
///
/// Provides CRUD operations for user-created dashboards and saved queries.
@lazySingleton
class DashboardServiceClient {
  final Client _client;

  DashboardServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.DashboardService';

  // ==========================================================================
  // Dashboard Operations
  // ==========================================================================

  /// Create a new dashboard.
  Future<Dashboard> createDashboard(CreateDashboardRequest request) {
    return _client.unary(
      Spec<CreateDashboardRequest, Dashboard>(
        '$_service/CreateDashboard',
        StreamType.unary,
        CreateDashboardRequest.create,
        Dashboard.create,
      ),
      request,
    );
  }

  /// Get a dashboard by ID.
  Future<Dashboard> getDashboard(GetDashboardRequest request) {
    return _client.unary(
      Spec<GetDashboardRequest, Dashboard>(
        '$_service/GetDashboard',
        StreamType.unary,
        GetDashboardRequest.create,
        Dashboard.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  /// List dashboards.
  Future<ListDashboardsResponse> listDashboards(ListDashboardsRequest request) {
    return _client.unary(
      Spec<ListDashboardsRequest, ListDashboardsResponse>(
        '$_service/ListDashboards',
        StreamType.unary,
        ListDashboardsRequest.create,
        ListDashboardsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  /// Update a dashboard.
  Future<Dashboard> updateDashboard(UpdateDashboardRequest request) {
    return _client.unary(
      Spec<UpdateDashboardRequest, Dashboard>(
        '$_service/UpdateDashboard',
        StreamType.unary,
        UpdateDashboardRequest.create,
        Dashboard.create,
      ),
      request,
    );
  }

  /// Delete a dashboard.
  Future<void> deleteDashboard(DeleteDashboardRequest request) async {
    await _client.unary(
      Spec<DeleteDashboardRequest, Empty>(
        '$_service/DeleteDashboard',
        StreamType.unary,
        DeleteDashboardRequest.create,
        Empty.create,
      ),
      request,
    );
  }

  // ==========================================================================
  // Saved Query Operations
  // ==========================================================================

  /// Create a new saved query.
  Future<SavedQuery> createSavedQuery(CreateSavedQueryRequest request) {
    return _client.unary(
      Spec<CreateSavedQueryRequest, SavedQuery>(
        '$_service/CreateSavedQuery',
        StreamType.unary,
        CreateSavedQueryRequest.create,
        SavedQuery.create,
      ),
      request,
    );
  }

  /// Get a saved query by ID.
  Future<SavedQuery> getSavedQuery(GetSavedQueryRequest request) {
    return _client.unary(
      Spec<GetSavedQueryRequest, SavedQuery>(
        '$_service/GetSavedQuery',
        StreamType.unary,
        GetSavedQueryRequest.create,
        SavedQuery.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  /// List saved queries.
  Future<ListSavedQueriesResponse> listSavedQueries(
      ListSavedQueriesRequest request) {
    return _client.unary(
      Spec<ListSavedQueriesRequest, ListSavedQueriesResponse>(
        '$_service/ListSavedQueries',
        StreamType.unary,
        ListSavedQueriesRequest.create,
        ListSavedQueriesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  /// Update a saved query.
  Future<SavedQuery> updateSavedQuery(UpdateSavedQueryRequest request) {
    return _client.unary(
      Spec<UpdateSavedQueryRequest, SavedQuery>(
        '$_service/UpdateSavedQuery',
        StreamType.unary,
        UpdateSavedQueryRequest.create,
        SavedQuery.create,
      ),
      request,
    );
  }

  /// Delete a saved query.
  Future<void> deleteSavedQuery(DeleteSavedQueryRequest request) async {
    await _client.unary(
      Spec<DeleteSavedQueryRequest, Empty>(
        '$_service/DeleteSavedQuery',
        StreamType.unary,
        DeleteSavedQueryRequest.create,
        Empty.create,
      ),
      request,
    );
  }

  // ==========================================================================
  // Dashboard Item Operations
  // ==========================================================================

  /// Add a saved query to a dashboard.
  Future<DashboardItem> addQueryToDashboard(
      AddQueryToDashboardRequest request) {
    return _client.unary(
      Spec<AddQueryToDashboardRequest, DashboardItem>(
        '$_service/AddQueryToDashboard',
        StreamType.unary,
        AddQueryToDashboardRequest.create,
        DashboardItem.create,
      ),
      request,
    );
  }

  /// Remove a saved query from a dashboard.
  Future<void> removeQueryFromDashboard(
      RemoveQueryFromDashboardRequest request) async {
    await _client.unary(
      Spec<RemoveQueryFromDashboardRequest, Empty>(
        '$_service/RemoveQueryFromDashboard',
        StreamType.unary,
        RemoveQueryFromDashboardRequest.create,
        Empty.create,
      ),
      request,
    );
  }

  /// Update the layout of items on a dashboard.
  Future<Dashboard> updateDashboardLayout(
      UpdateDashboardLayoutRequest request) {
    return _client.unary(
      Spec<UpdateDashboardLayoutRequest, Dashboard>(
        '$_service/UpdateDashboardLayout',
        StreamType.unary,
        UpdateDashboardLayoutRequest.create,
        Dashboard.create,
      ),
      request,
    );
  }
}

/// Empty message placeholder for void responses.
class Empty {
  static Empty create() => Empty();
}
