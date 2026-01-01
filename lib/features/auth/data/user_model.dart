import 'package:equatable/equatable.dart';

/// User model matching the proto User message.
///
/// Represents an authenticated user with their authorization info.
class User extends Equatable {
  /// Unique member ID (UUID).
  final String id;

  /// Firebase UID from the authentication token.
  final String firebaseUid;

  /// User's email address.
  final String email;

  /// User's first name.
  final String firstName;

  /// User's last name.
  final String lastName;

  /// The company this user belongs to.
  final Company company;

  /// All roles assigned to this user.
  final List<Role> roles;

  /// Flattened list of all permissions (format: "resource:action").
  final List<String> permissions;

  /// Location IDs this user has access to.
  /// Empty means access to all locations.
  final List<String> locationIds;

  /// Whether the user has accepted their invite.
  final bool hasAcceptedInvite;

  const User({
    required this.id,
    required this.firebaseUid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.roles,
    required this.permissions,
    required this.locationIds,
    required this.hasAcceptedInvite,
  });

  /// Full display name.
  String get displayName => '$firstName $lastName'.trim();

  /// Check if user has a specific permission.
  bool hasPermission(String permission) {
    return permissions.contains(permission);
  }

  /// Check if user has access to a specific location.
  /// Empty locationIds means access to all locations.
  bool hasLocationAccess(String locationId) {
    if (locationIds.isEmpty) return true;
    return locationIds.contains(locationId);
  }

  /// Check if user has a specific role.
  bool hasRole(String roleName) {
    return roles.any((r) => r.name == roleName);
  }

  /// Create from JSON (API response).
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      firebaseUid: json['firebaseUid'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      roles: (json['roles'] as List<dynamic>)
          .map((r) => Role.fromJson(r as Map<String, dynamic>))
          .toList(),
      permissions: (json['permissions'] as List<dynamic>).cast<String>(),
      locationIds: (json['locationIds'] as List<dynamic>).cast<String>(),
      hasAcceptedInvite: json['hasAcceptedInvite'] as bool,
    );
  }

  @override
  List<Object?> get props => [
        id,
        firebaseUid,
        email,
        firstName,
        lastName,
        company,
        roles,
        permissions,
        locationIds,
        hasAcceptedInvite,
      ];
}

/// Company model matching the proto Company message.
class Company extends Equatable {
  /// Unique company ID (UUID).
  final String id;

  /// Company display name.
  final String name;

  const Company({
    required this.id,
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [id, name];
}

/// Role model matching the proto Role message.
class Role extends Equatable {
  /// Unique role ID (UUID).
  final String id;

  /// Role display name.
  final String name;

  /// Permissions granted by this role (format: "resource:action").
  final List<String> permissions;

  const Role({
    required this.id,
    required this.name,
    required this.permissions,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'] as String,
      name: json['name'] as String,
      permissions: (json['permissions'] as List<dynamic>).cast<String>(),
    );
  }

  @override
  List<Object?> get props => [id, name, permissions];
}
