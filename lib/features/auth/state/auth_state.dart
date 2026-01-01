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

  // Core state signals
  final _firebaseUser = signal<fb.User?>(null);
  final _user = signal<User?>(null);
  final _isLoading = signal(false);
  final _error = signal<String?>(null);
  final _isInitialized = signal(false);

  // Public read-only accessors
  fb.User? get firebaseUser => _firebaseUser.value;
  User? get user => _user.value;
  bool get isLoading => _isLoading.value;
  String? get error => _error.value;
  bool get isInitialized => _isInitialized.value;

  // Computed values
  late final isAuthenticated = computed(() => _user.value != null);
  late final isFirebaseAuthenticated = computed(() => _firebaseUser.value != null);

  late final displayName = computed(() {
    final u = _user.value;
    if (u != null) {
      return '${u.firstName} ${u.lastName}'.trim();
    }
    return _firebaseUser.value?.displayName ?? 'User';
  });

  late final email = computed(() => _user.value?.email ?? _firebaseUser.value?.email);

  late final companyName = computed(() => _user.value?.company.name);

  late final permissions = computed(() => _user.value?.permissions ?? []);

  /// Check if user has a specific permission.
  bool hasPermission(String permission) {
    return _user.value?.hasPermission(permission) ?? false;
  }

  /// Check if user has access to a specific location.
  bool hasLocationAccess(String locationId) {
    return _user.value?.hasLocationAccess(locationId) ?? false;
  }

  /// Handle Firebase auth state changes.
  void _onAuthStateChanged(fb.User? firebaseUser) {
    _firebaseUser.value = firebaseUser;

    if (firebaseUser != null) {
      _loadUserProfile();
    } else {
      _user.value = null;
      _isInitialized.value = true;
    }
  }

  /// Load user profile from API after Firebase auth.
  Future<void> _loadUserProfile() async {
    try {
      final user = await _authClient.getCurrentUser();
      _user.value = user;
      _error.value = null;
    } catch (e) {
      // Profile load failure - user might not exist in our system yet
      // or there's a network error
      _error.value = 'Failed to load user profile';
      _user.value = null;
    } finally {
      _isInitialized.value = true;
    }
  }

  /// Reload user profile from API.
  Future<void> refreshUser() async {
    if (_firebaseUser.value == null) return;
    await _loadUserProfile();
  }

  /// Sign in with email and password.
  Future<bool> signInWithEmail(String email, String password) async {
    _isLoading.value = true;
    _error.value = null;

    try {
      await _firebaseAuth.signInWithEmail(email: email, password: password);
      return true;
    } on fb.FirebaseAuthException catch (e) {
      _error.value = _mapFirebaseError(e.code);
      return false;
    } catch (e) {
      _error.value = 'An unexpected error occurred';
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  /// Create a new account with email and password.
  Future<bool> createAccount(String email, String password) async {
    _isLoading.value = true;
    _error.value = null;

    try {
      await _firebaseAuth.createAccountWithEmail(email: email, password: password);
      return true;
    } on fb.FirebaseAuthException catch (e) {
      _error.value = _mapFirebaseError(e.code);
      return false;
    } catch (e) {
      _error.value = 'An unexpected error occurred';
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  /// Sign in with Google.
  ///
  /// Returns true on success, false if cancelled or failed.
  Future<bool> signInWithGoogle() async {
    _isLoading.value = true;
    _error.value = null;

    try {
      final result = await _firebaseAuth.signInWithGoogle();
      if (result == null) {
        // User cancelled
        return false;
      }
      return true;
    } on fb.FirebaseAuthException catch (e) {
      _error.value = _mapFirebaseError(e.code);
      return false;
    } catch (e) {
      _error.value = 'An unexpected error occurred';
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  /// Send password reset email.
  Future<bool> sendPasswordResetEmail(String email) async {
    _isLoading.value = true;
    _error.value = null;

    try {
      await _firebaseAuth.sendPasswordResetEmail(email);
      return true;
    } on fb.FirebaseAuthException catch (e) {
      _error.value = _mapFirebaseError(e.code);
      return false;
    } catch (e) {
      _error.value = 'An unexpected error occurred';
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  /// Sign out from Firebase and clear user state.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _user.value = null;
    _error.value = null;
  }

  /// Clear the current error.
  void clearError() {
    _error.value = null;
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
