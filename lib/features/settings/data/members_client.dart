import 'package:injectable/injectable.dart';
import 'members_models.dart';

/// Client for member-related API calls.
///
/// Currently returns mock data until proto clients are generated.
@lazySingleton
class MembersClient {
  MembersClient();

  // Internal mock data - remove when using real API
  static final _mockMembers = <Member>[
    Member(
      id: 'member-001',
      email: 'jake@moat.app',
      firstName: 'Jake',
      lastName: 'Admin',
      hasAcceptedInvite: true,
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      lastLoginAt: DateTime.now().subtract(const Duration(hours: 2)),
      roles: const [
        MemberRoleAssignment(id: 'role-admin', name: 'Admin', isSystem: true),
      ],
      locationIds: const [],
    ),
    Member(
      id: 'member-002',
      email: 'sarah@example.com',
      firstName: 'Sarah',
      lastName: 'Manager',
      hasAcceptedInvite: true,
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
      lastLoginAt: DateTime.now().subtract(const Duration(days: 1)),
      roles: const [
        MemberRoleAssignment(
          id: 'role-manager',
          name: 'Location Manager',
          isSystem: false,
          locationIds: ['loc-001', 'loc-002'],
        ),
      ],
      locationIds: const ['loc-001', 'loc-002'],
    ),
    Member(
      id: 'member-003',
      email: 'mike@example.com',
      firstName: 'Mike',
      lastName: 'Technician',
      hasAcceptedInvite: true,
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
      lastLoginAt: DateTime.now().subtract(const Duration(days: 7)),
      roles: const [
        MemberRoleAssignment(
          id: 'role-tech',
          name: 'Technician',
          isSystem: false,
          locationIds: ['loc-001'],
        ),
      ],
      locationIds: const ['loc-001'],
    ),
    Member(
      id: 'member-004',
      email: 'pending@example.com',
      firstName: 'Pending',
      lastName: 'User',
      hasAcceptedInvite: false,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      lastLoginAt: null,
      roles: const [
        MemberRoleAssignment(
          id: 'role-viewer',
          name: 'Viewer',
          isSystem: false,
        ),
      ],
      locationIds: const [],
    ),
    Member(
      id: 'member-005',
      email: 'lisa@example.com',
      firstName: 'Lisa',
      lastName: 'Chen',
      hasAcceptedInvite: true,
      createdAt: DateTime.now().subtract(const Duration(days: 50)),
      lastLoginAt: DateTime.now().subtract(const Duration(hours: 12)),
      roles: const [
        MemberRoleAssignment(
          id: 'role-manager',
          name: 'Location Manager',
          isSystem: false,
        ),
        MemberRoleAssignment(
          id: 'role-tech',
          name: 'Technician',
          isSystem: false,
          locationIds: ['loc-002'],
        ),
      ],
      locationIds: const [],
    ),
  ];

  /// List members with pagination and optional filters.
  Future<PaginatedMembers> listMembers({
    required int limit,
    required int offset,
    String? search,
    bool includePending = true,
    String? sortBy,
    bool sortAsc = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    var filtered = List<Member>.from(_mockMembers);

    // Apply search filter
    if (search != null && search.isNotEmpty) {
      final searchLower = search.toLowerCase();
      filtered = filtered
          .where((m) =>
              m.displayName.toLowerCase().contains(searchLower) ||
              m.email.toLowerCase().contains(searchLower))
          .toList();
    }

    // Apply pending filter
    if (!includePending) {
      filtered = filtered.where((m) => m.hasAcceptedInvite).toList();
    }

    // Apply sorting
    if (sortBy != null) {
      filtered.sort((a, b) {
        int result;
        switch (sortBy) {
          case 'name':
            result = a.displayName.compareTo(b.displayName);
          case 'email':
            result = a.email.compareTo(b.email);
          case 'createdAt':
            result = (a.createdAt ?? DateTime(1970))
                .compareTo(b.createdAt ?? DateTime(1970));
          case 'lastLoginAt':
            result = (a.lastLoginAt ?? DateTime(1970))
                .compareTo(b.lastLoginAt ?? DateTime(1970));
          default:
            result = a.displayName.compareTo(b.displayName);
        }
        return sortAsc ? result : -result;
      });
    }

    final total = filtered.length;

    // Apply pagination
    if (offset >= filtered.length) {
      return PaginatedMembers(
        items: [],
        total: total,
        limit: limit,
        offset: offset,
      );
    }

    final endIndex = (offset + limit).clamp(0, filtered.length);
    final items = filtered.sublist(offset, endIndex);

    return PaginatedMembers(
      items: items,
      total: total,
      limit: limit,
      offset: offset,
    );
  }

  /// Get a single member by ID.
  Future<Member> getMember(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final member = _mockMembers.where((m) => m.id == id).firstOrNull;
    if (member == null) {
      throw Exception('Member not found: $id');
    }
    return member;
  }

  /// Invite a new member.
  Future<Member> inviteMember({
    required String email,
    required String firstName,
    required String lastName,
    required List<String> roleIds,
    List<String>? locationIds,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final newMember = Member(
      id: 'member-${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      firstName: firstName,
      lastName: lastName,
      hasAcceptedInvite: false,
      createdAt: DateTime.now(),
      lastLoginAt: null,
      roles: roleIds
          .map((id) => MemberRoleAssignment(
                id: id,
                name: 'Role $id',
                isSystem: false,
                locationIds: locationIds,
              ))
          .toList(),
      locationIds: locationIds ?? [],
    );

    _mockMembers.insert(0, newMember);
    return newMember;
  }

  /// Resend invitation to a pending member.
  Future<void> resendInvite(String memberId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock: just verify member exists and is pending
    final member = _mockMembers.where((m) => m.id == memberId).firstOrNull;
    if (member == null) {
      throw Exception('Member not found: $memberId');
    }
    if (member.hasAcceptedInvite) {
      throw Exception('Member has already accepted invite');
    }
  }

  /// Delete a member.
  Future<void> deleteMember(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _mockMembers.indexWhere((m) => m.id == id);
    if (index == -1) {
      throw Exception('Member not found: $id');
    }

    _mockMembers.removeAt(index);
  }
}
