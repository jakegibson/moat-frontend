import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/organization.pb.dart';

/// ConnectRPC client for OrganizationService.
///
/// Uses generated protobuf types and the ConnectRPC transport for type-safe
/// RPC calls.
@lazySingleton
class OrganizationServiceClient {
  final Client _client;

  OrganizationServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.OrganizationService';

  // ============================================================================
  // Member Management
  // ============================================================================

  Future<ListMembersResponse> listMembers(ListMembersRequest request) {
    return _client.unary(
      Spec<ListMembersRequest, ListMembersResponse>(
        '$_service/ListMembers',
        StreamType.unary,
        ListMembersRequest.create,
        ListMembersResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<Member> getMember(GetMemberRequest request) {
    return _client.unary(
      Spec<GetMemberRequest, Member>(
        '$_service/GetMember',
        StreamType.unary,
        GetMemberRequest.create,
        Member.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<Member> createMember(CreateMemberRequest request) {
    return _client.unary(
      Spec<CreateMemberRequest, Member>(
        '$_service/CreateMember',
        StreamType.unary,
        CreateMemberRequest.create,
        Member.create,
      ),
      request,
    );
  }

  Future<Member> updateMember(UpdateMemberRequest request) {
    return _client.unary(
      Spec<UpdateMemberRequest, Member>(
        '$_service/UpdateMember',
        StreamType.unary,
        UpdateMemberRequest.create,
        Member.create,
      ),
      request,
    );
  }

  Future<DeleteMemberResponse> deleteMember(DeleteMemberRequest request) {
    return _client.unary(
      Spec<DeleteMemberRequest, DeleteMemberResponse>(
        '$_service/DeleteMember',
        StreamType.unary,
        DeleteMemberRequest.create,
        DeleteMemberResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Location Management
  // ============================================================================

  Future<ListLocationsResponse> listLocations(ListLocationsRequest request) {
    return _client.unary(
      Spec<ListLocationsRequest, ListLocationsResponse>(
        '$_service/ListLocations',
        StreamType.unary,
        ListLocationsRequest.create,
        ListLocationsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<Location> getLocation(GetLocationRequest request) {
    return _client.unary(
      Spec<GetLocationRequest, Location>(
        '$_service/GetLocation',
        StreamType.unary,
        GetLocationRequest.create,
        Location.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<Location> createLocation(CreateLocationRequest request) {
    return _client.unary(
      Spec<CreateLocationRequest, Location>(
        '$_service/CreateLocation',
        StreamType.unary,
        CreateLocationRequest.create,
        Location.create,
      ),
      request,
    );
  }

  Future<Location> updateLocation(UpdateLocationRequest request) {
    return _client.unary(
      Spec<UpdateLocationRequest, Location>(
        '$_service/UpdateLocation',
        StreamType.unary,
        UpdateLocationRequest.create,
        Location.create,
      ),
      request,
    );
  }

  Future<DeleteLocationResponse> deleteLocation(DeleteLocationRequest request) {
    return _client.unary(
      Spec<DeleteLocationRequest, DeleteLocationResponse>(
        '$_service/DeleteLocation',
        StreamType.unary,
        DeleteLocationRequest.create,
        DeleteLocationResponse.create,
      ),
      request,
    );
  }

  Future<ListLocationsResponse> getMyLocations(GetMyLocationsRequest request) {
    return _client.unary(
      Spec<GetMyLocationsRequest, ListLocationsResponse>(
        '$_service/GetMyLocations',
        StreamType.unary,
        GetMyLocationsRequest.create,
        ListLocationsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Role Management
  // ============================================================================

  Future<ListRolesResponse> listRoles(ListRolesRequest request) {
    return _client.unary(
      Spec<ListRolesRequest, ListRolesResponse>(
        '$_service/ListRoles',
        StreamType.unary,
        ListRolesRequest.create,
        ListRolesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<RoleDetail> getRole(GetRoleRequest request) {
    return _client.unary(
      Spec<GetRoleRequest, RoleDetail>(
        '$_service/GetRole',
        StreamType.unary,
        GetRoleRequest.create,
        RoleDetail.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<RoleDetail> createRole(CreateRoleRequest request) {
    return _client.unary(
      Spec<CreateRoleRequest, RoleDetail>(
        '$_service/CreateRole',
        StreamType.unary,
        CreateRoleRequest.create,
        RoleDetail.create,
      ),
      request,
    );
  }

  Future<RoleDetail> updateRole(UpdateRoleRequest request) {
    return _client.unary(
      Spec<UpdateRoleRequest, RoleDetail>(
        '$_service/UpdateRole',
        StreamType.unary,
        UpdateRoleRequest.create,
        RoleDetail.create,
      ),
      request,
    );
  }

  Future<DeleteRoleResponse> deleteRole(DeleteRoleRequest request) {
    return _client.unary(
      Spec<DeleteRoleRequest, DeleteRoleResponse>(
        '$_service/DeleteRole',
        StreamType.unary,
        DeleteRoleRequest.create,
        DeleteRoleResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Role Assignments
  // ============================================================================

  Future<AssignRoleResponse> assignRole(AssignRoleRequest request) {
    return _client.unary(
      Spec<AssignRoleRequest, AssignRoleResponse>(
        '$_service/AssignRole',
        StreamType.unary,
        AssignRoleRequest.create,
        AssignRoleResponse.create,
      ),
      request,
    );
  }

  Future<RevokeRoleResponse> revokeRole(RevokeRoleRequest request) {
    return _client.unary(
      Spec<RevokeRoleRequest, RevokeRoleResponse>(
        '$_service/RevokeRole',
        StreamType.unary,
        RevokeRoleRequest.create,
        RevokeRoleResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Member Location Assignments
  // ============================================================================

  Future<ListLocationsResponse> getMemberLocations(
      GetMemberLocationsRequest request) {
    return _client.unary(
      Spec<GetMemberLocationsRequest, ListLocationsResponse>(
        '$_service/GetMemberLocations',
        StreamType.unary,
        GetMemberLocationsRequest.create,
        ListLocationsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<AssignMemberLocationResponse> assignMemberLocation(
      AssignMemberLocationRequest request) {
    return _client.unary(
      Spec<AssignMemberLocationRequest, AssignMemberLocationResponse>(
        '$_service/AssignMemberLocation',
        StreamType.unary,
        AssignMemberLocationRequest.create,
        AssignMemberLocationResponse.create,
      ),
      request,
    );
  }

  Future<RevokeMemberLocationResponse> revokeMemberLocation(
      RevokeMemberLocationRequest request) {
    return _client.unary(
      Spec<RevokeMemberLocationRequest, RevokeMemberLocationResponse>(
        '$_service/RevokeMemberLocation',
        StreamType.unary,
        RevokeMemberLocationRequest.create,
        RevokeMemberLocationResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Permissions
  // ============================================================================

  Future<ListPermissionsResponse> listPermissions(
      ListPermissionsRequest request) {
    return _client.unary(
      Spec<ListPermissionsRequest, ListPermissionsResponse>(
        '$_service/ListPermissions',
        StreamType.unary,
        ListPermissionsRequest.create,
        ListPermissionsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Invitations
  // ============================================================================

  Future<InvitationInfo> validateInvitation(
      ValidateInvitationRequest request) {
    return _client.unary(
      Spec<ValidateInvitationRequest, InvitationInfo>(
        '$_service/ValidateInvitation',
        StreamType.unary,
        ValidateInvitationRequest.create,
        InvitationInfo.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<Member> acceptInvitation(AcceptInvitationRequest request) {
    return _client.unary(
      Spec<AcceptInvitationRequest, Member>(
        '$_service/AcceptInvitation',
        StreamType.unary,
        AcceptInvitationRequest.create,
        Member.create,
      ),
      request,
    );
  }
}
