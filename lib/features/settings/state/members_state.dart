import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/members_client.dart';
import '../data/members_models.dart';

/// State management for members list and operations.
///
/// Uses Signals for reactive state updates.
@lazySingleton
class MembersState {
  final MembersClient _client;

  MembersState(this._client);

  // ==========================================================================
  // Core State
  // ==========================================================================

  final members = signal<List<Member>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);

  // ==========================================================================
  // Pagination
  // ==========================================================================

  final totalCount = signal(0);
  final currentOffset = signal(0);
  final hasMore = signal(true);
  static const pageSize = 20;

  // ==========================================================================
  // Filters & Sorting
  // ==========================================================================

  final searchQuery = signal('');
  final includePending = signal(true);
  final sortBy = signal<String?>('name');
  final sortAsc = signal(true);

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  late final memberCount = computed(() => members.value.length);
  late final activeMembers =
      computed(() => members.value.where((m) => m.hasAcceptedInvite).toList());
  late final pendingMembers =
      computed(() => members.value.where((m) => !m.hasAcceptedInvite).toList());
  late final currentPage = computed(() => (currentOffset.value ~/ pageSize) + 1);
  late final totalPages = computed(() => (totalCount.value / pageSize).ceil());

  // ==========================================================================
  // Operations
  // ==========================================================================

  /// Fetch members with current filters. Set refresh=true to reset pagination.
  Future<void> fetchMembers({bool refresh = false}) async {
    if (refresh) {
      currentOffset.value = 0;
    }

    isLoading.value = true;
    error.value = null;

    final result = await _client
        .listMembers(
          limit: pageSize,
          offset: currentOffset.value,
          search: searchQuery.value.isEmpty ? null : searchQuery.value,
          includePending: includePending.value,
          sortBy: sortBy.value,
          sortAsc: sortAsc.value,
        )
        .toResult();

    result.when(
      ok: (paginated) {
        batch(() {
          if (refresh || currentOffset.value == 0) {
            members.value = paginated.items;
          } else {
            members.value = [...members.value, ...paginated.items];
          }
          totalCount.value = paginated.total;
          hasMore.value = paginated.hasMore;
        });
      },
      error: (e) => error.value = e,
    );

    isLoading.value = false;
  }

  /// Load next page of members.
  Future<void> loadMore() async {
    if (!hasMore.value || isLoading.value) return;
    currentOffset.value = currentOffset.value + pageSize;
    await fetchMembers();
  }

  /// Go to a specific page.
  Future<void> goToPage(int page) async {
    final newOffset = (page - 1) * pageSize;
    if (newOffset == currentOffset.value) return;
    currentOffset.value = newOffset;
    await fetchMembers(refresh: true);
  }

  /// Update search query and refresh.
  void setSearch(String query) {
    if (query == searchQuery.value) return;
    searchQuery.value = query;
    fetchMembers(refresh: true);
  }

  /// Toggle sort direction or change sort field.
  void setSort(String field) {
    if (sortBy.value == field) {
      sortAsc.value = !sortAsc.value;
    } else {
      sortBy.value = field;
      sortAsc.value = true;
    }
    fetchMembers(refresh: true);
  }

  /// Toggle include pending filter.
  void toggleIncludePending() {
    includePending.value = !includePending.value;
    fetchMembers(refresh: true);
  }

  /// Invite a new member.
  Future<Result<Member>> inviteMember({
    required String email,
    required String firstName,
    required String lastName,
    required List<String> roleIds,
    List<String>? locationIds,
  }) async {
    final result = await _client
        .inviteMember(
          email: email,
          firstName: firstName,
          lastName: lastName,
          roleIds: roleIds,
          locationIds: locationIds,
        )
        .toResult();

    result.when(
      ok: (member) {
        // Add to beginning of list
        members.value = [member, ...members.value];
        totalCount.value = totalCount.value + 1;
      },
      error: (e) => error.value = e,
    );

    return result;
  }

  /// Resend invite to a pending member.
  Future<Result<void>> resendInvite(String memberId) async {
    return await _client.resendInvite(memberId).toResult();
  }

  /// Delete a member.
  Future<Result<void>> deleteMember(String memberId) async {
    final result = await _client.deleteMember(memberId).toResult();

    result.when(
      ok: (_) {
        members.value = members.value.where((m) => m.id != memberId).toList();
        totalCount.value = totalCount.value - 1;
      },
      error: (e) => error.value = e,
    );

    return result;
  }
}
