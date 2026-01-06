import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/auth.pb.dart';

/// ConnectRPC client for AuthService.
///
/// Uses generated protobuf types and the ConnectRPC transport for type-safe
/// RPC calls.
@lazySingleton
class AuthServiceClient {
  final Client _client;

  AuthServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.AuthService';

  /// Get the current authenticated user's profile.
  Future<GetCurrentUserResponse> getCurrentUser(
      GetCurrentUserRequest request) {
    return _client.unary(
      Spec<GetCurrentUserRequest, GetCurrentUserResponse>(
        '$_service/GetCurrentUser',
        StreamType.unary,
        GetCurrentUserRequest.create,
        GetCurrentUserResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }
}
