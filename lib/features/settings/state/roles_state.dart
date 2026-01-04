import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/roles_client.dart';
import '../data/roles_models.dart';

/// State management for roles list and operations.
///
/// Uses Signals for reactive state updates.
@lazySingleton
class RolesState {
  final RolesClient _client;

  RolesState(this._client);

  // ==========================================================================
  // Core State
  // ==========================================================================

  final roles = signal<List<RoleDetail>>([]);
  final permissions = signal<List<Permission>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);
  final selectedRole = signal<RoleDetail?>(null);

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  late final roleCount = computed(() => roles.value.length);
  late final customRoles =
      computed(() => roles.value.where((r) => !r.isSystem).toList());
  late final systemRoles =
      computed(() => roles.value.where((r) => r.isSystem).toList());

  /// Permissions grouped by resource for easier display.
  late final permissionsByResource = computed(() {
    final map = <String, List<Permission>>{};
    for (final p in permissions.value) {
      map.putIfAbsent(p.resource, () => []).add(p);
    }
    return map;
  });

  // ==========================================================================
  // Operations
  // ==========================================================================

  /// Fetch all roles and permissions.
  Future<void> fetchRoles() async {
    isLoading.value = true;
    error.value = null;

    final rolesResult = await _client.listRoles().toResult();
    final permsResult = await _client.listPermissions().toResult();

    batch(() {
      rolesResult.when(
        ok: (data) => roles.value = data,
        error: (e) => error.value = e,
      );
      permsResult.when(
        ok: (data) => permissions.value = data,
        error: (e) => error.value ??= e,
      );
    });

    isLoading.value = false;
  }

  /// Select a role for viewing/editing.
  void selectRole(RoleDetail? role) {
    selectedRole.value = role;
  }

  /// Create a new role.
  Future<Result<RoleDetail>> createRole({
    required String name,
    String? description,
    required List<String> permissionIds,
  }) async {
    final result = await _client
        .createRole(
          name: name,
          description: description,
          permissionIds: permissionIds,
        )
        .toResult();

    result.when(
      ok: (role) {
        roles.value = [role, ...roles.value];
      },
      error: (e) => error.value = e,
    );

    return result;
  }

  /// Update an existing role.
  Future<Result<RoleDetail>> updateRole({
    required String roleId,
    String? name,
    String? description,
    List<String>? permissionIds,
  }) async {
    final result = await _client
        .updateRole(
          roleId: roleId,
          name: name,
          description: description,
          permissionIds: permissionIds,
        )
        .toResult();

    result.when(
      ok: (updated) {
        roles.value =
            roles.value.map((r) => r.id == updated.id ? updated : r).toList();
        if (selectedRole.value?.id == updated.id) {
          selectedRole.value = updated;
        }
      },
      error: (e) => error.value = e,
    );

    return result;
  }

  /// Delete a role.
  Future<Result<void>> deleteRole(String roleId) async {
    // Optimistic update
    final previousRoles = roles.value;
    roles.value = roles.value.where((r) => r.id != roleId).toList();

    final result = await _client.deleteRole(roleId).toResult();

    result.when(
      ok: (_) {
        if (selectedRole.value?.id == roleId) {
          selectedRole.value = null;
        }
      },
      error: (e) {
        // Rollback on error
        roles.value = previousRoles;
        error.value = e;
      },
    );

    return result;
  }
}
