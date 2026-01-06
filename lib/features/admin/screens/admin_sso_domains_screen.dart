import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/admin_client.dart' show SSODomain;
import '../state/admin_state.dart';

/// Admin: SSO Domains configuration screen.
class AdminSSODomainsScreen extends StatefulWidget {
  const AdminSSODomainsScreen({super.key});

  @override
  State<AdminSSODomainsScreen> createState() => _AdminSSODomainsScreenState();
}

class _AdminSSODomainsScreenState extends State<AdminSSODomainsScreen> {
  late final AdminState _state;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchSSODomains();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SSODomain> _filterDomains(List<SSODomain> domains) {
    if (_searchQuery.isEmpty) return domains;
    final query = _searchQuery.toLowerCase();
    return domains.where((d) {
      return d.domain.toLowerCase().contains(query) ||
          d.companyName.toLowerCase().contains(query);
    }).toList();
  }

  Future<void> _showDomainDialog({SSODomain? domain}) async {
    final result = await showDialog<_SSODomainFormData>(
      context: context,
      builder: (context) => _SSODomainDialog(domain: domain),
    );

    if (result == null || !mounted) return;

    if (domain == null) {
      final createResult = await _state.createSSODomain(
        domain: result.domain,
        companyId: result.companyId,
        allowedAuthProviders: result.allowedAuthProviders,
        autoJoinEnabled: result.autoJoinEnabled,
      );

      if (!mounted) return;
      createResult.when(
        ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Domain added')),
        ),
        error: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed: ${e.message}'),
            backgroundColor: SemanticColors.error,
          ),
        ),
      );
    } else {
      final updateResult = await _state.updateSSODomain(
        domainId: domain.id,
        domain: result.domain,
        allowedAuthProviders: result.allowedAuthProviders,
        autoJoinEnabled: result.autoJoinEnabled,
      );

      if (!mounted) return;
      updateResult.when(
        ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Domain updated')),
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

  Future<void> _deleteDomain(SSODomain domain) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete SSO Domain'),
        content: Text('Delete "${domain.domain}"? This cannot be undone.'),
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

    final result = await _state.deleteSSODomain(domain.id);

    if (!mounted) return;
    result.when(
      ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Domain deleted')),
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
            title: 'SSO Domains',
            subtitle: 'Configure Single Sign-On domains for your organization.',
            actions: [
              AppButton(
                label: 'Add Domain',
                onPressed: () => _showDomainDialog(),
                isFullWidth: false,
                icon: const Icon(Icons.add, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          // Search bar
          SizedBox(
            width: 320,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by domain...',
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                isDense: true,
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          const SizedBox(height: SemanticSpacing.normal),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingSSO.value && _state.ssoDomains.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.ssoDomains.value.isEmpty) {
                return _buildEmptyState();
              }

              return _buildDomainsList();
            }),
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
          Text('No SSO domains configured', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            'Add a domain to enable Single Sign-On for your users.',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Add First Domain',
            onPressed: () => _showDomainDialog(),
            isFullWidth: false,
            icon: const Icon(Icons.add, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildDomainsList() {
    return Watch((context) {
      final allDomains = _state.ssoDomains.value;
      final domains = _filterDomains(allDomains);

      if (domains.isEmpty && _searchQuery.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 48, color: AppColors.textTertiary),
              const SizedBox(height: SemanticSpacing.normal),
              Text('No domains match "$_searchQuery"',
                  style: Semantic.cardTitle),
              const SizedBox(height: SemanticSpacing.tight),
              TextButton(
                onPressed: () {
                  _searchController.clear();
                  setState(() => _searchQuery = '');
                },
                child: const Text('Clear search'),
              ),
            ],
          ),
        );
      }

      return ListView.separated(
        itemCount: domains.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: SemanticSpacing.normal),
        itemBuilder: (context, index) {
          final domain = domains[index];
          return _SSODomainCard(
            domain: domain,
            onEdit: () => _showDomainDialog(domain: domain),
            onDelete: () => _deleteDomain(domain),
          );
        },
      );
    });
  }
}

class _SSODomainCard extends StatelessWidget {
  final SSODomain domain;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _SSODomainCard({
    required this.domain,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(SemanticSpacing.tight),
            decoration: BoxDecoration(
              color: SemanticColors.infoBg,
              borderRadius: BorderRadius.circular(SemanticRadius.normal),
            ),
            child: Icon(Icons.domain, color: SemanticColors.info),
          ),
          const SizedBox(width: SemanticSpacing.normal),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(domain.domain, style: Semantic.formLabel),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    Text(
                      domain.companyName.isNotEmpty
                          ? domain.companyName
                          : domain.companyId,
                      style: Semantic.caption,
                    ),
                    const SizedBox(width: SemanticSpacing.normal),
                    _StatusBadge(
                      label: domain.autoJoinEnabled ? 'Auto-join' : 'Manual',
                      isPositive: domain.autoJoinEnabled,
                    ),
                    const SizedBox(width: SemanticSpacing.tight),
                    if (domain.allowedAuthProviders.isNotEmpty)
                      Text(
                        domain.allowedAuthProviders.join(', '),
                        style: Semantic.caption,
                      ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, size: 18),
            onPressed: onEdit,
            tooltip: 'Edit',
          ),
          IconButton(
            icon: Icon(Icons.delete, size: 18, color: SemanticColors.error),
            onPressed: onDelete,
            tooltip: 'Delete',
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final bool isPositive;

  const _StatusBadge({
    required this.label,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        isPositive ? SemanticColors.success : SemanticColors.textSecondary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: Semantic.badge.copyWith(color: color),
      ),
    );
  }
}

class _SSODomainFormData {
  final String domain;
  final String companyId;
  final List<String> allowedAuthProviders;
  final bool autoJoinEnabled;

  _SSODomainFormData({
    required this.domain,
    required this.companyId,
    required this.allowedAuthProviders,
    required this.autoJoinEnabled,
  });
}

class _SSODomainDialog extends StatefulWidget {
  final SSODomain? domain;

  const _SSODomainDialog({this.domain});

  @override
  State<_SSODomainDialog> createState() => _SSODomainDialogState();
}

class _SSODomainDialogState extends State<_SSODomainDialog> {
  late TextEditingController _domainController;
  late TextEditingController _companyIdController;
  late bool _autoJoinEnabled;
  late List<String> _selectedProviders;
  final _formKey = GlobalKey<FormState>();

  static const _availableProviders = ['google.com', 'microsoft.com', 'saml'];

  @override
  void initState() {
    super.initState();
    _domainController =
        TextEditingController(text: widget.domain?.domain ?? '');
    _companyIdController =
        TextEditingController(text: widget.domain?.companyId ?? '');
    _autoJoinEnabled = widget.domain?.autoJoinEnabled ?? true;
    _selectedProviders = widget.domain?.allowedAuthProviders.toList() ??
        ['google.com'];
  }

  @override
  void dispose() {
    _domainController.dispose();
    _companyIdController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final result = _SSODomainFormData(
      domain: _domainController.text.trim(),
      companyId: _companyIdController.text.trim(),
      allowedAuthProviders: _selectedProviders,
      autoJoinEnabled: _autoJoinEnabled,
    );

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.domain != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit SSO Domain' : 'Add SSO Domain'),
      content: SizedBox(
        width: 400,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _domainController,
                decoration: const InputDecoration(
                  labelText: 'Domain *',
                  hintText: 'example.com',
                ),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,
                enabled: !isEditing,
              ),
              const SizedBox(height: SemanticSpacing.normal),
              if (!isEditing)
                TextFormField(
                  controller: _companyIdController,
                  decoration: const InputDecoration(
                    labelText: 'Company ID *',
                    hintText: 'company-id',
                  ),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              const SizedBox(height: SemanticSpacing.normal),
              Text('Allowed Auth Providers', style: Semantic.formLabel),
              const SizedBox(height: SemanticSpacing.tight),
              Wrap(
                spacing: 8,
                children: _availableProviders.map((provider) {
                  return FilterChip(
                    label: Text(provider),
                    selected: _selectedProviders.contains(provider),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedProviders.add(provider);
                        } else {
                          _selectedProviders.remove(provider);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: SemanticSpacing.normal),
              SwitchListTile(
                title: const Text('Auto-join Enabled'),
                subtitle: const Text(
                    'Automatically add users with matching email domain'),
                value: _autoJoinEnabled,
                onChanged: (v) => setState(() => _autoJoinEnabled = v),
                contentPadding: EdgeInsets.zero,
              ),
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
          onPressed: _submit,
          child: Text(isEditing ? 'Save' : 'Add'),
        ),
      ],
    );
  }
}
