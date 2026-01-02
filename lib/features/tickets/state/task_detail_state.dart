import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/task_client.dart';
import '../data/task_models.dart';
import 'task_list_state.dart';

/// Task detail state management.
///
/// Manages the task detail view including:
/// - Selected task data
/// - Comments
/// - Activity/history
/// - Task operations (claim, status updates)
@lazySingleton
class TaskDetailState {
  final TaskClient _client;
  final TaskListState _listState;

  TaskDetailState(this._client, this._listState);

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
  final isLoading = signal(false);

  /// Error state
  final error = signal<AppError?>(null);

  // ==========================================================================
  // Task Detail Operations
  // ==========================================================================

  /// Fetch a single task by ID
  Future<void> fetchTask(String id) async {
    isLoading.value = true;
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

    isLoading.value = false;
  }

  /// Fetch a task by external ID (e.g., PM-1000)
  Future<void> fetchTaskByExternalId(String externalId) async {
    isLoading.value = true;
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

    isLoading.value = false;
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
        _listState.fetchTasks(refresh: true);
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
        _listState.updateTaskInList(task);
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
        _listState.updateTaskInList(task);

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
        _listState.updateTaskInList(task);
      },
      error: (e) {
        error.value = e;
      },
    );

    return result;
  }

  // ==========================================================================
  // Comment Operations
  // ==========================================================================

  /// Fetch comments for a task
  Future<void> fetchComments(String taskId) async {
    isLoading.value = true;

    final result = await _client.listComments(taskId: taskId).toResult();

    result.when(
      ok: (comments) {
        taskComments.value = comments;
      },
      error: (e) {
        error.value = e;
      },
    );

    isLoading.value = false;
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
  // Cleanup
  // ==========================================================================

  /// Clear selected task state
  void clear() {
    batch(() {
      selectedTask.value = null;
      taskComments.value = [];
      taskActivity.value = [];
      error.value = null;
    });
  }
}
