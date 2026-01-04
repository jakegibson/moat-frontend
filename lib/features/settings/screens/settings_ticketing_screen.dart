import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/ticketing_models.dart';
import '../state/ticketing_state.dart';

/// Settings: Ticketing configuration screen.
///
/// Manages assignment rules for automatic ticket routing.
class SettingsTicketingScreen extends StatefulWidget {
  const SettingsTicketingScreen({super.key});

  @override
  State<SettingsTicketingScreen> createState() =>
      _SettingsTicketingScreenState();
}

class _SettingsTicketingScreenState extends State<SettingsTicketingScreen> {
  late final TicketingState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<TicketingState>();
    _state.fetchRules();
  }

  void _onSort(String field) {
    _state.setSort(field);
  }

  Future<void> _showRuleDialog({AssignmentRule? rule}) async {
    final result = await showDialog<AssignmentRule>(
      context: context,
      builder: (context) => _RuleDialog(
        rule: rule,
        taskTypes: _state.taskTypes.value,
      ),
    );

    if (result == null || !mounted) return;

    if (rule == null) {
      // Create new rule
      final createResult = await _state.createRule(
        name: result.name,
        description: result.description,
        priority: result.priority,
        conditions: result.conditions,
        assignmentType: result.assignmentType,
        assignmentMethod: result.assignmentMethod,
      );

      if (!mounted) return;
      createResult.when(
        ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rule created')),
        ),
        error: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed: ${e.message}'),
            backgroundColor: SemanticColors.error,
          ),
        ),
      );
    } else {
      // Update existing rule
      final updateResult = await _state.updateRule(result);

      if (!mounted) return;
      updateResult.when(
        ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rule updated')),
        ),
        error: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed: ${e.message}'),
            backgroundColor: SemanticColors.error,
          ),
        ),
      );
    }
  }

  Future<void> _toggleActive(AssignmentRule rule) async {
    final result = await _state.toggleRuleActive(rule.id);

    if (!mounted) return;
    result.when(
      ok: (_) {},
      error: (e) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed: ${e.message}'),
          backgroundColor: SemanticColors.error,
        ),
      ),
    );
  }

  Future<void> _deleteRule(AssignmentRule rule) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Rule'),
        content: Text('Delete "${rule.name}"? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: SemanticColors.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final result = await _state.deleteRule(rule.id);

    if (!mounted) return;
    result.when(
      ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rule deleted')),
      ),
      error: (e) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed: ${e.message}'),
          backgroundColor: SemanticColors.error,
        ),
      ),
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
            title: 'Assignment Rules',
            subtitle:
                'Configure automatic assignment rules for tickets based on task type and location.',
            actions: [
              AppButton(
                label: 'Add Rule',
                onPressed: () => _showRuleDialog(),
                isFullWidth: false,
                icon: const Icon(Icons.add, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoading.value && _state.rules.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.error.value != null && _state.rules.value.isEmpty) {
                return _buildErrorView();
              }

              if (_state.rules.value.isEmpty) {
                return _buildEmptyState();
              }

              return _buildRulesTable();
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
          Text('Failed to load rules', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            _state.error.value?.message ?? 'Unknown error',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Retry',
            onPressed: () => _state.fetchRules(refresh: true),
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
          Icon(
            Icons.rule_outlined,
            size: 64,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          Text('No assignment rules yet', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            'Create rules to automatically assign tickets to team members.',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Create First Rule',
            onPressed: () => _showRuleDialog(),
            isFullWidth: false,
            icon: const Icon(Icons.add, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildRulesTable() {
    return Watch((context) {
      final rules = _state.sortedRules.value;
      final sortField = _state.sortField.value;
      final sortAsc = _state.sortAscending.value;

      return Container(
        decoration: BoxDecoration(
          color: SemanticColors.bgCard,
          border: Border.all(color: SemanticColors.border),
          borderRadius: BorderRadius.circular(SemanticRadius.card),
        ),
        child: Column(
          children: [
            // Table header
            _buildTableHeader(sortField, sortAsc),
            const Divider(height: 1),
            // Table body
            Expanded(
              child: ListView.separated(
                itemCount: rules.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return _buildRuleRow(rules[index]);
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTableHeader(String sortField, bool sortAsc) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SemanticSpacing.cardPadding,
        vertical: SemanticSpacing.relaxed,
      ),
      color: SemanticColors.bgSecondary,
      child: Row(
        children: [
          _buildSortableHeader('Rule Name', 'name', sortField, sortAsc, flex: 2),
          _buildSortableHeader('Priority', 'priority', sortField, sortAsc, flex: 1),
          const Expanded(flex: 2, child: Text('Task Types', style: TextStyle(fontWeight: FontWeight.w600))),
          const Expanded(flex: 1, child: Text('Assigned To', style: TextStyle(fontWeight: FontWeight.w600))),
          _buildSortableHeader('Status', 'isActive', sortField, sortAsc, flex: 1),
          const SizedBox(width: 100, child: Text('Actions', style: TextStyle(fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  Widget _buildSortableHeader(
    String label,
    String field,
    String currentField,
    bool ascending, {
    required int flex,
  }) {
    final isActive = currentField == field;
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: () => _onSort(field),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isActive ? SemanticColors.info : null,
              ),
            ),
            if (isActive)
              Icon(
                ascending ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: SemanticColors.info,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRuleRow(AssignmentRule rule) {
    return InkWell(
      onTap: () => _showRuleDialog(rule: rule),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SemanticSpacing.cardPadding,
          vertical: SemanticSpacing.relaxed,
        ),
        child: Row(
          children: [
            // Name & description
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rule.name,
                    style: Semantic.formLabel,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (rule.description != null)
                    Text(
                      rule.description!,
                      style: Semantic.caption,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),

            // Priority
            Expanded(
              flex: 1,
              child: Text(
                rule.priority.toString(),
                style: Semantic.body,
              ),
            ),

            // Task types
            Expanded(
              flex: 2,
              child: Text(
                rule.conditions.taskTypes?.join(', ') ?? 'All',
                style: Semantic.body,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Assigned to (roles)
            Expanded(
              flex: 1,
              child: Text(
                rule.conditions.roleNames?.join(', ') ?? 'Any',
                style: Semantic.body,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Status
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => _toggleActive(rule),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: rule.isActive
                        ? SemanticColors.success.withValues(alpha: 0.1)
                        : SemanticColors.textSecondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    rule.isActive ? 'Active' : 'Inactive',
                    style: Semantic.badge.copyWith(
                      color: rule.isActive
                          ? SemanticColors.success
                          : SemanticColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),

            // Actions
            SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, size: 18),
                    onPressed: () => _showRuleDialog(rule: rule),
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 18,
                      color: SemanticColors.error,
                    ),
                    onPressed: () => _deleteRule(rule),
                    tooltip: 'Delete',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Rule Dialog
// =============================================================================

class _RuleDialog extends StatefulWidget {
  final AssignmentRule? rule;
  final List<String> taskTypes;

  const _RuleDialog({
    this.rule,
    required this.taskTypes,
  });

  @override
  State<_RuleDialog> createState() => _RuleDialogState();
}

class _RuleDialogState extends State<_RuleDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  late final TextEditingController _priorityController;

  late List<String> _selectedTaskTypes;
  late List<String> _selectedRoles;
  late AssignmentType _assignmentType;
  late AssignmentMethod _assignmentMethod;

  final _formKey = GlobalKey<FormState>();

  // Available roles (would come from RolesState in real app)
  static const _availableRoles = [
    'Admin',
    'Location Manager',
    'Technician',
    'Warranty Specialist',
    'Viewer',
  ];

  @override
  void initState() {
    super.initState();
    final rule = widget.rule;

    _nameController = TextEditingController(text: rule?.name ?? '');
    _descController = TextEditingController(text: rule?.description ?? '');
    _priorityController = TextEditingController(
      text: (rule?.priority ?? 100).toString(),
    );

    _selectedTaskTypes = List.from(rule?.conditions.taskTypes ?? []);
    _selectedRoles = List.from(rule?.conditions.roleNames ?? []);
    _assignmentType = rule?.assignmentType ?? AssignmentType.role;
    _assignmentMethod = rule?.assignmentMethod ?? AssignmentMethod.leastLoaded;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priorityController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final conditions = AssignmentConditions(
      taskTypes: _selectedTaskTypes.isEmpty ? null : _selectedTaskTypes,
      roleNames: _selectedRoles.isEmpty ? null : _selectedRoles,
    );

    final result = AssignmentRule(
      id: widget.rule?.id ?? '',
      companyId: widget.rule?.companyId ?? 'company-001',
      name: _nameController.text.trim(),
      description: _descController.text.trim().isEmpty
          ? null
          : _descController.text.trim(),
      isActive: widget.rule?.isActive ?? true,
      priority: int.tryParse(_priorityController.text) ?? 100,
      conditions: conditions,
      assignmentType: _assignmentType,
      assignmentMethod: _assignmentMethod,
      createdAt: widget.rule?.createdAt,
    );

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.rule != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Rule' : 'Create Rule'),
      content: SizedBox(
        width: 500,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Rule Name *',
                    hintText: 'e.g., Maintenance to Technicians',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: SemanticSpacing.section),

                // Description
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Optional description',
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: SemanticSpacing.section),

                // Priority
                TextFormField(
                  controller: _priorityController,
                  decoration: const InputDecoration(
                    labelText: 'Priority *',
                    hintText: 'Lower number = higher priority',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Priority is required';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Must be a number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: SemanticSpacing.section),

                // Task Types
                Text('Task Types', style: Semantic.formLabel),
                const SizedBox(height: SemanticSpacing.tight),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.taskTypes.map((type) {
                    final isSelected = _selectedTaskTypes.contains(type);
                    return FilterChip(
                      label: Text(type),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedTaskTypes.add(type);
                          } else {
                            _selectedTaskTypes.remove(type);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                if (_selectedTaskTypes.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'All task types (none selected)',
                      style: Semantic.caption,
                    ),
                  ),
                const SizedBox(height: SemanticSpacing.section),

                // Assignment Type
                Text('Assignment Type', style: Semantic.formLabel),
                const SizedBox(height: SemanticSpacing.tight),
                SegmentedButton<AssignmentType>(
                  segments: AssignmentType.values
                      .map((t) => ButtonSegment(
                            value: t,
                            label: Text(t.displayName),
                          ))
                      .toList(),
                  selected: {_assignmentType},
                  onSelectionChanged: (value) {
                    setState(() => _assignmentType = value.first);
                  },
                ),
                const SizedBox(height: SemanticSpacing.section),

                // Roles
                Text('Assign To Roles', style: Semantic.formLabel),
                const SizedBox(height: SemanticSpacing.tight),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _availableRoles.map((role) {
                    final isSelected = _selectedRoles.contains(role);
                    return FilterChip(
                      label: Text(role),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedRoles.add(role);
                          } else {
                            _selectedRoles.remove(role);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                if (_selectedRoles.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Any role (none selected)',
                      style: Semantic.caption,
                    ),
                  ),
                const SizedBox(height: SemanticSpacing.section),

                // Assignment Method
                Text('Assignment Method', style: Semantic.formLabel),
                const SizedBox(height: SemanticSpacing.tight),
                ...AssignmentMethod.values.map((method) {
                  return ListTile(
                    leading: Radio<AssignmentMethod>(
                      value: method,
                      groupValue: _assignmentMethod,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _assignmentMethod = value);
                        }
                      },
                    ),
                    title: Text(method.displayName),
                    subtitle: Text(method.description),
                    contentPadding: EdgeInsets.zero,
                    onTap: () => setState(() => _assignmentMethod = method),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(isEditing ? 'Save' : 'Create'),
        ),
      ],
    );
  }
}
