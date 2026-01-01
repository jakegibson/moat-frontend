import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show IconData, Icons;

/// Task type enum matching proto TaskType
enum TaskType {
  unspecified,
  maintenance,
  serviceRequest,
  warranty,
  other;

  static TaskType fromString(String value) {
    switch (value) {
      case 'TASK_TYPE_MAINTENANCE':
      case 'maintenance':
        return TaskType.maintenance;
      case 'TASK_TYPE_SERVICE_REQUEST':
      case 'service_request':
        return TaskType.serviceRequest;
      case 'TASK_TYPE_WARRANTY':
      case 'warranty':
        return TaskType.warranty;
      case 'TASK_TYPE_OTHER':
      case 'other':
        return TaskType.other;
      default:
        return TaskType.unspecified;
    }
  }

  String toProtoString() {
    switch (this) {
      case TaskType.maintenance:
        return 'TASK_TYPE_MAINTENANCE';
      case TaskType.serviceRequest:
        return 'TASK_TYPE_SERVICE_REQUEST';
      case TaskType.warranty:
        return 'TASK_TYPE_WARRANTY';
      case TaskType.other:
        return 'TASK_TYPE_OTHER';
      default:
        return 'TASK_TYPE_UNSPECIFIED';
    }
  }

  String get displayName {
    switch (this) {
      case TaskType.maintenance:
        return 'Preventive Maintenance';
      case TaskType.serviceRequest:
        return 'Service Request';
      case TaskType.warranty:
        return 'Warranty';
      case TaskType.other:
        return 'Other';
      default:
        return 'Unknown';
    }
  }

  String get prefix {
    switch (this) {
      case TaskType.maintenance:
        return 'PM';
      case TaskType.serviceRequest:
        return 'SR';
      case TaskType.warranty:
        return 'WR';
      case TaskType.other:
        return 'OT';
      default:
        return 'TK';
    }
  }
}

/// Task status enum matching proto TaskStatus
enum TaskStatus {
  unspecified,
  created,
  inProgress,
  onHold,
  resolved;

  static TaskStatus fromString(String value) {
    switch (value) {
      case 'TASK_STATUS_CREATED':
      case 'created':
        return TaskStatus.created;
      case 'TASK_STATUS_IN_PROGRESS':
      case 'in_progress':
        return TaskStatus.inProgress;
      case 'TASK_STATUS_ON_HOLD':
      case 'on_hold':
        return TaskStatus.onHold;
      case 'TASK_STATUS_RESOLVED':
      case 'resolved':
        return TaskStatus.resolved;
      default:
        return TaskStatus.unspecified;
    }
  }

  String toProtoString() {
    switch (this) {
      case TaskStatus.created:
        return 'TASK_STATUS_CREATED';
      case TaskStatus.inProgress:
        return 'TASK_STATUS_IN_PROGRESS';
      case TaskStatus.onHold:
        return 'TASK_STATUS_ON_HOLD';
      case TaskStatus.resolved:
        return 'TASK_STATUS_RESOLVED';
      default:
        return 'TASK_STATUS_UNSPECIFIED';
    }
  }

  String get displayName {
    switch (this) {
      case TaskStatus.created:
        return 'Open';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.onHold:
        return 'On Hold';
      case TaskStatus.resolved:
        return 'Resolved';
      default:
        return 'Unknown';
    }
  }

  bool get isOpen => this == TaskStatus.created || this == TaskStatus.inProgress || this == TaskStatus.onHold;
  bool get isClosed => this == TaskStatus.resolved;
}

/// Resolution type enum matching proto ResolutionType
enum ResolutionType {
  unspecified,
  completed,
  nonIssue,
  duplicate,
  willNotFix;

  static ResolutionType fromString(String value) {
    switch (value) {
      case 'RESOLUTION_TYPE_COMPLETED':
      case 'completed':
        return ResolutionType.completed;
      case 'RESOLUTION_TYPE_NON_ISSUE':
      case 'non_issue':
        return ResolutionType.nonIssue;
      case 'RESOLUTION_TYPE_DUPLICATE':
      case 'duplicate':
        return ResolutionType.duplicate;
      case 'RESOLUTION_TYPE_WILL_NOT_FIX':
      case 'will_not_fix':
        return ResolutionType.willNotFix;
      default:
        return ResolutionType.unspecified;
    }
  }

  String toProtoString() {
    switch (this) {
      case ResolutionType.completed:
        return 'RESOLUTION_TYPE_COMPLETED';
      case ResolutionType.nonIssue:
        return 'RESOLUTION_TYPE_NON_ISSUE';
      case ResolutionType.duplicate:
        return 'RESOLUTION_TYPE_DUPLICATE';
      case ResolutionType.willNotFix:
        return 'RESOLUTION_TYPE_WILL_NOT_FIX';
      default:
        return 'RESOLUTION_TYPE_UNSPECIFIED';
    }
  }

  String get displayName {
    switch (this) {
      case ResolutionType.completed:
        return 'Completed';
      case ResolutionType.nonIssue:
        return 'Non-Issue';
      case ResolutionType.duplicate:
        return 'Duplicate';
      case ResolutionType.willNotFix:
        return "Won't Fix";
      default:
        return 'Unknown';
    }
  }
}

/// Recurrence frequency for building recurrence rules
enum RecurrenceFrequency {
  unspecified,
  daily,
  weekly,
  monthly,
  yearly;

  String get displayName {
    switch (this) {
      case RecurrenceFrequency.daily:
        return 'Daily';
      case RecurrenceFrequency.weekly:
        return 'Weekly';
      case RecurrenceFrequency.monthly:
        return 'Monthly';
      case RecurrenceFrequency.yearly:
        return 'Yearly';
      default:
        return 'Unknown';
    }
  }
}

/// Task definition model matching proto TaskDef
class TaskDef extends Equatable {
  final String id;
  final String companyId;
  final String? assetId;
  final String locationId;
  final String? fileId;
  final TaskType taskType;
  final String title;
  final String? description;
  final bool isEnabled;
  final String? recurrenceRule;
  final DateTime? recurrenceStart;
  final DateTime? recurrenceEnd;
  final DateTime? nextRunAt;
  final String? taskId;
  final String? specificLocation;
  final Map<String, dynamic>? details;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TaskDef({
    required this.id,
    required this.companyId,
    this.assetId,
    required this.locationId,
    this.fileId,
    required this.taskType,
    required this.title,
    this.description,
    required this.isEnabled,
    this.recurrenceRule,
    this.recurrenceStart,
    this.recurrenceEnd,
    this.nextRunAt,
    this.taskId,
    this.specificLocation,
    this.details,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isRecurring => recurrenceRule != null && recurrenceRule!.isNotEmpty;
  bool get isOneTime => !isRecurring;

  factory TaskDef.fromJson(Map<String, dynamic> json) {
    return TaskDef(
      id: json['id'] as String,
      companyId: json['companyId'] as String,
      assetId: json['assetId'] as String?,
      locationId: json['locationId'] as String,
      fileId: json['fileId'] as String?,
      taskType: TaskType.fromString(json['taskType'] as String? ?? ''),
      title: json['title'] as String,
      description: json['description'] as String?,
      isEnabled: json['isEnabled'] as bool? ?? true,
      recurrenceRule: json['recurrenceRule'] as String?,
      recurrenceStart: json['recurrenceStart'] != null
          ? DateTime.parse(json['recurrenceStart'] as String)
          : null,
      recurrenceEnd: json['recurrenceEnd'] != null
          ? DateTime.parse(json['recurrenceEnd'] as String)
          : null,
      nextRunAt: json['nextRunAt'] != null
          ? DateTime.parse(json['nextRunAt'] as String)
          : null,
      taskId: json['taskId'] as String?,
      specificLocation: json['specificLocation'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyId,
        assetId,
        locationId,
        fileId,
        taskType,
        title,
        description,
        isEnabled,
        recurrenceRule,
        recurrenceStart,
        recurrenceEnd,
        nextRunAt,
        taskId,
        specificLocation,
        details,
        createdAt,
        updatedAt,
      ];
}

/// Task model matching proto Task
class Task extends Equatable {
  final String id;
  final String taskDefId;
  final String? assigneeId;
  final String? assignedRoleId;
  final String? requestedById;
  final String? assignedById;
  final DateTime scheduledDate;
  final DateTime? dueDate;
  final DateTime? completedDate;
  final TaskStatus status;
  final ResolutionType? resolutionType;
  final String? externalId;
  final Map<String, dynamic>? details;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Task({
    required this.id,
    required this.taskDefId,
    this.assigneeId,
    this.assignedRoleId,
    this.requestedById,
    this.assignedById,
    required this.scheduledDate,
    this.dueDate,
    this.completedDate,
    required this.status,
    this.resolutionType,
    this.externalId,
    this.details,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isAssigned => assigneeId != null;
  bool get isOverdue =>
      dueDate != null && dueDate!.isBefore(DateTime.now()) && status.isOpen;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      taskDefId: json['taskDefId'] as String,
      assigneeId: json['assigneeId'] as String?,
      assignedRoleId: json['assignedRoleId'] as String?,
      requestedById: json['requestedById'] as String?,
      assignedById: json['assignedById'] as String?,
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      completedDate: json['completedDate'] != null
          ? DateTime.parse(json['completedDate'] as String)
          : null,
      status: TaskStatus.fromString(json['status'] as String? ?? ''),
      resolutionType: json['resolutionType'] != null
          ? ResolutionType.fromString(json['resolutionType'] as String)
          : null,
      externalId: json['externalId'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  @override
  List<Object?> get props => [
        id,
        taskDefId,
        assigneeId,
        assignedRoleId,
        requestedById,
        assignedById,
        scheduledDate,
        dueDate,
        completedDate,
        status,
        resolutionType,
        externalId,
        details,
        createdAt,
        updatedAt,
      ];
}

/// Task with details from the task definition
class TaskWithDetails extends Equatable {
  final String id;
  final String taskDefId;
  final String? assigneeId;
  final String? assignedRoleId;
  final String? requestedById;
  final String? assignedById;
  final DateTime scheduledDate;
  final DateTime? dueDate;
  final DateTime? completedDate;
  final TaskStatus status;
  final ResolutionType? resolutionType;
  final String? externalId;
  final Map<String, dynamic>? details;
  final DateTime createdAt;
  final DateTime updatedAt;

  // From task definition
  final TaskType taskType;
  final String title;
  final String? description;
  final String? locationId;
  final String? locationName;
  final String? assetId;
  final DateTime? taskDefCreatedAt;
  final String? specificLocation;
  final String? floorLocation;
  final String? serviceArea;

  // Member names from joins
  final String? assigneeFirstName;
  final String? assigneeLastName;
  final String? requestedByFirstName;
  final String? requestedByLastName;
  final String? assignedByFirstName;
  final String? assignedByLastName;

  const TaskWithDetails({
    required this.id,
    required this.taskDefId,
    this.assigneeId,
    this.assignedRoleId,
    this.requestedById,
    this.assignedById,
    required this.scheduledDate,
    this.dueDate,
    this.completedDate,
    required this.status,
    this.resolutionType,
    this.externalId,
    this.details,
    required this.createdAt,
    required this.updatedAt,
    required this.taskType,
    required this.title,
    this.description,
    this.locationId,
    this.locationName,
    this.assetId,
    this.taskDefCreatedAt,
    this.specificLocation,
    this.floorLocation,
    this.serviceArea,
    this.assigneeFirstName,
    this.assigneeLastName,
    this.requestedByFirstName,
    this.requestedByLastName,
    this.assignedByFirstName,
    this.assignedByLastName,
  });

  bool get isAssigned => assigneeId != null;
  bool get isOverdue =>
      dueDate != null && dueDate!.isBefore(DateTime.now()) && status.isOpen;

  String? get assigneeName {
    if (assigneeFirstName == null && assigneeLastName == null) return null;
    return '${assigneeFirstName ?? ''} ${assigneeLastName ?? ''}'.trim();
  }

  String? get requestedByName {
    if (requestedByFirstName == null && requestedByLastName == null) return null;
    return '${requestedByFirstName ?? ''} ${requestedByLastName ?? ''}'.trim();
  }

  String? get assignedByName {
    if (assignedByFirstName == null && assignedByLastName == null) return null;
    return '${assignedByFirstName ?? ''} ${assignedByLastName ?? ''}'.trim();
  }

  String get fullLocationName {
    final parts = <String>[];
    if (locationName != null) parts.add(locationName!);
    if (floorLocation != null) parts.add(floorLocation!);
    if (serviceArea != null) parts.add(serviceArea!);
    if (specificLocation != null) parts.add(specificLocation!);
    return parts.join(' > ');
  }

  factory TaskWithDetails.fromJson(Map<String, dynamic> json) {
    return TaskWithDetails(
      id: json['id'] as String,
      taskDefId: json['taskDefId'] as String,
      assigneeId: json['assigneeId'] as String?,
      assignedRoleId: json['assignedRoleId'] as String?,
      requestedById: json['requestedById'] as String?,
      assignedById: json['assignedById'] as String?,
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      completedDate: json['completedDate'] != null
          ? DateTime.parse(json['completedDate'] as String)
          : null,
      status: TaskStatus.fromString(json['status'] as String? ?? ''),
      resolutionType: json['resolutionType'] != null
          ? ResolutionType.fromString(json['resolutionType'] as String)
          : null,
      externalId: json['externalId'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      taskType: TaskType.fromString(json['taskType'] as String? ?? ''),
      title: json['title'] as String,
      description: json['description'] as String?,
      locationId: json['locationId'] as String?,
      locationName: json['locationName'] as String?,
      assetId: json['assetId'] as String?,
      taskDefCreatedAt: json['taskDefCreatedAt'] != null
          ? DateTime.parse(json['taskDefCreatedAt'] as String)
          : null,
      specificLocation: json['specificLocation'] as String?,
      floorLocation: json['floorLocation'] as String?,
      serviceArea: json['serviceArea'] as String?,
      assigneeFirstName: json['assigneeFirstName'] as String?,
      assigneeLastName: json['assigneeLastName'] as String?,
      requestedByFirstName: json['requestedByFirstName'] as String?,
      requestedByLastName: json['requestedByLastName'] as String?,
      assignedByFirstName: json['assignedByFirstName'] as String?,
      assignedByLastName: json['assignedByLastName'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        taskDefId,
        assigneeId,
        assignedRoleId,
        requestedById,
        assignedById,
        scheduledDate,
        dueDate,
        completedDate,
        status,
        resolutionType,
        externalId,
        details,
        createdAt,
        updatedAt,
        taskType,
        title,
        description,
        locationId,
        locationName,
        assetId,
        taskDefCreatedAt,
        specificLocation,
        floorLocation,
        serviceArea,
        assigneeFirstName,
        assigneeLastName,
        requestedByFirstName,
        requestedByLastName,
        assignedByFirstName,
        assignedByLastName,
      ];
}

/// Task comment model
class TaskComment extends Equatable {
  final String id;
  final String taskId;
  final String content;
  final CommentAuthor? createdBy;
  final List<MentionedMember> mentionedMembers;
  final List<CommentEditHistory> editHistory;
  final bool edited;
  final DateTime? editedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TaskComment({
    required this.id,
    required this.taskId,
    required this.content,
    this.createdBy,
    this.mentionedMembers = const [],
    this.editHistory = const [],
    this.edited = false,
    this.editedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskComment.fromJson(Map<String, dynamic> json) {
    return TaskComment(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      content: json['content'] as String,
      createdBy: json['createdBy'] != null
          ? CommentAuthor.fromJson(json['createdBy'] as Map<String, dynamic>)
          : null,
      mentionedMembers: (json['mentionedMembers'] as List<dynamic>?)
              ?.map((e) => MentionedMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      editHistory: (json['editHistory'] as List<dynamic>?)
              ?.map((e) => CommentEditHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      edited: json['edited'] as bool? ?? false,
      editedAt: json['editedAt'] != null
          ? DateTime.parse(json['editedAt'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  @override
  List<Object?> get props => [
        id,
        taskId,
        content,
        createdBy,
        mentionedMembers,
        editHistory,
        edited,
        editedAt,
        createdAt,
        updatedAt,
      ];
}

/// Comment author
class CommentAuthor extends Equatable {
  final String id;
  final String name;
  final String? email;

  const CommentAuthor({
    required this.id,
    required this.name,
    this.email,
  });

  factory CommentAuthor.fromJson(Map<String, dynamic> json) {
    return CommentAuthor(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, email];
}

/// Mentioned member in a comment
class MentionedMember extends Equatable {
  final String id;
  final String name;
  final String email;

  const MentionedMember({
    required this.id,
    required this.name,
    required this.email,
  });

  factory MentionedMember.fromJson(Map<String, dynamic> json) {
    return MentionedMember(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  @override
  List<Object?> get props => [id, name, email];
}

/// Comment edit history entry
class CommentEditHistory extends Equatable {
  final String previousContent;
  final DateTime editedAt;
  final String? editedById;
  final String? editedByName;

  const CommentEditHistory({
    required this.previousContent,
    required this.editedAt,
    this.editedById,
    this.editedByName,
  });

  factory CommentEditHistory.fromJson(Map<String, dynamic> json) {
    return CommentEditHistory(
      previousContent: json['previousContent'] as String,
      editedAt: DateTime.parse(json['editedAt'] as String),
      editedById: json['editedById'] as String?,
      editedByName: json['editedByName'] as String?,
    );
  }

  @override
  List<Object?> get props => [previousContent, editedAt, editedById, editedByName];
}

/// Task activity/history entry
class TaskActivity extends Equatable {
  final String id;
  final String taskId;
  final String eventType;
  final CommentAuthor? changedBy;
  final String? notes;
  final Map<String, dynamic>? changes;
  final TaskComment? comment;
  final DateTime createdAt;

  const TaskActivity({
    required this.id,
    required this.taskId,
    required this.eventType,
    this.changedBy,
    this.notes,
    this.changes,
    this.comment,
    required this.createdAt,
  });

  String get eventDisplayName {
    switch (eventType) {
      case 'created':
        return 'Created';
      case 'status_changed':
        return 'Status Changed';
      case 'assigned':
        return 'Assigned';
      case 'reassigned':
        return 'Reassigned';
      case 'claimed':
        return 'Claimed';
      case 'comment_added':
        return 'Comment Added';
      default:
        return eventType;
    }
  }

  factory TaskActivity.fromJson(Map<String, dynamic> json) {
    return TaskActivity(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      eventType: json['eventType'] as String,
      changedBy: json['changedBy'] != null
          ? CommentAuthor.fromJson(json['changedBy'] as Map<String, dynamic>)
          : null,
      notes: json['notes'] as String?,
      changes: json['changes'] as Map<String, dynamic>?,
      comment: json['comment'] != null
          ? TaskComment.fromJson(json['comment'] as Map<String, dynamic>)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  @override
  List<Object?> get props => [
        id,
        taskId,
        eventType,
        changedBy,
        notes,
        changes,
        comment,
        createdAt,
      ];
}

/// Paginated task list response
class PaginatedTasks {
  final List<TaskWithDetails> items;
  final int total;

  const PaginatedTasks({
    required this.items,
    required this.total,
  });

  bool get hasMore => items.length < total;
  int get loadedCount => items.length;

  factory PaginatedTasks.fromJson(Map<String, dynamic> json) {
    return PaginatedTasks(
      items: (json['items'] as List<dynamic>)
          .map((e) => TaskWithDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );
  }
}

/// Assignment method enum
enum AssignmentMethod {
  unspecified,
  random,
  leastLoaded;

  static AssignmentMethod fromString(String value) {
    switch (value) {
      case 'ASSIGNMENT_METHOD_RANDOM':
      case 'random':
        return AssignmentMethod.random;
      case 'ASSIGNMENT_METHOD_LEAST_LOADED':
      case 'least_loaded':
        return AssignmentMethod.leastLoaded;
      default:
        return AssignmentMethod.unspecified;
    }
  }
}

/// Assignment target type enum
enum AssignmentTargetType {
  unspecified,
  role,
  member;

  static AssignmentTargetType fromString(String value) {
    switch (value) {
      case 'ASSIGNMENT_TARGET_TYPE_ROLE':
      case 'role':
        return AssignmentTargetType.role;
      case 'ASSIGNMENT_TARGET_TYPE_MEMBER':
      case 'member':
        return AssignmentTargetType.member;
      default:
        return AssignmentTargetType.unspecified;
    }
  }
}

/// Assignment rule model
/// Assignable member for task assignment
class AssignableMember extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatarUrl;

  const AssignableMember({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.avatarUrl,
  });

  String get fullName => '$firstName $lastName'.trim();

  factory AssignableMember.fromJson(Map<String, dynamic> json) {
    return AssignableMember(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, firstName, lastName, email, avatarUrl];
}

/// Assignable role for task assignment
class AssignableRole extends Equatable {
  final String id;
  final String name;
  final String? description;
  final int memberCount;

  const AssignableRole({
    required this.id,
    required this.name,
    this.description,
    required this.memberCount,
  });

  factory AssignableRole.fromJson(Map<String, dynamic> json) {
    return AssignableRole(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      memberCount: json['memberCount'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [id, name, description, memberCount];
}

/// Weekly metric data point
class WeeklyMetricDataPoint extends Equatable {
  final DateTime weekStart;
  final double averageHours;
  final int taskCount;

  const WeeklyMetricDataPoint({
    required this.weekStart,
    required this.averageHours,
    required this.taskCount,
  });

  factory WeeklyMetricDataPoint.fromJson(Map<String, dynamic> json) {
    return WeeklyMetricDataPoint(
      weekStart: DateTime.parse(json['weekStart'] as String),
      averageHours: (json['averageHours'] as num?)?.toDouble() ?? 0.0,
      taskCount: json['taskCount'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [weekStart, averageHours, taskCount];
}

/// Weekly count data point
class WeeklyCountDataPoint extends Equatable {
  final DateTime weekStart;
  final int count;

  const WeeklyCountDataPoint({
    required this.weekStart,
    required this.count,
  });

  factory WeeklyCountDataPoint.fromJson(Map<String, dynamic> json) {
    return WeeklyCountDataPoint(
      weekStart: DateTime.parse(json['weekStart'] as String),
      count: json['count'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [weekStart, count];
}

/// Task management overview with metrics
class TaskManagementOverview extends Equatable {
  final int totalTasks;
  final int openTasks;
  final int inProgressTasks;
  final int onHoldTasks;
  final int resolvedTasks;
  final int overdueTasks;
  final int unassignedTasks;
  final double avgTimeToCloseHours;
  final double avgResponseTimeHours;
  final double completionRate;
  final Map<String, int> tasksByType;
  final Map<String, int> tasksByStatus;
  final List<WeeklyMetricDataPoint> weeklyTimeToClose;
  final List<WeeklyMetricDataPoint> weeklyResponseTime;
  final List<WeeklyCountDataPoint> weeklyCreated;
  final List<WeeklyCountDataPoint> weeklyResolved;

  const TaskManagementOverview({
    required this.totalTasks,
    required this.openTasks,
    required this.inProgressTasks,
    required this.onHoldTasks,
    required this.resolvedTasks,
    required this.overdueTasks,
    required this.unassignedTasks,
    required this.avgTimeToCloseHours,
    required this.avgResponseTimeHours,
    required this.completionRate,
    required this.tasksByType,
    required this.tasksByStatus,
    required this.weeklyTimeToClose,
    required this.weeklyResponseTime,
    required this.weeklyCreated,
    required this.weeklyResolved,
  });

  factory TaskManagementOverview.fromJson(Map<String, dynamic> json) {
    return TaskManagementOverview(
      totalTasks: json['totalTasks'] as int? ?? 0,
      openTasks: json['openTasks'] as int? ?? 0,
      inProgressTasks: json['inProgressTasks'] as int? ?? 0,
      onHoldTasks: json['onHoldTasks'] as int? ?? 0,
      resolvedTasks: json['resolvedTasks'] as int? ?? 0,
      overdueTasks: json['overdueTasks'] as int? ?? 0,
      unassignedTasks: json['unassignedTasks'] as int? ?? 0,
      avgTimeToCloseHours: (json['avgTimeToCloseHours'] as num?)?.toDouble() ?? 0.0,
      avgResponseTimeHours: (json['avgResponseTimeHours'] as num?)?.toDouble() ?? 0.0,
      completionRate: (json['completionRate'] as num?)?.toDouble() ?? 0.0,
      tasksByType: (json['tasksByType'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, v as int),
          ) ??
          {},
      tasksByStatus: (json['tasksByStatus'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, v as int),
          ) ??
          {},
      weeklyTimeToClose: (json['weeklyTimeToClose'] as List<dynamic>?)
              ?.map((e) => WeeklyMetricDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      weeklyResponseTime: (json['weeklyResponseTime'] as List<dynamic>?)
              ?.map((e) => WeeklyMetricDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      weeklyCreated: (json['weeklyCreated'] as List<dynamic>?)
              ?.map((e) => WeeklyCountDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      weeklyResolved: (json['weeklyResolved'] as List<dynamic>?)
              ?.map((e) => WeeklyCountDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [
        totalTasks,
        openTasks,
        inProgressTasks,
        onHoldTasks,
        resolvedTasks,
        overdueTasks,
        unassignedTasks,
        avgTimeToCloseHours,
        avgResponseTimeHours,
        completionRate,
        tasksByType,
        tasksByStatus,
        weeklyTimeToClose,
        weeklyResponseTime,
        weeklyCreated,
        weeklyResolved,
      ];
}

/// Ticket location for filtering and assignment
class TicketLocation extends Equatable {
  final String id;
  final String name;
  final String? address;

  const TicketLocation({
    required this.id,
    required this.name,
    this.address,
  });

  factory TicketLocation.fromJson(Map<String, dynamic> json) {
    return TicketLocation(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, address];
}

/// Assignment rule model
class AssignmentRule extends Equatable {
  final String id;
  final String companyId;
  final String name;
  final String? description;
  final bool isActive;
  final int priority;
  final Map<String, dynamic>? conditions;
  final AssignmentTargetType assignmentType;
  final AssignmentMethod assignmentMethod;
  final String? createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AssignmentRule({
    required this.id,
    required this.companyId,
    required this.name,
    this.description,
    required this.isActive,
    required this.priority,
    this.conditions,
    required this.assignmentType,
    required this.assignmentMethod,
    this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssignmentRule.fromJson(Map<String, dynamic> json) {
    return AssignmentRule(
      id: json['id'] as String,
      companyId: json['companyId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      priority: json['priority'] as int? ?? 0,
      conditions: json['conditions'] as Map<String, dynamic>?,
      assignmentType: AssignmentTargetType.fromString(
          json['assignmentType'] as String? ?? ''),
      assignmentMethod: AssignmentMethod.fromString(
          json['assignmentMethod'] as String? ?? ''),
      createdBy: json['createdBy'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyId,
        name,
        description,
        isActive,
        priority,
        conditions,
        assignmentType,
        assignmentMethod,
        createdBy,
        createdAt,
        updatedAt,
      ];
}

/// TaskAttachment model representing a file attached to a task
class TaskAttachment extends Equatable {
  final String id;
  final String fileName;
  final String contentType;
  final int sizeBytes;
  final String url;
  final DateTime createdAt;

  const TaskAttachment({
    required this.id,
    required this.fileName,
    required this.contentType,
    required this.sizeBytes,
    required this.url,
    required this.createdAt,
  });

  String get formattedSize {
    if (sizeBytes < 1024) {
      return '$sizeBytes B';
    } else if (sizeBytes < 1024 * 1024) {
      return '${(sizeBytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(sizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  bool get isImage {
    return contentType.startsWith('image/');
  }

  bool get isPdf {
    return contentType == 'application/pdf';
  }

  IconData get fileIcon {
    if (isImage) return Icons.image;
    if (isPdf) return Icons.picture_as_pdf;
    if (contentType.contains('word') || contentType.contains('document')) {
      return Icons.description;
    }
    if (contentType.contains('excel') || contentType.contains('spreadsheet')) {
      return Icons.table_chart;
    }
    return Icons.attach_file;
  }

  @override
  List<Object?> get props => [id, fileName, contentType, sizeBytes, url, createdAt];
}

/// Upload URL response from the server
class AttachmentUploadUrl {
  final String uploadUrl;
  final String attachmentId;
  final DateTime expiresAt;

  const AttachmentUploadUrl({
    required this.uploadUrl,
    required this.attachmentId,
    required this.expiresAt,
  });
}

/// Recurrence rule validation result
class RecurrenceValidationResult {
  final bool isValid;
  final String? errorMessage;
  final String? description;

  const RecurrenceValidationResult({
    required this.isValid,
    this.errorMessage,
    this.description,
  });
}

/// Preview of upcoming recurrence occurrences
class RecurrencePreview {
  final List<DateTime> occurrences;
  final String? description;

  const RecurrencePreview({
    required this.occurrences,
    this.description,
  });
}

/// Result of creating a recurrence rule
class RecurrenceRuleResult {
  final String rule;
  final String description;

  const RecurrenceRuleResult({
    required this.rule,
    required this.description,
  });
}

/// Result of a bulk operation
class BulkOperationResult {
  final int successCount;
  final List<String> failedIds;

  const BulkOperationResult({
    required this.successCount,
    required this.failedIds,
  });

  bool get hasFailures => failedIds.isNotEmpty;
  bool get allSucceeded => failedIds.isEmpty;
}

/// Result of bulk create operation (includes created IDs)
class BulkCreateResult {
  final int createdCount;
  final List<String> failedAssetIds;
  final List<String> createdIds;

  const BulkCreateResult({
    required this.createdCount,
    required this.failedAssetIds,
    required this.createdIds,
  });

  bool get hasFailures => failedAssetIds.isNotEmpty;
  bool get allSucceeded => failedAssetIds.isEmpty;
}

/// A single entry in task definition history
class TaskDefHistoryEntry extends Equatable {
  final String id;
  final String taskDefId;
  final String changeType;
  final Map<String, dynamic>? changes;
  final String? changedById;
  final String? changedByName;
  final DateTime createdAt;

  const TaskDefHistoryEntry({
    required this.id,
    required this.taskDefId,
    required this.changeType,
    this.changes,
    this.changedById,
    this.changedByName,
    required this.createdAt,
  });

  String get changeTypeDisplayName {
    switch (changeType) {
      case 'created':
        return 'Created';
      case 'updated':
        return 'Updated';
      case 'deleted':
        return 'Deleted';
      default:
        return changeType;
    }
  }

  @override
  List<Object?> get props => [id, taskDefId, changeType, changes, changedById, changedByName, createdAt];
}

/// Paginated task definition history
class PaginatedTaskDefHistory {
  final List<TaskDefHistoryEntry> entries;
  final int total;

  const PaginatedTaskDefHistory({
    required this.entries,
    required this.total,
  });
}
