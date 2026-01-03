import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:injectable/injectable.dart';

import '../../../core/transport/task_service_client.dart';
import '../../../gen/google/protobuf/struct.pb.dart' as struct_pb;
import '../../../gen/google/protobuf/timestamp.pb.dart';
import '../../../gen/moat/v1/task.pb.dart' as pb;
import 'task_models.dart';

/// Client for task-related API calls.
///
/// Uses the ConnectRPC TaskServiceClient and converts between protobuf
/// types and domain models.
@lazySingleton
class TaskClient {
  final TaskServiceClient _rpc;

  TaskClient(this._rpc);

  // ============================================================================
  // Task Definition Methods
  // ============================================================================

  Future<TaskDef> createTaskDef({
    required String locationId,
    required String title,
    required TaskType taskType,
    String? assetId,
    String? fileId,
    String? description,
    bool isEnabled = true,
    String? recurrenceRule,
    DateTime? recurrenceStart,
    DateTime? recurrenceEnd,
    String? specificLocation,
    Map<String, dynamic>? details,
  }) async {
    final request = pb.CreateTaskDefRequest(
      locationId: locationId,
      title: title,
      taskType: _toProtoTaskType(taskType),
      isEnabled: isEnabled,
    );

    if (assetId != null) request.assetId = assetId;
    if (fileId != null) request.fileId = fileId;
    if (description != null) request.description = description;
    if (recurrenceRule != null) request.recurrenceRule = recurrenceRule;
    if (recurrenceStart != null) {
      request.recurrenceStart = _toTimestamp(recurrenceStart);
    }
    if (recurrenceEnd != null) {
      request.recurrenceEnd = _toTimestamp(recurrenceEnd);
    }
    if (specificLocation != null) request.specificLocation = specificLocation;
    if (details != null) request.details = _toProtoStruct(details);

    final response = await _rpc.createTaskDef(request);
    return _fromProtoTaskDef(response);
  }

  Future<TaskDef> getTaskDef(String id) async {
    final request = pb.GetTaskDefRequest(id: id);
    final response = await _rpc.getTaskDef(request);
    return _fromProtoTaskDef(response);
  }

  Future<TaskDef> updateTaskDef({
    required String id,
    String? locationId,
    String? fileId,
    TaskType? taskType,
    String? title,
    String? description,
    bool? isEnabled,
    String? recurrenceRule,
    DateTime? recurrenceStart,
    DateTime? recurrenceEnd,
    String? specificLocation,
    Map<String, dynamic>? details,
  }) async {
    final request = pb.UpdateTaskDefRequest(id: id);

    if (locationId != null) request.locationId = locationId;
    if (fileId != null) request.fileId = fileId;
    if (taskType != null) request.taskType = _toProtoTaskType(taskType);
    if (title != null) request.title = title;
    if (description != null) request.description = description;
    if (isEnabled != null) request.isEnabled = isEnabled;
    if (recurrenceRule != null) request.recurrenceRule = recurrenceRule;
    if (recurrenceStart != null) {
      request.recurrenceStart = _toTimestamp(recurrenceStart);
    }
    if (recurrenceEnd != null) {
      request.recurrenceEnd = _toTimestamp(recurrenceEnd);
    }
    if (specificLocation != null) request.specificLocation = specificLocation;
    if (details != null) request.details = _toProtoStruct(details);

    final response = await _rpc.updateTaskDef(request);
    return _fromProtoTaskDef(response);
  }

  Future<void> deleteTaskDef(String id) async {
    final request = pb.DeleteTaskDefRequest(id: id);
    await _rpc.deleteTaskDef(request);
  }

  Future<List<TaskDef>> listTaskDefs({
    String? assetId,
    List<String>? assetIds,
    String? locationId,
    List<String>? locationIds,
    TaskType? taskType,
    bool? isEnabled,
    String? search,
    int limit = 50,
    int offset = 0,
  }) async {
    final request = pb.ListTaskDefsRequest(
      limit: limit,
      offset: offset,
    );

    if (assetId != null) request.assetId = assetId;
    if (assetIds != null) request.assetIds.addAll(assetIds);
    if (locationId != null) request.locationId = locationId;
    if (locationIds != null) request.locationIds.addAll(locationIds);
    if (taskType != null) request.taskType = _toProtoTaskType(taskType);
    if (isEnabled != null) request.isEnabled = isEnabled;
    if (search != null) request.search = search;

    final response = await _rpc.listTaskDefs(request);
    return response.items.map(_fromProtoTaskDef).toList();
  }

  // ============================================================================
  // Task Methods
  // ============================================================================

  Future<Task> createTask({
    required String taskDefId,
    DateTime? scheduledDate,
    DateTime? dueDate,
    String? assigneeId,
    String? assignedRoleId,
  }) async {
    final request = pb.CreateTaskRequest(taskDefId: taskDefId);

    if (scheduledDate != null) {
      request.scheduledDate = _toTimestamp(scheduledDate);
    }
    if (dueDate != null) {
      request.dueDate = _toTimestamp(dueDate);
    }
    if (assigneeId != null) request.assigneeId = assigneeId;
    if (assignedRoleId != null) request.assignedRoleId = assignedRoleId;

    final response = await _rpc.createTask(request);
    return _fromProtoTask(response);
  }

  Future<TaskWithDetails> getTask(String id) async {
    final request = pb.GetTaskRequest(id: id);
    final response = await _rpc.getTask(request);
    return _fromProtoTaskWithDetails(response);
  }

  Future<TaskWithDetails> getTaskByExternalId(String externalId) async {
    final request = pb.GetTaskByExternalIdRequest(externalId: externalId);
    final response = await _rpc.getTaskByExternalId(request);
    return _fromProtoTaskWithDetails(response);
  }

  Future<Task> updateTask({
    required String id,
    String? assigneeId,
    String? assignedRoleId,
    DateTime? scheduledDate,
    DateTime? dueDate,
  }) async {
    final request = pb.UpdateTaskRequest(id: id);

    if (assigneeId != null) request.assigneeId = assigneeId;
    if (assignedRoleId != null) request.assignedRoleId = assignedRoleId;
    if (scheduledDate != null) {
      request.scheduledDate = _toTimestamp(scheduledDate);
    }
    if (dueDate != null) {
      request.dueDate = _toTimestamp(dueDate);
    }

    final response = await _rpc.updateTask(request);
    return _fromProtoTask(response);
  }

  Future<void> deleteTask(String id) async {
    final request = pb.DeleteTaskRequest(id: id);
    await _rpc.deleteTask(request);
  }

  Future<PaginatedTasks> listTasks({
    List<String>? assetIds,
    List<String>? taskDefIds,
    List<TaskStatus>? statuses,
    List<String>? assigneeIds,
    List<String>? assignedByIds,
    List<String>? requestedByIds,
    List<String>? locationIds,
    List<TaskType>? taskTypes,
    String? search,
    DateTime? fromDate,
    DateTime? toDate,
    DateTime? scheduledDateFrom,
    DateTime? scheduledDateTo,
    DateTime? dueDateFrom,
    DateTime? dueDateTo,
    bool? isOverdue,
    bool filterUnassigned = false,
    bool filterNoAssigner = false,
    bool filterNoRequester = false,
    String? sortBy,
    String? sortOrder,
    int limit = 50,
    int offset = 0,
  }) async {
    final request = pb.ListTasksRequest(
      limit: limit,
      offset: offset,
    );

    if (assetIds != null && assetIds.isNotEmpty) {
      request.assetIds.addAll(assetIds);
    }
    if (taskDefIds != null && taskDefIds.isNotEmpty) {
      request.taskDefIds.addAll(taskDefIds);
    }
    if (statuses != null && statuses.isNotEmpty) {
      request.statuses.addAll(statuses.map(_toProtoTaskStatus));
    }
    if (assigneeIds != null && assigneeIds.isNotEmpty) {
      request.assigneeIds.addAll(assigneeIds);
    }
    if (assignedByIds != null && assignedByIds.isNotEmpty) {
      request.assignedByIds.addAll(assignedByIds);
    }
    if (requestedByIds != null && requestedByIds.isNotEmpty) {
      request.requestedByIds.addAll(requestedByIds);
    }
    if (locationIds != null && locationIds.isNotEmpty) {
      request.locationIds.addAll(locationIds);
    }
    if (taskTypes != null && taskTypes.isNotEmpty) {
      request.taskTypes.addAll(taskTypes.map(_toProtoTaskType));
    }
    if (search != null && search.isNotEmpty) request.search = search;
    if (fromDate != null) request.fromDate = _toTimestamp(fromDate);
    if (toDate != null) request.toDate = _toTimestamp(toDate);
    if (scheduledDateFrom != null) {
      request.scheduledDateFrom = _toTimestamp(scheduledDateFrom);
    }
    if (scheduledDateTo != null) {
      request.scheduledDateTo = _toTimestamp(scheduledDateTo);
    }
    if (dueDateFrom != null) request.dueDateFrom = _toTimestamp(dueDateFrom);
    if (dueDateTo != null) request.dueDateTo = _toTimestamp(dueDateTo);
    if (isOverdue != null) request.isOverdue = isOverdue;
    if (filterUnassigned) request.filterUnassigned = true;
    if (filterNoAssigner) request.filterNoAssigner = true;
    if (filterNoRequester) request.filterNoRequester = true;
    if (sortBy != null) request.sortBy = sortBy;
    if (sortOrder != null) request.sortOrder = sortOrder;

    final response = await _rpc.listTasks(request);
    return PaginatedTasks(
      items: response.items.map(_fromProtoTaskWithDetails).toList(),
      total: response.total,
    );
  }

  Future<Task> updateTaskStatus({
    required String id,
    required TaskStatus status,
    ResolutionType? resolutionType,
    String? notes,
  }) async {
    final request = pb.UpdateTaskStatusRequest(
      id: id,
      status: _toProtoTaskStatus(status),
    );

    if (resolutionType != null) {
      request.resolutionType = _toProtoResolutionType(resolutionType);
    }
    if (notes != null) request.notes = notes;

    final response = await _rpc.updateTaskStatus(request);
    return _fromProtoTask(response);
  }

  Future<Task> claimTask(String id) async {
    final request = pb.ClaimTaskRequest(id: id);
    final response = await _rpc.claimTask(request);
    return _fromProtoTask(response);
  }

  // ============================================================================
  // Comment Methods
  // ============================================================================

  Future<TaskComment> createComment({
    required String taskId,
    required String content,
    List<String>? mentionedMemberIds,
    List<String>? attachmentIds,
  }) async {
    final request = pb.CreateCommentRequest(
      taskId: taskId,
      content: content,
    );

    if (mentionedMemberIds != null && mentionedMemberIds.isNotEmpty) {
      request.mentionedMemberIds.addAll(mentionedMemberIds);
    }

    if (attachmentIds != null && attachmentIds.isNotEmpty) {
      request.attachmentIds.addAll(attachmentIds);
    }

    final response = await _rpc.createComment(request);
    return _fromProtoTaskComment(response);
  }

  Future<TaskComment> updateComment({
    required String id,
    required String content,
  }) async {
    final request = pb.UpdateCommentRequest(
      id: id,
      content: content,
    );

    final response = await _rpc.updateComment(request);
    return _fromProtoTaskComment(response);
  }

  Future<void> deleteComment(String id) async {
    final request = pb.DeleteCommentRequest(id: id);
    await _rpc.deleteComment(request);
  }

  Future<List<TaskComment>> listComments({
    required String taskId,
    int limit = 50,
    int offset = 0,
  }) async {
    final request = pb.ListCommentsRequest(
      taskId: taskId,
      limit: limit,
      offset: offset,
    );

    final response = await _rpc.listComments(request);
    return response.comments.map(_fromProtoTaskComment).toList();
  }

  // ============================================================================
  // Activity Methods
  // ============================================================================

  Future<List<TaskActivity>> getTaskActivity({
    required String taskId,
    int limit = 50,
    int offset = 0,
  }) async {
    final request = pb.GetTaskActivityRequest(
      taskId: taskId,
      limit: limit,
      offset: offset,
    );

    final response = await _rpc.getTaskActivity(request);
    return response.items.map(_fromProtoTaskActivity).toList();
  }

  // ============================================================================
  // Assignment Rule Methods
  // ============================================================================

  Future<AssignmentRule> createAssignmentRule({
    required String name,
    String? description,
    bool isActive = true,
    int priority = 0,
    Map<String, dynamic>? conditions,
    required AssignmentTargetType assignmentType,
    required AssignmentMethod assignmentMethod,
  }) async {
    final request = pb.CreateAssignmentRuleRequest(
      name: name,
      isActive: isActive,
      priority: priority,
      assignmentType: _toProtoAssignmentTargetType(assignmentType),
      assignmentMethod: _toProtoAssignmentMethod(assignmentMethod),
    );

    if (description != null) request.description = description;
    if (conditions != null) request.conditions = _toProtoStruct(conditions);

    final response = await _rpc.createAssignmentRule(request);
    return _fromProtoAssignmentRule(response);
  }

  Future<AssignmentRule> updateAssignmentRule({
    required String id,
    String? name,
    String? description,
    bool? isActive,
    int? priority,
    Map<String, dynamic>? conditions,
    AssignmentTargetType? assignmentType,
    AssignmentMethod? assignmentMethod,
  }) async {
    final request = pb.UpdateAssignmentRuleRequest(id: id);

    if (name != null) request.name = name;
    if (description != null) request.description = description;
    if (isActive != null) request.isActive = isActive;
    if (priority != null) request.priority = priority;
    if (conditions != null) request.conditions = _toProtoStruct(conditions);
    if (assignmentType != null) {
      request.assignmentType = _toProtoAssignmentTargetType(assignmentType);
    }
    if (assignmentMethod != null) {
      request.assignmentMethod = _toProtoAssignmentMethod(assignmentMethod);
    }

    final response = await _rpc.updateAssignmentRule(request);
    return _fromProtoAssignmentRule(response);
  }

  Future<void> deleteAssignmentRule(String id) async {
    final request = pb.DeleteAssignmentRuleRequest(id: id);
    await _rpc.deleteAssignmentRule(request);
  }

  Future<List<AssignmentRule>> listAssignmentRules({
    bool? isActive,
    AssignmentTargetType? assignmentType,
  }) async {
    final request = pb.ListAssignmentRulesRequest();

    if (isActive != null) request.isActive = isActive;
    if (assignmentType != null) {
      request.assignmentType = _toProtoAssignmentTargetType(assignmentType);
    }

    final response = await _rpc.listAssignmentRules(request);
    return response.items.map(_fromProtoAssignmentRule).toList();
  }

  // ============================================================================
  // Support RPC Methods
  // ============================================================================

  Future<List<AssignableMember>> getAssignableMembers({
    String? search,
    String? locationId,
  }) async {
    final request = pb.GetAssignableMembersRequest();

    if (search != null && search.isNotEmpty) request.search = search;
    if (locationId != null) request.locationId = locationId;

    final response = await _rpc.getAssignableMembers(request);
    return response.members.map(_fromProtoAssignableMember).toList();
  }

  Future<List<AssignableRole>> getAssignableRoles({
    String? locationId,
  }) async {
    final request = pb.GetAssignableRolesRequest();

    if (locationId != null) request.locationId = locationId;

    final response = await _rpc.getAssignableRoles(request);
    return response.roles.map(_fromProtoAssignableRole).toList();
  }

  Future<List<TicketLocation>> getTicketLocations() async {
    final request = pb.GetTicketLocationsRequest();
    final response = await _rpc.getTicketLocations(request);
    return response.locations.map(_fromProtoTicketLocation).toList();
  }

  Future<String> generateTaskTitle(String description,
      {String? specificLocation}) async {
    final request = pb.GenerateTaskTitleRequest(description: description);

    if (specificLocation != null) request.specificLocation = specificLocation;

    final response = await _rpc.generateTaskTitle(request);
    return response.title;
  }

  Future<TaskManagementOverview> getTaskManagementOverview() async {
    final request = pb.GetTaskManagementOverviewRequest();
    final response = await _rpc.getTaskManagementOverview(request);
    return _fromProtoTaskManagementOverview(response);
  }

  // ============================================================================
  // Conversion Helpers: DateTime <-> Timestamp
  // ============================================================================

  static Timestamp _toTimestamp(DateTime dt) {
    return Timestamp.fromDateTime(dt.toUtc());
  }

  static DateTime _fromTimestamp(Timestamp ts) {
    return ts.toDateTime().toLocal();
  }

  static DateTime? _fromTimestampNullable(Timestamp? ts) {
    if (ts == null || !ts.hasSeconds()) return null;
    return ts.toDateTime().toLocal();
  }

  // ============================================================================
  // Conversion Helpers: Struct <-> Map
  // ============================================================================

  static struct_pb.Struct _toProtoStruct(Map<String, dynamic> map) {
    final struct = struct_pb.Struct();
    map.forEach((key, value) {
      struct.fields[key] = _toProtoValue(value);
    });
    return struct;
  }

  static struct_pb.Value _toProtoValue(dynamic value) {
    final v = struct_pb.Value();
    if (value == null) {
      v.nullValue = struct_pb.NullValue.NULL_VALUE;
    } else if (value is bool) {
      v.boolValue = value;
    } else if (value is num) {
      v.numberValue = value.toDouble();
    } else if (value is String) {
      v.stringValue = value;
    } else if (value is List) {
      v.listValue = struct_pb.ListValue(
        values: value.map(_toProtoValue).toList(),
      );
    } else if (value is Map<String, dynamic>) {
      v.structValue = _toProtoStruct(value);
    }
    return v;
  }

  static Map<String, dynamic>? _fromProtoStruct(struct_pb.Struct? s) {
    if (s == null) return null;
    return s.fields.map((key, value) => MapEntry(key, _fromProtoValue(value)));
  }

  static dynamic _fromProtoValue(struct_pb.Value v) {
    if (v.hasNullValue()) return null;
    if (v.hasBoolValue()) return v.boolValue;
    if (v.hasNumberValue()) return v.numberValue;
    if (v.hasStringValue()) return v.stringValue;
    if (v.hasListValue()) {
      return v.listValue.values.map(_fromProtoValue).toList();
    }
    if (v.hasStructValue()) return _fromProtoStruct(v.structValue);
    return null;
  }

  // ============================================================================
  // Conversion Helpers: Enums
  // ============================================================================

  static pb.TaskType _toProtoTaskType(TaskType t) {
    switch (t) {
      case TaskType.maintenance:
        return pb.TaskType.TASK_TYPE_MAINTENANCE;
      case TaskType.serviceRequest:
        return pb.TaskType.TASK_TYPE_SERVICE_REQUEST;
      case TaskType.warranty:
        return pb.TaskType.TASK_TYPE_WARRANTY;
      case TaskType.other:
        return pb.TaskType.TASK_TYPE_OTHER;
      default:
        return pb.TaskType.TASK_TYPE_UNSPECIFIED;
    }
  }

  static TaskType _fromProtoTaskType(pb.TaskType t) {
    switch (t) {
      case pb.TaskType.TASK_TYPE_MAINTENANCE:
        return TaskType.maintenance;
      case pb.TaskType.TASK_TYPE_SERVICE_REQUEST:
        return TaskType.serviceRequest;
      case pb.TaskType.TASK_TYPE_WARRANTY:
        return TaskType.warranty;
      case pb.TaskType.TASK_TYPE_OTHER:
        return TaskType.other;
      default:
        return TaskType.unspecified;
    }
  }

  static pb.RecurrenceFrequency _toProtoRecurrenceFrequency(
      RecurrenceFrequency f) {
    switch (f) {
      case RecurrenceFrequency.daily:
        return pb.RecurrenceFrequency.RECURRENCE_FREQUENCY_DAILY;
      case RecurrenceFrequency.weekly:
        return pb.RecurrenceFrequency.RECURRENCE_FREQUENCY_WEEKLY;
      case RecurrenceFrequency.monthly:
        return pb.RecurrenceFrequency.RECURRENCE_FREQUENCY_MONTHLY;
      case RecurrenceFrequency.yearly:
        return pb.RecurrenceFrequency.RECURRENCE_FREQUENCY_YEARLY;
      default:
        return pb.RecurrenceFrequency.RECURRENCE_FREQUENCY_UNSPECIFIED;
    }
  }

  static pb.TaskStatus _toProtoTaskStatus(TaskStatus s) {
    switch (s) {
      case TaskStatus.created:
        return pb.TaskStatus.TASK_STATUS_CREATED;
      case TaskStatus.inProgress:
        return pb.TaskStatus.TASK_STATUS_IN_PROGRESS;
      case TaskStatus.onHold:
        return pb.TaskStatus.TASK_STATUS_ON_HOLD;
      case TaskStatus.resolved:
        return pb.TaskStatus.TASK_STATUS_RESOLVED;
      default:
        return pb.TaskStatus.TASK_STATUS_UNSPECIFIED;
    }
  }

  static TaskStatus _fromProtoTaskStatus(pb.TaskStatus s) {
    switch (s) {
      case pb.TaskStatus.TASK_STATUS_CREATED:
        return TaskStatus.created;
      case pb.TaskStatus.TASK_STATUS_IN_PROGRESS:
        return TaskStatus.inProgress;
      case pb.TaskStatus.TASK_STATUS_ON_HOLD:
        return TaskStatus.onHold;
      case pb.TaskStatus.TASK_STATUS_RESOLVED:
        return TaskStatus.resolved;
      default:
        return TaskStatus.unspecified;
    }
  }

  static pb.ResolutionType _toProtoResolutionType(ResolutionType r) {
    switch (r) {
      case ResolutionType.completed:
        return pb.ResolutionType.RESOLUTION_TYPE_COMPLETED;
      case ResolutionType.nonIssue:
        return pb.ResolutionType.RESOLUTION_TYPE_NON_ISSUE;
      case ResolutionType.duplicate:
        return pb.ResolutionType.RESOLUTION_TYPE_DUPLICATE;
      case ResolutionType.willNotFix:
        return pb.ResolutionType.RESOLUTION_TYPE_WILL_NOT_FIX;
      default:
        return pb.ResolutionType.RESOLUTION_TYPE_UNSPECIFIED;
    }
  }

  static ResolutionType _fromProtoResolutionType(pb.ResolutionType r) {
    switch (r) {
      case pb.ResolutionType.RESOLUTION_TYPE_COMPLETED:
        return ResolutionType.completed;
      case pb.ResolutionType.RESOLUTION_TYPE_NON_ISSUE:
        return ResolutionType.nonIssue;
      case pb.ResolutionType.RESOLUTION_TYPE_DUPLICATE:
        return ResolutionType.duplicate;
      case pb.ResolutionType.RESOLUTION_TYPE_WILL_NOT_FIX:
        return ResolutionType.willNotFix;
      default:
        return ResolutionType.unspecified;
    }
  }

  static pb.AssignmentTargetType _toProtoAssignmentTargetType(
      AssignmentTargetType t) {
    switch (t) {
      case AssignmentTargetType.role:
        return pb.AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_ROLE;
      case AssignmentTargetType.member:
        return pb.AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_MEMBER;
      default:
        return pb.AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_UNSPECIFIED;
    }
  }

  static AssignmentTargetType _fromProtoAssignmentTargetType(
      pb.AssignmentTargetType t) {
    switch (t) {
      case pb.AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_ROLE:
        return AssignmentTargetType.role;
      case pb.AssignmentTargetType.ASSIGNMENT_TARGET_TYPE_MEMBER:
        return AssignmentTargetType.member;
      default:
        return AssignmentTargetType.unspecified;
    }
  }

  static pb.AssignmentMethod _toProtoAssignmentMethod(AssignmentMethod m) {
    switch (m) {
      case AssignmentMethod.random:
        return pb.AssignmentMethod.ASSIGNMENT_METHOD_RANDOM;
      case AssignmentMethod.leastLoaded:
        return pb.AssignmentMethod.ASSIGNMENT_METHOD_LEAST_LOADED;
      default:
        return pb.AssignmentMethod.ASSIGNMENT_METHOD_UNSPECIFIED;
    }
  }

  static AssignmentMethod _fromProtoAssignmentMethod(pb.AssignmentMethod m) {
    switch (m) {
      case pb.AssignmentMethod.ASSIGNMENT_METHOD_RANDOM:
        return AssignmentMethod.random;
      case pb.AssignmentMethod.ASSIGNMENT_METHOD_LEAST_LOADED:
        return AssignmentMethod.leastLoaded;
      default:
        return AssignmentMethod.unspecified;
    }
  }

  // ============================================================================
  // Conversion Helpers: Domain Models
  // ============================================================================

  static TaskDef _fromProtoTaskDef(pb.TaskDef p) {
    return TaskDef(
      id: p.id,
      companyId: p.companyId,
      assetId: p.hasAssetId() ? p.assetId : null,
      locationId: p.locationId,
      fileId: p.hasFileId() ? p.fileId : null,
      taskType: _fromProtoTaskType(p.taskType),
      title: p.title,
      description: p.hasDescription() ? p.description : null,
      isEnabled: p.isEnabled,
      recurrenceRule: p.hasRecurrenceRule() ? p.recurrenceRule : null,
      recurrenceStart: _fromTimestampNullable(
          p.hasRecurrenceStart() ? p.recurrenceStart : null),
      recurrenceEnd:
          _fromTimestampNullable(p.hasRecurrenceEnd() ? p.recurrenceEnd : null),
      nextRunAt:
          _fromTimestampNullable(p.hasNextRunAt() ? p.nextRunAt : null),
      taskId: p.hasTaskId() ? p.taskId : null,
      specificLocation:
          p.hasSpecificLocation() ? p.specificLocation : null,
      details: _fromProtoStruct(p.hasDetails() ? p.details : null),
      createdAt: _fromTimestamp(p.createdAt),
      updatedAt: _fromTimestamp(p.updatedAt),
    );
  }

  static Task _fromProtoTask(pb.Task p) {
    return Task(
      id: p.id,
      taskDefId: p.taskDefId,
      assigneeId: p.hasAssigneeId() ? p.assigneeId : null,
      assignedRoleId: p.hasAssignedRoleId() ? p.assignedRoleId : null,
      requestedById: p.hasRequestedById() ? p.requestedById : null,
      assignedById: p.hasAssignedById() ? p.assignedById : null,
      scheduledDate: _fromTimestamp(p.scheduledDate),
      dueDate: _fromTimestampNullable(p.hasDueDate() ? p.dueDate : null),
      completedDate:
          _fromTimestampNullable(p.hasCompletedDate() ? p.completedDate : null),
      status: _fromProtoTaskStatus(p.status),
      resolutionType: p.hasResolutionType()
          ? _fromProtoResolutionType(p.resolutionType)
          : null,
      externalId: p.hasExternalId() ? p.externalId : null,
      details: _fromProtoStruct(p.hasDetails() ? p.details : null),
      createdAt: _fromTimestamp(p.createdAt),
      updatedAt: _fromTimestamp(p.updatedAt),
    );
  }

  static TaskWithDetails _fromProtoTaskWithDetails(pb.TaskWithDetails p) {
    return TaskWithDetails(
      id: p.id,
      taskDefId: p.taskDefId,
      assigneeId: p.hasAssigneeId() ? p.assigneeId : null,
      assignedRoleId: p.hasAssignedRoleId() ? p.assignedRoleId : null,
      requestedById: p.hasRequestedById() ? p.requestedById : null,
      assignedById: p.hasAssignedById() ? p.assignedById : null,
      scheduledDate: _fromTimestamp(p.scheduledDate),
      dueDate: _fromTimestampNullable(p.hasDueDate() ? p.dueDate : null),
      completedDate:
          _fromTimestampNullable(p.hasCompletedDate() ? p.completedDate : null),
      status: _fromProtoTaskStatus(p.status),
      resolutionType: p.hasResolutionType()
          ? _fromProtoResolutionType(p.resolutionType)
          : null,
      externalId: p.hasExternalId() ? p.externalId : null,
      details: _fromProtoStruct(p.hasDetails() ? p.details : null),
      createdAt: _fromTimestamp(p.createdAt),
      updatedAt: _fromTimestamp(p.updatedAt),
      taskType: _fromProtoTaskType(p.taskType),
      title: p.title,
      description: p.hasDescription() ? p.description : null,
      locationId: p.hasLocationId() ? p.locationId : null,
      locationName: p.hasLocationName() ? p.locationName : null,
      assetId: p.hasAssetId() ? p.assetId : null,
      taskDefCreatedAt: _fromTimestampNullable(
          p.hasTaskDefCreatedAt() ? p.taskDefCreatedAt : null),
      specificLocation:
          p.hasSpecificLocation() ? p.specificLocation : null,
      floorLocation: p.hasFloorLocation() ? p.floorLocation : null,
      serviceArea: p.hasServiceArea() ? p.serviceArea : null,
      assigneeFirstName:
          p.hasAssigneeFirstName() ? p.assigneeFirstName : null,
      assigneeLastName:
          p.hasAssigneeLastName() ? p.assigneeLastName : null,
      requestedByFirstName:
          p.hasRequestedByFirstName() ? p.requestedByFirstName : null,
      requestedByLastName:
          p.hasRequestedByLastName() ? p.requestedByLastName : null,
      assignedByFirstName:
          p.hasAssignedByFirstName() ? p.assignedByFirstName : null,
      assignedByLastName:
          p.hasAssignedByLastName() ? p.assignedByLastName : null,
    );
  }

  static TaskComment _fromProtoTaskComment(pb.TaskComment p) {
    return TaskComment(
      id: p.id,
      taskId: p.taskId,
      content: p.content,
      createdBy:
          p.hasCreatedBy() ? _fromProtoCommentAuthor(p.createdBy) : null,
      mentionedMembers:
          p.mentionedMembers.map(_fromProtoMentionedMember).toList(),
      editHistory: p.editHistory.map(_fromProtoCommentEditHistory).toList(),
      edited: p.edited,
      editedAt: _fromTimestampNullable(p.hasEditedAt() ? p.editedAt : null),
      createdAt: _fromTimestamp(p.createdAt),
      updatedAt: _fromTimestamp(p.updatedAt),
    );
  }

  static CommentAuthor _fromProtoCommentAuthor(pb.CommentAuthor p) {
    return CommentAuthor(
      id: p.id,
      name: p.name,
      email: p.hasEmail() ? p.email : null,
    );
  }

  static MentionedMember _fromProtoMentionedMember(pb.MentionedMember p) {
    return MentionedMember(
      id: p.id,
      name: p.name,
      email: p.email,
    );
  }

  static CommentEditHistory _fromProtoCommentEditHistory(
      pb.CommentEditHistory p) {
    return CommentEditHistory(
      previousContent: p.previousContent,
      editedAt: _fromTimestamp(p.editedAt),
      editedById: p.hasEditedById() ? p.editedById : null,
      editedByName: p.hasEditedByName() ? p.editedByName : null,
    );
  }

  static TaskActivity _fromProtoTaskActivity(pb.TaskActivity p) {
    return TaskActivity(
      id: p.id,
      taskId: p.taskId,
      eventType: p.eventType,
      changedBy:
          p.hasChangedBy() ? _fromProtoCommentAuthor(p.changedBy) : null,
      notes: p.hasNotes() ? p.notes : null,
      changes: _fromProtoStruct(p.hasChanges() ? p.changes : null),
      attachments: p.attachments.map(_fromProtoTaskAttachment).toList(),
      comment: p.hasComment() ? _fromProtoTaskComment(p.comment) : null,
      createdAt: _fromTimestamp(p.createdAt),
    );
  }

  static AssignmentRule _fromProtoAssignmentRule(pb.AssignmentRule p) {
    return AssignmentRule(
      id: p.id,
      companyId: p.companyId,
      name: p.name,
      description: p.hasDescription() ? p.description : null,
      isActive: p.isActive,
      priority: p.priority,
      conditions: _fromProtoStruct(p.hasConditions() ? p.conditions : null),
      assignmentType: _fromProtoAssignmentTargetType(p.assignmentType),
      assignmentMethod: _fromProtoAssignmentMethod(p.assignmentMethod),
      createdBy: p.hasCreatedBy() ? p.createdBy : null,
      createdAt: _fromTimestamp(p.createdAt),
      updatedAt: _fromTimestamp(p.updatedAt),
    );
  }

  static AssignableMember _fromProtoAssignableMember(pb.AssignableMember p) {
    return AssignableMember(
      id: p.id,
      firstName: p.firstName,
      lastName: p.lastName,
      email: p.email,
      avatarUrl: p.hasAvatarUrl() ? p.avatarUrl : null,
    );
  }

  static AssignableRole _fromProtoAssignableRole(pb.AssignableRole p) {
    return AssignableRole(
      id: p.id,
      name: p.name,
      description: p.hasDescription() ? p.description : null,
      memberCount: p.memberCount,
    );
  }

  static TicketLocation _fromProtoTicketLocation(pb.TicketLocation p) {
    return TicketLocation(
      id: p.id,
      name: p.name,
      address: p.hasAddress() ? p.address : null,
    );
  }

  static TaskManagementOverview _fromProtoTaskManagementOverview(
      pb.TaskManagementOverview p) {
    return TaskManagementOverview(
      totalTasks: p.totalTasks,
      openTasks: p.openTasks,
      inProgressTasks: p.inProgressTasks,
      onHoldTasks: p.onHoldTasks,
      resolvedTasks: p.resolvedTasks,
      overdueTasks: p.overdueTasks,
      unassignedTasks: p.unassignedTasks,
      avgTimeToCloseHours: p.avgTimeToCloseHours,
      avgResponseTimeHours: p.avgResponseTimeHours,
      completionRate: p.completionRate,
      tasksByType: Map<String, int>.from(p.tasksByType),
      tasksByStatus: Map<String, int>.from(p.tasksByStatus),
      weeklyTimeToClose:
          p.weeklyTimeToClose.map(_fromProtoWeeklyMetricDataPoint).toList(),
      weeklyResponseTime:
          p.weeklyResponseTime.map(_fromProtoWeeklyMetricDataPoint).toList(),
      weeklyCreated:
          p.weeklyCreated.map(_fromProtoWeeklyCountDataPoint).toList(),
      weeklyResolved:
          p.weeklyResolved.map(_fromProtoWeeklyCountDataPoint).toList(),
    );
  }

  static WeeklyMetricDataPoint _fromProtoWeeklyMetricDataPoint(
      pb.WeeklyMetricDataPoint p) {
    return WeeklyMetricDataPoint(
      weekStart: _fromTimestamp(p.weekStart),
      averageHours: p.averageHours,
      taskCount: p.taskCount,
    );
  }

  static WeeklyCountDataPoint _fromProtoWeeklyCountDataPoint(
      pb.WeeklyCountDataPoint p) {
    return WeeklyCountDataPoint(
      weekStart: _fromTimestamp(p.weekStart),
      count: p.count,
    );
  }

  // ============================================================================
  // Attachment Methods
  // ============================================================================

  /// Get a presigned URL for uploading an attachment
  Future<AttachmentUploadUrl> getAttachmentUploadUrl({
    required String taskId,
    required String fileName,
    required String contentType,
    required int sizeBytes,
  }) async {
    final request = pb.GetAttachmentUploadUrlRequest(
      taskId: taskId,
      fileName: fileName,
      contentType: contentType,
      sizeBytes: fixnum.Int64(sizeBytes),
    );

    final response = await _rpc.getAttachmentUploadUrl(request);
    return AttachmentUploadUrl(
      uploadUrl: response.uploadUrl,
      attachmentId: response.attachmentId,
      expiresAt: _fromTimestamp(response.expiresAt),
    );
  }

  /// Confirm an attachment upload after the file has been uploaded to storage
  Future<TaskAttachment> confirmAttachmentUpload({
    required String attachmentId,
    required String taskId,
    String? commentId,
  }) async {
    final request = pb.ConfirmAttachmentUploadRequest(
      attachmentId: attachmentId,
      taskId: taskId,
    );
    if (commentId != null) request.commentId = commentId;

    final response = await _rpc.confirmAttachmentUpload(request);
    return _fromProtoTaskAttachment(response);
  }

  /// List all attachments for a task
  Future<List<TaskAttachment>> listTaskAttachments(String taskId) async {
    final request = pb.ListTaskAttachmentsRequest(taskId: taskId);
    final response = await _rpc.listTaskAttachments(request);
    return response.attachments.map(_fromProtoTaskAttachment).toList();
  }

  /// Delete an attachment
  Future<void> deleteAttachment(String id) async {
    final request = pb.DeleteAttachmentRequest(id: id);
    await _rpc.deleteAttachment(request);
  }

  /// Update attachment metadata (caption, display order)
  Future<TaskAttachment> updateAttachment({
    required String id,
    String? caption,
    int? displayOrder,
  }) async {
    final request = pb.UpdateAttachmentRequest(
      id: id,
      caption: caption,
      displayOrder: displayOrder,
    );
    final response = await _rpc.updateAttachment(request);
    return _fromProtoTaskAttachment(response);
  }

  // ============================================================================
  // Task Definition Attachment Methods
  // ============================================================================

  /// Get a presigned URL for uploading an attachment to a task definition
  Future<AttachmentUploadUrl> getTaskDefAttachmentUploadUrl({
    required String taskDefId,
    required String fileName,
    required String contentType,
    int sizeBytes = 0,
  }) async {
    final request = pb.GetTaskDefAttachmentUploadUrlRequest(
      taskDefId: taskDefId,
      fileName: fileName,
      contentType: contentType,
      sizeBytes: fixnum.Int64(sizeBytes),
    );
    final response = await _rpc.getTaskDefAttachmentUploadUrl(request);
    return AttachmentUploadUrl(
      uploadUrl: response.uploadUrl,
      attachmentId: response.attachmentId,
      expiresAt: _fromTimestamp(response.expiresAt),
    );
  }

  /// Confirm that a task definition attachment was uploaded successfully
  Future<TaskAttachment> confirmTaskDefAttachmentUpload({
    required String attachmentId,
    required String taskDefId,
  }) async {
    final request = pb.ConfirmTaskDefAttachmentUploadRequest(
      attachmentId: attachmentId,
      taskDefId: taskDefId,
    );
    final response = await _rpc.confirmTaskDefAttachmentUpload(request);
    return _fromProtoTaskAttachment(response);
  }

  /// List all attachments for a task definition
  Future<List<TaskAttachment>> listTaskDefAttachments(String taskDefId) async {
    final request = pb.ListTaskDefAttachmentsRequest(taskDefId: taskDefId);
    final response = await _rpc.listTaskDefAttachments(request);
    return response.attachments.map(_fromProtoTaskAttachment).toList();
  }

  /// Delete an attachment from a task definition
  Future<void> deleteTaskDefAttachment({
    required String taskDefId,
    required String attachmentId,
  }) async {
    final request = pb.DeleteTaskDefAttachmentRequest(
      taskDefId: taskDefId,
      attachmentId: attachmentId,
    );
    await _rpc.deleteTaskDefAttachment(request);
  }

  static TaskAttachment _fromProtoTaskAttachment(pb.TaskAttachment p) {
    return TaskAttachment(
      id: p.id,
      fileName: p.fileName,
      contentType: p.contentType,
      sizeBytes: p.sizeBytes.toInt(),
      url: p.url,
      createdAt: _fromTimestamp(p.createdAt),
    );
  }

  // ============================================================================
  // Recurrence Methods
  // ============================================================================

  /// Validate an iCal RRULE string
  Future<RecurrenceValidationResult> validateRecurrenceRule(String rule) async {
    final request = pb.ValidateRecurrenceRuleRequest(rule: rule);
    final response = await _rpc.validateRecurrenceRule(request);
    return RecurrenceValidationResult(
      isValid: response.isValid,
      errorMessage: response.hasErrorMessage() ? response.errorMessage : null,
      description: response.hasDescription() ? response.description : null,
    );
  }

  /// Preview upcoming occurrences for a recurrence rule
  Future<RecurrencePreview> previewRecurrenceOccurrences({
    required String rule,
    DateTime? startDate,
    int count = 10,
  }) async {
    final request = pb.PreviewRecurrenceOccurrencesRequest(
      rule: rule,
      count: count,
    );
    if (startDate != null) {
      request.startDate = _toTimestamp(startDate);
    }

    final response = await _rpc.previewRecurrenceOccurrences(request);
    return RecurrencePreview(
      occurrences: response.occurrences
          .map((ts) => _fromTimestamp(ts as Timestamp))
          .toList(),
      description: response.hasDescription() ? response.description : null,
    );
  }

  /// Create a recurrence rule from component parts
  Future<RecurrenceRuleResult> createRecurrenceRule({
    required RecurrenceFrequency frequency,
    int interval = 1,
    List<String>? byDay,
    int? byMonthDay,
    int? byMonth,
    int? count,
    DateTime? until,
  }) async {
    final request = pb.CreateRecurrenceRuleRequest(
      frequency: _toProtoRecurrenceFrequency(frequency),
      interval: interval,
    );

    if (byDay != null) request.byDay.addAll(byDay);
    if (byMonthDay != null) request.byMonthDay = byMonthDay;
    if (byMonth != null) request.byMonth = byMonth;
    if (count != null) request.count = count;
    if (until != null) request.until = _toTimestamp(until);

    final response = await _rpc.createRecurrenceRule(request);
    return RecurrenceRuleResult(
      rule: response.rule,
      description: response.description,
    );
  }

  // ============================================================================
  // Bulk Operations
  // ============================================================================

  /// Bulk create task definitions for multiple assets
  Future<BulkCreateResult> bulkCreateTaskDefs({
    required List<String> assetIds,
    required String locationId,
    required TaskType taskType,
    required String title,
    String? description,
    bool isEnabled = true,
    String? recurrenceRule,
    DateTime? recurrenceStart,
    DateTime? recurrenceEnd,
    String? specificLocation,
    Map<String, dynamic>? details,
  }) async {
    final request = pb.BulkCreateTaskDefsRequest(
      locationId: locationId,
      taskType: _toProtoTaskType(taskType),
      title: title,
      isEnabled: isEnabled,
    );
    request.assetIds.addAll(assetIds);

    if (description != null) request.description = description;
    if (recurrenceRule != null) request.recurrenceRule = recurrenceRule;
    if (recurrenceStart != null) {
      request.recurrenceStart = _toTimestamp(recurrenceStart);
    }
    if (recurrenceEnd != null) {
      request.recurrenceEnd = _toTimestamp(recurrenceEnd);
    }
    if (specificLocation != null) request.specificLocation = specificLocation;
    if (details != null) request.details = _toProtoStruct(details);

    final response = await _rpc.bulkCreateTaskDefs(request);
    return BulkCreateResult(
      createdCount: response.createdCount,
      failedAssetIds: response.failedAssetIds,
      createdIds: response.createdIds,
    );
  }

  /// Bulk update task definitions (enable/disable, change location, etc.)
  Future<BulkOperationResult> bulkUpdateTaskDefs({
    required List<String> ids,
    bool? isEnabled,
    String? locationId,
    TaskType? taskType,
  }) async {
    final request = pb.BulkUpdateTaskDefsRequest();
    request.ids.addAll(ids);

    if (isEnabled != null) request.isEnabled = isEnabled;
    if (locationId != null) request.locationId = locationId;
    if (taskType != null) request.taskType = _toProtoTaskType(taskType);

    final response = await _rpc.bulkUpdateTaskDefs(request);
    return BulkOperationResult(
      successCount: response.updatedCount,
      failedIds: response.failedIds,
    );
  }

  /// Bulk delete (soft-delete) task definitions
  Future<BulkOperationResult> bulkDeleteTaskDefs(List<String> ids) async {
    final request = pb.BulkDeleteTaskDefsRequest();
    request.ids.addAll(ids);

    final response = await _rpc.bulkDeleteTaskDefs(request);
    return BulkOperationResult(
      successCount: response.deletedCount,
      failedIds: response.failedIds,
    );
  }

  /// Bulk update task status for multiple tasks
  Future<BulkOperationResult> bulkUpdateTaskStatus({
    required List<String> ids,
    required TaskStatus status,
    ResolutionType? resolutionType,
    String? notes,
  }) async {
    final request = pb.BulkUpdateTaskStatusRequest(
      status: _toProtoTaskStatus(status),
    );
    request.ids.addAll(ids);

    if (resolutionType != null) {
      request.resolutionType = _toProtoResolutionType(resolutionType);
    }
    if (notes != null) request.notes = notes;

    final response = await _rpc.bulkUpdateTaskStatus(request);
    return BulkOperationResult(
      successCount: response.updatedCount,
      failedIds: response.failedIds,
    );
  }

  // ============================================================================
  // Task Definition History
  // ============================================================================

  /// Get change history for a task definition
  Future<PaginatedTaskDefHistory> getTaskDefHistory({
    required String taskDefId,
    int limit = 50,
    int offset = 0,
  }) async {
    final request = pb.GetTaskDefHistoryRequest(
      taskDefId: taskDefId,
      limit: limit,
      offset: offset,
    );

    final response = await _rpc.getTaskDefHistory(request);
    return PaginatedTaskDefHistory(
      entries: response.entries.map(_fromProtoTaskDefHistoryEntry).toList(),
      total: response.total,
    );
  }

  static TaskDefHistoryEntry _fromProtoTaskDefHistoryEntry(
      pb.TaskDefHistoryEntry p) {
    Map<String, dynamic>? changes;
    if (p.hasChanges()) {
      changes = _fromProtoStruct(p.changes);
    }

    return TaskDefHistoryEntry(
      id: p.id,
      taskDefId: p.taskDefId,
      changeType: p.changeType,
      changes: changes,
      changedById: p.hasChangedById() ? p.changedById : null,
      changedByName: p.hasChangedByName() ? p.changedByName : null,
      createdAt: _fromTimestamp(p.createdAt),
    );
  }
}
