import 'package:equatable/equatable.dart';

/// Assignment method for distributing tasks.
enum AssignmentMethod {
  random,
  leastLoaded,
}

extension AssignmentMethodExtension on AssignmentMethod {
  String get displayName {
    switch (this) {
      case AssignmentMethod.random:
        return 'Random';
      case AssignmentMethod.leastLoaded:
        return 'Least Loaded';
    }
  }

  String get description {
    switch (this) {
      case AssignmentMethod.random:
        return 'Randomly assign to eligible members';
      case AssignmentMethod.leastLoaded:
        return 'Assign to member with fewest open tickets';
    }
  }
}

/// Assignment type - role-based or direct member assignment.
enum AssignmentType {
  role,
  member,
}

extension AssignmentTypeExtension on AssignmentType {
  String get displayName {
    switch (this) {
      case AssignmentType.role:
        return 'By Role';
      case AssignmentType.member:
        return 'Specific Members';
    }
  }
}

/// Conditions for matching tasks to assignment rules.
class AssignmentConditions extends Equatable {
  final List<String>? taskTypes;
  final List<String>? locationIds;
  final List<String>? assetTypes;
  final List<String>? roleNames;
  final List<String>? memberIds;
  final bool requireAll;

  const AssignmentConditions({
    this.taskTypes,
    this.locationIds,
    this.assetTypes,
    this.roleNames,
    this.memberIds,
    this.requireAll = false,
  });

  factory AssignmentConditions.fromJson(Map<String, dynamic> json) {
    return AssignmentConditions(
      taskTypes: (json['task_types'] as List<dynamic>?)?.cast<String>(),
      locationIds: (json['location_ids'] as List<dynamic>?)?.cast<String>(),
      assetTypes: (json['asset_types'] as List<dynamic>?)?.cast<String>(),
      roleNames: (json['role_names'] as List<dynamic>?)?.cast<String>(),
      memberIds: (json['member_ids'] as List<dynamic>?)?.cast<String>(),
      requireAll: json['require_all'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (taskTypes != null) 'task_types': taskTypes,
      if (locationIds != null) 'location_ids': locationIds,
      if (assetTypes != null) 'asset_types': assetTypes,
      if (roleNames != null) 'role_names': roleNames,
      if (memberIds != null) 'member_ids': memberIds,
      'require_all': requireAll,
    };
  }

  AssignmentConditions copyWith({
    List<String>? taskTypes,
    List<String>? locationIds,
    List<String>? assetTypes,
    List<String>? roleNames,
    List<String>? memberIds,
    bool? requireAll,
  }) {
    return AssignmentConditions(
      taskTypes: taskTypes ?? this.taskTypes,
      locationIds: locationIds ?? this.locationIds,
      assetTypes: assetTypes ?? this.assetTypes,
      roleNames: roleNames ?? this.roleNames,
      memberIds: memberIds ?? this.memberIds,
      requireAll: requireAll ?? this.requireAll,
    );
  }

  @override
  List<Object?> get props => [
        taskTypes,
        locationIds,
        assetTypes,
        roleNames,
        memberIds,
        requireAll,
      ];
}

/// Assignment rule for auto-assigning tickets.
class AssignmentRule extends Equatable {
  final String id;
  final String companyId;
  final String name;
  final String? description;
  final bool isActive;
  final int priority;
  final AssignmentConditions conditions;
  final AssignmentType assignmentType;
  final AssignmentMethod assignmentMethod;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdBy;

  const AssignmentRule({
    required this.id,
    required this.companyId,
    required this.name,
    this.description,
    this.isActive = true,
    this.priority = 100,
    required this.conditions,
    required this.assignmentType,
    required this.assignmentMethod,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
  });

  factory AssignmentRule.fromJson(Map<String, dynamic> json) {
    return AssignmentRule(
      id: json['id'] as String,
      companyId: json['company_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      priority: json['priority'] as int? ?? 100,
      conditions: AssignmentConditions.fromJson(
        json['conditions'] as Map<String, dynamic>,
      ),
      assignmentType: AssignmentType.values.firstWhere(
        (t) => t.name == json['assignment_type'],
        orElse: () => AssignmentType.role,
      ),
      assignmentMethod: AssignmentMethod.values.firstWhere(
        (m) => m.name == json['assignment_method'],
        orElse: () => AssignmentMethod.random,
      ),
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
      createdBy: json['created_by'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'name': name,
      if (description != null) 'description': description,
      'is_active': isActive,
      'priority': priority,
      'conditions': conditions.toJson(),
      'assignment_type': assignmentType.name,
      'assignment_method': assignmentMethod.name,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
      if (createdBy != null) 'created_by': createdBy,
    };
  }

  AssignmentRule copyWith({
    String? id,
    String? companyId,
    String? name,
    String? description,
    bool? isActive,
    int? priority,
    AssignmentConditions? conditions,
    AssignmentType? assignmentType,
    AssignmentMethod? assignmentMethod,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdBy,
  }) {
    return AssignmentRule(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      priority: priority ?? this.priority,
      conditions: conditions ?? this.conditions,
      assignmentType: assignmentType ?? this.assignmentType,
      assignmentMethod: assignmentMethod ?? this.assignmentMethod,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
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
        createdAt,
        updatedAt,
        createdBy,
      ];
}

/// Available task types for assignment rules.
class TaskType {
  static const maintenance = 'Maintenance';
  static const warranty = 'Warranty';
  static const inspection = 'Inspection';
  static const repair = 'Repair';
  static const installation = 'Installation';

  static const all = [
    maintenance,
    warranty,
    inspection,
    repair,
    installation,
  ];
}
