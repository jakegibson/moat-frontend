import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../data/task_client.dart';

/// Task metrics state management.
///
/// Manages task management overview metrics including:
/// - Total counts and averages
/// - Weekly chart data
/// - Change percentages
@lazySingleton
class TaskMetricsState {
  final TaskClient _client;

  TaskMetricsState(this._client);

  // ==========================================================================
  // Metrics Data
  // ==========================================================================

  /// Total number of tasks
  final total = signal(0);

  /// Total tasks created last month
  final totalLastMonth = signal(0);

  /// Average time to close (hours)
  final avgTimeToClose = signal(0.0);

  /// Average response time (hours)
  final avgResponseTime = signal(0.0);

  /// Time to close change percentage
  final timeToCloseChange = signal<double?>(null);

  /// Response time change percentage
  final responseTimeChange = signal<double?>(null);

  /// Number of overdue tasks
  final overdueCount = signal(0);

  /// Number of unassigned tasks
  final unassignedCount = signal(0);

  /// Loading state
  final isLoading = signal(false);

  // ==========================================================================
  // Weekly Chart Data
  // ==========================================================================

  /// Weekly open tickets chart data
  final weeklyOpenTickets = signal<List<double>>([]);

  /// Weekly time to close chart data
  final weeklyTimeToClose = signal<List<double>>([]);

  /// Weekly response times chart data
  final weeklyResponseTimes = signal<List<double>>([]);

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  /// Average time to close in days
  late final avgTimeToCloseDays = computed(() {
    final hours = avgTimeToClose.value;
    return hours > 0 ? hours / 24 : 0.0;
  });

  // ==========================================================================
  // Operations
  // ==========================================================================

  /// Fetch task management overview metrics
  Future<void> fetchMetrics() async {
    isLoading.value = true;

    try {
      final overview = await _client.getTaskManagementOverview();
      batch(() {
        total.value = overview.totalTasks;
        avgTimeToClose.value = overview.avgTimeToCloseHours;
        avgResponseTime.value = overview.avgResponseTimeHours;
        overdueCount.value = overview.overdueTasks;
        unassignedCount.value = overview.unassignedTasks;

        // Extract chart data from weekly metrics
        weeklyOpenTickets.value = overview.weeklyCreated
            .map((point) => point.count.toDouble())
            .toList();
        weeklyTimeToClose.value = overview.weeklyTimeToClose
            .map((point) => point.averageHours)
            .toList();
        weeklyResponseTimes.value = overview.weeklyResponseTime
            .map((point) => point.averageHours)
            .toList();

        // Calculate total last month from weekly created data
        if (overview.weeklyCreated.isNotEmpty) {
          final totalCreatedLastMonth = overview.weeklyCreated.fold<int>(
            0,
            (sum, point) => sum + point.count,
          );
          totalLastMonth.value = totalCreatedLastMonth;
        }

        // Calculate change percentages from weekly data if available
        if (overview.weeklyTimeToClose.length >= 2) {
          final current = overview.weeklyTimeToClose.last.averageHours;
          final previous =
              overview.weeklyTimeToClose[overview.weeklyTimeToClose.length - 2]
                  .averageHours;
          if (previous > 0) {
            timeToCloseChange.value = ((current - previous) / previous) * 100;
          }
        }
        if (overview.weeklyResponseTime.length >= 2) {
          final current = overview.weeklyResponseTime.last.averageHours;
          final previous =
              overview.weeklyResponseTime[overview.weeklyResponseTime.length - 2]
                  .averageHours;
          if (previous > 0) {
            responseTimeChange.value = ((current - previous) / previous) * 100;
          }
        }
      });
    } catch (e) {
      // Silently fail - metrics are not critical
    }

    isLoading.value = false;
  }

  /// Clear metrics state
  void clear() {
    batch(() {
      total.value = 0;
      totalLastMonth.value = 0;
      avgTimeToClose.value = 0.0;
      avgResponseTime.value = 0.0;
      timeToCloseChange.value = null;
      responseTimeChange.value = null;
      overdueCount.value = 0;
      unassignedCount.value = 0;
      weeklyOpenTickets.value = [];
      weeklyTimeToClose.value = [];
      weeklyResponseTimes.value = [];
    });
  }
}
