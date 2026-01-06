import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../../../gen/moat/v1/organization.pb.dart' as org;
import '../data/admin_client.dart';

/// State management for organization-related admin features.
///
/// Manages members, locations, roles, and permissions.
/// Extracted from AdminState for better separation of concerns.
@lazySingleton
class AdminOrgState {
  final AdminClient _client;

  AdminOrgState(this._client);

  // ===========================================================================
  // Members State
  // ===========================================================================

  final members = signal<List<Member>>([]);
  final membersTotal = signal(0);
  final isLoadingMembers = signal(false);
  final membersError = signal<AppError?>(null);

  Future<void> fetchMembers({
    bool refresh = false,
    String? search,
    bool includePending = true,
  }) async {
    if (isLoadingMembers.value && !refresh) return;

    isLoadingMembers.value = true;
    membersError.value = null;

    final result = await _client
        .listMembers(search: search, includePending: includePending)
        .toResult();

    batch(() {
      result.when(
        ok: (data) {
          members.value = data;
          membersTotal.value = data.length;
        },
        error: (e) => membersError.value = e,
      );
      isLoadingMembers.value = false;
    });
  }

  Future<Result<org.Member>> createMember({
    required String email,
    required String firstName,
    required String lastName,
    List<String>? roleIds,
    List<String>? locationIds,
  }) async {
    final result = await _client
        .createMember(
          email: email,
          firstName: firstName,
          lastName: lastName,
          roleIds: roleIds,
          locationIds: locationIds,
        )
        .toResult();

    result.when(
      ok: (_) => fetchMembers(refresh: true),
      error: (e) => membersError.value = e,
    );

    return result;
  }

  Future<Result<org.Member>> updateMember({
    required String memberId,
    String? firstName,
    String? lastName,
  }) async {
    final result = await _client
        .updateMember(
          memberId: memberId,
          firstName: firstName,
          lastName: lastName,
        )
        .toResult();

    result.when(
      ok: (_) => fetchMembers(refresh: true),
      error: (e) => membersError.value = e,
    );

    return result;
  }

  Future<Result<void>> deleteMember(String memberId) async {
    final previous = members.value;
    members.value = members.value.where((m) => m.id != memberId).toList();

    final result = await _client.deleteMember(memberId).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        members.value = previous;
        membersError.value = e;
      },
    );

    return result;
  }

  // ===========================================================================
  // Locations State
  // ===========================================================================

  final locations = signal<List<Location>>([]);
  final isLoadingLocations = signal(false);
  final locationsError = signal<AppError?>(null);

  Future<void> fetchLocations({bool refresh = false}) async {
    if (isLoadingLocations.value && !refresh) return;

    isLoadingLocations.value = true;
    locationsError.value = null;

    final result = await _client.listLocations().toResult();

    batch(() {
      result.when(
        ok: (data) => locations.value = data,
        error: (e) => locationsError.value = e,
      );
      isLoadingLocations.value = false;
    });
  }

  Future<Result<org.Location>> createLocation({
    required String name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) async {
    final result = await _client
        .createLocation(
          name: name,
          address: address,
          city: city,
          state: state,
          zipCode: zipCode,
          country: country,
        )
        .toResult();

    result.when(
      ok: (_) => fetchLocations(refresh: true),
      error: (e) => locationsError.value = e,
    );

    return result;
  }

  Future<Result<org.Location>> updateLocation({
    required String locationId,
    String? name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) async {
    final result = await _client
        .updateLocation(
          locationId: locationId,
          name: name,
          address: address,
          city: city,
          state: state,
          zipCode: zipCode,
          country: country,
        )
        .toResult();

    result.when(
      ok: (_) => fetchLocations(refresh: true),
      error: (e) => locationsError.value = e,
    );

    return result;
  }

  Future<Result<void>> deleteLocation(String locationId) async {
    final previous = locations.value;
    locations.value =
        locations.value.where((l) => l.id != locationId).toList();

    final result = await _client.deleteLocation(locationId).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        locations.value = previous;
        locationsError.value = e;
      },
    );

    return result;
  }

  // ===========================================================================
  // Roles State
  // ===========================================================================

  final roles = signal<List<Role>>([]);
  final isLoadingRoles = signal(false);
  final rolesError = signal<AppError?>(null);

  Future<void> fetchRoles({
    bool refresh = false,
    bool includeSystem = false,
  }) async {
    if (isLoadingRoles.value && !refresh) return;

    isLoadingRoles.value = true;
    rolesError.value = null;

    final result =
        await _client.listRoles(includeSystem: includeSystem).toResult();

    batch(() {
      result.when(
        ok: (data) => roles.value = data,
        error: (e) => rolesError.value = e,
      );
      isLoadingRoles.value = false;
    });
  }

  Future<Result<org.RoleDetail>> createRole({
    required String name,
    String? description,
    bool isAssignable = true,
    List<String>? permissionIds,
  }) async {
    final result = await _client
        .createRole(
          name: name,
          description: description,
          isAssignable: isAssignable,
          permissionIds: permissionIds,
        )
        .toResult();

    result.when(
      ok: (_) => fetchRoles(refresh: true),
      error: (e) => rolesError.value = e,
    );

    return result;
  }

  Future<Result<org.RoleDetail>> updateRole({
    required String roleId,
    String? name,
    String? description,
    bool? isAssignable,
    List<String>? permissionIds,
  }) async {
    final result = await _client
        .updateRole(
          roleId: roleId,
          name: name,
          description: description,
          isAssignable: isAssignable,
          permissionIds: permissionIds,
        )
        .toResult();

    result.when(
      ok: (_) => fetchRoles(refresh: true),
      error: (e) => rolesError.value = e,
    );

    return result;
  }

  Future<Result<void>> deleteRole(String roleId) async {
    final previous = roles.value;
    roles.value = roles.value.where((r) => r.id != roleId).toList();

    final result = await _client.deleteRole(roleId).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        roles.value = previous;
        rolesError.value = e;
      },
    );

    return result;
  }

  Future<Result<void>> assignRole({
    required String memberId,
    required String roleId,
    List<String>? locationIds,
  }) async {
    final result = await _client
        .assignRole(
            memberId: memberId, roleId: roleId, locationIds: locationIds)
        .toResult();

    result.when(
      ok: (_) => fetchMembers(refresh: true),
      error: (e) => rolesError.value = e,
    );

    return result;
  }

  Future<Result<void>> revokeRole({
    required String memberId,
    required String roleId,
    String? reason,
  }) async {
    final result = await _client
        .revokeRole(memberId: memberId, roleId: roleId, reason: reason)
        .toResult();

    result.when(
      ok: (_) => fetchMembers(refresh: true),
      error: (e) => rolesError.value = e,
    );

    return result;
  }

  // ===========================================================================
  // Permissions State
  // ===========================================================================

  final permissions = signal<List<org.Permission>>([]);
  final isLoadingPermissions = signal(false);
  final permissionsError = signal<AppError?>(null);

  Future<void> fetchPermissions({bool refresh = false}) async {
    if (isLoadingPermissions.value && !refresh) return;

    isLoadingPermissions.value = true;
    permissionsError.value = null;

    final result = await _client.listPermissions().toResult();

    batch(() {
      result.when(
        ok: (data) => permissions.value = data.permissions,
        error: (e) => permissionsError.value = e,
      );
      isLoadingPermissions.value = false;
    });
  }
}
