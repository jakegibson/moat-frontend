import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../reports/data/analytics_client.dart';
import '../../reports/data/cube_models.dart';

/// State management for the data explorer.
@lazySingleton
class ExploreState {
  final AnalyticsClient _analyticsClient;

  ExploreState(this._analyticsClient);

  // Loading states
  final isLoadingMeta = signal<bool>(false);
  final isLoadingData = signal<bool>(false);
  final error = signal<String?>(null);

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
      error.value = e.toString();
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
      error.value = 'Please select at least one measure';
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
      error.value = e.toString();
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
}
