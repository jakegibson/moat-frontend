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

import 'task.pb.dart' as $3;
import 'task.pbjson.dart';

export 'task.pb.dart';

abstract class TaskServiceBase extends $pb.GeneratedService {
  $async.Future<$3.TaskDef> createTaskDef($pb.ServerContext ctx, $3.CreateTaskDefRequest request);
  $async.Future<$3.TaskDef> getTaskDef($pb.ServerContext ctx, $3.GetTaskDefRequest request);
  $async.Future<$3.TaskDef> updateTaskDef($pb.ServerContext ctx, $3.UpdateTaskDefRequest request);
  $async.Future<$3.DeleteTaskDefResponse> deleteTaskDef($pb.ServerContext ctx, $3.DeleteTaskDefRequest request);
  $async.Future<$3.ListTaskDefsResponse> listTaskDefs($pb.ServerContext ctx, $3.ListTaskDefsRequest request);
  $async.Future<$3.Task> createTask($pb.ServerContext ctx, $3.CreateTaskRequest request);
  $async.Future<$3.TaskWithDetails> getTask($pb.ServerContext ctx, $3.GetTaskRequest request);
  $async.Future<$3.TaskWithDetails> getTaskByExternalId($pb.ServerContext ctx, $3.GetTaskByExternalIdRequest request);
  $async.Future<$3.Task> updateTask($pb.ServerContext ctx, $3.UpdateTaskRequest request);
  $async.Future<$3.DeleteTaskResponse> deleteTask($pb.ServerContext ctx, $3.DeleteTaskRequest request);
  $async.Future<$3.ListTasksResponse> listTasks($pb.ServerContext ctx, $3.ListTasksRequest request);
  $async.Future<$3.Task> updateTaskStatus($pb.ServerContext ctx, $3.UpdateTaskStatusRequest request);
  $async.Future<$3.Task> claimTask($pb.ServerContext ctx, $3.ClaimTaskRequest request);
  $async.Future<$3.TaskComment> createComment($pb.ServerContext ctx, $3.CreateCommentRequest request);
  $async.Future<$3.TaskComment> updateComment($pb.ServerContext ctx, $3.UpdateCommentRequest request);
  $async.Future<$3.DeleteCommentResponse> deleteComment($pb.ServerContext ctx, $3.DeleteCommentRequest request);
  $async.Future<$3.ListCommentsResponse> listComments($pb.ServerContext ctx, $3.ListCommentsRequest request);
  $async.Future<$3.GetTaskActivityResponse> getTaskActivity($pb.ServerContext ctx, $3.GetTaskActivityRequest request);
  $async.Future<$3.AssignmentRule> createAssignmentRule($pb.ServerContext ctx, $3.CreateAssignmentRuleRequest request);
  $async.Future<$3.AssignmentRule> updateAssignmentRule($pb.ServerContext ctx, $3.UpdateAssignmentRuleRequest request);
  $async.Future<$3.DeleteAssignmentRuleResponse> deleteAssignmentRule($pb.ServerContext ctx, $3.DeleteAssignmentRuleRequest request);
  $async.Future<$3.ListAssignmentRulesResponse> listAssignmentRules($pb.ServerContext ctx, $3.ListAssignmentRulesRequest request);
  $async.Future<$3.GetAssignableMembersResponse> getAssignableMembers($pb.ServerContext ctx, $3.GetAssignableMembersRequest request);
  $async.Future<$3.GetAssignableRolesResponse> getAssignableRoles($pb.ServerContext ctx, $3.GetAssignableRolesRequest request);
  $async.Future<$3.GetTicketLocationsResponse> getTicketLocations($pb.ServerContext ctx, $3.GetTicketLocationsRequest request);
  $async.Future<$3.GenerateTaskTitleResponse> generateTaskTitle($pb.ServerContext ctx, $3.GenerateTaskTitleRequest request);
  $async.Future<$3.TaskDefStatistics> getTaskDefStatistics($pb.ServerContext ctx, $3.GetTaskDefStatisticsRequest request);
  $async.Future<$3.ListTasksResponse> getUpcomingTasks($pb.ServerContext ctx, $3.GetUpcomingTasksRequest request);
  $async.Future<$3.ListTasksResponse> getOverdueTasks($pb.ServerContext ctx, $3.GetOverdueTasksRequest request);
  $async.Future<$3.TaskManagementOverview> getTaskManagementOverview($pb.ServerContext ctx, $3.GetTaskManagementOverviewRequest request);
  $async.Future<$3.GetAttachmentUploadUrlResponse> getAttachmentUploadUrl($pb.ServerContext ctx, $3.GetAttachmentUploadUrlRequest request);
  $async.Future<$3.TaskAttachment> confirmAttachmentUpload($pb.ServerContext ctx, $3.ConfirmAttachmentUploadRequest request);
  $async.Future<$3.ListTaskAttachmentsResponse> listTaskAttachments($pb.ServerContext ctx, $3.ListTaskAttachmentsRequest request);
  $async.Future<$3.DeleteAttachmentResponse> deleteAttachment($pb.ServerContext ctx, $3.DeleteAttachmentRequest request);
  $async.Future<$3.ValidateRecurrenceRuleResponse> validateRecurrenceRule($pb.ServerContext ctx, $3.ValidateRecurrenceRuleRequest request);
  $async.Future<$3.PreviewRecurrenceOccurrencesResponse> previewRecurrenceOccurrences($pb.ServerContext ctx, $3.PreviewRecurrenceOccurrencesRequest request);
  $async.Future<$3.CreateRecurrenceRuleResponse> createRecurrenceRule($pb.ServerContext ctx, $3.CreateRecurrenceRuleRequest request);
  $async.Future<$3.BulkCreateTaskDefsResponse> bulkCreateTaskDefs($pb.ServerContext ctx, $3.BulkCreateTaskDefsRequest request);
  $async.Future<$3.BulkUpdateTaskDefsResponse> bulkUpdateTaskDefs($pb.ServerContext ctx, $3.BulkUpdateTaskDefsRequest request);
  $async.Future<$3.BulkDeleteTaskDefsResponse> bulkDeleteTaskDefs($pb.ServerContext ctx, $3.BulkDeleteTaskDefsRequest request);
  $async.Future<$3.BulkUpdateTaskStatusResponse> bulkUpdateTaskStatus($pb.ServerContext ctx, $3.BulkUpdateTaskStatusRequest request);
  $async.Future<$3.GetTaskDefHistoryResponse> getTaskDefHistory($pb.ServerContext ctx, $3.GetTaskDefHistoryRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateTaskDef': return $3.CreateTaskDefRequest();
      case 'GetTaskDef': return $3.GetTaskDefRequest();
      case 'UpdateTaskDef': return $3.UpdateTaskDefRequest();
      case 'DeleteTaskDef': return $3.DeleteTaskDefRequest();
      case 'ListTaskDefs': return $3.ListTaskDefsRequest();
      case 'CreateTask': return $3.CreateTaskRequest();
      case 'GetTask': return $3.GetTaskRequest();
      case 'GetTaskByExternalId': return $3.GetTaskByExternalIdRequest();
      case 'UpdateTask': return $3.UpdateTaskRequest();
      case 'DeleteTask': return $3.DeleteTaskRequest();
      case 'ListTasks': return $3.ListTasksRequest();
      case 'UpdateTaskStatus': return $3.UpdateTaskStatusRequest();
      case 'ClaimTask': return $3.ClaimTaskRequest();
      case 'CreateComment': return $3.CreateCommentRequest();
      case 'UpdateComment': return $3.UpdateCommentRequest();
      case 'DeleteComment': return $3.DeleteCommentRequest();
      case 'ListComments': return $3.ListCommentsRequest();
      case 'GetTaskActivity': return $3.GetTaskActivityRequest();
      case 'CreateAssignmentRule': return $3.CreateAssignmentRuleRequest();
      case 'UpdateAssignmentRule': return $3.UpdateAssignmentRuleRequest();
      case 'DeleteAssignmentRule': return $3.DeleteAssignmentRuleRequest();
      case 'ListAssignmentRules': return $3.ListAssignmentRulesRequest();
      case 'GetAssignableMembers': return $3.GetAssignableMembersRequest();
      case 'GetAssignableRoles': return $3.GetAssignableRolesRequest();
      case 'GetTicketLocations': return $3.GetTicketLocationsRequest();
      case 'GenerateTaskTitle': return $3.GenerateTaskTitleRequest();
      case 'GetTaskDefStatistics': return $3.GetTaskDefStatisticsRequest();
      case 'GetUpcomingTasks': return $3.GetUpcomingTasksRequest();
      case 'GetOverdueTasks': return $3.GetOverdueTasksRequest();
      case 'GetTaskManagementOverview': return $3.GetTaskManagementOverviewRequest();
      case 'GetAttachmentUploadUrl': return $3.GetAttachmentUploadUrlRequest();
      case 'ConfirmAttachmentUpload': return $3.ConfirmAttachmentUploadRequest();
      case 'ListTaskAttachments': return $3.ListTaskAttachmentsRequest();
      case 'DeleteAttachment': return $3.DeleteAttachmentRequest();
      case 'ValidateRecurrenceRule': return $3.ValidateRecurrenceRuleRequest();
      case 'PreviewRecurrenceOccurrences': return $3.PreviewRecurrenceOccurrencesRequest();
      case 'CreateRecurrenceRule': return $3.CreateRecurrenceRuleRequest();
      case 'BulkCreateTaskDefs': return $3.BulkCreateTaskDefsRequest();
      case 'BulkUpdateTaskDefs': return $3.BulkUpdateTaskDefsRequest();
      case 'BulkDeleteTaskDefs': return $3.BulkDeleteTaskDefsRequest();
      case 'BulkUpdateTaskStatus': return $3.BulkUpdateTaskStatusRequest();
      case 'GetTaskDefHistory': return $3.GetTaskDefHistoryRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateTaskDef': return this.createTaskDef(ctx, request as $3.CreateTaskDefRequest);
      case 'GetTaskDef': return this.getTaskDef(ctx, request as $3.GetTaskDefRequest);
      case 'UpdateTaskDef': return this.updateTaskDef(ctx, request as $3.UpdateTaskDefRequest);
      case 'DeleteTaskDef': return this.deleteTaskDef(ctx, request as $3.DeleteTaskDefRequest);
      case 'ListTaskDefs': return this.listTaskDefs(ctx, request as $3.ListTaskDefsRequest);
      case 'CreateTask': return this.createTask(ctx, request as $3.CreateTaskRequest);
      case 'GetTask': return this.getTask(ctx, request as $3.GetTaskRequest);
      case 'GetTaskByExternalId': return this.getTaskByExternalId(ctx, request as $3.GetTaskByExternalIdRequest);
      case 'UpdateTask': return this.updateTask(ctx, request as $3.UpdateTaskRequest);
      case 'DeleteTask': return this.deleteTask(ctx, request as $3.DeleteTaskRequest);
      case 'ListTasks': return this.listTasks(ctx, request as $3.ListTasksRequest);
      case 'UpdateTaskStatus': return this.updateTaskStatus(ctx, request as $3.UpdateTaskStatusRequest);
      case 'ClaimTask': return this.claimTask(ctx, request as $3.ClaimTaskRequest);
      case 'CreateComment': return this.createComment(ctx, request as $3.CreateCommentRequest);
      case 'UpdateComment': return this.updateComment(ctx, request as $3.UpdateCommentRequest);
      case 'DeleteComment': return this.deleteComment(ctx, request as $3.DeleteCommentRequest);
      case 'ListComments': return this.listComments(ctx, request as $3.ListCommentsRequest);
      case 'GetTaskActivity': return this.getTaskActivity(ctx, request as $3.GetTaskActivityRequest);
      case 'CreateAssignmentRule': return this.createAssignmentRule(ctx, request as $3.CreateAssignmentRuleRequest);
      case 'UpdateAssignmentRule': return this.updateAssignmentRule(ctx, request as $3.UpdateAssignmentRuleRequest);
      case 'DeleteAssignmentRule': return this.deleteAssignmentRule(ctx, request as $3.DeleteAssignmentRuleRequest);
      case 'ListAssignmentRules': return this.listAssignmentRules(ctx, request as $3.ListAssignmentRulesRequest);
      case 'GetAssignableMembers': return this.getAssignableMembers(ctx, request as $3.GetAssignableMembersRequest);
      case 'GetAssignableRoles': return this.getAssignableRoles(ctx, request as $3.GetAssignableRolesRequest);
      case 'GetTicketLocations': return this.getTicketLocations(ctx, request as $3.GetTicketLocationsRequest);
      case 'GenerateTaskTitle': return this.generateTaskTitle(ctx, request as $3.GenerateTaskTitleRequest);
      case 'GetTaskDefStatistics': return this.getTaskDefStatistics(ctx, request as $3.GetTaskDefStatisticsRequest);
      case 'GetUpcomingTasks': return this.getUpcomingTasks(ctx, request as $3.GetUpcomingTasksRequest);
      case 'GetOverdueTasks': return this.getOverdueTasks(ctx, request as $3.GetOverdueTasksRequest);
      case 'GetTaskManagementOverview': return this.getTaskManagementOverview(ctx, request as $3.GetTaskManagementOverviewRequest);
      case 'GetAttachmentUploadUrl': return this.getAttachmentUploadUrl(ctx, request as $3.GetAttachmentUploadUrlRequest);
      case 'ConfirmAttachmentUpload': return this.confirmAttachmentUpload(ctx, request as $3.ConfirmAttachmentUploadRequest);
      case 'ListTaskAttachments': return this.listTaskAttachments(ctx, request as $3.ListTaskAttachmentsRequest);
      case 'DeleteAttachment': return this.deleteAttachment(ctx, request as $3.DeleteAttachmentRequest);
      case 'ValidateRecurrenceRule': return this.validateRecurrenceRule(ctx, request as $3.ValidateRecurrenceRuleRequest);
      case 'PreviewRecurrenceOccurrences': return this.previewRecurrenceOccurrences(ctx, request as $3.PreviewRecurrenceOccurrencesRequest);
      case 'CreateRecurrenceRule': return this.createRecurrenceRule(ctx, request as $3.CreateRecurrenceRuleRequest);
      case 'BulkCreateTaskDefs': return this.bulkCreateTaskDefs(ctx, request as $3.BulkCreateTaskDefsRequest);
      case 'BulkUpdateTaskDefs': return this.bulkUpdateTaskDefs(ctx, request as $3.BulkUpdateTaskDefsRequest);
      case 'BulkDeleteTaskDefs': return this.bulkDeleteTaskDefs(ctx, request as $3.BulkDeleteTaskDefsRequest);
      case 'BulkUpdateTaskStatus': return this.bulkUpdateTaskStatus(ctx, request as $3.BulkUpdateTaskStatusRequest);
      case 'GetTaskDefHistory': return this.getTaskDefHistory(ctx, request as $3.GetTaskDefHistoryRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => TaskServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => TaskServiceBase$messageJson;
}

