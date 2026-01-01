import 'package:connectrpc/connect.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/web.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../config/app_config.dart';

/// Creates a ConnectRPC transport with Firebase authentication.
Transport createTransport() {
  return protocol.Transport(
    baseUrl: AppConfig.apiBaseUrl,
    // Use ProtoCodec (binary) - JsonCodec requires protobuf >=5.x for
    // well-known types (Timestamp RFC 3339 support), but we're on 3.1.0.
    codec: const ProtoCodec(),
    httpClient: _createAuthenticatedHttpClient(),
  );
}

/// Creates an HTTP client that adds Firebase auth token to requests.
HttpClient _createAuthenticatedHttpClient() {
  final baseClient = createHttpClient();

  return (request) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final token = await user.getIdToken();
      if (token != null) {
        request.header.add('Authorization', 'Bearer $token');
      }
    }
    return baseClient(request);
  };
}
