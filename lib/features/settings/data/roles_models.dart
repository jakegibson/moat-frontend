import 'package:equatable/equatable.dart';

/// Role model for company role management.
class RoleDetail extends Equatable {
  final String id;
  final String name;
  final String? description;
  final bool isSystem;
  final bool isAssignable;
  final List<Permission> permissions;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const RoleDetail({
    required this.id,
    required this.name,
    this.description,
    required this.isSystem,
    required this.isAssignable,
    required this.permissions,
    this.createdAt,
    this.updatedAt,
  });

  /// Number of permissions assigned to this role.
  int get permissionCount => permissions.length;

  factory RoleDetail.fromJson(Map<String, dynamic> json) {
    return RoleDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      isSystem: json['isSystem'] as bool? ?? false,
      isAssignable: json['isAssignable'] as bool? ?? true,
      permissions: (json['permissions'] as List<dynamic>?)
              ?.map((p) => Permission.fromJson(p as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String)
          : null,
    );
  }

  RoleDetail copyWith({
    String? id,
    String? name,
    String? description,
    bool? isSystem,
    bool? isAssignable,
    List<Permission>? permissions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RoleDetail(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isSystem: isSystem ?? this.isSystem,
      isAssignable: isAssignable ?? this.isAssignable,
      permissions: permissions ?? this.permissions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        isSystem,
        isAssignable,
        permissions,
        createdAt,
        updatedAt,
      ];
}

/// Permission model for role-based access control.
class Permission extends Equatable {
  final String id;
  final String resource;
  final String action;
  final String name;

  const Permission({
    required this.id,
    required this.resource,
    required this.action,
    required this.name,
  });

  /// Display label for the permission.
  String get displayLabel =>
      '${_capitalize(resource)} - ${_capitalize(action)}';

  static String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1).replaceAll('_', ' ');
  }

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      id: json['id'] as String,
      resource: json['resource'] as String,
      action: json['action'] as String,
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [id, resource, action, name];
}
