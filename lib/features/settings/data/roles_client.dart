import 'package:injectable/injectable.dart';
import 'roles_models.dart';

/// Client for role-related API calls.
///
/// Currently returns mock data until proto clients are generated.
@lazySingleton
class RolesClient {
  RolesClient();

  // All available permissions
  static const _allPermissions = <Permission>[
    Permission(
        id: 'perm-1', resource: 'assets', action: 'read', name: 'assets:read'),
    Permission(
        id: 'perm-2',
        resource: 'assets',
        action: 'create',
        name: 'assets:create'),
    Permission(
        id: 'perm-3',
        resource: 'assets',
        action: 'update',
        name: 'assets:update'),
    Permission(
        id: 'perm-4',
        resource: 'assets',
        action: 'delete',
        name: 'assets:delete'),
    Permission(
        id: 'perm-5', resource: 'tasks', action: 'read', name: 'tasks:read'),
    Permission(
        id: 'perm-6',
        resource: 'tasks',
        action: 'create',
        name: 'tasks:create'),
    Permission(
        id: 'perm-7',
        resource: 'tasks',
        action: 'update',
        name: 'tasks:update'),
    Permission(
        id: 'perm-8',
        resource: 'tasks',
        action: 'assign',
        name: 'tasks:assign'),
    Permission(
        id: 'perm-9',
        resource: 'members',
        action: 'read',
        name: 'members:read'),
    Permission(
        id: 'perm-10',
        resource: 'members',
        action: 'manage',
        name: 'members:manage'),
    Permission(
        id: 'perm-11', resource: 'roles', action: 'read', name: 'roles:read'),
    Permission(
        id: 'perm-12',
        resource: 'roles',
        action: 'manage',
        name: 'roles:manage'),
    Permission(
        id: 'perm-13',
        resource: 'locations',
        action: 'read',
        name: 'locations:read'),
    Permission(
        id: 'perm-14',
        resource: 'locations',
        action: 'manage',
        name: 'locations:manage'),
    Permission(
        id: 'perm-15',
        resource: 'settings',
        action: 'manage',
        name: 'settings:manage'),
  ];

  // Internal mock data - remove when using real API
  static final _mockRoles = <RoleDetail>[
    RoleDetail(
      id: 'role-admin',
      name: 'Admin',
      description: 'Full access to all features',
      isSystem: true,
      isAssignable: true,
      permissions: _allPermissions,
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      updatedAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    RoleDetail(
      id: 'role-manager',
      name: 'Location Manager',
      description: 'Manage assets and tasks at assigned locations',
      isSystem: false,
      isAssignable: true,
      permissions: _allPermissions
          .where((p) =>
              p.resource == 'assets' ||
              p.resource == 'tasks' ||
              p.name == 'members:read')
          .toList(),
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
      updatedAt: DateTime.now().subtract(const Duration(days: 14)),
    ),
    RoleDetail(
      id: 'role-tech',
      name: 'Technician',
      description: 'View and update assigned tasks',
      isSystem: false,
      isAssignable: true,
      permissions: _allPermissions
          .where((p) =>
              p.name == 'assets:read' ||
              p.name == 'tasks:read' ||
              p.name == 'tasks:update')
          .toList(),
      createdAt: DateTime.now().subtract(const Duration(days: 150)),
      updatedAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
    RoleDetail(
      id: 'role-viewer',
      name: 'Viewer',
      description: 'Read-only access to assets and tasks',
      isSystem: false,
      isAssignable: true,
      permissions: _allPermissions
          .where((p) => p.action == 'read' && p.resource != 'members')
          .toList(),
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  /// List all roles for the company.
  Future<List<RoleDetail>> listRoles({bool includeSystem = true}) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (includeSystem) {
      return List.from(_mockRoles);
    }
    return _mockRoles.where((r) => !r.isSystem).toList();
  }

  /// List all available permissions.
  Future<List<Permission>> listPermissions() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List.from(_allPermissions);
  }

  /// Get a single role by ID.
  Future<RoleDetail> getRole(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final role = _mockRoles.where((r) => r.id == id).firstOrNull;
    if (role == null) {
      throw Exception('Role not found: $id');
    }
    return role;
  }

  /// Create a new role.
  Future<RoleDetail> createRole({
    required String name,
    String? description,
    required List<String> permissionIds,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final permissions = _allPermissions
        .where((p) => permissionIds.contains(p.id))
        .toList();

    final newRole = RoleDetail(
      id: 'role-${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      description: description,
      isSystem: false,
      isAssignable: true,
      permissions: permissions,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _mockRoles.insert(0, newRole);
    return newRole;
  }

  /// Update an existing role.
  Future<RoleDetail> updateRole({
    required String roleId,
    String? name,
    String? description,
    List<String>? permissionIds,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _mockRoles.indexWhere((r) => r.id == roleId);
    if (index == -1) {
      throw Exception('Role not found: $roleId');
    }

    final current = _mockRoles[index];
    if (current.isSystem) {
      throw Exception('Cannot modify system role');
    }

    final permissions = permissionIds != null
        ? _allPermissions
            .where((p) => permissionIds.contains(p.id))
            .toList()
        : current.permissions;

    final updated = current.copyWith(
      name: name ?? current.name,
      description: description ?? current.description,
      permissions: permissions,
      updatedAt: DateTime.now(),
    );

    _mockRoles[index] = updated;
    return updated;
  }

  /// Delete a role.
  Future<void> deleteRole(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _mockRoles.indexWhere((r) => r.id == id);
    if (index == -1) {
      throw Exception('Role not found: $id');
    }

    if (_mockRoles[index].isSystem) {
      throw Exception('Cannot delete system role');
    }

    _mockRoles.removeAt(index);
  }
}
