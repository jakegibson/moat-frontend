import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/transport/dashboard_service_client.dart';
import '../../../core/utils/app_error.dart';
import '../../../gen/moat/v1/analytics.pb.dart' as pb;
import '../../reports/data/cube_models.dart';

/// State management for dashboards and saved queries.
///
/// Extracted from ExploreState to manage dashboard-specific operations:
/// - Dashboard CRUD
/// - Saved query CRUD
/// - Adding/removing queries from dashboards
@lazySingleton
class DashboardState {
  final DashboardServiceClient _dashboardClient;

  DashboardState(this._dashboardClient);

  // Loading states
  final isLoadingDashboards = signal<bool>(false);
  final isLoadingSavedQueries = signal<bool>(false);
  final isSaving = signal<bool>(false);
  final error = signal<AppError?>(null);

  // Dashboards and saved queries
  final dashboards = signal<List<pb.Dashboard>>([]);
  final savedQueries = signal<List<pb.SavedQuery>>([]);
  final selectedDashboard = signal<pb.Dashboard?>(null);

  /// Load user's dashboards.
  Future<void> loadDashboards() async {
    if (isLoadingDashboards.value) return;

    isLoadingDashboards.value = true;
    error.value = null;

    try {
      final response = await _dashboardClient.listDashboards(
        pb.ListDashboardsRequest(),
      );
      dashboards.value = response.dashboards;

      // Auto-select default dashboard if available
      if (selectedDashboard.value == null && response.dashboards.isNotEmpty) {
        final defaultDash =
            response.dashboards.where((d) => d.isDefault).firstOrNull;
        selectedDashboard.value = defaultDash ?? response.dashboards.first;
      }
    } catch (e) {
      debugPrint('DashboardState.loadDashboards error: $e');
      error.value = AppError.from(e);
    } finally {
      isLoadingDashboards.value = false;
    }
  }

  /// Load user's saved queries.
  Future<void> loadSavedQueries() async {
    if (isLoadingSavedQueries.value) return;

    isLoadingSavedQueries.value = true;
    error.value = null;

    try {
      final response = await _dashboardClient.listSavedQueries(
        pb.ListSavedQueriesRequest(),
      );
      savedQueries.value = response.queries;
    } catch (e) {
      debugPrint('DashboardState.loadSavedQueries error: $e');
      error.value = AppError.from(e);
    } finally {
      isLoadingSavedQueries.value = false;
    }
  }

  /// Create a new dashboard.
  Future<pb.Dashboard?> createDashboard({
    required String name,
    String? description,
    bool isDefault = false,
  }) async {
    isSaving.value = true;
    error.value = null;

    try {
      final dashboard = await _dashboardClient.createDashboard(
        pb.CreateDashboardRequest(
          name: name,
          description: description ?? '',
          isDefault: isDefault,
        ),
      );

      // Add to local list
      dashboards.value = [...dashboards.value, dashboard];

      // Select if it's the first or default
      if (dashboard.isDefault || dashboards.value.length == 1) {
        selectedDashboard.value = dashboard;
      }

      return dashboard;
    } catch (e) {
      debugPrint('DashboardState.createDashboard error: $e');
      error.value = AppError.from(e);
      return null;
    } finally {
      isSaving.value = false;
    }
  }

  /// Save a query configuration as a saved query.
  Future<pb.SavedQuery?> saveQuery({
    required String name,
    String? description,
    required List<String> measures,
    required List<String> dimensions,
    String? timeDimension,
    String? dateRange,
    String? granularity,
    required String chartType,
    String? nlQuestion,
    String? dashboardId,
  }) async {
    if (measures.isEmpty) {
      error.value = ValidationError('Cannot save: no measures selected');
      return null;
    }

    isSaving.value = true;
    error.value = null;

    try {
      // Build the CubeQuery proto from selections
      final cubeQuery = pb.CubeQuery(
        measures: measures,
        dimensions: dimensions,
      );

      // Add time dimension if provided
      if (timeDimension != null) {
        cubeQuery.timeDimensions.add(pb.TimeDimension(
          dimension: timeDimension,
          dateRange: [dateRange ?? 'last 30 days'],
          granularity: granularity ?? 'day',
        ));
      }

      // Build chart config
      final chartConfig = pb.ChartConfig(showLegend: true);

      // Determine source type
      final sourceType =
          nlQuestion != null && nlQuestion.isNotEmpty ? 'nl_generated' : 'manual';

      final savedQuery = await _dashboardClient.createSavedQuery(
        pb.CreateSavedQueryRequest(
          name: name,
          description: description ?? '',
          query: cubeQuery,
          chartType: chartType,
          chartConfig: chartConfig,
          sourceType: sourceType,
          nlQuestion: nlQuestion ?? '',
        ),
      );

      // Add to local list
      savedQueries.value = [...savedQueries.value, savedQuery];

      // If dashboard specified, add to it
      if (dashboardId != null && dashboardId.isNotEmpty) {
        await addQueryToDashboard(
          savedQueryId: savedQuery.id,
          dashboardId: dashboardId,
        );
      }

      return savedQuery;
    } catch (e) {
      debugPrint('DashboardState.saveQuery error: $e');
      error.value = AppError.from(e);
      return null;
    } finally {
      isSaving.value = false;
    }
  }

  /// Add a saved query to a dashboard.
  Future<pb.DashboardItem?> addQueryToDashboard({
    required String savedQueryId,
    required String dashboardId,
    int gridX = 0,
    int gridY = 0,
    int gridWidth = 6,
    int gridHeight = 4,
  }) async {
    isSaving.value = true;
    error.value = null;

    try {
      final item = await _dashboardClient.addQueryToDashboard(
        pb.AddQueryToDashboardRequest(
          dashboardId: dashboardId,
          savedQueryId: savedQueryId,
          position: pb.GridPosition(
            x: gridX,
            y: gridY,
            width: gridWidth,
            height: gridHeight,
          ),
        ),
      );

      // Refresh the dashboard to get updated items
      await _refreshDashboard(dashboardId);

      return item;
    } catch (e) {
      debugPrint('DashboardState.addQueryToDashboard error: $e');
      error.value = AppError.from(e);
      return null;
    } finally {
      isSaving.value = false;
    }
  }

  /// Remove a query from a dashboard.
  Future<void> removeQueryFromDashboard({
    required String dashboardId,
    required String savedQueryId,
  }) async {
    isSaving.value = true;
    error.value = null;

    try {
      await _dashboardClient.removeQueryFromDashboard(
        pb.RemoveQueryFromDashboardRequest(
          dashboardId: dashboardId,
          savedQueryId: savedQueryId,
        ),
      );

      // Refresh the dashboard to get updated items
      await _refreshDashboard(dashboardId);
    } catch (e) {
      debugPrint('DashboardState.removeQueryFromDashboard error: $e');
      error.value = AppError.from(e);
    } finally {
      isSaving.value = false;
    }
  }

  /// Select a dashboard.
  void selectDashboard(pb.Dashboard? dashboard) {
    selectedDashboard.value = dashboard;
  }

  /// Delete a saved query.
  Future<void> deleteSavedQuery(String queryId) async {
    isSaving.value = true;
    error.value = null;

    try {
      await _dashboardClient.deleteSavedQuery(
        pb.DeleteSavedQueryRequest(id: queryId),
      );

      // Remove from local list
      savedQueries.value =
          savedQueries.value.where((q) => q.id != queryId).toList();
    } catch (e) {
      debugPrint('DashboardState.deleteSavedQuery error: $e');
      error.value = AppError.from(e);
    } finally {
      isSaving.value = false;
    }
  }

  /// Delete a dashboard.
  Future<void> deleteDashboard(String dashboardId) async {
    isSaving.value = true;
    error.value = null;

    try {
      await _dashboardClient.deleteDashboard(
        pb.DeleteDashboardRequest(id: dashboardId),
      );

      // Remove from local list
      dashboards.value =
          dashboards.value.where((d) => d.id != dashboardId).toList();

      // Clear selection if deleted
      if (selectedDashboard.value?.id == dashboardId) {
        selectedDashboard.value = dashboards.value.firstOrNull;
      }
    } catch (e) {
      debugPrint('DashboardState.deleteDashboard error: $e');
      error.value = AppError.from(e);
    } finally {
      isSaving.value = false;
    }
  }

  /// Refresh a specific dashboard's data.
  Future<void> _refreshDashboard(String dashboardId) async {
    try {
      final dashboard = await _dashboardClient.getDashboard(
        pb.GetDashboardRequest(id: dashboardId),
      );

      // Update in local list
      final index = dashboards.value.indexWhere((d) => d.id == dashboardId);
      if (index >= 0) {
        final updated = List<pb.Dashboard>.from(dashboards.value);
        updated[index] = dashboard;
        dashboards.value = updated;
      }

      // Update selected if it was selected
      if (selectedDashboard.value?.id == dashboardId) {
        selectedDashboard.value = dashboard;
      }
    } catch (e) {
      debugPrint('DashboardState._refreshDashboard error: $e');
    }
  }

  /// Parse a saved query into CubeMember lists for the explorer.
  SavedQueryParsed parseSavedQuery(pb.SavedQuery query) {
    return SavedQueryParsed(
      measures: query.query.measures
          .map((name) => CubeMember(
                name: name,
                title: _formatMemberTitle(name),
                type: 'number',
              ))
          .toList(),
      dimensions: query.query.dimensions
          .map((name) => CubeMember(
                name: name,
                title: _formatMemberTitle(name),
                type: 'string',
              ))
          .toList(),
      timeDimension: query.query.timeDimensions.isNotEmpty
          ? CubeMember(
              name: query.query.timeDimensions.first.dimension,
              title:
                  _formatMemberTitle(query.query.timeDimensions.first.dimension),
              type: 'time',
            )
          : null,
      granularity: query.query.timeDimensions.isNotEmpty &&
              query.query.timeDimensions.first.granularity.isNotEmpty
          ? query.query.timeDimensions.first.granularity
          : null,
      dateRange: query.query.timeDimensions.isNotEmpty &&
              query.query.timeDimensions.first.dateRange.isNotEmpty
          ? query.query.timeDimensions.first.dateRange.first
          : null,
      chartType: query.chartType,
      nlQuestion: query.nlQuestion.isNotEmpty ? query.nlQuestion : null,
    );
  }

  /// Format a member name as a readable title.
  String _formatMemberTitle(String name) {
    final fieldName = name.split('.').last;
    return fieldName
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}'
            : '')
        .join(' ');
  }
}

/// Parsed saved query data for use in the explorer.
class SavedQueryParsed {
  final List<CubeMember> measures;
  final List<CubeMember> dimensions;
  final CubeMember? timeDimension;
  final String? granularity;
  final String? dateRange;
  final String chartType;
  final String? nlQuestion;

  const SavedQueryParsed({
    required this.measures,
    required this.dimensions,
    this.timeDimension,
    this.granularity,
    this.dateRange,
    required this.chartType,
    this.nlQuestion,
  });
}
