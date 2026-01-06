import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/roles_models.dart';
import '../state/roles_state.dart';

/// Settings: Roles management screen.
///
/// Displays a list of company roles with their permissions.
class SettingsRolesScreen extends StatefulWidget {
  const SettingsRolesScreen({super.key});

  @override
  State<SettingsRolesScreen> createState() => _SettingsRolesScreenState();
}

class _SettingsRolesScreenState extends State<SettingsRolesScreen> {
  late final RolesState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<RolesState>();
    _state.fetchRoles();
  }

  void _onAddRole() {
    _showRoleDialog(null);
  }

  void _onEditRole(RoleDetail role) {
    if (role.isSystem) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('System roles cannot be edited')),
      );
      return;
    }
    _showRoleDialog(role);
  }

  Future<void> _onDeleteRole(RoleDetail role) async {
    if (role.isSystem) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('System roles cannot be deleted')),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Role'),
        content: Text('Are you sure you want to delete "${role.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: SemanticColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final result = await _state.deleteRole(role.id);
    if (!mounted) return;

    result.when(
      ok: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${role.name} deleted')),
        );
      },
      error: (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete: ${e.message}'),
            backgroundColor: SemanticColors.error,
          ),
        );
      },
    );
  }

  void _showRoleDialog(RoleDetail? role) {
    final isEditing = role != null;
    final nameController = TextEditingController(text: role?.name ?? '');
    final descController =
        TextEditingController(text: role?.description ?? '');
    final selectedPerms =
        Set<String>.from(role?.permissions.map((p) => p.id) ?? []);

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(isEditing ? 'Edit Role' : 'Create Role'),
          content: SizedBox(
            width: 500,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name *',
                      hintText: 'e.g., Project Manager',
                    ),
                    autofocus: true,
                  ),
                  const SizedBox(height: SemanticSpacing.formGap),
                  TextField(
                    controller: descController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Brief description of this role',
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: SemanticSpacing.section),
                  Text('Permissions', style: Semantic.subtitle),
                  const SizedBox(height: SemanticSpacing.normal),
                  Watch((context) {
                    final permsByResource = _state.permissionsByResource.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: permsByResource.entries.map((entry) {
                        return _buildPermissionGroup(
                          entry.key,
                          entry.value,
                          selectedPerms,
                          (permId, selected) {
                            setDialogState(() {
                              if (selected) {
                                selectedPerms.add(permId);
                              } else {
                                selectedPerms.remove(permId);
                              }
                            });
                          },
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Name is required')),
                  );
                  return;
                }

                Navigator.pop(context);

                if (isEditing) {
                  await _state.updateRole(
                    roleId: role.id,
                    name: name,
                    description: descController.text.trim(),
                    permissionIds: selectedPerms.toList(),
                  );
                } else {
                  await _state.createRole(
                    name: name,
                    description: descController.text.trim(),
                    permissionIds: selectedPerms.toList(),
                  );
                }
              },
              child: Text(isEditing ? 'Save' : 'Create'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionGroup(
    String resource,
    List<Permission> permissions,
    Set<String> selectedPerms,
    void Function(String permId, bool selected) onToggle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _capitalize(resource),
          style: Semantic.formLabel,
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: permissions.map((perm) {
            final isSelected = selectedPerms.contains(perm.id);
            return FilterChip(
              label: Text(_capitalize(perm.action)),
              selected: isSelected,
              onSelected: (selected) => onToggle(perm.id, selected),
              selectedColor: SemanticColors.successBg,
              checkmarkColor: SemanticColors.success,
            );
          }).toList(),
        ),
        const SizedBox(height: SemanticSpacing.relaxed),
      ],
    );
  }

  static String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1).replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Manage Roles',
            subtitle: 'Create roles and assign permissions.',
            actions: [
              AppButton(
                label: 'Create Role',
                onPressed: _onAddRole,
                isFullWidth: false,
                icon: const Icon(Icons.add, size: 18, color: AppColors.white),
              ),
            ],
          ),
          Expanded(
            child: Watch((context) {
              if (_state.isLoading.value && _state.roles.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.error.value != null && _state.roles.value.isEmpty) {
                return _buildErrorView();
              }

              if (_state.roles.value.isEmpty) {
                return _buildEmptyState();
              }

              return _buildRolesList();
            }),
          ),
        ],
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
          Text('Failed to load roles', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            _state.error.value?.message ?? 'Unknown error',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Retry',
            onPressed: () => _state.fetchRoles(),
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
          Icon(Icons.security, size: 64, color: AppColors.textTertiary),
          const SizedBox(height: SemanticSpacing.section),
          Text('No roles', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            'Create roles to manage access permissions.',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Create Role',
            onPressed: _onAddRole,
            isFullWidth: false,
            icon: const Icon(Icons.add, size: 18, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildRolesList() {
    return Watch((context) {
      final roles = _state.roles.value;

      return ListView.builder(
        itemCount: roles.length,
        itemBuilder: (context, index) {
          final role = roles[index];
          return _buildRoleCard(role);
        },
      );
    });
  }

  Widget _buildRoleCard(RoleDetail role) {
    return Container(
      margin: const EdgeInsets.only(bottom: SemanticSpacing.relaxed),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: ExpansionTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: role.isSystem
                ? SemanticColors.infoBg
                : SemanticColors.bgSecondary,
            borderRadius: BorderRadius.circular(SemanticRadius.normal),
          ),
          child: Icon(
            role.isSystem ? Icons.verified_user : Icons.shield_outlined,
            color:
                role.isSystem ? SemanticColors.info : AppColors.textSecondary,
          ),
        ),
        title: Row(
          children: [
            Text(role.name, style: Semantic.formLabel),
            if (role.isSystem) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: SemanticColors.infoBg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'System',
                  style: Semantic.badge.copyWith(color: SemanticColors.info),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(
          role.description ?? '${role.permissionCount} permissions',
          style: Semantic.caption,
        ),
        trailing: role.isSystem
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => _onEditRole(role),
                    icon: const Icon(Icons.edit_outlined),
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    onPressed: () => _onDeleteRole(role),
                    icon: const Icon(Icons.delete_outline),
                    color: SemanticColors.error,
                    tooltip: 'Delete',
                  ),
                ],
              ),
        children: [
          Padding(
            padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Permissions:', style: Semantic.formLabel),
                const SizedBox(height: SemanticSpacing.normal),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: role.permissions.map((perm) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: SemanticColors.successBg,
                        borderRadius:
                            BorderRadius.circular(SemanticRadius.small),
                      ),
                      child: Text(
                        perm.displayLabel,
                        style:
                            Semantic.badge.copyWith(color: SemanticColors.success),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
