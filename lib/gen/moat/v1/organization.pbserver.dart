//
//  Generated code. Do not modify.
//  source: moat/v1/organization.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'organization.pb.dart' as $5;
import 'organization.pbjson.dart';

export 'organization.pb.dart';

abstract class OrganizationServiceBase extends $pb.GeneratedService {
  $async.Future<$5.ListMembersResponse> listMembers($pb.ServerContext ctx, $5.ListMembersRequest request);
  $async.Future<$5.Member> getMember($pb.ServerContext ctx, $5.GetMemberRequest request);
  $async.Future<$5.Member> createMember($pb.ServerContext ctx, $5.CreateMemberRequest request);
  $async.Future<$5.Member> updateMember($pb.ServerContext ctx, $5.UpdateMemberRequest request);
  $async.Future<$5.DeleteMemberResponse> deleteMember($pb.ServerContext ctx, $5.DeleteMemberRequest request);
  $async.Future<$5.ListLocationsResponse> listLocations($pb.ServerContext ctx, $5.ListLocationsRequest request);
  $async.Future<$5.Location> getLocation($pb.ServerContext ctx, $5.GetLocationRequest request);
  $async.Future<$5.Location> createLocation($pb.ServerContext ctx, $5.CreateLocationRequest request);
  $async.Future<$5.Location> updateLocation($pb.ServerContext ctx, $5.UpdateLocationRequest request);
  $async.Future<$5.DeleteLocationResponse> deleteLocation($pb.ServerContext ctx, $5.DeleteLocationRequest request);
  $async.Future<$5.ListLocationsResponse> getMyLocations($pb.ServerContext ctx, $5.GetMyLocationsRequest request);
  $async.Future<$5.ListRolesResponse> listRoles($pb.ServerContext ctx, $5.ListRolesRequest request);
  $async.Future<$5.RoleDetail> getRole($pb.ServerContext ctx, $5.GetRoleRequest request);
  $async.Future<$5.RoleDetail> createRole($pb.ServerContext ctx, $5.CreateRoleRequest request);
  $async.Future<$5.RoleDetail> updateRole($pb.ServerContext ctx, $5.UpdateRoleRequest request);
  $async.Future<$5.DeleteRoleResponse> deleteRole($pb.ServerContext ctx, $5.DeleteRoleRequest request);
  $async.Future<$5.AssignRoleResponse> assignRole($pb.ServerContext ctx, $5.AssignRoleRequest request);
  $async.Future<$5.RevokeRoleResponse> revokeRole($pb.ServerContext ctx, $5.RevokeRoleRequest request);
  $async.Future<$5.ListLocationsResponse> getMemberLocations($pb.ServerContext ctx, $5.GetMemberLocationsRequest request);
  $async.Future<$5.AssignMemberLocationResponse> assignMemberLocation($pb.ServerContext ctx, $5.AssignMemberLocationRequest request);
  $async.Future<$5.RevokeMemberLocationResponse> revokeMemberLocation($pb.ServerContext ctx, $5.RevokeMemberLocationRequest request);
  $async.Future<$5.ListPermissionsResponse> listPermissions($pb.ServerContext ctx, $5.ListPermissionsRequest request);
  $async.Future<$5.InvitationInfo> validateInvitation($pb.ServerContext ctx, $5.ValidateInvitationRequest request);
  $async.Future<$5.Member> acceptInvitation($pb.ServerContext ctx, $5.AcceptInvitationRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ListMembers': return $5.ListMembersRequest();
      case 'GetMember': return $5.GetMemberRequest();
      case 'CreateMember': return $5.CreateMemberRequest();
      case 'UpdateMember': return $5.UpdateMemberRequest();
      case 'DeleteMember': return $5.DeleteMemberRequest();
      case 'ListLocations': return $5.ListLocationsRequest();
      case 'GetLocation': return $5.GetLocationRequest();
      case 'CreateLocation': return $5.CreateLocationRequest();
      case 'UpdateLocation': return $5.UpdateLocationRequest();
      case 'DeleteLocation': return $5.DeleteLocationRequest();
      case 'GetMyLocations': return $5.GetMyLocationsRequest();
      case 'ListRoles': return $5.ListRolesRequest();
      case 'GetRole': return $5.GetRoleRequest();
      case 'CreateRole': return $5.CreateRoleRequest();
      case 'UpdateRole': return $5.UpdateRoleRequest();
      case 'DeleteRole': return $5.DeleteRoleRequest();
      case 'AssignRole': return $5.AssignRoleRequest();
      case 'RevokeRole': return $5.RevokeRoleRequest();
      case 'GetMemberLocations': return $5.GetMemberLocationsRequest();
      case 'AssignMemberLocation': return $5.AssignMemberLocationRequest();
      case 'RevokeMemberLocation': return $5.RevokeMemberLocationRequest();
      case 'ListPermissions': return $5.ListPermissionsRequest();
      case 'ValidateInvitation': return $5.ValidateInvitationRequest();
      case 'AcceptInvitation': return $5.AcceptInvitationRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ListMembers': return this.listMembers(ctx, request as $5.ListMembersRequest);
      case 'GetMember': return this.getMember(ctx, request as $5.GetMemberRequest);
      case 'CreateMember': return this.createMember(ctx, request as $5.CreateMemberRequest);
      case 'UpdateMember': return this.updateMember(ctx, request as $5.UpdateMemberRequest);
      case 'DeleteMember': return this.deleteMember(ctx, request as $5.DeleteMemberRequest);
      case 'ListLocations': return this.listLocations(ctx, request as $5.ListLocationsRequest);
      case 'GetLocation': return this.getLocation(ctx, request as $5.GetLocationRequest);
      case 'CreateLocation': return this.createLocation(ctx, request as $5.CreateLocationRequest);
      case 'UpdateLocation': return this.updateLocation(ctx, request as $5.UpdateLocationRequest);
      case 'DeleteLocation': return this.deleteLocation(ctx, request as $5.DeleteLocationRequest);
      case 'GetMyLocations': return this.getMyLocations(ctx, request as $5.GetMyLocationsRequest);
      case 'ListRoles': return this.listRoles(ctx, request as $5.ListRolesRequest);
      case 'GetRole': return this.getRole(ctx, request as $5.GetRoleRequest);
      case 'CreateRole': return this.createRole(ctx, request as $5.CreateRoleRequest);
      case 'UpdateRole': return this.updateRole(ctx, request as $5.UpdateRoleRequest);
      case 'DeleteRole': return this.deleteRole(ctx, request as $5.DeleteRoleRequest);
      case 'AssignRole': return this.assignRole(ctx, request as $5.AssignRoleRequest);
      case 'RevokeRole': return this.revokeRole(ctx, request as $5.RevokeRoleRequest);
      case 'GetMemberLocations': return this.getMemberLocations(ctx, request as $5.GetMemberLocationsRequest);
      case 'AssignMemberLocation': return this.assignMemberLocation(ctx, request as $5.AssignMemberLocationRequest);
      case 'RevokeMemberLocation': return this.revokeMemberLocation(ctx, request as $5.RevokeMemberLocationRequest);
      case 'ListPermissions': return this.listPermissions(ctx, request as $5.ListPermissionsRequest);
      case 'ValidateInvitation': return this.validateInvitation(ctx, request as $5.ValidateInvitationRequest);
      case 'AcceptInvitation': return this.acceptInvitation(ctx, request as $5.AcceptInvitationRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => OrganizationServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => OrganizationServiceBase$messageJson;
}

