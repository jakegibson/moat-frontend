import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/auth/firebase_auth_service.dart';
import '../data/auth_client.dart';
import '../data/user_model.dart';

/// Authentication state management using Signals.
///
/// This manages both Firebase authentication state and the hydrated user
/// profile from the API. The flow is:
/// 1. User signs in via Firebase (email/password or Google)
/// 2. On successful Firebase auth, we call the API to get the full user profile
/// 3. The user profile contains roles, permissions, locations, etc.
@lazySingleton
class AuthState {
  final FirebaseAuthService _firebaseAuth;
  final AuthClient _authClient;

  AuthState(this._firebaseAuth, this._authClient) {
    // Listen to Firebase auth state changes
    _firebaseAuth.authStateChanges.listen(_onAuthStateChanged);
  }

  // ==========================================================================
  // Core State (public signals - use .value to access)
  // ==========================================================================

  /// Firebase user from auth state changes
  final firebaseUser = signal<fb.User?>(null);

  /// Hydrated user profile from API
  final user = signal<User?>(null);

  /// Loading state for auth operations
  final isLoading = signal(false);

  /// Error message from last operation
  final error = signal<String?>(null);

  /// Whether initial auth check has completed
  final isInitialized = signal(false);

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  late final isAuthenticated = computed(() => user.value != null);
  late final isFirebaseAuthenticated = computed(() => firebaseUser.value != null);

  late final displayName = computed(() {
    final u = user.value;
    if (u != null) {
      return '${u.firstName} ${u.lastName}'.trim();
    }
    return firebaseUser.value?.displayName ?? 'User';
  });

  late final email = computed(() => user.value?.email ?? firebaseUser.value?.email);

  late final companyName = computed(() => user.value?.company.name);

  late final permissions = computed(() => user.value?.permissions ?? []);

  // ==========================================================================
  // Permission Helpers
  // ==========================================================================

  /// Check if user has a specific permission.
  bool hasPermission(String permission) {
    return user.value?.hasPermission(permission) ?? false;
  }

  /// Check if user has access to a specific location.
  bool hasLocationAccess(String locationId) {
    return user.value?.hasLocationAccess(locationId) ?? false;
  }

  // ==========================================================================
  // Auth State Changes
  // ==========================================================================

  /// Handle Firebase auth state changes.
  void _onAuthStateChanged(fb.User? fbUser) {
    firebaseUser.value = fbUser;

    if (fbUser != null) {
      _loadUserProfile();
    } else {
      user.value = null;
      isInitialized.value = true;
    }
  }

  /// Load user profile from API after Firebase auth.
  Future<void> _loadUserProfile() async {
    try {
      final profile = await _authClient.getCurrentUser();
      user.value = profile;
      error.value = null;
    } catch (e) {
      // Profile load failure - user might not exist in our system yet
      // or there's a network error
      error.value = 'Failed to load user profile';
      user.value = null;
    } finally {
      isInitialized.value = true;
    }
  }

  /// Reload user profile from API.
  Future<void> refreshUser() async {
    if (firebaseUser.value == null) return;
    await _loadUserProfile();
  }

  // ==========================================================================
  // Auth Operations
  // ==========================================================================

  /// Sign in with email and password.
  Future<bool> signInWithEmail(String emailAddress, String password) async {
    isLoading.value = true;
    error.value = null;

    try {
      await _firebaseAuth.signInWithEmail(email: emailAddress, password: password);
      return true;
    } on fb.FirebaseAuthException catch (e) {
      error.value = _mapFirebaseError(e.code);
      return false;
    } catch (e) {
      error.value = 'An unexpected error occurred';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Create a new account with email and password.
  Future<bool> createAccount(String emailAddress, String password) async {
    isLoading.value = true;
    error.value = null;

    try {
      await _firebaseAuth.createAccountWithEmail(email: emailAddress, password: password);
      return true;
    } on fb.FirebaseAuthException catch (e) {
      error.value = _mapFirebaseError(e.code);
      return false;
    } catch (e) {
      error.value = 'An unexpected error occurred';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Sign in with Google.
  ///
  /// Returns true on success, false if cancelled or failed.
  Future<bool> signInWithGoogle() async {
    isLoading.value = true;
    error.value = null;

    try {
      final result = await _firebaseAuth.signInWithGoogle();
      if (result == null) {
        // User cancelled
        return false;
      }
      return true;
    } on fb.FirebaseAuthException catch (e) {
      error.value = _mapFirebaseError(e.code);
      return false;
    } catch (e) {
      error.value = 'An unexpected error occurred';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Send password reset email.
  Future<bool> sendPasswordResetEmail(String emailAddress) async {
    isLoading.value = true;
    error.value = null;

    try {
      await _firebaseAuth.sendPasswordResetEmail(emailAddress);
      return true;
    } on fb.FirebaseAuthException catch (e) {
      error.value = _mapFirebaseError(e.code);
      return false;
    } catch (e) {
      error.value = 'An unexpected error occurred';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Sign out from Firebase and clear user state.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    user.value = null;
    error.value = null;
  }

  /// Clear the current error.
  void clearError() {
    error.value = null;
  }

  String _mapFirebaseError(String code) => switch (code) {
        'user-not-found' => 'No account found with this email',
        'wrong-password' => 'Incorrect password',
        'invalid-credential' => 'Invalid email or password',
        'invalid-email' => 'Invalid email address',
        'email-already-in-use' => 'An account already exists with this email',
        'weak-password' => 'Password is too weak',
        'user-disabled' => 'This account has been disabled',
        'too-many-requests' => 'Too many attempts. Please try again later',
        'operation-not-allowed' => 'This sign-in method is not enabled',
        'account-exists-with-different-credential' =>
          'An account already exists with this email using a different sign-in method',
        _ => 'An error occurred. Please try again',
      };
}
