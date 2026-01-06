//
//  Generated code. Do not modify.
//  source: moat/v1/task.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'task.pb.dart' as $9;
import 'task.pbjson.dart';

export 'task.pb.dart';

abstract class TaskServiceBase extends $pb.GeneratedService {
  $async.Future<$9.TaskDef> createTaskDef($pb.ServerContext ctx, $9.CreateTaskDefRequest request);
  $async.Future<$9.TaskDef> getTaskDef($pb.ServerContext ctx, $9.GetTaskDefRequest request);
  $async.Future<$9.TaskDef> updateTaskDef($pb.ServerContext ctx, $9.UpdateTaskDefRequest request);
  $async.Future<$9.DeleteTaskDefResponse> deleteTaskDef($pb.ServerContext ctx, $9.DeleteTaskDefRequest request);
  $async.Future<$9.ListTaskDefsResponse> listTaskDefs($pb.ServerContext ctx, $9.ListTaskDefsRequest request);
  $async.Future<$9.Task> createTask($pb.ServerContext ctx, $9.CreateTaskRequest request);
  $async.Future<$9.TaskWithDetails> getTask($pb.ServerContext ctx, $9.GetTaskRequest request);
  $async.Future<$9.TaskWithDetails> getTaskByExternalId($pb.ServerContext ctx, $9.GetTaskByExternalIdRequest request);
  $async.Future<$9.Task> updateTask($pb.ServerContext ctx, $9.UpdateTaskRequest request);
  $async.Future<$9.DeleteTaskResponse> deleteTask($pb.ServerContext ctx, $9.DeleteTaskRequest request);
  $async.Future<$9.ListTasksResponse> listTasks($pb.ServerContext ctx, $9.ListTasksRequest request);
  $async.Future<$9.Task> updateTaskStatus($pb.ServerContext ctx, $9.UpdateTaskStatusRequest request);
  $async.Future<$9.Task> claimTask($pb.ServerContext ctx, $9.ClaimTaskRequest request);
  $async.Future<$9.TaskComment> createComment($pb.ServerContext ctx, $9.CreateCommentRequest request);
  $async.Future<$9.TaskComment> updateComment($pb.ServerContext ctx, $9.UpdateCommentRequest request);
  $async.Future<$9.DeleteCommentResponse> deleteComment($pb.ServerContext ctx, $9.DeleteCommentRequest request);
  $async.Future<$9.ListCommentsResponse> listComments($pb.ServerContext ctx, $9.ListCommentsRequest request);
  $async.Future<$9.GetTaskActivityResponse> getTaskActivity($pb.ServerContext ctx, $9.GetTaskActivityRequest request);
  $async.Future<$9.AssignmentRule> createAssignmentRule($pb.ServerContext ctx, $9.CreateAssignmentRuleRequest request);
  $async.Future<$9.AssignmentRule> updateAssignmentRule($pb.ServerContext ctx, $9.UpdateAssignmentRuleRequest request);
  $async.Future<$9.DeleteAssignmentRuleResponse> deleteAssignmentRule($pb.ServerContext ctx, $9.DeleteAssignmentRuleRequest request);
  $async.Future<$9.ListAssignmentRulesResponse> listAssignmentRules($pb.ServerContext ctx, $9.ListAssignmentRulesRequest request);
  $async.Future<$9.GetAssignableMembersResponse> getAssignableMembers($pb.ServerContext ctx, $9.GetAssignableMembersRequest request);
  $async.Future<$9.GetAssignableRolesResponse> getAssignableRoles($pb.ServerContext ctx, $9.GetAssignableRolesRequest request);
  $async.Future<$9.GetTicketLocationsResponse> getTicketLocations($pb.ServerContext ctx, $9.GetTicketLocationsRequest request);
  $async.Future<$9.GenerateTaskTitleResponse> generateTaskTitle($pb.ServerContext ctx, $9.GenerateTaskTitleRequest request);
  $async.Future<$9.TaskDefStatistics> getTaskDefStatistics($pb.ServerContext ctx, $9.GetTaskDefStatisticsRequest request);
  $async.Future<$9.ListTasksResponse> getUpcomingTasks($pb.ServerContext ctx, $9.GetUpcomingTasksRequest request);
  $async.Future<$9.ListTasksResponse> getOverdueTasks($pb.ServerContext ctx, $9.GetOverdueTasksRequest request);
  $async.Future<$9.TaskManagementOverview> getTaskManagementOverview($pb.ServerContext ctx, $9.GetTaskManagementOverviewRequest request);
  $async.Future<$9.GetAttachmentUploadUrlResponse> getAttachmentUploadUrl($pb.ServerContext ctx, $9.GetAttachmentUploadUrlRequest request);
  $async.Future<$9.TaskAttachment> confirmAttachmentUpload($pb.ServerContext ctx, $9.ConfirmAttachmentUploadRequest request);
  $async.Future<$9.ListTaskAttachmentsResponse> listTaskAttachments($pb.ServerContext ctx, $9.ListTaskAttachmentsRequest request);
  $async.Future<$9.DeleteAttachmentResponse> deleteAttachment($pb.ServerContext ctx, $9.DeleteAttachmentRequest request);
  $async.Future<$9.TaskAttachment> updateAttachment($pb.ServerContext ctx, $9.UpdateAttachmentRequest request);
  $async.Future<$9.GetAttachmentUploadUrlResponse> getTaskDefAttachmentUploadUrl($pb.ServerContext ctx, $9.GetTaskDefAttachmentUploadUrlRequest request);
  $async.Future<$9.TaskAttachment> confirmTaskDefAttachmentUpload($pb.ServerContext ctx, $9.ConfirmTaskDefAttachmentUploadRequest request);
  $async.Future<$9.ListTaskAttachmentsResponse> listTaskDefAttachments($pb.ServerContext ctx, $9.ListTaskDefAttachmentsRequest request);
  $async.Future<$9.DeleteAttachmentResponse> deleteTaskDefAttachment($pb.ServerContext ctx, $9.DeleteTaskDefAttachmentRequest request);
  $async.Future<$9.ValidateRecurrenceRuleResponse> validateRecurrenceRule($pb.ServerContext ctx, $9.ValidateRecurrenceRuleRequest request);
  $async.Future<$9.PreviewRecurrenceOccurrencesResponse> previewRecurrenceOccurrences($pb.ServerContext ctx, $9.PreviewRecurrenceOccurrencesRequest request);
  $async.Future<$9.CreateRecurrenceRuleResponse> createRecurrenceRule($pb.ServerContext ctx, $9.CreateRecurrenceRuleRequest request);
  $async.Future<$9.BulkCreateTaskDefsResponse> bulkCreateTaskDefs($pb.ServerContext ctx, $9.BulkCreateTaskDefsRequest request);
  $async.Future<$9.BulkUpdateTaskDefsResponse> bulkUpdateTaskDefs($pb.ServerContext ctx, $9.BulkUpdateTaskDefsRequest request);
  $async.Future<$9.BulkDeleteTaskDefsResponse> bulkDeleteTaskDefs($pb.ServerContext ctx, $9.BulkDeleteTaskDefsRequest request);
  $async.Future<$9.BulkUpdateTaskStatusResponse> bulkUpdateTaskStatus($pb.ServerContext ctx, $9.BulkUpdateTaskStatusRequest request);
  $async.Future<$9.GetTaskDefHistoryResponse> getTaskDefHistory($pb.ServerContext ctx, $9.GetTaskDefHistoryRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateTaskDef': return $9.CreateTaskDefRequest();
      case 'GetTaskDef': return $9.GetTaskDefRequest();
      case 'UpdateTaskDef': return $9.UpdateTaskDefRequest();
      case 'DeleteTaskDef': return $9.DeleteTaskDefRequest();
      case 'ListTaskDefs': return $9.ListTaskDefsRequest();
      case 'CreateTask': return $9.CreateTaskRequest();
      case 'GetTask': return $9.GetTaskRequest();
      case 'GetTaskByExternalId': return $9.GetTaskByExternalIdRequest();
      case 'UpdateTask': return $9.UpdateTaskRequest();
      case 'DeleteTask': return $9.DeleteTaskRequest();
      case 'ListTasks': return $9.ListTasksRequest();
      case 'UpdateTaskStatus': return $9.UpdateTaskStatusRequest();
      case 'ClaimTask': return $9.ClaimTaskRequest();
      case 'CreateComment': return $9.CreateCommentRequest();
      case 'UpdateComment': return $9.UpdateCommentRequest();
      case 'DeleteComment': return $9.DeleteCommentRequest();
      case 'ListComments': return $9.ListCommentsRequest();
      case 'GetTaskActivity': return $9.GetTaskActivityRequest();
      case 'CreateAssignmentRule': return $9.CreateAssignmentRuleRequest();
      case 'UpdateAssignmentRule': return $9.UpdateAssignmentRuleRequest();
      case 'DeleteAssignmentRule': return $9.DeleteAssignmentRuleRequest();
      case 'ListAssignmentRules': return $9.ListAssignmentRulesRequest();
      case 'GetAssignableMembers': return $9.GetAssignableMembersRequest();
      case 'GetAssignableRoles': return $9.GetAssignableRolesRequest();
      case 'GetTicketLocations': return $9.GetTicketLocationsRequest();
      case 'GenerateTaskTitle': return $9.GenerateTaskTitleRequest();
      case 'GetTaskDefStatistics': return $9.GetTaskDefStatisticsRequest();
      case 'GetUpcomingTasks': return $9.GetUpcomingTasksRequest();
      case 'GetOverdueTasks': return $9.GetOverdueTasksRequest();
      case 'GetTaskManagementOverview': return $9.GetTaskManagementOverviewRequest();
      case 'GetAttachmentUploadUrl': return $9.GetAttachmentUploadUrlRequest();
      case 'ConfirmAttachmentUpload': return $9.ConfirmAttachmentUploadRequest();
      case 'ListTaskAttachments': return $9.ListTaskAttachmentsRequest();
      case 'DeleteAttachment': return $9.DeleteAttachmentRequest();
      case 'UpdateAttachment': return $9.UpdateAttachmentRequest();
      case 'GetTaskDefAttachmentUploadUrl': return $9.GetTaskDefAttachmentUploadUrlRequest();
      case 'ConfirmTaskDefAttachmentUpload': return $9.ConfirmTaskDefAttachmentUploadRequest();
      case 'ListTaskDefAttachments': return $9.ListTaskDefAttachmentsRequest();
      case 'DeleteTaskDefAttachment': return $9.DeleteTaskDefAttachmentRequest();
      case 'ValidateRecurrenceRule': return $9.ValidateRecurrenceRuleRequest();
      case 'PreviewRecurrenceOccurrences': return $9.PreviewRecurrenceOccurrencesRequest();
      case 'CreateRecurrenceRule': return $9.CreateRecurrenceRuleRequest();
      case 'BulkCreateTaskDefs': return $9.BulkCreateTaskDefsRequest();
      case 'BulkUpdateTaskDefs': return $9.BulkUpdateTaskDefsRequest();
      case 'BulkDeleteTaskDefs': return $9.BulkDeleteTaskDefsRequest();
      case 'BulkUpdateTaskStatus': return $9.BulkUpdateTaskStatusRequest();
      case 'GetTaskDefHistory': return $9.GetTaskDefHistoryRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateTaskDef': return this.createTaskDef(ctx, request as $9.CreateTaskDefRequest);
      case 'GetTaskDef': return this.getTaskDef(ctx, request as $9.GetTaskDefRequest);
      case 'UpdateTaskDef': return this.updateTaskDef(ctx, request as $9.UpdateTaskDefRequest);
      case 'DeleteTaskDef': return this.deleteTaskDef(ctx, request as $9.DeleteTaskDefRequest);
      case 'ListTaskDefs': return this.listTaskDefs(ctx, request as $9.ListTaskDefsRequest);
      case 'CreateTask': return this.createTask(ctx, request as $9.CreateTaskRequest);
      case 'GetTask': return this.getTask(ctx, request as $9.GetTaskRequest);
      case 'GetTaskByExternalId': return this.getTaskByExternalId(ctx, request as $9.GetTaskByExternalIdRequest);
      case 'UpdateTask': return this.updateTask(ctx, request as $9.UpdateTaskRequest);
      case 'DeleteTask': return this.deleteTask(ctx, request as $9.DeleteTaskRequest);
      case 'ListTasks': return this.listTasks(ctx, request as $9.ListTasksRequest);
      case 'UpdateTaskStatus': return this.updateTaskStatus(ctx, request as $9.UpdateTaskStatusRequest);
      case 'ClaimTask': return this.claimTask(ctx, request as $9.ClaimTaskRequest);
      case 'CreateComment': return this.createComment(ctx, request as $9.CreateCommentRequest);
      case 'UpdateComment': return this.updateComment(ctx, request as $9.UpdateCommentRequest);
      case 'DeleteComment': return this.deleteComment(ctx, request as $9.DeleteCommentRequest);
      case 'ListComments': return this.listComments(ctx, request as $9.ListCommentsRequest);
      case 'GetTaskActivity': return this.getTaskActivity(ctx, request as $9.GetTaskActivityRequest);
      case 'CreateAssignmentRule': return this.createAssignmentRule(ctx, request as $9.CreateAssignmentRuleRequest);
      case 'UpdateAssignmentRule': return this.updateAssignmentRule(ctx, request as $9.UpdateAssignmentRuleRequest);
      case 'DeleteAssignmentRule': return this.deleteAssignmentRule(ctx, request as $9.DeleteAssignmentRuleRequest);
      case 'ListAssignmentRules': return this.listAssignmentRules(ctx, request as $9.ListAssignmentRulesRequest);
      case 'GetAssignableMembers': return this.getAssignableMembers(ctx, request as $9.GetAssignableMembersRequest);
      case 'GetAssignableRoles': return this.getAssignableRoles(ctx, request as $9.GetAssignableRolesRequest);
      case 'GetTicketLocations': return this.getTicketLocations(ctx, request as $9.GetTicketLocationsRequest);
      case 'GenerateTaskTitle': return this.generateTaskTitle(ctx, request as $9.GenerateTaskTitleRequest);
      case 'GetTaskDefStatistics': return this.getTaskDefStatistics(ctx, request as $9.GetTaskDefStatisticsRequest);
      case 'GetUpcomingTasks': return this.getUpcomingTasks(ctx, request as $9.GetUpcomingTasksRequest);
      case 'GetOverdueTasks': return this.getOverdueTasks(ctx, request as $9.GetOverdueTasksRequest);
      case 'GetTaskManagementOverview': return this.getTaskManagementOverview(ctx, request as $9.GetTaskManagementOverviewRequest);
      case 'GetAttachmentUploadUrl': return this.getAttachmentUploadUrl(ctx, request as $9.GetAttachmentUploadUrlRequest);
      case 'ConfirmAttachmentUpload': return this.confirmAttachmentUpload(ctx, request as $9.ConfirmAttachmentUploadRequest);
      case 'ListTaskAttachments': return this.listTaskAttachments(ctx, request as $9.ListTaskAttachmentsRequest);
      case 'DeleteAttachment': return this.deleteAttachment(ctx, request as $9.DeleteAttachmentRequest);
      case 'UpdateAttachment': return this.updateAttachment(ctx, request as $9.UpdateAttachmentRequest);
      case 'GetTaskDefAttachmentUploadUrl': return this.getTaskDefAttachmentUploadUrl(ctx, request as $9.GetTaskDefAttachmentUploadUrlRequest);
      case 'ConfirmTaskDefAttachmentUpload': return this.confirmTaskDefAttachmentUpload(ctx, request as $9.ConfirmTaskDefAttachmentUploadRequest);
      case 'ListTaskDefAttachments': return this.listTaskDefAttachments(ctx, request as $9.ListTaskDefAttachmentsRequest);
      case 'DeleteTaskDefAttachment': return this.deleteTaskDefAttachment(ctx, request as $9.DeleteTaskDefAttachmentRequest);
      case 'ValidateRecurrenceRule': return this.validateRecurrenceRule(ctx, request as $9.ValidateRecurrenceRuleRequest);
      case 'PreviewRecurrenceOccurrences': return this.previewRecurrenceOccurrences(ctx, request as $9.PreviewRecurrenceOccurrencesRequest);
      case 'CreateRecurrenceRule': return this.createRecurrenceRule(ctx, request as $9.CreateRecurrenceRuleRequest);
      case 'BulkCreateTaskDefs': return this.bulkCreateTaskDefs(ctx, request as $9.BulkCreateTaskDefsRequest);
      case 'BulkUpdateTaskDefs': return this.bulkUpdateTaskDefs(ctx, request as $9.BulkUpdateTaskDefsRequest);
      case 'BulkDeleteTaskDefs': return this.bulkDeleteTaskDefs(ctx, request as $9.BulkDeleteTaskDefsRequest);
      case 'BulkUpdateTaskStatus': return this.bulkUpdateTaskStatus(ctx, request as $9.BulkUpdateTaskStatusRequest);
      case 'GetTaskDefHistory': return this.getTaskDefHistory(ctx, request as $9.GetTaskDefHistoryRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => TaskServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => TaskServiceBase$messageJson;
}

