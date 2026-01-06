import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../gen/moat/v1/analytics.pb.dart' as pb;
import '../../reports/data/analytics_client.dart';
import '../../reports/data/cube_models.dart';
import '../data/explore_client.dart';
import 'dashboard_state.dart';

/// State management for the data explorer.
///
/// Manages query building, execution, templates, and NL translation.
/// Dashboard operations are delegated to [DashboardState].
@lazySingleton
class ExploreState {
  final AnalyticsClient _analyticsClient;
  final ExploreClient _exploreClient;
  final DashboardState _dashboardState;

  ExploreState(this._analyticsClient, this._exploreClient, this._dashboardState);

  // Loading states
  final isLoadingMeta = signal<bool>(false);
  final isLoadingData = signal<bool>(false);
  final isLoadingTemplates = signal<bool>(false);
  final isTranslating = signal<bool>(false);
  final error = signal<AppError?>(null);

  // Delegate dashboard loading states
  Signal<bool> get isLoadingDashboards => _dashboardState.isLoadingDashboards;
  Signal<bool> get isLoadingSavedQueries => _dashboardState.isLoadingSavedQueries;
  Signal<bool> get isSaving => _dashboardState.isSaving;

  // Delegate dashboard data
  Signal<List<pb.Dashboard>> get dashboards => _dashboardState.dashboards;
  Signal<List<pb.SavedQuery>> get savedQueries => _dashboardState.savedQueries;
  Signal<pb.Dashboard?> get selectedDashboard => _dashboardState.selectedDashboard;

  // Templates and NL query
  final templates = signal<List<QueryTemplate>>([]);
  final nlQuestion = signal<String>('');
  final nlResult = signal<NLQueryResult?>(null);

  // Metadata
  final meta = signal<CubeMeta?>(null);
  final selectedCube = signal<CubeDefinition?>(null);

  // Query configuration
  final selectedMeasures = signal<List<CubeMember>>([]);
  final selectedDimensions = signal<List<CubeMember>>([]);
  final selectedTimeDimension = signal<CubeMember?>(null);
  final selectedGranularity = signal<String>('day');
  final selectedDateRange = signal<String>('last 30 days');

  // Chart configuration
  final chartType = signal<ExplorerChartType>(ExplorerChartType.bar);

  // Results
  final queryResult = signal<CubeResponse?>(null);

  // ===========================================================================
  // Metadata & Query Operations
  // ===========================================================================

  /// Load metadata from Cube.js.
  Future<void> loadMeta() async {
    if (isLoadingMeta.value) return;

    isLoadingMeta.value = true;
    error.value = null;

    try {
      final result = await _analyticsClient.getMeta();
      meta.value = result;

      // Auto-select first cube if available
      if (result.cubes.isNotEmpty && selectedCube.value == null) {
        selectedCube.value = result.cubes.first;
      }
    } catch (e) {
      debugPrint('ExploreState.loadMeta error: $e');
      error.value = AppError.from(e);
    } finally {
      isLoadingMeta.value = false;
    }
  }

  /// Select a cube to explore.
  void selectCube(CubeDefinition cube) {
    selectedCube.value = cube;
    // Reset selections when cube changes
    selectedMeasures.value = [];
    selectedDimensions.value = [];
    selectedTimeDimension.value = null;
    queryResult.value = null;
  }

  /// Toggle a measure selection.
  void toggleMeasure(CubeMember measure) {
    final current = List<CubeMember>.from(selectedMeasures.value);
    final index = current.indexWhere((m) => m.name == measure.name);
    if (index >= 0) {
      current.removeAt(index);
    } else {
      current.add(measure);
    }
    selectedMeasures.value = current;
  }

  /// Toggle a dimension selection.
  void toggleDimension(CubeMember dimension) {
    final current = List<CubeMember>.from(selectedDimensions.value);
    final index = current.indexWhere((d) => d.name == dimension.name);
    if (index >= 0) {
      current.removeAt(index);
    } else {
      // Handle time dimensions specially
      if (dimension.isTimeDimension) {
        selectedTimeDimension.value = dimension;
      } else {
        current.add(dimension);
      }
    }
    selectedDimensions.value = current;
  }

  /// Set the time dimension.
  void setTimeDimension(CubeMember? dimension) {
    selectedTimeDimension.value = dimension;
  }

  /// Set date range.
  void setDateRange(String range) {
    selectedDateRange.value = range;
  }

  /// Set granularity.
  void setGranularity(String granularity) {
    selectedGranularity.value = granularity;
  }

  /// Set chart type.
  void setChartType(ExplorerChartType type) {
    chartType.value = type;
  }

  /// Execute the current query.
  Future<void> executeQuery() async {
    if (selectedMeasures.value.isEmpty) {
      error.value = ValidationError('Please select at least one measure');
      return;
    }

    isLoadingData.value = true;
    error.value = null;

    try {
      final query = _buildQuery();
      debugPrint('Executing query: ${query.toJson()}');
      final result = await _analyticsClient.query(query);
      queryResult.value = result;
    } catch (e) {
      debugPrint('ExploreState.executeQuery error: $e');
      error.value = AppError.from(e);
    } finally {
      isLoadingData.value = false;
    }
  }

  /// Build the Cube.js query from current selections.
  CubeQuery _buildQuery() {
    final measures = selectedMeasures.value.map((m) => m.name).toList();
    final dimensions = selectedDimensions.value.map((d) => d.name).toList();

    List<CubeTimeDimension>? timeDimensions;
    if (selectedTimeDimension.value != null) {
      timeDimensions = [
        CubeTimeDimension(
          dimension: selectedTimeDimension.value!.name,
          dateRange: selectedDateRange.value,
          granularity: selectedGranularity.value,
        ),
      ];
    }

    return CubeQuery(
      measures: measures,
      dimensions: dimensions.isNotEmpty ? dimensions : null,
      timeDimensions: timeDimensions,
      limit: 1000,
    );
  }

  /// Check if a measure is selected.
  bool isMeasureSelected(CubeMember measure) {
    return selectedMeasures.value.any((m) => m.name == measure.name);
  }

  /// Check if a dimension is selected.
  bool isDimensionSelected(CubeMember dimension) {
    return selectedDimensions.value.any((d) => d.name == dimension.name) ||
        selectedTimeDimension.value?.name == dimension.name;
  }

  /// Clear all selections.
  void clearSelections() {
    selectedMeasures.value = [];
    selectedDimensions.value = [];
    selectedTimeDimension.value = null;
    queryResult.value = null;
    error.value = null;
  }

  /// Available date range options.
  static const dateRangeOptions = [
    'today',
    'yesterday',
    'last 7 days',
    'last 30 days',
    'last 90 days',
    'last year',
    'this week',
    'this month',
    'this quarter',
    'this year',
  ];

  /// Available granularity options.
  static const granularityOptions = [
    'hour',
    'day',
    'week',
    'month',
    'quarter',
    'year',
  ];

  // ===========================================================================
  // Templates
  // ===========================================================================

  /// Load query templates from the backend.
  Future<void> loadTemplates() async {
    if (isLoadingTemplates.value) return;

    isLoadingTemplates.value = true;
    error.value = null;

    try {
      final result = await _exploreClient.getQueryTemplates();
      templates.value = result;
    } catch (e) {
      debugPrint('ExploreState.loadTemplates error: $e');
      error.value = AppError.from(e);
    } finally {
      isLoadingTemplates.value = false;
    }
  }

  /// Apply a template to the current query.
  Future<void> applyTemplate(QueryTemplate template) async {
    // Clear current selections
    clearSelections();

    // Set chart type
    final chartTypeStr = template.chartType.toLowerCase();
    chartType.value = ExplorerChartType.values.firstWhere(
      (t) => t.name == chartTypeStr,
      orElse: () => ExplorerChartType.bar,
    );

    // Populate selectedMeasures from template
    selectedMeasures.value = template.query.measures
        .map((name) => CubeMember(
              name: name,
              title: _formatMemberTitle(name),
              type: 'number',
            ))
        .toList();

    // Populate selectedDimensions from template
    selectedDimensions.value = template.query.dimensions
        .map((name) => CubeMember(
              name: name,
              title: _formatMemberTitle(name),
              type: 'string',
            ))
        .toList();

    // Handle time dimensions
    if (template.query.timeDimensions.isNotEmpty) {
      final td = template.query.timeDimensions.first;
      selectedTimeDimension.value = CubeMember(
        name: td.dimension,
        title: _formatMemberTitle(td.dimension),
        type: 'time',
      );
      if (td.granularity != null && td.granularity!.isNotEmpty) {
        selectedGranularity.value = td.granularity!;
      }
      if (td.dateRange.isNotEmpty) {
        selectedDateRange.value = td.dateRange.first;
      }
    }

    // Execute the template query directly
    isLoadingData.value = true;
    error.value = null;

    try {
      final cubeQuery = CubeQuery(
        measures: template.query.measures,
        dimensions: template.query.dimensions.isNotEmpty
            ? template.query.dimensions
            : null,
        timeDimensions: template.query.timeDimensions.isNotEmpty
            ? template.query.timeDimensions
                .map((td) => CubeTimeDimension(
                      dimension: td.dimension,
                      dateRange: td.dateRange.isNotEmpty
                          ? td.dateRange.first
                          : 'last 30 days',
                      granularity: td.granularity,
                    ))
                .toList()
            : null,
        limit: template.query.limit ?? 100,
      );

      debugPrint('Executing template query: ${cubeQuery.toJson()}');
      final result = await _analyticsClient.query(cubeQuery);
      queryResult.value = result;
    } catch (e) {
      debugPrint('ExploreState.applyTemplate error: $e');
      error.value = AppError.from(e);
    } finally {
      isLoadingData.value = false;
    }
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

  /// Get templates by category.
  List<QueryTemplate> getTemplatesByCategory(String category) {
    return templates.value.where((t) => t.category == category).toList();
  }

  /// Get all template categories.
  List<String> get templateCategories {
    return templates.value.map((t) => t.category).toSet().toList()..sort();
  }

  // ===========================================================================
  // Natural Language Query
  // ===========================================================================

  /// Set the natural language question.
  void setNLQuestion(String question) {
    nlQuestion.value = question;
  }

  /// Translate natural language to a Cube.js query.
  Future<void> translateNaturalLanguage() async {
    final question = nlQuestion.value.trim();
    if (question.isEmpty) {
      error.value = ValidationError('Please enter a question');
      return;
    }

    isTranslating.value = true;
    error.value = null;
    nlResult.value = null;

    try {
      final result = await _exploreClient.translateNaturalLanguage(
        question,
        preferredChartType: chartType.value.name,
      );
      nlResult.value = result;

      // Auto-set chart type from suggestion
      final suggestedType = result.suggestedChartType.toLowerCase();
      chartType.value = ExplorerChartType.values.firstWhere(
        (t) => t.name == suggestedType,
        orElse: () => ExplorerChartType.bar,
      );
    } catch (e) {
      debugPrint('ExploreState.translateNaturalLanguage error: $e');
      error.value = AppError.from(e);
    } finally {
      isTranslating.value = false;
    }
  }

  /// Execute the NL query result.
  Future<void> executeNLQuery() async {
    final result = nlResult.value;
    if (result == null) {
      error.value =
          ValidationError('No query to execute. Please translate a question first.');
      return;
    }

    // Populate selectedMeasures from NL result
    selectedMeasures.value = result.query.measures
        .map((name) => CubeMember(
              name: name,
              title: _formatMemberTitle(name),
              type: 'number',
            ))
        .toList();

    // Populate selectedDimensions from NL result
    selectedDimensions.value = result.query.dimensions
        .map((name) => CubeMember(
              name: name,
              title: _formatMemberTitle(name),
              type: 'string',
            ))
        .toList();

    // Handle time dimensions
    if (result.query.timeDimensions.isNotEmpty) {
      final td = result.query.timeDimensions.first;
      selectedTimeDimension.value = CubeMember(
        name: td.dimension,
        title: _formatMemberTitle(td.dimension),
        type: 'time',
      );
      if (td.granularity != null && td.granularity!.isNotEmpty) {
        selectedGranularity.value = td.granularity!;
      }
      if (td.dateRange.isNotEmpty) {
        selectedDateRange.value = td.dateRange.first;
      }
    } else {
      selectedTimeDimension.value = null;
    }

    isLoadingData.value = true;
    error.value = null;

    try {
      final cubeQuery = CubeQuery(
        measures: result.query.measures,
        dimensions:
            result.query.dimensions.isNotEmpty ? result.query.dimensions : null,
        timeDimensions: result.query.timeDimensions.isNotEmpty
            ? result.query.timeDimensions
                .map((td) => CubeTimeDimension(
                      dimension: td.dimension,
                      dateRange: td.dateRange.isNotEmpty
                          ? td.dateRange.first
                          : 'last 30 days',
                      granularity: td.granularity,
                    ))
                .toList()
            : null,
        limit: result.query.limit ?? 100,
      );

      debugPrint('Executing NL query: ${cubeQuery.toJson()}');
      final queryResponse = await _analyticsClient.query(cubeQuery);
      queryResult.value = queryResponse;
    } catch (e) {
      debugPrint('ExploreState.executeNLQuery error: $e');
      error.value = AppError.from(e);
    } finally {
      isLoadingData.value = false;
    }
  }

  /// Clear the NL query state.
  void clearNLQuery() {
    nlQuestion.value = '';
    nlResult.value = null;
  }

  // ===========================================================================
  // Dashboard & Saved Query Operations (delegated to DashboardState)
  // ===========================================================================

  /// Load user's dashboards.
  Future<void> loadDashboards() => _dashboardState.loadDashboards();

  /// Load user's saved queries.
  Future<void> loadSavedQueries() => _dashboardState.loadSavedQueries();

  /// Create a new dashboard.
  Future<pb.Dashboard?> createDashboard({
    required String name,
    String? description,
    bool isDefault = false,
  }) =>
      _dashboardState.createDashboard(
        name: name,
        description: description,
        isDefault: isDefault,
      );

  /// Save the current query configuration as a saved query.
  Future<pb.SavedQuery?> saveCurrentQuery({
    required String name,
    String? description,
    String? dashboardId,
  }) =>
      _dashboardState.saveQuery(
        name: name,
        description: description,
        measures: selectedMeasures.value.map((m) => m.name).toList(),
        dimensions: selectedDimensions.value.map((d) => d.name).toList(),
        timeDimension: selectedTimeDimension.value?.name,
        dateRange: selectedDateRange.value,
        granularity: selectedGranularity.value,
        chartType: chartType.value.name,
        nlQuestion: nlQuestion.value.isNotEmpty ? nlQuestion.value : null,
        dashboardId: dashboardId,
      );

  /// Add a saved query to a dashboard.
  Future<pb.DashboardItem?> addQueryToDashboard({
    required String savedQueryId,
    required String dashboardId,
    int gridX = 0,
    int gridY = 0,
    int gridWidth = 6,
    int gridHeight = 4,
  }) =>
      _dashboardState.addQueryToDashboard(
        savedQueryId: savedQueryId,
        dashboardId: dashboardId,
        gridX: gridX,
        gridY: gridY,
        gridWidth: gridWidth,
        gridHeight: gridHeight,
      );

  /// Remove a query from a dashboard.
  Future<void> removeQueryFromDashboard({
    required String dashboardId,
    required String savedQueryId,
  }) =>
      _dashboardState.removeQueryFromDashboard(
        dashboardId: dashboardId,
        savedQueryId: savedQueryId,
      );

  /// Apply a saved query to the explorer.
  void applySavedQuery(pb.SavedQuery query) {
    final parsed = _dashboardState.parseSavedQuery(query);

    // Clear current selections
    clearSelections();

    // Set chart type
    final chartTypeStr = parsed.chartType.toLowerCase();
    chartType.value = ExplorerChartType.values.firstWhere(
      (t) => t.name == chartTypeStr,
      orElse: () => ExplorerChartType.bar,
    );

    // Apply parsed data
    selectedMeasures.value = parsed.measures;
    selectedDimensions.value = parsed.dimensions;
    selectedTimeDimension.value = parsed.timeDimension;
    if (parsed.granularity != null) {
      selectedGranularity.value = parsed.granularity!;
    }
    if (parsed.dateRange != null) {
      selectedDateRange.value = parsed.dateRange!;
    }
    if (parsed.nlQuestion != null) {
      nlQuestion.value = parsed.nlQuestion!;
    }
  }

  /// Execute a saved query directly.
  Future<void> executeSavedQuery(pb.SavedQuery query) async {
    applySavedQuery(query);
    await executeQuery();
  }

  /// Select a dashboard.
  void selectDashboard(pb.Dashboard? dashboard) =>
      _dashboardState.selectDashboard(dashboard);

  /// Delete a saved query.
  Future<void> deleteSavedQuery(String queryId) =>
      _dashboardState.deleteSavedQuery(queryId);

  /// Delete a dashboard.
  Future<void> deleteDashboard(String dashboardId) =>
      _dashboardState.deleteDashboard(dashboardId);
}
