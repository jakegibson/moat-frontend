import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/app_error.dart';
import '../data/analytics_client.dart';
import '../data/cube_models.dart';
import '../widgets/time_range_selector.dart';

/// State management for reports dashboard.
///
/// Uses Signals for reactive state and lazy loading of analytics data.
@lazySingleton
class ReportsState {
  final AnalyticsClient _client;

  ReportsState(this._client);

  // Loading states
  final isLoading = signal<bool>(false);
  final error = signal<AppError?>(null);

  // Current time range selection
  final selectedTimeRange = signal<TimeRange>(TimeRange.twelveMonths);

  // Dashboard metrics
  final metrics = signal<DashboardMetrics?>(null);

  // Task breakdown data
  final tasksByStatus = signal<List<TaskStatusBreakdown>>([]);
  final tasksByPriority = signal<List<TaskPriorityBreakdown>>([]);

  // Time series data for sparklines
  final tasksCreatedTrend = signal<List<TimeSeriesDataPoint>>([]);
  final tasksResolvedTrend = signal<List<TimeSeriesDataPoint>>([]);

  // Assets by year for bar chart
  final assetsByYear = signal<List<Map<String, dynamic>>>([]);

  // Heatmap calendar data
  final overdueTasksByDate = signal<Map<DateTime, int>>({});
  final taskActivityByDate = signal<Map<DateTime, int>>({});

  // ============================================
  // Asset-focused signals (new Figma design)
  // ============================================

  // Facility dashboard summary metrics
  final facilityMetrics = signal<FacilityDashboardMetrics?>(null);

  // Asset breakdown data
  final assetsByDivision = signal<List<AssetDivisionBreakdown>>([]);
  final assetsByLocation = signal<List<AssetLocationBreakdown>>([]);
  final assetsByAge = signal<List<AssetAgeData>>([]);

  // Maintenance metrics
  final maintenanceScoreMetrics = signal<MaintenanceScoreMetrics?>(null);

  // Calendar data (asset-focused)
  final warrantyExpirationCalendar = signal<Map<DateTime, int>>({});
  final maintenanceCalendar = signal<Map<DateTime, int>>({});

  /// Load all dashboard data.
  Future<void> loadDashboard() async {
    if (isLoading.value) return;

    isLoading.value = true;
    error.value = null;

    try {
      // Load all data in parallel - asset-focused metrics for new design
      final results = await Future.wait([
        _client.getFacilityMetrics(),
        _client.getAssetsByDivision(limit: 10),
        _client.getAssetsByLocation(limit: 10),
        _client.getAssetsByAge(maxYears: 12),
        _client.getMaintenanceScore(),
        _client.getWarrantyExpirationCalendar(),
        _client.getMaintenanceCalendar(),
        // Legacy data (keep for backward compatibility)
        _client.getTasksByStatus(),
        _client.getTasksByPriority(),
        _client.getAssetsByYear(),
      ]);

      // Use batch() to prevent multiple rebuilds when updating many signals
      batch(() {
        // Asset-focused metrics (new)
        facilityMetrics.value = results[0] as FacilityDashboardMetrics;
        assetsByDivision.value = results[1] as List<AssetDivisionBreakdown>;
        assetsByLocation.value = results[2] as List<AssetLocationBreakdown>;
        assetsByAge.value = results[3] as List<AssetAgeData>;
        maintenanceScoreMetrics.value = results[4] as MaintenanceScoreMetrics;
        warrantyExpirationCalendar.value = results[5] as Map<DateTime, int>;
        maintenanceCalendar.value = results[6] as Map<DateTime, int>;

        // Legacy data
        tasksByStatus.value = results[7] as List<TaskStatusBreakdown>;
        tasksByPriority.value = results[8] as List<TaskPriorityBreakdown>;
        assetsByYear.value = results[9] as List<Map<String, dynamic>>;
      });
    } catch (e) {
      error.value = AppError.from(e);
      debugPrint('Failed to load dashboard: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Reload dashboard data.
  Future<void> refresh() async {
    await loadDashboard();
  }

  // Computed values for UI convenience

  /// Total open tasks percentage.
  double get openTasksPercentage {
    final m = metrics.value;
    if (m == null || m.totalTasks == 0) return 0;
    return m.openTasks / m.totalTasks * 100;
  }

  /// Task resolution rate percentage.
  double get resolutionRate {
    final m = metrics.value;
    if (m == null || m.totalTasks == 0) return 0;
    return m.resolvedTasks / m.totalTasks * 100;
  }

  /// Active member percentage.
  double get activeMemberRate {
    final m = metrics.value;
    if (m == null || m.totalMembers == 0) return 0;
    return m.activeMembers / m.totalMembers * 100;
  }

  /// Format a large number with K/M suffix.
  static String formatNumber(num value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    }
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toStringAsFixed(0);
  }

  /// Format currency value.
  static String formatCurrency(double value) {
    if (value >= 1000000) {
      return '\$${(value / 1000000).toStringAsFixed(1)}M';
    }
    if (value >= 1000) {
      return '\$${(value / 1000).toStringAsFixed(1)}K';
    }
    return '\$${value.toStringAsFixed(0)}';
  }

  /// Format hours as a readable duration.
  static String formatHours(double hours) {
    if (hours < 1) {
      return '${(hours * 60).toStringAsFixed(0)} min';
    }
    if (hours < 24) {
      return '${hours.toStringAsFixed(1)} hrs';
    }
    final days = hours / 24;
    return '${days.toStringAsFixed(1)} days';
  }
}
