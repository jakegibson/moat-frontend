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

/// Task list state management.
///
/// Manages the task list view including:
/// - Task list data and loading
/// - Pagination
/// - Filters and sorting
/// - Filter options (locations, members)
@lazySingleton
class TaskListState {
  final TaskClient _client;
  final AuthState _authState;

  TaskListState(this._client, this._authState);

  // ==========================================================================
  // Core State
  // ==========================================================================

  /// List of tasks with details
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
  static const pageSize = 50;

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
    List<String>? assigneeIds =
        assigneeFilter.value.isEmpty ? null : assigneeFilter.value;
    List<String>? requestedByIds;

    final userId = _currentUserId;
    if (userId != null) {
      switch (quickFilter.value) {
        case QuickFilter.myTickets:
          assigneeIds = [userId];
          break;
        case QuickFilter.myRequests:
          requestedByIds = [userId];
          break;
        case QuickFilter.all:
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
          limit: pageSize,
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

  /// Go to specific page (1-indexed)
  Future<void> goToPage(int page) async {
    if (isLoading.value) return;
    final offset = (page - 1) * pageSize;
    currentOffset.value = offset;
    await fetchTasks(refresh: true);
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

  /// Update a task in the list (after status/assignment change)
  void updateTaskInList(Task task) {
    tasks.value = tasks.value.map((t) {
      if (t.id == task.id) {
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

  /// Clear list state
  void clear() {
    batch(() {
      tasks.value = [];
      totalCount.value = 0;
      currentOffset.value = 0;
      hasMore.value = true;
      error.value = null;
    });
    clearFilters();
  }
}
