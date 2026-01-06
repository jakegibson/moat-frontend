import 'package:injectable/injectable.dart';

import '../../../core/transport/organization_service_client.dart';
import '../../../gen/moat/v1/organization.pb.dart' as org;
import 'roles_models.dart';

/// Client for role-related API calls.
///
/// Uses OrganizationServiceClient for real backend API calls.
@lazySingleton
class RolesClient {
  final OrganizationServiceClient _orgClient;

  RolesClient(this._orgClient);

  /// List all roles for the company.
  Future<List<RoleDetail>> listRoles({bool includeSystem = true}) async {
    final response = await _orgClient.listRoles(
      org.ListRolesRequest(includeSystem: includeSystem),
    );
    return response.roles.map(_roleFromProto).toList();
  }

  /// List all available permissions.
  Future<List<Permission>> listPermissions() async {
    final response = await _orgClient.listPermissions(
      org.ListPermissionsRequest(),
    );
    return response.permissions.map(_permissionFromProto).toList();
  }

  /// Get a single role by ID.
  Future<RoleDetail> getRole(String id) async {
    final response = await _orgClient.getRole(
      org.GetRoleRequest(roleId: id),
    );
    return _roleFromProto(response);
  }

  /// Create a new role.
  Future<RoleDetail> createRole({
    required String name,
    String? description,
    required List<String> permissionIds,
  }) async {
    final response = await _orgClient.createRole(org.CreateRoleRequest(
      name: name,
      description: description ?? '',
      isAssignable: true,
      permissionIds: permissionIds,
    ));
    return _roleFromProto(response);
  }

  /// Update an existing role.
  Future<RoleDetail> updateRole({
    required String roleId,
    String? name,
    String? description,
    List<String>? permissionIds,
  }) async {
    final response = await _orgClient.updateRole(org.UpdateRoleRequest(
      roleId: roleId,
      name: name,
      description: description,
      permissionIds: permissionIds ?? [],
    ));
    return _roleFromProto(response);
  }

  /// Delete a role.
  Future<void> deleteRole(String id) async {
    await _orgClient.deleteRole(org.DeleteRoleRequest(roleId: id));
  }

  /// Convert protobuf RoleDetail to local RoleDetail model.
  RoleDetail _roleFromProto(org.RoleDetail proto) {
    return RoleDetail(
      id: proto.id,
      name: proto.name,
      description: proto.description.isEmpty ? null : proto.description,
      isSystem: proto.isSystem,
      isAssignable: proto.isAssignable,
      permissions: proto.permissions.map(_permissionFromProto).toList(),
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      updatedAt: proto.hasUpdatedAt() ? proto.updatedAt.toDateTime() : null,
    );
  }

  /// Convert protobuf Permission to local Permission model.
  Permission _permissionFromProto(org.Permission proto) {
    return Permission(
      id: proto.id,
      resource: proto.resource,
      action: proto.action,
      name: proto.name,
    );
  }
}
