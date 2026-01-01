import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../../auth/state/auth_state.dart';
import '../data/task_client.dart';
import '../data/task_models.dart';

/// Quick filter presets for common ticket views
enum QuickFilter {
  all,
  myTickets,
  myRequests,
}

/// Task/Ticket state management using signals.
///
/// This manages the state for the ticket list and detail views,
/// including filters, pagination, and CRUD operations.
@lazySingleton
class TaskState {
  final TaskClient _client;
  final AuthState _authState;

  TaskState(this._client, this._authState);

  // ==========================================================================
  // Core State
  // ==========================================================================

  /// List of tasks with details (for list view)
  final tasks = signal<List<TaskWithDetails>>([]);

  /// Loading state
  final isLoading = signal(false);

  /// Error state
  final error = signal<AppError?>(null);

  // ==========================================================================
  // Pagination
  // ==========================================================================

  /// Total count from server
  final totalCount = signal(0);

  /// Current offset for pagination
  final currentOffset = signal(0);

  /// Whether more items are available
  final hasMore = signal(true);

  /// Page size
  static const _pageSize = 50;

  // ==========================================================================
  // Filters
  // ==========================================================================

  /// Status filter
  final statusFilter = signal<List<TaskStatus>>([]);

  /// Task type filter
  final taskTypeFilter = signal<List<TaskType>>([]);

  /// Assignee filter
  final assigneeFilter = signal<List<String>>([]);

  /// Location filter
  final locationFilter = signal<List<String>>([]);

  /// Search query
  final searchQuery = signal('');

  /// Date range - from
  final fromDate = signal<DateTime?>(null);

  /// Date range - to
  final toDate = signal<DateTime?>(null);

  /// Overdue filter
  final isOverdue = signal<bool?>(null);

  /// Unassigned filter
  final filterUnassigned = signal(false);

  /// Sort field
  final sortBy = signal('scheduledDate');

  /// Sort order (asc or desc)
  final sortOrder = signal('desc');

  /// Quick filter preset (My Tickets, My Requests, All)
  final quickFilter = signal(QuickFilter.all);

  /// Current user's member ID (for quick filters)
  String? get _currentUserId => _authState.user?.id;

  // ==========================================================================
  // Selected Task State
  // ==========================================================================

  /// Currently selected task (for detail view)
  final selectedTask = signal<TaskWithDetails?>(null);

  /// Comments for the selected task
  final taskComments = signal<List<TaskComment>>([]);

  /// Activity/history for the selected task
  final taskActivity = signal<List<TaskActivity>>([]);

  /// Loading state for task details
  final isLoadingDetails = signal(false);

  // ==========================================================================
  // Filter Options Data
  // ==========================================================================

  /// Available locations for filtering
  final availableLocations = signal<List<TicketLocation>>([]);

  /// Available members for filtering
  final availableMembers = signal<List<AssignableMember>>([]);

  /// Whether filter options are loaded
  final isFilterDataLoaded = signal(false);

  /// Load filter options (locations and members)
  Future<void> loadFilterOptions() async {
    if (isFilterDataLoaded.value) return;

    try {
      final results = await Future.wait([
        _client.getTicketLocations(),
        _client.getAssignableMembers(),
      ]);
      batch(() {
        availableLocations.value = results[0] as List<TicketLocation>;
        availableMembers.value = results[1] as List<AssignableMember>;
        isFilterDataLoaded.value = true;
      });
    } catch (e) {
      // Silently fail - filter options are not critical
    }
  }

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  late final taskCount = computed(() => tasks.value.length);

  late final openTasks = computed(
    () => tasks.value.where((t) => t.status.isOpen).toList(),
  );

  late final closedTasks = computed(
    () => tasks.value.where((t) => t.status.isClosed).toList(),
  );

  late final overdueTasks = computed(
    () => tasks.value.where((t) => t.isOverdue).toList(),
  );

  late final unassignedTasks = computed(
    () => tasks.value.where((t) => !t.isAssigned).toList(),
  );

  late final hasFilters = computed(
    () =>
        statusFilter.value.isNotEmpty ||
        taskTypeFilter.value.isNotEmpty ||
        assigneeFilter.value.isNotEmpty ||
        locationFilter.value.isNotEmpty ||
        searchQuery.value.isNotEmpty ||
        fromDate.value != null ||
        toDate.value != null ||
        isOverdue.value != null ||
        filterUnassigned.value ||
        quickFilter.value != QuickFilter.all,
  );

  // ==========================================================================
  // Task List Operations
  // ==========================================================================

  /// Fetch tasks with current filters
  Future<void> fetchTasks({bool refresh = false}) async {
    if (isLoading.value && !refresh) return;

    if (refresh) {
      batch(() {
        currentOffset.value = 0;
        hasMore.value = true;
      });
    }

    isLoading.value = true;
    error.value = null;

    // Compute assignee and requester filters based on quick filter
    List<String>? assigneeIds = assigneeFilter.value.isEmpty ? null : assigneeFilter.value;
    List<String>? requestedByIds;

    final userId = _currentUserId;
    if (userId != null) {
      switch (quickFilter.value) {
        case QuickFilter.myTickets:
          // Filter by tasks assigned to current user
          assigneeIds = [userId];
          break;
        case QuickFilter.myRequests:
          // Filter by tasks requested by current user
          requestedByIds = [userId];
          break;
        case QuickFilter.all:
          // Use explicit assignee filter if set
          break;
      }
    }

    final result = await _client
        .listTasks(
          statuses: statusFilter.value.isEmpty ? null : statusFilter.value,
          taskTypes: taskTypeFilter.value.isEmpty ? null : taskTypeFilter.value,
          assigneeIds: assigneeIds,
          requestedByIds: requestedByIds,
          locationIds:
              locationFilter.value.isEmpty ? null : locationFilter.value,
          search: searchQuery.value.isEmpty ? null : searchQuery.value,
          fromDate: fromDate.value,
          toDate: toDate.value,
          isOverdue: isOverdue.value,
          filterUnassigned: filterUnassigned.value,
          sortBy: sortBy.value,
          sortOrder: sortOrder.value,
          limit: _pageSize,
          offset: currentOffset.value,
        )
        .toResult();

    result.when(
      ok: (paginated) {
        batch(() {
          if (refresh || currentOffset.value == 0) {
            tasks.value = paginated.items;
          } else {
            tasks.value = [...tasks.value, ...paginated.items];
          }
          totalCount.value = paginated.total;
          hasMore.value = tasks.value.length < paginated.total;
          currentOffset.value = tasks.value.length;
        });
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoading.value = false;
  }

  /// Load next page
  Future<void> loadMore() async {
    if (!hasMore.value || isLoading.value) return;
    await fetchTasks();
  }

  /// Apply filters and refresh
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
  }) {
    batch(() {
      if (statuses != null) statusFilter.value = statuses;
      if (taskTypes != null) taskTypeFilter.value = taskTypes;
      if (assignees != null) assigneeFilter.value = assignees;
      if (locations != null) locationFilter.value = locations;
      if (search != null) searchQuery.value = search;
      if (from != null) fromDate.value = from;
      if (to != null) toDate.value = to;
      if (overdue != null) isOverdue.value = overdue;
      if (unassigned != null) filterUnassigned.value = unassigned;
      if (sort != null) sortBy.value = sort;
      if (order != null) sortOrder.value = order;
      if (quick != null) quickFilter.value = quick;
    });
    fetchTasks(refresh: true);
  }

  /// Set quick filter preset
  void setQuickFilter(QuickFilter filter) {
    quickFilter.value = filter;
    fetchTasks(refresh: true);
  }

  /// Clear all filters
  void clearFilters() {
    batch(() {
      statusFilter.value = [];
      taskTypeFilter.value = [];
      assigneeFilter.value = [];
      locationFilter.value = [];
      searchQuery.value = '';
      fromDate.value = null;
      toDate.value = null;
      isOverdue.value = null;
      filterUnassigned.value = false;
      sortBy.value = 'scheduledDate';
      sortOrder.value = 'desc';
      quickFilter.value = QuickFilter.all;
    });
    fetchTasks(refresh: true);
  }

  // ==========================================================================
  // Task Detail Operations
  // ==========================================================================

  /// Fetch a single task by ID
  Future<void> fetchTask(String id) async {
    isLoadingDetails.value = true;
    error.value = null;

    final result = await _client.getTask(id).toResult();

    result.when(
      ok: (task) {
        selectedTask.value = task;
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoadingDetails.value = false;
  }

  /// Fetch a task by external ID (e.g., PM-1000)
  Future<void> fetchTaskByExternalId(String externalId) async {
    isLoadingDetails.value = true;
    error.value = null;

    final result = await _client.getTaskByExternalId(externalId).toResult();

    result.when(
      ok: (task) {
        selectedTask.value = task;
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoadingDetails.value = false;
  }

  /// Create a new task
  Future<Result<Task>> createTask({
    required String taskDefId,
    DateTime? scheduledDate,
    DateTime? dueDate,
    String? assigneeId,
    String? assignedRoleId,
  }) async {
    isLoading.value = true;

    final result = await _client
        .createTask(
          taskDefId: taskDefId,
          scheduledDate: scheduledDate,
          dueDate: dueDate,
          assigneeId: assigneeId,
          assignedRoleId: assignedRoleId,
        )
        .toResult();

    result.when(
      ok: (_) {
        // Refresh the list to include the new task
        fetchTasks(refresh: true);
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoading.value = false;
    return result;
  }

  /// Update task assignment
  Future<Result<Task>> updateTaskAssignment({
    required String id,
    String? assigneeId,
    String? assignedRoleId,
  }) async {
    final result = await _client
        .updateTask(
          id: id,
          assigneeId: assigneeId,
          assignedRoleId: assignedRoleId,
        )
        .toResult();

    result.when(
      ok: (task) {
        // Update in list if present
        _updateTaskInList(task);
      },
      error: (e) {
        error.value = e;
      },
    );

    return result;
  }

  /// Update task status
  Future<Result<Task>> updateTaskStatus({
    required String id,
    required TaskStatus status,
    ResolutionType? resolutionType,
    String? notes,
  }) async {
    final result = await _client
        .updateTaskStatus(
          id: id,
          status: status,
          resolutionType: resolutionType,
          notes: notes,
        )
        .toResult();

    result.when(
      ok: (task) {
        // Update in list if present
        _updateTaskInList(task);

        // Refresh activity if we have a selected task
        if (selectedTask.value?.id == id) {
          fetchTaskActivity(id);
        }
      },
      error: (e) {
        error.value = e;
      },
    );

    return result;
  }

  /// Claim a task (assign to current user)
  Future<Result<Task>> claimTask(String id) async {
    final result = await _client.claimTask(id).toResult();

    result.when(
      ok: (task) {
        _updateTaskInList(task);
      },
      error: (e) {
        error.value = e;
      },
    );

    return result;
  }

  void _updateTaskInList(Task task) {
    tasks.value = tasks.value.map((t) {
      if (t.id == task.id) {
        // Create updated TaskWithDetails preserving the joined fields
        return TaskWithDetails(
          id: task.id,
          taskDefId: task.taskDefId,
          assigneeId: task.assigneeId,
          assignedRoleId: task.assignedRoleId,
          requestedById: task.requestedById,
          assignedById: task.assignedById,
          scheduledDate: task.scheduledDate,
          dueDate: task.dueDate,
          completedDate: task.completedDate,
          status: task.status,
          resolutionType: task.resolutionType,
          externalId: task.externalId,
          details: task.details,
          createdAt: task.createdAt,
          updatedAt: task.updatedAt,
          // Preserve joined fields
          taskType: t.taskType,
          title: t.title,
          description: t.description,
          locationId: t.locationId,
          locationName: t.locationName,
          assetId: t.assetId,
          taskDefCreatedAt: t.taskDefCreatedAt,
          specificLocation: t.specificLocation,
          floorLocation: t.floorLocation,
          serviceArea: t.serviceArea,
          assigneeFirstName: t.assigneeFirstName,
          assigneeLastName: t.assigneeLastName,
          requestedByFirstName: t.requestedByFirstName,
          requestedByLastName: t.requestedByLastName,
          assignedByFirstName: t.assignedByFirstName,
          assignedByLastName: t.assignedByLastName,
        );
      }
      return t;
    }).toList();
  }

  // ==========================================================================
  // Comment Operations
  // ==========================================================================

  /// Fetch comments for a task
  Future<void> fetchComments(String taskId) async {
    isLoadingDetails.value = true;

    final result = await _client.listComments(taskId: taskId).toResult();

    result.when(
      ok: (comments) {
        taskComments.value = comments;
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoadingDetails.value = false;
  }

  /// Create a comment
  Future<Result<TaskComment>> createComment({
    required String taskId,
    required String content,
    List<String>? mentionedMemberIds,
  }) async {
    final result = await _client
        .createComment(
          taskId: taskId,
          content: content,
          mentionedMemberIds: mentionedMemberIds,
        )
        .toResult();

    result.when(
      ok: (comment) {
        // Add to beginning of list
        taskComments.value = [comment, ...taskComments.value];
        // Refresh activity
        fetchTaskActivity(taskId);
      },
      error: (e) {
        error.value = e;
      },
    );

    return result;
  }

  /// Update a comment
  Future<Result<TaskComment>> updateComment({
    required String id,
    required String content,
  }) async {
    final result = await _client
        .updateComment(
          id: id,
          content: content,
        )
        .toResult();

    result.when(
      ok: (updated) {
        taskComments.value = taskComments.value
            .map((c) => c.id == updated.id ? updated : c)
            .toList();
      },
      error: (e) {
        error.value = e;
      },
    );

    return result;
  }

  /// Delete a comment
  Future<Result<void>> deleteComment(String id) async {
    final previousComments = taskComments.value;

    // Optimistic remove
    taskComments.value = taskComments.value.where((c) => c.id != id).toList();

    final result = await _client.deleteComment(id).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        // Rollback
        taskComments.value = previousComments;
        error.value = e;
      },
    );

    return result;
  }

  // ==========================================================================
  // Activity Operations
  // ==========================================================================

  /// Fetch activity/history for a task
  Future<void> fetchTaskActivity(String taskId) async {
    final result = await _client.getTaskActivity(taskId: taskId).toResult();

    result.when(
      ok: (activity) {
        taskActivity.value = activity;
      },
      error: (e) {
        error.value = e;
      },
    );
  }

  // ==========================================================================
  // Metrics State
  // ==========================================================================

  /// Metrics data
  final metricsTotal = signal(0);
  final metricsTotalLastMonth = signal(0);
  final metricsAvgTimeToClose = signal(0.0);
  final metricsAvgResponseTime = signal(0.0);
  final metricsTimeToCloseChange = signal<double?>(null);
  final metricsResponseTimeChange = signal<double?>(null);
  final metricsOverdueCount = signal(0);
  final metricsUnassignedCount = signal(0);
  final metricsIsLoading = signal(false);

  /// Weekly chart data
  final weeklyOpenTickets = signal<List<double>>([]);
  final weeklyTimeToClose = signal<List<double>>([]);
  final weeklyResponseTimes = signal<List<double>>([]);

  /// Fetch task management overview metrics
  Future<void> fetchMetrics() async {
    metricsIsLoading.value = true;

    try {
      final overview = await _client.getTaskManagementOverview();
      batch(() {
        metricsTotal.value = overview.totalTasks;
        metricsAvgTimeToClose.value = overview.avgTimeToCloseHours;
        metricsAvgResponseTime.value = overview.avgResponseTimeHours;
        metricsOverdueCount.value = overview.overdueTasks;
        metricsUnassignedCount.value = overview.unassignedTasks;

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
          // Sum of weekly created counts gives last month approximation
          final totalCreatedLastMonth = overview.weeklyCreated.fold<int>(
            0,
            (sum, point) => sum + point.count,
          );
          metricsTotalLastMonth.value = totalCreatedLastMonth;
        }

        // Calculate change percentages from weekly data if available
        if (overview.weeklyTimeToClose.length >= 2) {
          final current = overview.weeklyTimeToClose.last.averageHours;
          final previous = overview.weeklyTimeToClose[overview.weeklyTimeToClose.length - 2].averageHours;
          if (previous > 0) {
            metricsTimeToCloseChange.value = ((current - previous) / previous) * 100;
          }
        }
        if (overview.weeklyResponseTime.length >= 2) {
          final current = overview.weeklyResponseTime.last.averageHours;
          final previous = overview.weeklyResponseTime[overview.weeklyResponseTime.length - 2].averageHours;
          if (previous > 0) {
            metricsResponseTimeChange.value = ((current - previous) / previous) * 100;
          }
        }
      });
    } catch (e) {
      // Silently fail - metrics are not critical
    }

    metricsIsLoading.value = false;
  }

  // ==========================================================================
  // Cleanup
  // ==========================================================================

  /// Clear selected task state
  void clearSelectedTask() {
    batch(() {
      selectedTask.value = null;
      taskComments.value = [];
      taskActivity.value = [];
    });
  }

  /// Clear all state
  void clear() {
    batch(() {
      tasks.value = [];
      totalCount.value = 0;
      currentOffset.value = 0;
      hasMore.value = true;
      selectedTask.value = null;
      taskComments.value = [];
      taskActivity.value = [];
      error.value = null;
    });
    clearFilters();
  }
}
