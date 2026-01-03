import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/task.pb.dart';

/// ConnectRPC client for TaskService.
///
/// Uses generated protobuf types and the ConnectRPC transport for type-safe
/// RPC calls.
@lazySingleton
class TaskServiceClient {
  final Client _client;

  TaskServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.TaskService';

  // ============================================================================
  // Task Definition RPCs
  // ============================================================================

  Future<TaskDef> createTaskDef(CreateTaskDefRequest request) {
    return _client.unary(
      Spec<CreateTaskDefRequest, TaskDef>(
        '$_service/CreateTaskDef',
        StreamType.unary,
        CreateTaskDefRequest.create,
        TaskDef.create,
      ),
      request,
    );
  }

  Future<TaskDef> getTaskDef(GetTaskDefRequest request) {
    return _client.unary(
      Spec<GetTaskDefRequest, TaskDef>(
        '$_service/GetTaskDef',
        StreamType.unary,
        GetTaskDefRequest.create,
        TaskDef.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<TaskDef> updateTaskDef(UpdateTaskDefRequest request) {
    return _client.unary(
      Spec<UpdateTaskDefRequest, TaskDef>(
        '$_service/UpdateTaskDef',
        StreamType.unary,
        UpdateTaskDefRequest.create,
        TaskDef.create,
      ),
      request,
    );
  }

  Future<DeleteTaskDefResponse> deleteTaskDef(DeleteTaskDefRequest request) {
    return _client.unary(
      Spec<DeleteTaskDefRequest, DeleteTaskDefResponse>(
        '$_service/DeleteTaskDef',
        StreamType.unary,
        DeleteTaskDefRequest.create,
        DeleteTaskDefResponse.create,
      ),
      request,
    );
  }

  Future<ListTaskDefsResponse> listTaskDefs(ListTaskDefsRequest request) {
    return _client.unary(
      Spec<ListTaskDefsRequest, ListTaskDefsResponse>(
        '$_service/ListTaskDefs',
        StreamType.unary,
        ListTaskDefsRequest.create,
        ListTaskDefsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Task RPCs
  // ============================================================================

  Future<Task> createTask(CreateTaskRequest request) {
    return _client.unary(
      Spec<CreateTaskRequest, Task>(
        '$_service/CreateTask',
        StreamType.unary,
        CreateTaskRequest.create,
        Task.create,
      ),
      request,
    );
  }

  Future<TaskWithDetails> getTask(GetTaskRequest request) {
    return _client.unary(
      Spec<GetTaskRequest, TaskWithDetails>(
        '$_service/GetTask',
        StreamType.unary,
        GetTaskRequest.create,
        TaskWithDetails.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<TaskWithDetails> getTaskByExternalId(
      GetTaskByExternalIdRequest request) {
    return _client.unary(
      Spec<GetTaskByExternalIdRequest, TaskWithDetails>(
        '$_service/GetTaskByExternalId',
        StreamType.unary,
        GetTaskByExternalIdRequest.create,
        TaskWithDetails.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<Task> updateTask(UpdateTaskRequest request) {
    return _client.unary(
      Spec<UpdateTaskRequest, Task>(
        '$_service/UpdateTask',
        StreamType.unary,
        UpdateTaskRequest.create,
        Task.create,
      ),
      request,
    );
  }

  Future<DeleteTaskResponse> deleteTask(DeleteTaskRequest request) {
    return _client.unary(
      Spec<DeleteTaskRequest, DeleteTaskResponse>(
        '$_service/DeleteTask',
        StreamType.unary,
        DeleteTaskRequest.create,
        DeleteTaskResponse.create,
      ),
      request,
    );
  }

  Future<ListTasksResponse> listTasks(ListTasksRequest request) {
    return _client.unary(
      Spec<ListTasksRequest, ListTasksResponse>(
        '$_service/ListTasks',
        StreamType.unary,
        ListTasksRequest.create,
        ListTasksResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<Task> updateTaskStatus(UpdateTaskStatusRequest request) {
    return _client.unary(
      Spec<UpdateTaskStatusRequest, Task>(
        '$_service/UpdateTaskStatus',
        StreamType.unary,
        UpdateTaskStatusRequest.create,
        Task.create,
      ),
      request,
    );
  }

  Future<Task> claimTask(ClaimTaskRequest request) {
    return _client.unary(
      Spec<ClaimTaskRequest, Task>(
        '$_service/ClaimTask',
        StreamType.unary,
        ClaimTaskRequest.create,
        Task.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Comment RPCs
  // ============================================================================

  Future<TaskComment> createComment(CreateCommentRequest request) {
    return _client.unary(
      Spec<CreateCommentRequest, TaskComment>(
        '$_service/CreateComment',
        StreamType.unary,
        CreateCommentRequest.create,
        TaskComment.create,
      ),
      request,
    );
  }

  Future<TaskComment> updateComment(UpdateCommentRequest request) {
    return _client.unary(
      Spec<UpdateCommentRequest, TaskComment>(
        '$_service/UpdateComment',
        StreamType.unary,
        UpdateCommentRequest.create,
        TaskComment.create,
      ),
      request,
    );
  }

  Future<DeleteCommentResponse> deleteComment(DeleteCommentRequest request) {
    return _client.unary(
      Spec<DeleteCommentRequest, DeleteCommentResponse>(
        '$_service/DeleteComment',
        StreamType.unary,
        DeleteCommentRequest.create,
        DeleteCommentResponse.create,
      ),
      request,
    );
  }

  Future<ListCommentsResponse> listComments(ListCommentsRequest request) {
    return _client.unary(
      Spec<ListCommentsRequest, ListCommentsResponse>(
        '$_service/ListComments',
        StreamType.unary,
        ListCommentsRequest.create,
        ListCommentsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Activity RPCs
  // ============================================================================

  Future<GetTaskActivityResponse> getTaskActivity(
      GetTaskActivityRequest request) {
    return _client.unary(
      Spec<GetTaskActivityRequest, GetTaskActivityResponse>(
        '$_service/GetTaskActivity',
        StreamType.unary,
        GetTaskActivityRequest.create,
        GetTaskActivityResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Assignment Rule RPCs
  // ============================================================================

  Future<AssignmentRule> createAssignmentRule(
      CreateAssignmentRuleRequest request) {
    return _client.unary(
      Spec<CreateAssignmentRuleRequest, AssignmentRule>(
        '$_service/CreateAssignmentRule',
        StreamType.unary,
        CreateAssignmentRuleRequest.create,
        AssignmentRule.create,
      ),
      request,
    );
  }

  Future<AssignmentRule> updateAssignmentRule(
      UpdateAssignmentRuleRequest request) {
    return _client.unary(
      Spec<UpdateAssignmentRuleRequest, AssignmentRule>(
        '$_service/UpdateAssignmentRule',
        StreamType.unary,
        UpdateAssignmentRuleRequest.create,
        AssignmentRule.create,
      ),
      request,
    );
  }

  Future<DeleteAssignmentRuleResponse> deleteAssignmentRule(
      DeleteAssignmentRuleRequest request) {
    return _client.unary(
      Spec<DeleteAssignmentRuleRequest, DeleteAssignmentRuleResponse>(
        '$_service/DeleteAssignmentRule',
        StreamType.unary,
        DeleteAssignmentRuleRequest.create,
        DeleteAssignmentRuleResponse.create,
      ),
      request,
    );
  }

  Future<ListAssignmentRulesResponse> listAssignmentRules(
      ListAssignmentRulesRequest request) {
    return _client.unary(
      Spec<ListAssignmentRulesRequest, ListAssignmentRulesResponse>(
        '$_service/ListAssignmentRules',
        StreamType.unary,
        ListAssignmentRulesRequest.create,
        ListAssignmentRulesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Support RPCs
  // ============================================================================

  Future<GetAssignableMembersResponse> getAssignableMembers(
      GetAssignableMembersRequest request) {
    return _client.unary(
      Spec<GetAssignableMembersRequest, GetAssignableMembersResponse>(
        '$_service/GetAssignableMembers',
        StreamType.unary,
        GetAssignableMembersRequest.create,
        GetAssignableMembersResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GetAssignableRolesResponse> getAssignableRoles(
      GetAssignableRolesRequest request) {
    return _client.unary(
      Spec<GetAssignableRolesRequest, GetAssignableRolesResponse>(
        '$_service/GetAssignableRoles',
        StreamType.unary,
        GetAssignableRolesRequest.create,
        GetAssignableRolesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GetTicketLocationsResponse> getTicketLocations(
      GetTicketLocationsRequest request) {
    return _client.unary(
      Spec<GetTicketLocationsRequest, GetTicketLocationsResponse>(
        '$_service/GetTicketLocations',
        StreamType.unary,
        GetTicketLocationsRequest.create,
        GetTicketLocationsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GenerateTaskTitleResponse> generateTaskTitle(
      GenerateTaskTitleRequest request) {
    return _client.unary(
      Spec<GenerateTaskTitleRequest, GenerateTaskTitleResponse>(
        '$_service/GenerateTaskTitle',
        StreamType.unary,
        GenerateTaskTitleRequest.create,
        GenerateTaskTitleResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<TaskDefStatistics> getTaskDefStatistics(
      GetTaskDefStatisticsRequest request) {
    return _client.unary(
      Spec<GetTaskDefStatisticsRequest, TaskDefStatistics>(
        '$_service/GetTaskDefStatistics',
        StreamType.unary,
        GetTaskDefStatisticsRequest.create,
        TaskDefStatistics.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<ListTasksResponse> getUpcomingTasks(GetUpcomingTasksRequest request) {
    return _client.unary(
      Spec<GetUpcomingTasksRequest, ListTasksResponse>(
        '$_service/GetUpcomingTasks',
        StreamType.unary,
        GetUpcomingTasksRequest.create,
        ListTasksResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<ListTasksResponse> getOverdueTasks(GetOverdueTasksRequest request) {
    return _client.unary(
      Spec<GetOverdueTasksRequest, ListTasksResponse>(
        '$_service/GetOverdueTasks',
        StreamType.unary,
        GetOverdueTasksRequest.create,
        ListTasksResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<TaskManagementOverview> getTaskManagementOverview(
      GetTaskManagementOverviewRequest request) {
    return _client.unary(
      Spec<GetTaskManagementOverviewRequest, TaskManagementOverview>(
        '$_service/GetTaskManagementOverview',
        StreamType.unary,
        GetTaskManagementOverviewRequest.create,
        TaskManagementOverview.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ===== Attachments =====

  Future<GetAttachmentUploadUrlResponse> getAttachmentUploadUrl(
      GetAttachmentUploadUrlRequest request) {
    return _client.unary(
      Spec<GetAttachmentUploadUrlRequest, GetAttachmentUploadUrlResponse>(
        '$_service/GetAttachmentUploadUrl',
        StreamType.unary,
        GetAttachmentUploadUrlRequest.create,
        GetAttachmentUploadUrlResponse.create,
      ),
      request,
    );
  }

  Future<TaskAttachment> confirmAttachmentUpload(
      ConfirmAttachmentUploadRequest request) {
    return _client.unary(
      Spec<ConfirmAttachmentUploadRequest, TaskAttachment>(
        '$_service/ConfirmAttachmentUpload',
        StreamType.unary,
        ConfirmAttachmentUploadRequest.create,
        TaskAttachment.create,
      ),
      request,
    );
  }

  Future<ListTaskAttachmentsResponse> listTaskAttachments(
      ListTaskAttachmentsRequest request) {
    return _client.unary(
      Spec<ListTaskAttachmentsRequest, ListTaskAttachmentsResponse>(
        '$_service/ListTaskAttachments',
        StreamType.unary,
        ListTaskAttachmentsRequest.create,
        ListTaskAttachmentsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<DeleteAttachmentResponse> deleteAttachment(
      DeleteAttachmentRequest request) {
    return _client.unary(
      Spec<DeleteAttachmentRequest, DeleteAttachmentResponse>(
        '$_service/DeleteAttachment',
        StreamType.unary,
        DeleteAttachmentRequest.create,
        DeleteAttachmentResponse.create,
      ),
      request,
    );
  }

  Future<TaskAttachment> updateAttachment(UpdateAttachmentRequest request) {
    return _client.unary(
      Spec<UpdateAttachmentRequest, TaskAttachment>(
        '$_service/UpdateAttachment',
        StreamType.unary,
        UpdateAttachmentRequest.create,
        TaskAttachment.create,
      ),
      request,
    );
  }

  // ===== Task Definition Attachments =====

  Future<GetAttachmentUploadUrlResponse> getTaskDefAttachmentUploadUrl(
      GetTaskDefAttachmentUploadUrlRequest request) {
    return _client.unary(
      Spec<GetTaskDefAttachmentUploadUrlRequest,
          GetAttachmentUploadUrlResponse>(
        '$_service/GetTaskDefAttachmentUploadUrl',
        StreamType.unary,
        GetTaskDefAttachmentUploadUrlRequest.create,
        GetAttachmentUploadUrlResponse.create,
      ),
      request,
    );
  }

  Future<TaskAttachment> confirmTaskDefAttachmentUpload(
      ConfirmTaskDefAttachmentUploadRequest request) {
    return _client.unary(
      Spec<ConfirmTaskDefAttachmentUploadRequest, TaskAttachment>(
        '$_service/ConfirmTaskDefAttachmentUpload',
        StreamType.unary,
        ConfirmTaskDefAttachmentUploadRequest.create,
        TaskAttachment.create,
      ),
      request,
    );
  }

  Future<ListTaskAttachmentsResponse> listTaskDefAttachments(
      ListTaskDefAttachmentsRequest request) {
    return _client.unary(
      Spec<ListTaskDefAttachmentsRequest, ListTaskAttachmentsResponse>(
        '$_service/ListTaskDefAttachments',
        StreamType.unary,
        ListTaskDefAttachmentsRequest.create,
        ListTaskAttachmentsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<DeleteAttachmentResponse> deleteTaskDefAttachment(
      DeleteTaskDefAttachmentRequest request) {
    return _client.unary(
      Spec<DeleteTaskDefAttachmentRequest, DeleteAttachmentResponse>(
        '$_service/DeleteTaskDefAttachment',
        StreamType.unary,
        DeleteTaskDefAttachmentRequest.create,
        DeleteAttachmentResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Recurrence RPCs
  // ============================================================================

  Future<ValidateRecurrenceRuleResponse> validateRecurrenceRule(
      ValidateRecurrenceRuleRequest request) {
    return _client.unary(
      Spec<ValidateRecurrenceRuleRequest, ValidateRecurrenceRuleResponse>(
        '$_service/ValidateRecurrenceRule',
        StreamType.unary,
        ValidateRecurrenceRuleRequest.create,
        ValidateRecurrenceRuleResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<PreviewRecurrenceOccurrencesResponse> previewRecurrenceOccurrences(
      PreviewRecurrenceOccurrencesRequest request) {
    return _client.unary(
      Spec<PreviewRecurrenceOccurrencesRequest,
          PreviewRecurrenceOccurrencesResponse>(
        '$_service/PreviewRecurrenceOccurrences',
        StreamType.unary,
        PreviewRecurrenceOccurrencesRequest.create,
        PreviewRecurrenceOccurrencesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<CreateRecurrenceRuleResponse> createRecurrenceRule(
      CreateRecurrenceRuleRequest request) {
    return _client.unary(
      Spec<CreateRecurrenceRuleRequest, CreateRecurrenceRuleResponse>(
        '$_service/CreateRecurrenceRule',
        StreamType.unary,
        CreateRecurrenceRuleRequest.create,
        CreateRecurrenceRuleResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Bulk Operation RPCs
  // ============================================================================

  Future<BulkCreateTaskDefsResponse> bulkCreateTaskDefs(
      BulkCreateTaskDefsRequest request) {
    return _client.unary(
      Spec<BulkCreateTaskDefsRequest, BulkCreateTaskDefsResponse>(
        '$_service/BulkCreateTaskDefs',
        StreamType.unary,
        BulkCreateTaskDefsRequest.create,
        BulkCreateTaskDefsResponse.create,
      ),
      request,
    );
  }

  Future<BulkUpdateTaskDefsResponse> bulkUpdateTaskDefs(
      BulkUpdateTaskDefsRequest request) {
    return _client.unary(
      Spec<BulkUpdateTaskDefsRequest, BulkUpdateTaskDefsResponse>(
        '$_service/BulkUpdateTaskDefs',
        StreamType.unary,
        BulkUpdateTaskDefsRequest.create,
        BulkUpdateTaskDefsResponse.create,
      ),
      request,
    );
  }

  Future<BulkDeleteTaskDefsResponse> bulkDeleteTaskDefs(
      BulkDeleteTaskDefsRequest request) {
    return _client.unary(
      Spec<BulkDeleteTaskDefsRequest, BulkDeleteTaskDefsResponse>(
        '$_service/BulkDeleteTaskDefs',
        StreamType.unary,
        BulkDeleteTaskDefsRequest.create,
        BulkDeleteTaskDefsResponse.create,
      ),
      request,
    );
  }

  Future<BulkUpdateTaskStatusResponse> bulkUpdateTaskStatus(
      BulkUpdateTaskStatusRequest request) {
    return _client.unary(
      Spec<BulkUpdateTaskStatusRequest, BulkUpdateTaskStatusResponse>(
        '$_service/BulkUpdateTaskStatus',
        StreamType.unary,
        BulkUpdateTaskStatusRequest.create,
        BulkUpdateTaskStatusResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Task Definition History RPCs
  // ============================================================================

  Future<GetTaskDefHistoryResponse> getTaskDefHistory(
      GetTaskDefHistoryRequest request) {
    return _client.unary(
      Spec<GetTaskDefHistoryRequest, GetTaskDefHistoryResponse>(
        '$_service/GetTaskDefHistory',
        StreamType.unary,
        GetTaskDefHistoryRequest.create,
        GetTaskDefHistoryResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }
}
