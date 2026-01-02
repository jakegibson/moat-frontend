import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/task_models.dart';
import 'task_detail_state.dart';
import 'task_list_state.dart';
import 'task_metrics_state.dart';

// Re-export QuickFilter for backward compatibility
export 'task_list_state.dart' show QuickFilter;

/// Task state facade that composes focused sub-states.
///
/// This class provides backward compatibility while the codebase
/// migrates to using the focused state classes directly:
/// - [TaskListState] - list, pagination, filters
/// - [TaskDetailState] - selected task, comments, activity
/// - [TaskMetricsState] - metrics and charts
///
/// New code should inject the specific state class needed.
/// This facade will be deprecated once migration is complete.
@lazySingleton
class TaskState {
  final TaskListState list;
  final TaskDetailState detail;
  final TaskMetricsState metrics;

  TaskState(this.list, this.detail, this.metrics);

  // ==========================================================================
  // List State Delegates
  // ==========================================================================

  Signal<List<TaskWithDetails>> get tasks => list.tasks;
  Signal<bool> get isLoading => list.isLoading;
  Signal<AppError?> get error => list.error;
  Signal<int> get totalCount => list.totalCount;
  Signal<int> get currentOffset => list.currentOffset;
  Signal<bool> get hasMore => list.hasMore;
  Signal<List<TaskStatus>> get statusFilter => list.statusFilter;
  Signal<List<TaskType>> get taskTypeFilter => list.taskTypeFilter;
  Signal<List<String>> get assigneeFilter => list.assigneeFilter;
  Signal<List<String>> get locationFilter => list.locationFilter;
  Signal<String> get searchQuery => list.searchQuery;
  Signal<DateTime?> get fromDate => list.fromDate;
  Signal<DateTime?> get toDate => list.toDate;
  Signal<bool?> get isOverdue => list.isOverdue;
  Signal<bool> get filterUnassigned => list.filterUnassigned;
  Signal<String> get sortBy => list.sortBy;
  Signal<String> get sortOrder => list.sortOrder;
  Signal<QuickFilter> get quickFilter => list.quickFilter;
  Signal<List<TicketLocation>> get availableLocations => list.availableLocations;
  Signal<List<AssignableMember>> get availableMembers => list.availableMembers;
  Signal<bool> get isFilterDataLoaded => list.isFilterDataLoaded;

  Computed<int> get taskCount => list.taskCount;
  Computed<List<TaskWithDetails>> get openTasks => list.openTasks;
  Computed<List<TaskWithDetails>> get closedTasks => list.closedTasks;
  Computed<List<TaskWithDetails>> get overdueTasks => list.overdueTasks;
  Computed<List<TaskWithDetails>> get unassignedTasks => list.unassignedTasks;
  Computed<bool> get hasFilters => list.hasFilters;

  Future<void> fetchTasks({bool refresh = false}) => list.fetchTasks(refresh: refresh);
  Future<void> loadMore() => list.loadMore();
  Future<void> goToPage(int page) => list.goToPage(page);
  Future<void> loadFilterOptions() => list.loadFilterOptions();

  void applyFilters({
    List<TaskStatus>? statuses,
    List<TaskType>? taskTypes,
    List<String>? assignees,
    List<String>? locations,
    String? search,
    DateTime? from,
    DateTime? to,
    bool? overdue,
    bool? unassigned,
    String? sort,
    String? order,
    QuickFilter? quick,
  }) =>
      list.applyFilters(
        statuses: statuses,
        taskTypes: taskTypes,
        assignees: assignees,
        locations: locations,
        search: search,
        from: from,
        to: to,
        overdue: overdue,
        unassigned: unassigned,
        sort: sort,
        order: order,
        quick: quick,
      );

  void setQuickFilter(QuickFilter filter) => list.setQuickFilter(filter);
  void clearFilters() => list.clearFilters();

  // ==========================================================================
  // Detail State Delegates
  // ==========================================================================

  Signal<TaskWithDetails?> get selectedTask => detail.selectedTask;
  Signal<List<TaskComment>> get taskComments => detail.taskComments;
  Signal<List<TaskActivity>> get taskActivity => detail.taskActivity;
  Signal<bool> get isLoadingDetails => detail.isLoading;

  Future<void> fetchTask(String id) => detail.fetchTask(id);
  Future<void> fetchTaskByExternalId(String externalId) =>
      detail.fetchTaskByExternalId(externalId);

  Future<Result<Task>> createTask({
    required String taskDefId,
    DateTime? scheduledDate,
    DateTime? dueDate,
    String? assigneeId,
    String? assignedRoleId,
  }) =>
      detail.createTask(
        taskDefId: taskDefId,
        scheduledDate: scheduledDate,
        dueDate: dueDate,
        assigneeId: assigneeId,
        assignedRoleId: assignedRoleId,
      );

  Future<Result<Task>> updateTaskAssignment({
    required String id,
    String? assigneeId,
    String? assignedRoleId,
  }) =>
      detail.updateTaskAssignment(
        id: id,
        assigneeId: assigneeId,
        assignedRoleId: assignedRoleId,
      );

  Future<Result<Task>> updateTaskStatus({
    required String id,
    required TaskStatus status,
    ResolutionType? resolutionType,
    String? notes,
  }) =>
      detail.updateTaskStatus(
        id: id,
        status: status,
        resolutionType: resolutionType,
        notes: notes,
      );

  Future<Result<Task>> claimTask(String id) => detail.claimTask(id);

  Future<void> fetchComments(String taskId) => detail.fetchComments(taskId);

  Future<Result<TaskComment>> createComment({
    required String taskId,
    required String content,
    List<String>? mentionedMemberIds,
  }) =>
      detail.createComment(
        taskId: taskId,
        content: content,
        mentionedMemberIds: mentionedMemberIds,
      );

  Future<Result<TaskComment>> updateComment({
    required String id,
    required String content,
  }) =>
      detail.updateComment(id: id, content: content);

  Future<Result<void>> deleteComment(String id) => detail.deleteComment(id);

  Future<void> fetchTaskActivity(String taskId) =>
      detail.fetchTaskActivity(taskId);

  void clearSelectedTask() => detail.clear();

  // ==========================================================================
  // Metrics State Delegates
  // ==========================================================================

  Signal<int> get metricsTotal => metrics.total;
  Signal<int> get metricsTotalLastMonth => metrics.totalLastMonth;
  Signal<double> get metricsAvgTimeToClose => metrics.avgTimeToClose;
  Signal<double> get metricsAvgResponseTime => metrics.avgResponseTime;
  Signal<double?> get metricsTimeToCloseChange => metrics.timeToCloseChange;
  Signal<double?> get metricsResponseTimeChange => metrics.responseTimeChange;
  Signal<int> get metricsOverdueCount => metrics.overdueCount;
  Signal<int> get metricsUnassignedCount => metrics.unassignedCount;
  Signal<bool> get metricsIsLoading => metrics.isLoading;
  Signal<List<double>> get weeklyOpenTickets => metrics.weeklyOpenTickets;
  Signal<List<double>> get weeklyTimeToClose => metrics.weeklyTimeToClose;
  Signal<List<double>> get weeklyResponseTimes => metrics.weeklyResponseTimes;

  Future<void> fetchMetrics() => metrics.fetchMetrics();

  // ==========================================================================
  // Cleanup
  // ==========================================================================

  void clear() {
    list.clear();
    detail.clear();
    metrics.clear();
  }
}
