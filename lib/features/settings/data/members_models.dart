import 'package:equatable/equatable.dart';

/// Member model for company member management.
///
/// Represents a team member with their roles and location access.
class Member extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool hasAcceptedInvite;
  final DateTime? createdAt;
  final DateTime? lastLoginAt;
  final List<MemberRoleAssignment> roles;
  final List<String> locationIds;

  const Member({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.hasAcceptedInvite,
    this.createdAt,
    this.lastLoginAt,
    required this.roles,
    required this.locationIds,
  });

  String get displayName {
    final name = '$firstName $lastName'.trim();
    return name.isEmpty ? email : name;
  }

  /// Whether member has access to all locations (empty locationIds = all).
  bool get hasAllLocations => locationIds.isEmpty;

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      hasAcceptedInvite: json['hasAcceptedInvite'] as bool? ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
      lastLoginAt: json['lastLoginAt'] != null
          ? DateTime.tryParse(json['lastLoginAt'] as String)
          : null,
      roles: (json['roles'] as List<dynamic>?)
              ?.map((r) =>
                  MemberRoleAssignment.fromJson(r as Map<String, dynamic>))
              .toList() ??
          [],
      locationIds:
          (json['locationIds'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        hasAcceptedInvite,
        createdAt,
        lastLoginAt,
        roles,
        locationIds,
      ];
}

/// Role assignment for a member, including location restrictions.
class MemberRoleAssignment extends Equatable {
  final String id;
  final String name;
  final bool isSystem;
  final List<String>? locationIds;

  const MemberRoleAssignment({
    required this.id,
    required this.name,
    required this.isSystem,
    this.locationIds,
  });

  /// Whether this role applies to all locations.
  bool get hasAllLocations => locationIds == null || locationIds!.isEmpty;

  factory MemberRoleAssignment.fromJson(Map<String, dynamic> json) {
    return MemberRoleAssignment(
      id: json['id'] as String,
      name: json['name'] as String,
      isSystem: json['isSystem'] as bool? ?? false,
      locationIds:
          (json['locationIds'] as List<dynamic>?)?.cast<String>(),
    );
  }

  @override
  List<Object?> get props => [id, name, isSystem, locationIds];
}

/// Paginated response for member listing.
class PaginatedMembers {
  final List<Member> items;
  final int total;
  final int limit;
  final int offset;

  const PaginatedMembers({
    required this.items,
    required this.total,
    required this.limit,
    required this.offset,
  });

  int get currentPage => (offset ~/ limit) + 1;
  int get totalPages => (total / limit).ceil();
  bool get hasMore => offset + items.length < total;
}
