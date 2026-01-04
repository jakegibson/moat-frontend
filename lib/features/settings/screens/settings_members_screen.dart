import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../common_widgets/profile_avatar.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/members_models.dart';
import '../state/locations_state.dart';
import '../state/members_state.dart';
import '../state/roles_state.dart';

/// Settings: Members management screen.
///
/// Displays a list of company members with search, sort, and invite actions.
class SettingsMembersScreen extends StatefulWidget {
  const SettingsMembersScreen({super.key});

  @override
  State<SettingsMembersScreen> createState() => _SettingsMembersScreenState();
}

class _SettingsMembersScreenState extends State<SettingsMembersScreen> {
  late final MembersState _state;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _state = getIt<MembersState>();
    _state.fetchMembers(refresh: true);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    _state.setSearch(query);
  }

  void _onSort(String field) {
    _state.setSort(field);
  }

  void _onAddMember() {
    context.go('/settings/members/new');
  }

  void _onEditMember(Member member) {
    context.go('/settings/members/${member.id}');
  }

  Future<void> _onResendInvite(Member member) async {
    final result = await _state.resendInvite(member.id);
    if (!mounted) return;

    result.when(
      ok: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invite resent to ${member.email}')),
        );
      },
      error: (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to resend invite: ${e.message}'),
            backgroundColor: SemanticColors.error,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Manage Members',
            subtitle: 'Invite team members, assign roles, and manage access.',
            showSearchBar: true,
            searchWidget: _buildSearchBar(),
            actions: [
              AppButton(
                label: 'Add Member',
                onPressed: _onAddMember,
                isFullWidth: false,
                icon: const Icon(Icons.add, size: 18, color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: Watch((context) {
              if (_state.isLoading.value && _state.members.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.error.value != null && _state.members.value.isEmpty) {
                return _buildErrorView();
              }

              if (_state.members.value.isEmpty) {
                return _buildEmptyState();
              }

              return _buildMembersTable();
            }),
          ),
          Watch((context) {
            if (_state.totalPages.value > 1) {
              return _buildPagination();
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: _searchController,
        onChanged: _onSearch,
        decoration: InputDecoration(
          hintText: 'Search by name or email...',
          hintStyle: Semantic.formPlaceholder,
          prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary),
          filled: true,
          fillColor: SemanticColors.bgSecondary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SemanticRadius.normal),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: SemanticSpacing.normal,
            vertical: SemanticSpacing.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: SemanticColors.error),
          const SizedBox(height: SemanticSpacing.normal),
          Text(
            'Failed to load members',
            style: Semantic.cardTitle,
          ),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            _state.error.value?.message ?? 'Unknown error',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Retry',
            onPressed: () => _state.fetchMembers(refresh: true),
            isFullWidth: false,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 64, color: AppColors.textTertiary),
          const SizedBox(height: SemanticSpacing.section),
          Text('No members found', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            'Invite team members to get started.',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Add Member',
            onPressed: _onAddMember,
            isFullWidth: false,
            icon: const Icon(Icons.add, size: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMembersTable() {
    return Watch((context) {
      final members = _state.members.value;
      final sortBy = _state.sortBy.value;
      final sortAsc = _state.sortAsc.value;

      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: SemanticColors.border),
          borderRadius: BorderRadius.circular(SemanticRadius.card),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SemanticRadius.card),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width - 300,
              ),
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(SemanticColors.bgSecondary),
                headingTextStyle: Semantic.tableHeader,
                dataTextStyle: Semantic.tableCell,
                columns: [
                  DataColumn(
                    label: _buildSortableHeader('Name', 'name', sortBy, sortAsc),
                    onSort: (_, __) => _onSort('name'),
                  ),
                  const DataColumn(label: Text('Role(s)')),
                  DataColumn(
                    label: _buildSortableHeader(
                        'Member Since', 'createdAt', sortBy, sortAsc),
                    onSort: (_, __) => _onSort('createdAt'),
                  ),
                  DataColumn(
                    label: _buildSortableHeader(
                        'Last Login', 'lastLoginAt', sortBy, sortAsc),
                    onSort: (_, __) => _onSort('lastLoginAt'),
                  ),
                  const DataColumn(label: Text('')),
                ],
                rows: members.map((member) => _buildMemberRow(member)).toList(),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildSortableHeader(
      String label, String field, String? currentSort, bool sortAsc) {
    final isActive = currentSort == field;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        const SizedBox(width: 4),
        Icon(
          isActive
              ? (sortAsc ? Icons.arrow_upward : Icons.arrow_downward)
              : Icons.unfold_more,
          size: 16,
          color: isActive ? AppColors.textPrimary : AppColors.textTertiary,
        ),
      ],
    );
  }

  DataRow _buildMemberRow(Member member) {
    return DataRow(
      cells: [
        DataCell(_buildMemberCell(member)),
        DataCell(_buildRolesCell(member)),
        DataCell(_buildDateCell(member.createdAt, member.hasAcceptedInvite)),
        DataCell(_buildLastLoginCell(member)),
        DataCell(_buildActionsCell(member)),
      ],
    );
  }

  Widget _buildMemberCell(Member member) {
    return Row(
      children: [
        ProfileAvatar(name: member.displayName, size: 36),
        const SizedBox(width: SemanticSpacing.relaxed),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.displayName,
                style: Semantic.formLabel,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                member.email,
                style: Semantic.caption,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRolesCell(Member member) {
    if (member.roles.isEmpty) {
      return Text('No roles', style: Semantic.bodySecondary);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: member.roles.map((role) {
        final locationText = role.hasAllLocations
            ? 'All locations'
            : '${role.locationIds?.length ?? 0} location(s)';
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(role.name, style: Semantic.bodySmall),
              const SizedBox(width: 8),
              Text(locationText, style: Semantic.caption),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDateCell(DateTime? date, bool hasAcceptedInvite) {
    if (!hasAcceptedInvite) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: SemanticColors.warningBg,
          borderRadius: BorderRadius.circular(SemanticRadius.small),
        ),
        child: Text(
          'Pending',
          style: Semantic.badge.copyWith(color: SemanticColors.warning),
        ),
      );
    }

    if (date == null) return Text('—', style: Semantic.bodySecondary);
    return Text(_formatDate(date), style: Semantic.bodySmall);
  }

  Widget _buildLastLoginCell(Member member) {
    if (!member.hasAcceptedInvite) {
      return const SizedBox.shrink();
    }
    if (member.lastLoginAt == null) {
      return Text('Never', style: Semantic.bodySecondary);
    }
    return Text(_formatDate(member.lastLoginAt!), style: Semantic.bodySmall);
  }

  Widget _buildActionsCell(Member member) {
    if (!member.hasAcceptedInvite) {
      return TextButton(
        onPressed: () => _onResendInvite(member),
        child: Text('Resend Invite', style: Semantic.link),
      );
    }

    return TextButton(
      onPressed: () => _onEditMember(member),
      child: Text('Edit', style: Semantic.link),
    );
  }

  Widget _buildPagination() {
    return Watch((context) {
      final currentPage = _state.currentPage.value;
      final totalPages = _state.totalPages.value;
      final totalCount = _state.totalCount.value;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: SemanticSpacing.section),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Showing ${_state.members.value.length} of $totalCount members',
              style: Semantic.caption,
            ),
            Row(
              children: [
                IconButton(
                  onPressed:
                      currentPage > 1 ? () => _state.goToPage(currentPage - 1) : null,
                  icon: const Icon(Icons.chevron_left),
                ),
                Text('Page $currentPage of $totalPages', style: Semantic.bodySmall),
                IconButton(
                  onPressed: currentPage < totalPages
                      ? () => _state.goToPage(currentPage + 1)
                      : null,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}

/// Add/Edit member screen.
class AddMemberScreen extends StatefulWidget {
  final String memberId;

  const AddMemberScreen({required this.memberId, super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  late final MembersState _membersState;
  late final RolesState _rolesState;
  late final LocationsState _locationsState;

  Set<String> _selectedRoleIds = {};
  Set<String> _selectedLocationIds = {};
  bool _allLocations = true;
  bool _isSubmitting = false;

  bool get isNew => widget.memberId == 'new';

  @override
  void initState() {
    super.initState();
    _membersState = getIt<MembersState>();
    _rolesState = getIt<RolesState>();
    _locationsState = getIt<LocationsState>();

    // Fetch roles and locations
    if (_rolesState.roles.value.isEmpty) {
      _rolesState.fetchRoles();
    }
    if (_locationsState.locations.value.isEmpty) {
      _locationsState.fetchLocations();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRoleIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select at least one role'),
          backgroundColor: SemanticColors.error,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final result = await _membersState.inviteMember(
      email: _emailController.text.trim(),
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      roleIds: _selectedRoleIds.toList(),
      locationIds: _allLocations ? null : _selectedLocationIds.toList(),
    );

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    result.when(
      ok: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invitation sent to ${_emailController.text}'),
            backgroundColor: SemanticColors.success,
          ),
        );
        context.go('/settings/members');
      },
      error: (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send invitation: ${e.message}'),
            backgroundColor: SemanticColors.error,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              IconButton(
                onPressed: () => context.go('/settings/members'),
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: SemanticSpacing.normal),
              Text(
                isNew ? 'Invite Member' : 'Edit Member',
                style: Semantic.pageTitle,
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.large),

          // Form
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Basic Info Section
                      Text('Basic Information', style: Semantic.sectionTitle),
                      const SizedBox(height: SemanticSpacing.normal),

                      // Email
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address *',
                          hintText: 'member@company.com',
                          hintStyle: Semantic.formPlaceholder,
                          filled: true,
                          fillColor: SemanticColors.bgSecondary,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(SemanticRadius.normal),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email is required';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: SemanticSpacing.normal),

                      // First Name / Last Name row
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                labelText: 'First Name *',
                                hintText: 'John',
                                hintStyle: Semantic.formPlaceholder,
                                filled: true,
                                fillColor: SemanticColors.bgSecondary,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      SemanticRadius.normal),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'First name is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: SemanticSpacing.normal),
                          Expanded(
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Last Name *',
                                hintText: 'Doe',
                                hintStyle: Semantic.formPlaceholder,
                                filled: true,
                                fillColor: SemanticColors.bgSecondary,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      SemanticRadius.normal),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Last name is required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: SemanticSpacing.section),

                      // Roles Section
                      Text('Assign Roles *', style: Semantic.sectionTitle),
                      const SizedBox(height: SemanticSpacing.tight),
                      Text(
                        'Select one or more roles for this member.',
                        style: Semantic.bodySecondary,
                      ),
                      const SizedBox(height: SemanticSpacing.normal),

                      Watch((context) {
                        final roles = _rolesState.roles.value;
                        final isLoading = _rolesState.isLoading.value;

                        if (isLoading && roles.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(SemanticSpacing.normal),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        if (roles.isEmpty) {
                          return Container(
                            padding: const EdgeInsets.all(SemanticSpacing.normal),
                            decoration: BoxDecoration(
                              color: SemanticColors.bgSecondary,
                              borderRadius:
                                  BorderRadius.circular(SemanticRadius.card),
                            ),
                            child: Text(
                              'No roles available. Create roles first.',
                              style: Semantic.bodySecondary,
                            ),
                          );
                        }

                        final assignableRoles =
                            roles.where((r) => r.isAssignable).toList();

                        return Container(
                          padding: const EdgeInsets.all(SemanticSpacing.normal),
                          decoration: BoxDecoration(
                            color: SemanticColors.bgSecondary,
                            borderRadius:
                                BorderRadius.circular(SemanticRadius.card),
                            border: Border.all(color: SemanticColors.border),
                          ),
                          child: Wrap(
                            spacing: SemanticSpacing.tight,
                            runSpacing: SemanticSpacing.tight,
                            children: assignableRoles.map((role) {
                              final isSelected =
                                  _selectedRoleIds.contains(role.id);
                              return FilterChip(
                                label: Text(role.name),
                                selected: isSelected,
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      _selectedRoleIds.add(role.id);
                                    } else {
                                      _selectedRoleIds.remove(role.id);
                                    }
                                  });
                                },
                                selectedColor: SemanticColors.infoBg,
                                checkmarkColor: SemanticColors.primary,
                              );
                            }).toList(),
                          ),
                        );
                      }),

                      const SizedBox(height: SemanticSpacing.section),

                      // Location Access Section
                      Text('Location Access', style: Semantic.sectionTitle),
                      const SizedBox(height: SemanticSpacing.tight),
                      Text(
                        'Specify which locations this member can access.',
                        style: Semantic.bodySecondary,
                      ),
                      const SizedBox(height: SemanticSpacing.normal),

                      // All locations toggle
                      Container(
                        padding: const EdgeInsets.all(SemanticSpacing.normal),
                        decoration: BoxDecoration(
                          color: SemanticColors.bgSecondary,
                          borderRadius:
                              BorderRadius.circular(SemanticRadius.card),
                          border: Border.all(color: SemanticColors.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _allLocations,
                                  onChanged: (value) {
                                    setState(() {
                                      _allLocations = value ?? true;
                                      if (_allLocations) {
                                        _selectedLocationIds.clear();
                                      }
                                    });
                                  },
                                ),
                                const SizedBox(width: SemanticSpacing.tight),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Access to all locations',
                                        style: Semantic.formLabel,
                                      ),
                                      Text(
                                        'Member can access tickets and assets at any location.',
                                        style: Semantic.caption,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Specific locations (when not all)
                            if (!_allLocations) ...[
                              const SizedBox(height: SemanticSpacing.normal),
                              const Divider(),
                              const SizedBox(height: SemanticSpacing.normal),
                              Watch((context) {
                                final locations =
                                    _locationsState.locations.value;
                                final isLoading =
                                    _locationsState.isLoading.value;

                                if (isLoading && locations.isEmpty) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (locations.isEmpty) {
                                  return Text(
                                    'No locations available.',
                                    style: Semantic.bodySecondary,
                                  );
                                }

                                return Wrap(
                                  spacing: SemanticSpacing.tight,
                                  runSpacing: SemanticSpacing.tight,
                                  children: locations.map((location) {
                                    final isSelected = _selectedLocationIds
                                        .contains(location.id);
                                    return FilterChip(
                                      label: Text(location.name),
                                      selected: isSelected,
                                      onSelected: (selected) {
                                        setState(() {
                                          if (selected) {
                                            _selectedLocationIds
                                                .add(location.id);
                                          } else {
                                            _selectedLocationIds
                                                .remove(location.id);
                                          }
                                        });
                                      },
                                      selectedColor: SemanticColors.infoBg,
                                      checkmarkColor: SemanticColors.primary,
                                    );
                                  }).toList(),
                                );
                              }),
                            ],
                          ],
                        ),
                      ),

                      const SizedBox(height: SemanticSpacing.section),

                      // Submit buttons
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: _isSubmitting
                                ? null
                                : () => context.go('/settings/members'),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: SemanticSpacing.normal),
                          AppButton(
                            label: isNew ? 'Send Invitation' : 'Save Changes',
                            onPressed: _isSubmitting ? null : _onSubmit,
                            isFullWidth: false,
                            isLoading: _isSubmitting,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
