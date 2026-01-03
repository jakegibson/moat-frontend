//
//  Generated code. Do not modify.
//  source: moat/v1/task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'task.pb.dart' as $6;
import 'task.pbjson.dart';

export 'task.pb.dart';

abstract class TaskServiceBase extends $pb.GeneratedService {
  $async.Future<$6.TaskDef> createTaskDef($pb.ServerContext ctx, $6.CreateTaskDefRequest request);
  $async.Future<$6.TaskDef> getTaskDef($pb.ServerContext ctx, $6.GetTaskDefRequest request);
  $async.Future<$6.TaskDef> updateTaskDef($pb.ServerContext ctx, $6.UpdateTaskDefRequest request);
  $async.Future<$6.DeleteTaskDefResponse> deleteTaskDef($pb.ServerContext ctx, $6.DeleteTaskDefRequest request);
  $async.Future<$6.ListTaskDefsResponse> listTaskDefs($pb.ServerContext ctx, $6.ListTaskDefsRequest request);
  $async.Future<$6.Task> createTask($pb.ServerContext ctx, $6.CreateTaskRequest request);
  $async.Future<$6.TaskWithDetails> getTask($pb.ServerContext ctx, $6.GetTaskRequest request);
  $async.Future<$6.TaskWithDetails> getTaskByExternalId($pb.ServerContext ctx, $6.GetTaskByExternalIdRequest request);
  $async.Future<$6.Task> updateTask($pb.ServerContext ctx, $6.UpdateTaskRequest request);
  $async.Future<$6.DeleteTaskResponse> deleteTask($pb.ServerContext ctx, $6.DeleteTaskRequest request);
  $async.Future<$6.ListTasksResponse> listTasks($pb.ServerContext ctx, $6.ListTasksRequest request);
  $async.Future<$6.Task> updateTaskStatus($pb.ServerContext ctx, $6.UpdateTaskStatusRequest request);
  $async.Future<$6.Task> claimTask($pb.ServerContext ctx, $6.ClaimTaskRequest request);
  $async.Future<$6.TaskComment> createComment($pb.ServerContext ctx, $6.CreateCommentRequest request);
  $async.Future<$6.TaskComment> updateComment($pb.ServerContext ctx, $6.UpdateCommentRequest request);
  $async.Future<$6.DeleteCommentResponse> deleteComment($pb.ServerContext ctx, $6.DeleteCommentRequest request);
  $async.Future<$6.ListCommentsResponse> listComments($pb.ServerContext ctx, $6.ListCommentsRequest request);
  $async.Future<$6.GetTaskActivityResponse> getTaskActivity($pb.ServerContext ctx, $6.GetTaskActivityRequest request);
  $async.Future<$6.AssignmentRule> createAssignmentRule($pb.ServerContext ctx, $6.CreateAssignmentRuleRequest request);
  $async.Future<$6.AssignmentRule> updateAssignmentRule($pb.ServerContext ctx, $6.UpdateAssignmentRuleRequest request);
  $async.Future<$6.DeleteAssignmentRuleResponse> deleteAssignmentRule($pb.ServerContext ctx, $6.DeleteAssignmentRuleRequest request);
  $async.Future<$6.ListAssignmentRulesResponse> listAssignmentRules($pb.ServerContext ctx, $6.ListAssignmentRulesRequest request);
  $async.Future<$6.GetAssignableMembersResponse> getAssignableMembers($pb.ServerContext ctx, $6.GetAssignableMembersRequest request);
  $async.Future<$6.GetAssignableRolesResponse> getAssignableRoles($pb.ServerContext ctx, $6.GetAssignableRolesRequest request);
  $async.Future<$6.GetTicketLocationsResponse> getTicketLocations($pb.ServerContext ctx, $6.GetTicketLocationsRequest request);
  $async.Future<$6.GenerateTaskTitleResponse> generateTaskTitle($pb.ServerContext ctx, $6.GenerateTaskTitleRequest request);
  $async.Future<$6.TaskDefStatistics> getTaskDefStatistics($pb.ServerContext ctx, $6.GetTaskDefStatisticsRequest request);
  $async.Future<$6.ListTasksResponse> getUpcomingTasks($pb.ServerContext ctx, $6.GetUpcomingTasksRequest request);
  $async.Future<$6.ListTasksResponse> getOverdueTasks($pb.ServerContext ctx, $6.GetOverdueTasksRequest request);
  $async.Future<$6.TaskManagementOverview> getTaskManagementOverview($pb.ServerContext ctx, $6.GetTaskManagementOverviewRequest request);
  $async.Future<$6.GetAttachmentUploadUrlResponse> getAttachmentUploadUrl($pb.ServerContext ctx, $6.GetAttachmentUploadUrlRequest request);
  $async.Future<$6.TaskAttachment> confirmAttachmentUpload($pb.ServerContext ctx, $6.ConfirmAttachmentUploadRequest request);
  $async.Future<$6.ListTaskAttachmentsResponse> listTaskAttachments($pb.ServerContext ctx, $6.ListTaskAttachmentsRequest request);
  $async.Future<$6.DeleteAttachmentResponse> deleteAttachment($pb.ServerContext ctx, $6.DeleteAttachmentRequest request);
  $async.Future<$6.TaskAttachment> updateAttachment($pb.ServerContext ctx, $6.UpdateAttachmentRequest request);
  $async.Future<$6.GetAttachmentUploadUrlResponse> getTaskDefAttachmentUploadUrl($pb.ServerContext ctx, $6.GetTaskDefAttachmentUploadUrlRequest request);
  $async.Future<$6.TaskAttachment> confirmTaskDefAttachmentUpload($pb.ServerContext ctx, $6.ConfirmTaskDefAttachmentUploadRequest request);
  $async.Future<$6.ListTaskAttachmentsResponse> listTaskDefAttachments($pb.ServerContext ctx, $6.ListTaskDefAttachmentsRequest request);
  $async.Future<$6.DeleteAttachmentResponse> deleteTaskDefAttachment($pb.ServerContext ctx, $6.DeleteTaskDefAttachmentRequest request);
  $async.Future<$6.ValidateRecurrenceRuleResponse> validateRecurrenceRule($pb.ServerContext ctx, $6.ValidateRecurrenceRuleRequest request);
  $async.Future<$6.PreviewRecurrenceOccurrencesResponse> previewRecurrenceOccurrences($pb.ServerContext ctx, $6.PreviewRecurrenceOccurrencesRequest request);
  $async.Future<$6.CreateRecurrenceRuleResponse> createRecurrenceRule($pb.ServerContext ctx, $6.CreateRecurrenceRuleRequest request);
  $async.Future<$6.BulkCreateTaskDefsResponse> bulkCreateTaskDefs($pb.ServerContext ctx, $6.BulkCreateTaskDefsRequest request);
  $async.Future<$6.BulkUpdateTaskDefsResponse> bulkUpdateTaskDefs($pb.ServerContext ctx, $6.BulkUpdateTaskDefsRequest request);
  $async.Future<$6.BulkDeleteTaskDefsResponse> bulkDeleteTaskDefs($pb.ServerContext ctx, $6.BulkDeleteTaskDefsRequest request);
  $async.Future<$6.BulkUpdateTaskStatusResponse> bulkUpdateTaskStatus($pb.ServerContext ctx, $6.BulkUpdateTaskStatusRequest request);
  $async.Future<$6.GetTaskDefHistoryResponse> getTaskDefHistory($pb.ServerContext ctx, $6.GetTaskDefHistoryRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateTaskDef': return $6.CreateTaskDefRequest();
      case 'GetTaskDef': return $6.GetTaskDefRequest();
      case 'UpdateTaskDef': return $6.UpdateTaskDefRequest();
      case 'DeleteTaskDef': return $6.DeleteTaskDefRequest();
      case 'ListTaskDefs': return $6.ListTaskDefsRequest();
      case 'CreateTask': return $6.CreateTaskRequest();
      case 'GetTask': return $6.GetTaskRequest();
      case 'GetTaskByExternalId': return $6.GetTaskByExternalIdRequest();
      case 'UpdateTask': return $6.UpdateTaskRequest();
      case 'DeleteTask': return $6.DeleteTaskRequest();
      case 'ListTasks': return $6.ListTasksRequest();
      case 'UpdateTaskStatus': return $6.UpdateTaskStatusRequest();
      case 'ClaimTask': return $6.ClaimTaskRequest();
      case 'CreateComment': return $6.CreateCommentRequest();
      case 'UpdateComment': return $6.UpdateCommentRequest();
      case 'DeleteComment': return $6.DeleteCommentRequest();
      case 'ListComments': return $6.ListCommentsRequest();
      case 'GetTaskActivity': return $6.GetTaskActivityRequest();
      case 'CreateAssignmentRule': return $6.CreateAssignmentRuleRequest();
      case 'UpdateAssignmentRule': return $6.UpdateAssignmentRuleRequest();
      case 'DeleteAssignmentRule': return $6.DeleteAssignmentRuleRequest();
      case 'ListAssignmentRules': return $6.ListAssignmentRulesRequest();
      case 'GetAssignableMembers': return $6.GetAssignableMembersRequest();
      case 'GetAssignableRoles': return $6.GetAssignableRolesRequest();
      case 'GetTicketLocations': return $6.GetTicketLocationsRequest();
      case 'GenerateTaskTitle': return $6.GenerateTaskTitleRequest();
      case 'GetTaskDefStatistics': return $6.GetTaskDefStatisticsRequest();
      case 'GetUpcomingTasks': return $6.GetUpcomingTasksRequest();
      case 'GetOverdueTasks': return $6.GetOverdueTasksRequest();
      case 'GetTaskManagementOverview': return $6.GetTaskManagementOverviewRequest();
      case 'GetAttachmentUploadUrl': return $6.GetAttachmentUploadUrlRequest();
      case 'ConfirmAttachmentUpload': return $6.ConfirmAttachmentUploadRequest();
      case 'ListTaskAttachments': return $6.ListTaskAttachmentsRequest();
      case 'DeleteAttachment': return $6.DeleteAttachmentRequest();
      case 'UpdateAttachment': return $6.UpdateAttachmentRequest();
      case 'GetTaskDefAttachmentUploadUrl': return $6.GetTaskDefAttachmentUploadUrlRequest();
      case 'ConfirmTaskDefAttachmentUpload': return $6.ConfirmTaskDefAttachmentUploadRequest();
      case 'ListTaskDefAttachments': return $6.ListTaskDefAttachmentsRequest();
      case 'DeleteTaskDefAttachment': return $6.DeleteTaskDefAttachmentRequest();
      case 'ValidateRecurrenceRule': return $6.ValidateRecurrenceRuleRequest();
      case 'PreviewRecurrenceOccurrences': return $6.PreviewRecurrenceOccurrencesRequest();
      case 'CreateRecurrenceRule': return $6.CreateRecurrenceRuleRequest();
      case 'BulkCreateTaskDefs': return $6.BulkCreateTaskDefsRequest();
      case 'BulkUpdateTaskDefs': return $6.BulkUpdateTaskDefsRequest();
      case 'BulkDeleteTaskDefs': return $6.BulkDeleteTaskDefsRequest();
      case 'BulkUpdateTaskStatus': return $6.BulkUpdateTaskStatusRequest();
      case 'GetTaskDefHistory': return $6.GetTaskDefHistoryRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateTaskDef': return this.createTaskDef(ctx, request as $6.CreateTaskDefRequest);
      case 'GetTaskDef': return this.getTaskDef(ctx, request as $6.GetTaskDefRequest);
      case 'UpdateTaskDef': return this.updateTaskDef(ctx, request as $6.UpdateTaskDefRequest);
      case 'DeleteTaskDef': return this.deleteTaskDef(ctx, request as $6.DeleteTaskDefRequest);
      case 'ListTaskDefs': return this.listTaskDefs(ctx, request as $6.ListTaskDefsRequest);
      case 'CreateTask': return this.createTask(ctx, request as $6.CreateTaskRequest);
      case 'GetTask': return this.getTask(ctx, request as $6.GetTaskRequest);
      case 'GetTaskByExternalId': return this.getTaskByExternalId(ctx, request as $6.GetTaskByExternalIdRequest);
      case 'UpdateTask': return this.updateTask(ctx, request as $6.UpdateTaskRequest);
      case 'DeleteTask': return this.deleteTask(ctx, request as $6.DeleteTaskRequest);
      case 'ListTasks': return this.listTasks(ctx, request as $6.ListTasksRequest);
      case 'UpdateTaskStatus': return this.updateTaskStatus(ctx, request as $6.UpdateTaskStatusRequest);
      case 'ClaimTask': return this.claimTask(ctx, request as $6.ClaimTaskRequest);
      case 'CreateComment': return this.createComment(ctx, request as $6.CreateCommentRequest);
      case 'UpdateComment': return this.updateComment(ctx, request as $6.UpdateCommentRequest);
      case 'DeleteComment': return this.deleteComment(ctx, request as $6.DeleteCommentRequest);
      case 'ListComments': return this.listComments(ctx, request as $6.ListCommentsRequest);
      case 'GetTaskActivity': return this.getTaskActivity(ctx, request as $6.GetTaskActivityRequest);
      case 'CreateAssignmentRule': return this.createAssignmentRule(ctx, request as $6.CreateAssignmentRuleRequest);
      case 'UpdateAssignmentRule': return this.updateAssignmentRule(ctx, request as $6.UpdateAssignmentRuleRequest);
      case 'DeleteAssignmentRule': return this.deleteAssignmentRule(ctx, request as $6.DeleteAssignmentRuleRequest);
      case 'ListAssignmentRules': return this.listAssignmentRules(ctx, request as $6.ListAssignmentRulesRequest);
      case 'GetAssignableMembers': return this.getAssignableMembers(ctx, request as $6.GetAssignableMembersRequest);
      case 'GetAssignableRoles': return this.getAssignableRoles(ctx, request as $6.GetAssignableRolesRequest);
      case 'GetTicketLocations': return this.getTicketLocations(ctx, request as $6.GetTicketLocationsRequest);
      case 'GenerateTaskTitle': return this.generateTaskTitle(ctx, request as $6.GenerateTaskTitleRequest);
      case 'GetTaskDefStatistics': return this.getTaskDefStatistics(ctx, request as $6.GetTaskDefStatisticsRequest);
      case 'GetUpcomingTasks': return this.getUpcomingTasks(ctx, request as $6.GetUpcomingTasksRequest);
      case 'GetOverdueTasks': return this.getOverdueTasks(ctx, request as $6.GetOverdueTasksRequest);
      case 'GetTaskManagementOverview': return this.getTaskManagementOverview(ctx, request as $6.GetTaskManagementOverviewRequest);
      case 'GetAttachmentUploadUrl': return this.getAttachmentUploadUrl(ctx, request as $6.GetAttachmentUploadUrlRequest);
      case 'ConfirmAttachmentUpload': return this.confirmAttachmentUpload(ctx, request as $6.ConfirmAttachmentUploadRequest);
      case 'ListTaskAttachments': return this.listTaskAttachments(ctx, request as $6.ListTaskAttachmentsRequest);
      case 'DeleteAttachment': return this.deleteAttachment(ctx, request as $6.DeleteAttachmentRequest);
      case 'UpdateAttachment': return this.updateAttachment(ctx, request as $6.UpdateAttachmentRequest);
      case 'GetTaskDefAttachmentUploadUrl': return this.getTaskDefAttachmentUploadUrl(ctx, request as $6.GetTaskDefAttachmentUploadUrlRequest);
      case 'ConfirmTaskDefAttachmentUpload': return this.confirmTaskDefAttachmentUpload(ctx, request as $6.ConfirmTaskDefAttachmentUploadRequest);
      case 'ListTaskDefAttachments': return this.listTaskDefAttachments(ctx, request as $6.ListTaskDefAttachmentsRequest);
      case 'DeleteTaskDefAttachment': return this.deleteTaskDefAttachment(ctx, request as $6.DeleteTaskDefAttachmentRequest);
      case 'ValidateRecurrenceRule': return this.validateRecurrenceRule(ctx, request as $6.ValidateRecurrenceRuleRequest);
      case 'PreviewRecurrenceOccurrences': return this.previewRecurrenceOccurrences(ctx, request as $6.PreviewRecurrenceOccurrencesRequest);
      case 'CreateRecurrenceRule': return this.createRecurrenceRule(ctx, request as $6.CreateRecurrenceRuleRequest);
      case 'BulkCreateTaskDefs': return this.bulkCreateTaskDefs(ctx, request as $6.BulkCreateTaskDefsRequest);
      case 'BulkUpdateTaskDefs': return this.bulkUpdateTaskDefs(ctx, request as $6.BulkUpdateTaskDefsRequest);
      case 'BulkDeleteTaskDefs': return this.bulkDeleteTaskDefs(ctx, request as $6.BulkDeleteTaskDefsRequest);
      case 'BulkUpdateTaskStatus': return this.bulkUpdateTaskStatus(ctx, request as $6.BulkUpdateTaskStatusRequest);
      case 'GetTaskDefHistory': return this.getTaskDefHistory(ctx, request as $6.GetTaskDefHistoryRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => TaskServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => TaskServiceBase$messageJson;
}

