import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

/// Service for handling Firebase Authentication operations.
///
/// This service wraps Firebase Auth and provides methods for:
/// - Email/password sign in
/// - Google sign in
/// - Sign out
/// - Password reset
/// - Getting the current ID token for API calls
@lazySingleton
class FirebaseAuthService {
  final FirebaseAuth _auth;
  final GoogleSignIn? _googleSignIn;

  FirebaseAuthService()
      : _auth = FirebaseAuth.instance,
        // Only create GoogleSignIn on non-web platforms
        _googleSignIn = kIsWeb ? null : GoogleSignIn();

  /// Constructor for testing with mocks.
  FirebaseAuthService.withDependencies({
    required FirebaseAuth auth,
    GoogleSignIn? googleSignIn,
  })  : _auth = auth,
        _googleSignIn = googleSignIn;

  /// Stream of auth state changes (user logged in/out).
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Current Firebase user (null if not authenticated).
  User? get currentUser => _auth.currentUser;

  /// Whether a user is currently signed in.
  bool get isSignedIn => currentUser != null;

  /// Sign in with email and password.
  ///
  /// Throws [FirebaseAuthException] on failure.
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Create a new account with email and password.
  ///
  /// Throws [FirebaseAuthException] on failure.
  Future<UserCredential> createAccountWithEmail({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Sign in with Google.
  ///
  /// Returns null if the user cancels the sign-in flow.
  /// Throws [FirebaseAuthException] on failure.
  Future<UserCredential?> signInWithGoogle() async {
    if (kIsWeb) {
      // Use Firebase's signInWithPopup for web (no client ID needed)
      try {
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();
        return await _auth.signInWithPopup(googleProvider);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'popup-closed-by-user') {
          return null;
        }
        rethrow;
      }
    } else {
      // Use google_sign_in package for mobile platforms
      final GoogleSignInAccount? googleUser = await _googleSignIn?.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in flow
        return null;
      }

      // Get auth details from the Google sign-in
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create credential for Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      return await _auth.signInWithCredential(credential);
    }
  }

  /// Sign out from Firebase and Google.
  Future<void> signOut() async {
    final futures = <Future>[_auth.signOut()];
    if (_googleSignIn != null) {
      futures.add(_googleSignIn.signOut());
    }
    await Future.wait(futures);
  }

  /// Send a password reset email.
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  /// Confirm password reset with code from email.
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    await _auth.confirmPasswordReset(
      code: code,
      newPassword: newPassword,
    );
  }

  /// Get the current user's ID token for API authentication.
  ///
  /// Returns null if not authenticated.
  /// The token should be used as a Bearer token in API calls.
  Future<String?> getIdToken({bool forceRefresh = false}) async {
    final user = currentUser;
    if (user == null) return null;
    return await user.getIdToken(forceRefresh);
  }

  /// Reload the current user's data from Firebase.
  Future<void> reloadUser() async {
    await currentUser?.reload();
  }
}
