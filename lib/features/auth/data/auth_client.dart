import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../core/config/app_config.dart';
import 'user_model.dart' as models;

/// Client for auth-related API calls.
///
/// Uses ConnectRPC JSON format to communicate with the backend.
/// Once Dart proto generation is enabled, this can be replaced with
/// the generated client.
@lazySingleton
class AuthClient {
  AuthClient();

  /// Get the current user's profile from the API.
  ///
  /// This calls the AuthService.GetCurrentUser RPC endpoint.
  /// The auth interceptor in the transport adds the Firebase ID token.
  Future<models.User> getCurrentUser() async {
    // Get the current Firebase user's ID token
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      throw Exception('No authenticated user');
    }

    final idToken = await firebaseUser.getIdToken();

    // Make the ConnectRPC call using JSON format
    // The endpoint follows ConnectRPC conventions: POST to /service.Name/MethodName
    final url = Uri.parse('${AppConfig.apiBaseUrl}/moat.v1.AuthService/GetCurrentUser');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $idToken',
      },
      body: '{}', // Empty request message
    );

    if (response.statusCode != 200) {
      final error = _parseConnectError(response);
      throw Exception(error);
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final userJson = json['user'] as Map<String, dynamic>;

    return models.User.fromJson(userJson);
  }

  /// Parse ConnectRPC error response.
  String _parseConnectError(http.Response response) {
    try {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return json['message'] as String? ?? 'Unknown error';
    } catch (_) {
      return 'Request failed with status ${response.statusCode}';
    }
  }
}
