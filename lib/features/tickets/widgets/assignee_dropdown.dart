import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../data/task_client.dart';
import '../data/task_models.dart';

/// Represents the selected assignee (member or role)
class AssignmentSelection {
  final String? memberId;
  final String? roleId;
  final String displayName;
  final bool isRole;

  const AssignmentSelection({
    this.memberId,
    this.roleId,
    required this.displayName,
    required this.isRole,
  });

  static AssignmentSelection member(AssignableMember m) => AssignmentSelection(
        memberId: m.id,
        displayName: m.fullName,
        isRole: false,
      );

  static AssignmentSelection role(AssignableRole r) => AssignmentSelection(
        roleId: r.id,
        displayName: r.name,
        isRole: true,
      );
}

class AssigneeDropdown extends StatefulWidget {
  final String? locationId;
  final AssignmentSelection? value;
  final ValueChanged<AssignmentSelection?> onChanged;

  const AssigneeDropdown({
    super.key,
    this.locationId,
    this.value,
    required this.onChanged,
  });

  @override
  State<AssigneeDropdown> createState() => _AssigneeDropdownState();
}

class _AssigneeDropdownState extends State<AssigneeDropdown> {
  final _client = getIt<TaskClient>();
  final _searchController = TextEditingController();

  List<AssignableMember> _members = [];
  List<AssignableRole> _roles = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void didUpdateWidget(AssigneeDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.locationId != widget.locationId) {
      _loadData();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final results = await Future.wait([
        _client.getAssignableMembers(locationId: widget.locationId),
        _client.getAssignableRoles(locationId: widget.locationId),
      ]);

      if (mounted) {
        setState(() {
          _members = results[0] as List<AssignableMember>;
          _roles = results[1] as List<AssignableRole>;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        expand: false,
        builder: (context, scrollController) => _AssigneePicker(
          scrollController: scrollController,
          members: _members,
          roles: _roles,
          selectedValue: widget.value,
          onSelected: (selection) {
            Navigator.pop(context);
            widget.onChanged(selection);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isLoading) {
      return const LinearProgressIndicator();
    }

    if (_error != null) {
      return Text(
        'Failed to load assignees',
        style: TextStyle(color: theme.colorScheme.error),
      );
    }

    return InkWell(
      onTap: _showPicker,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(Spacing.md),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              widget.value?.isRole == true
                  ? Icons.group_outlined
                  : Icons.person_outlined,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: Text(
                widget.value?.displayName ?? 'Unassigned',
                style: TextStyle(
                  color: widget.value != null
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _AssigneePicker extends StatefulWidget {
  final ScrollController scrollController;
  final List<AssignableMember> members;
  final List<AssignableRole> roles;
  final AssignmentSelection? selectedValue;
  final ValueChanged<AssignmentSelection?> onSelected;

  const _AssigneePicker({
    required this.scrollController,
    required this.members,
    required this.roles,
    this.selectedValue,
    required this.onSelected,
  });

  @override
  State<_AssigneePicker> createState() => _AssigneePickerState();
}

class _AssigneePickerState extends State<_AssigneePicker> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<AssignableMember> get _filteredMembers {
    if (_searchQuery.isEmpty) return widget.members;
    final query = _searchQuery.toLowerCase();
    return widget.members.where((m) {
      return m.fullName.toLowerCase().contains(query) ||
          m.email.toLowerCase().contains(query);
    }).toList();
  }

  List<AssignableRole> get _filteredRoles {
    if (_searchQuery.isEmpty) return widget.roles;
    final query = _searchQuery.toLowerCase();
    return widget.roles.where((r) {
      return r.name.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.md),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border(bottom: BorderSide(color: theme.dividerColor)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    'Assign To',
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: Spacing.sm),
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search members or roles...',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() => _searchQuery = value);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            controller: widget.scrollController,
            padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
            children: [
              ListTile(
                leading: const Icon(Icons.person_off_outlined),
                title: const Text('Unassigned'),
                selected: widget.selectedValue == null,
                onTap: () => widget.onSelected(null),
              ),
              if (_filteredRoles.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    Spacing.md,
                    Spacing.md,
                    Spacing.md,
                    Spacing.xs,
                  ),
                  child: Text(
                    'ROLES',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ..._filteredRoles.map((role) => ListTile(
                      leading: const Icon(Icons.group_outlined),
                      title: Text(role.name),
                      subtitle: Text('${role.memberCount} members'),
                      selected: widget.selectedValue?.roleId == role.id,
                      onTap: () => widget.onSelected(
                        AssignmentSelection.role(role),
                      ),
                    )),
              ],
              if (_filteredMembers.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    Spacing.md,
                    Spacing.md,
                    Spacing.md,
                    Spacing.xs,
                  ),
                  child: Text(
                    'MEMBERS',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ..._filteredMembers.map((member) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: member.avatarUrl != null
                            ? NetworkImage(member.avatarUrl!)
                            : null,
                        child: member.avatarUrl == null
                            ? Text(member.firstName[0].toUpperCase())
                            : null,
                      ),
                      title: Text(member.fullName),
                      subtitle: Text(member.email),
                      selected: widget.selectedValue?.memberId == member.id,
                      onTap: () => widget.onSelected(
                        AssignmentSelection.member(member),
                      ),
                    )),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
