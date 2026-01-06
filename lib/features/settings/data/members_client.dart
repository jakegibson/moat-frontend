import 'package:injectable/injectable.dart';

import '../../../core/transport/organization_service_client.dart';
import '../../../gen/moat/v1/organization.pb.dart' as org;
import 'members_models.dart';

/// Client for member-related API calls.
///
/// Uses OrganizationServiceClient for real backend API calls.
@lazySingleton
class MembersClient {
  final OrganizationServiceClient _orgClient;

  MembersClient(this._orgClient);

  /// List members with pagination and optional filters.
  Future<PaginatedMembers> listMembers({
    required int limit,
    required int offset,
    String? search,
    bool includePending = true,
    String? sortBy,
    bool sortAsc = true,
  }) async {
    final response = await _orgClient.listMembers(org.ListMembersRequest(
      limit: limit,
      offset: offset,
      search: search ?? '',
      includePending: includePending,
      includeDeleted: false,
      sortBy: sortBy ?? 'name',
      sortOrder: sortAsc ? 'asc' : 'desc',
    ));

    final members = response.members.map(_memberFromProto).toList();

    return PaginatedMembers(
      items: members,
      total: response.total,
      limit: limit,
      offset: offset,
    );
  }

  /// Get a single member by ID.
  Future<Member> getMember(String id) async {
    final response = await _orgClient.getMember(
      org.GetMemberRequest(memberId: id),
    );
    return _memberFromProto(response);
  }

  /// Invite a new member.
  Future<Member> inviteMember({
    required String email,
    required String firstName,
    required String lastName,
    required List<String> roleIds,
    List<String>? locationIds,
  }) async {
    final response = await _orgClient.createMember(org.CreateMemberRequest(
      email: email,
      firstName: firstName,
      lastName: lastName,
      roleIds: roleIds,
      locationIds: locationIds ?? [],
    ));
    return _memberFromProto(response);
  }

  /// Update a member.
  Future<Member> updateMember({
    required String memberId,
    String? firstName,
    String? lastName,
  }) async {
    final response = await _orgClient.updateMember(org.UpdateMemberRequest(
      memberId: memberId,
      firstName: firstName,
      lastName: lastName,
    ));
    return _memberFromProto(response);
  }

  /// Resend invitation to a pending member.
  Future<void> resendInvite(String memberId) async {
    // The backend should have a resendInvite RPC, but for now
    // we'll just verify the member exists
    await _orgClient.getMember(org.GetMemberRequest(memberId: memberId));
    // TODO: Call actual resendInvite RPC when available
  }

  /// Delete a member.
  Future<void> deleteMember(String id) async {
    await _orgClient.deleteMember(org.DeleteMemberRequest(memberId: id));
  }

  /// Convert protobuf Member to local Member model.
  Member _memberFromProto(org.Member proto) {
    return Member(
      id: proto.id,
      email: proto.email,
      firstName: proto.firstName,
      lastName: proto.lastName,
      hasAcceptedInvite: proto.hasAcceptedInvite,
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      lastLoginAt: null, // Not in protobuf yet
      roles: proto.roles.map(_roleFromProto).toList(),
      locationIds: proto.locationIds,
    );
  }

  /// Convert protobuf MemberRole to local MemberRoleAssignment.
  MemberRoleAssignment _roleFromProto(org.MemberRole proto) {
    return MemberRoleAssignment(
      id: proto.id,
      name: proto.name,
      isSystem: proto.isSystem,
      locationIds: proto.locationIds.isEmpty ? null : proto.locationIds,
    );
  }
}
