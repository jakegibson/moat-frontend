import 'package:injectable/injectable.dart';

import '../../../core/transport/auth_service_client.dart';
import '../../../gen/moat/v1/auth.pb.dart' as pb;
import 'user_model.dart';

/// Client for auth-related API calls.
///
/// Uses the ConnectRPC AuthServiceClient and converts between protobuf
/// types and domain models.
@lazySingleton
class AuthClient {
  final AuthServiceClient _rpc;

  AuthClient(this._rpc);

  /// Get the current user's profile from the API.
  Future<User> getCurrentUser() async {
    final request = pb.GetCurrentUserRequest();
    final response = await _rpc.getCurrentUser(request);
    return _fromProtoUser(response.user);
  }

  // ============================================================================
  // Proto Converters
  // ============================================================================

  User _fromProtoUser(pb.User proto) {
    return User(
      id: proto.id,
      firebaseUid: proto.firebaseUid,
      email: proto.email,
      firstName: proto.firstName,
      lastName: proto.lastName,
      company: _fromProtoCompany(proto.company),
      roles: proto.roles.map(_fromProtoRole).toList(),
      permissions: proto.permissions.toList(),
      locationIds: proto.locationIds.toList(),
      hasAcceptedInvite: proto.hasAcceptedInvite,
    );
  }

  Company _fromProtoCompany(pb.Company proto) {
    return Company(
      id: proto.id,
      name: proto.name,
    );
  }

  Role _fromProtoRole(pb.Role proto) {
    return Role(
      id: proto.id,
      name: proto.name,
      permissions: proto.permissions.toList(),
    );
  }
}
