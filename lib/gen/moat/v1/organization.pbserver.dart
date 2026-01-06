//
//  Generated code. Do not modify.
//  source: moat/v1/organization.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'organization.pb.dart' as $8;
import 'organization.pbjson.dart';

export 'organization.pb.dart';

abstract class OrganizationServiceBase extends $pb.GeneratedService {
  $async.Future<$8.ListMembersResponse> listMembers($pb.ServerContext ctx, $8.ListMembersRequest request);
  $async.Future<$8.Member> getMember($pb.ServerContext ctx, $8.GetMemberRequest request);
  $async.Future<$8.Member> createMember($pb.ServerContext ctx, $8.CreateMemberRequest request);
  $async.Future<$8.Member> updateMember($pb.ServerContext ctx, $8.UpdateMemberRequest request);
  $async.Future<$8.DeleteMemberResponse> deleteMember($pb.ServerContext ctx, $8.DeleteMemberRequest request);
  $async.Future<$8.ListLocationsResponse> listLocations($pb.ServerContext ctx, $8.ListLocationsRequest request);
  $async.Future<$8.Location> getLocation($pb.ServerContext ctx, $8.GetLocationRequest request);
  $async.Future<$8.Location> createLocation($pb.ServerContext ctx, $8.CreateLocationRequest request);
  $async.Future<$8.Location> updateLocation($pb.ServerContext ctx, $8.UpdateLocationRequest request);
  $async.Future<$8.DeleteLocationResponse> deleteLocation($pb.ServerContext ctx, $8.DeleteLocationRequest request);
  $async.Future<$8.ListLocationsResponse> getMyLocations($pb.ServerContext ctx, $8.GetMyLocationsRequest request);
  $async.Future<$8.ListRolesResponse> listRoles($pb.ServerContext ctx, $8.ListRolesRequest request);
  $async.Future<$8.RoleDetail> getRole($pb.ServerContext ctx, $8.GetRoleRequest request);
  $async.Future<$8.RoleDetail> createRole($pb.ServerContext ctx, $8.CreateRoleRequest request);
  $async.Future<$8.RoleDetail> updateRole($pb.ServerContext ctx, $8.UpdateRoleRequest request);
  $async.Future<$8.DeleteRoleResponse> deleteRole($pb.ServerContext ctx, $8.DeleteRoleRequest request);
  $async.Future<$8.AssignRoleResponse> assignRole($pb.ServerContext ctx, $8.AssignRoleRequest request);
  $async.Future<$8.RevokeRoleResponse> revokeRole($pb.ServerContext ctx, $8.RevokeRoleRequest request);
  $async.Future<$8.ListLocationsResponse> getMemberLocations($pb.ServerContext ctx, $8.GetMemberLocationsRequest request);
  $async.Future<$8.AssignMemberLocationResponse> assignMemberLocation($pb.ServerContext ctx, $8.AssignMemberLocationRequest request);
  $async.Future<$8.RevokeMemberLocationResponse> revokeMemberLocation($pb.ServerContext ctx, $8.RevokeMemberLocationRequest request);
  $async.Future<$8.ListPermissionsResponse> listPermissions($pb.ServerContext ctx, $8.ListPermissionsRequest request);
  $async.Future<$8.InvitationInfo> validateInvitation($pb.ServerContext ctx, $8.ValidateInvitationRequest request);
  $async.Future<$8.Member> acceptInvitation($pb.ServerContext ctx, $8.AcceptInvitationRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ListMembers': return $8.ListMembersRequest();
      case 'GetMember': return $8.GetMemberRequest();
      case 'CreateMember': return $8.CreateMemberRequest();
      case 'UpdateMember': return $8.UpdateMemberRequest();
      case 'DeleteMember': return $8.DeleteMemberRequest();
      case 'ListLocations': return $8.ListLocationsRequest();
      case 'GetLocation': return $8.GetLocationRequest();
      case 'CreateLocation': return $8.CreateLocationRequest();
      case 'UpdateLocation': return $8.UpdateLocationRequest();
      case 'DeleteLocation': return $8.DeleteLocationRequest();
      case 'GetMyLocations': return $8.GetMyLocationsRequest();
      case 'ListRoles': return $8.ListRolesRequest();
      case 'GetRole': return $8.GetRoleRequest();
      case 'CreateRole': return $8.CreateRoleRequest();
      case 'UpdateRole': return $8.UpdateRoleRequest();
      case 'DeleteRole': return $8.DeleteRoleRequest();
      case 'AssignRole': return $8.AssignRoleRequest();
      case 'RevokeRole': return $8.RevokeRoleRequest();
      case 'GetMemberLocations': return $8.GetMemberLocationsRequest();
      case 'AssignMemberLocation': return $8.AssignMemberLocationRequest();
      case 'RevokeMemberLocation': return $8.RevokeMemberLocationRequest();
      case 'ListPermissions': return $8.ListPermissionsRequest();
      case 'ValidateInvitation': return $8.ValidateInvitationRequest();
      case 'AcceptInvitation': return $8.AcceptInvitationRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ListMembers': return this.listMembers(ctx, request as $8.ListMembersRequest);
      case 'GetMember': return this.getMember(ctx, request as $8.GetMemberRequest);
      case 'CreateMember': return this.createMember(ctx, request as $8.CreateMemberRequest);
      case 'UpdateMember': return this.updateMember(ctx, request as $8.UpdateMemberRequest);
      case 'DeleteMember': return this.deleteMember(ctx, request as $8.DeleteMemberRequest);
      case 'ListLocations': return this.listLocations(ctx, request as $8.ListLocationsRequest);
      case 'GetLocation': return this.getLocation(ctx, request as $8.GetLocationRequest);
      case 'CreateLocation': return this.createLocation(ctx, request as $8.CreateLocationRequest);
      case 'UpdateLocation': return this.updateLocation(ctx, request as $8.UpdateLocationRequest);
      case 'DeleteLocation': return this.deleteLocation(ctx, request as $8.DeleteLocationRequest);
      case 'GetMyLocations': return this.getMyLocations(ctx, request as $8.GetMyLocationsRequest);
      case 'ListRoles': return this.listRoles(ctx, request as $8.ListRolesRequest);
      case 'GetRole': return this.getRole(ctx, request as $8.GetRoleRequest);
      case 'CreateRole': return this.createRole(ctx, request as $8.CreateRoleRequest);
      case 'UpdateRole': return this.updateRole(ctx, request as $8.UpdateRoleRequest);
      case 'DeleteRole': return this.deleteRole(ctx, request as $8.DeleteRoleRequest);
      case 'AssignRole': return this.assignRole(ctx, request as $8.AssignRoleRequest);
      case 'RevokeRole': return this.revokeRole(ctx, request as $8.RevokeRoleRequest);
      case 'GetMemberLocations': return this.getMemberLocations(ctx, request as $8.GetMemberLocationsRequest);
      case 'AssignMemberLocation': return this.assignMemberLocation(ctx, request as $8.AssignMemberLocationRequest);
      case 'RevokeMemberLocation': return this.revokeMemberLocation(ctx, request as $8.RevokeMemberLocationRequest);
      case 'ListPermissions': return this.listPermissions(ctx, request as $8.ListPermissionsRequest);
      case 'ValidateInvitation': return this.validateInvitation(ctx, request as $8.ValidateInvitationRequest);
      case 'AcceptInvitation': return this.acceptInvitation(ctx, request as $8.AcceptInvitationRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => OrganizationServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => OrganizationServiceBase$messageJson;
}

