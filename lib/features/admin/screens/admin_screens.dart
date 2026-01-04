import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/admin_models.dart';
import '../state/admin_state.dart';

// =============================================================================
// Admin Overview Screen
// =============================================================================

/// Admin: Overview dashboard with system stats and quick actions.
class AdminOverviewScreen extends StatefulWidget {
  const AdminOverviewScreen({super.key});

  @override
  State<AdminOverviewScreen> createState() => _AdminOverviewScreenState();
}

class _AdminOverviewScreenState extends State<AdminOverviewScreen> {
  late final AdminState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.wait([
      _state.fetchSystemMetrics(),
      _state.fetchGapItems(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Admin Overview',
            subtitle: 'System health, metrics, and administrative actions.',
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingMetrics.value &&
                  _state.systemMetrics.value == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMetricsGrid(),
                    const SizedBox(height: SemanticSpacing.section),
                    _buildGapsSummary(),
                    const SizedBox(height: SemanticSpacing.section),
                    _buildQuickActions(),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid() {
    return Watch((context) {
      final metrics = _state.systemMetrics.value;
      if (metrics == null) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('System Metrics', style: Semantic.sectionTitle),
          const SizedBox(height: SemanticSpacing.normal),
          Wrap(
            spacing: SemanticSpacing.normal,
            runSpacing: SemanticSpacing.normal,
            children: [
              _MetricCard(
                icon: Icons.people_outline,
                label: 'Total Users',
                value: metrics.totalUsers.toString(),
                subtitle: '${metrics.activeUsers} active',
                color: SemanticColors.info,
              ),
              _MetricCard(
                icon: Icons.confirmation_number_outlined,
                label: 'Total Tickets',
                value: metrics.totalTickets.toString(),
                subtitle: '${metrics.openTickets} open',
                color: SemanticColors.warning,
              ),
              _MetricCard(
                icon: Icons.inventory_2_outlined,
                label: 'Total Assets',
                value: metrics.totalAssets.toString(),
                subtitle: '${metrics.totalLocations} locations',
                color: SemanticColors.success,
              ),
              _MetricCard(
                icon: Icons.auto_awesome,
                label: 'AI Generations Today',
                value: metrics.aiGenerationsToday.toString(),
                subtitle: '${_formatTokens(metrics.aiTokensUsedToday)} tokens',
                color: SemanticColors.primary,
              ),
              _MetricCard(
                icon: Icons.speed,
                label: 'Avg Response Time',
                value: '${metrics.avgResponseTimeMs.toStringAsFixed(0)} ms',
                subtitle: 'API latency',
                color: SemanticColors.info,
              ),
              _MetricCard(
                icon: Icons.error_outline,
                label: 'Error Rate',
                value: '${(metrics.errorRate * 100).toStringAsFixed(1)}%',
                subtitle: 'Last 24 hours',
                color: metrics.errorRate > 0.05
                    ? SemanticColors.error
                    : SemanticColors.success,
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildGapsSummary() {
    return Watch((context) {
      final openGaps = _state.openGapsCount.value;
      final criticalGaps = _state.criticalGapsCount.value;

      return Container(
        padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
        decoration: BoxDecoration(
          color: SemanticColors.bgCard,
          border: Border.all(color: SemanticColors.border),
          borderRadius: BorderRadius.circular(SemanticRadius.card),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.assessment, color: SemanticColors.warning),
                const SizedBox(width: SemanticSpacing.tight),
                Text('Gap Analysis Summary', style: Semantic.cardTitle),
              ],
            ),
            const SizedBox(height: SemanticSpacing.normal),
            Row(
              children: [
                _GapChip(
                  label: 'Open Gaps',
                  count: openGaps,
                  color: SemanticColors.warning,
                ),
                const SizedBox(width: SemanticSpacing.normal),
                _GapChip(
                  label: 'Critical',
                  count: criticalGaps,
                  color: SemanticColors.error,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions', style: Semantic.sectionTitle),
        const SizedBox(height: SemanticSpacing.normal),
        Wrap(
          spacing: SemanticSpacing.normal,
          runSpacing: SemanticSpacing.normal,
          children: [
            _QuickActionCard(
              icon: Icons.business,
              label: 'Company Settings',
              onTap: () => Navigator.pushNamed(context, '/admin/company-management'),
            ),
            _QuickActionCard(
              icon: Icons.security,
              label: 'SSO Domains',
              onTap: () => Navigator.pushNamed(context, '/admin/sso-domains'),
            ),
            _QuickActionCard(
              icon: Icons.account_tree,
              label: 'Workflows',
              onTap: () => Navigator.pushNamed(context, '/admin/workflows'),
            ),
            _QuickActionCard(
              icon: Icons.psychology,
              label: 'AI Prompts',
              onTap: () => Navigator.pushNamed(context, '/admin/prompts'),
            ),
          ],
        ),
      ],
    );
  }

  String _formatTokens(int tokens) {
    if (tokens >= 1000000) {
      return '${(tokens / 1000000).toStringAsFixed(1)}M';
    } else if (tokens >= 1000) {
      return '${(tokens / 1000).toStringAsFixed(1)}K';
    }
    return tokens.toString();
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String subtitle;
  final Color color;

  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: SemanticSpacing.tight),
          Text(label, style: Semantic.caption),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: Semantic.sectionTitle.copyWith(color: color),
          ),
          Text(subtitle, style: Semantic.caption),
        ],
      ),
    );
  }
}

class _GapChip extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _GapChip({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SemanticSpacing.normal,
        vertical: SemanticSpacing.tight,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(SemanticRadius.small),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count.toString(),
            style: Semantic.body.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 4.0),
          Text(label, style: Semantic.caption.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(SemanticRadius.card),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
        decoration: BoxDecoration(
          color: SemanticColors.bgCard,
          border: Border.all(color: SemanticColors.border),
          borderRadius: BorderRadius.circular(SemanticRadius.card),
        ),
        child: Column(
          children: [
            Icon(icon, color: SemanticColors.primary, size: 32),
            const SizedBox(height: SemanticSpacing.tight),
            Text(label, style: Semantic.body, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Company Management Screen
// =============================================================================

/// Admin: Company Management screen for company settings.
class AdminCompanyManagementScreen extends StatefulWidget {
  const AdminCompanyManagementScreen({super.key});

  @override
  State<AdminCompanyManagementScreen> createState() =>
      _AdminCompanyManagementScreenState();
}

class _AdminCompanyManagementScreenState
    extends State<AdminCompanyManagementScreen> {
  late final AdminState _state;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _websiteController;
  late TextEditingController _industryController;
  late TextEditingController _timezoneController;
  late TextEditingController _sessionTimeoutController;

  bool _allowPublicSignup = false;
  bool _requireEmailVerification = true;
  bool _enableTwoFactor = false;
  String _dateFormat = 'MM/dd/yyyy';
  String _currency = 'USD';

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _nameController = TextEditingController();
    _websiteController = TextEditingController();
    _industryController = TextEditingController();
    _timezoneController = TextEditingController();
    _sessionTimeoutController = TextEditingController();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await _state.fetchCompanySettings();
    _populateForm();
  }

  void _populateForm() {
    final settings = _state.companySettings.value;
    if (settings == null) return;

    setState(() {
      _nameController.text = settings.name;
      _websiteController.text = settings.website ?? '';
      _industryController.text = settings.industry ?? '';
      _timezoneController.text = settings.timezone;
      _sessionTimeoutController.text =
          settings.sessionTimeoutMinutes.toString();
      _allowPublicSignup = settings.allowPublicSignup;
      _requireEmailVerification = settings.requireEmailVerification;
      _enableTwoFactor = settings.enableTwoFactor;
      _dateFormat = settings.dateFormat;
      _currency = settings.currency;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _websiteController.dispose();
    _industryController.dispose();
    _timezoneController.dispose();
    _sessionTimeoutController.dispose();
    super.dispose();
  }

  Future<void> _saveSettings() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    final currentSettings = _state.companySettings.value!;
    final updated = currentSettings.copyWith(
      name: _nameController.text.trim(),
      website: _websiteController.text.trim().isEmpty
          ? null
          : _websiteController.text.trim(),
      industry: _industryController.text.trim().isEmpty
          ? null
          : _industryController.text.trim(),
      timezone: _timezoneController.text.trim(),
      dateFormat: _dateFormat,
      currency: _currency,
      allowPublicSignup: _allowPublicSignup,
      requireEmailVerification: _requireEmailVerification,
      enableTwoFactor: _enableTwoFactor,
      sessionTimeoutMinutes:
          int.tryParse(_sessionTimeoutController.text) ?? 60,
    );

    final result = await _state.updateCompanySettings(updated);

    if (!mounted) return;
    setState(() => _isSaving = false);

    result.when(
      ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings saved')),
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
            title: 'Company Management',
            subtitle: 'Configure company settings and preferences.',
            actions: [
              AppButton(
                label: 'Save Changes',
                onPressed: _isSaving ? null : _saveSettings,
                isFullWidth: false,
                isLoading: _isSaving,
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingSettings.value &&
                  _state.companySettings.value == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildGeneralSection(),
                      const SizedBox(height: SemanticSpacing.section),
                      _buildSecuritySection(),
                      const SizedBox(height: SemanticSpacing.section),
                      _buildLocalizationSection(),
                      const SizedBox(height: AppSizes.spacing2XL),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralSection() {
    return _SettingsSection(
      title: 'General',
      children: [
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Company Name *',
          ),
          validator: (v) =>
              v == null || v.trim().isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: SemanticSpacing.normal),
        TextFormField(
          controller: _websiteController,
          decoration: const InputDecoration(
            labelText: 'Website',
            hintText: 'https://example.com',
          ),
        ),
        const SizedBox(height: SemanticSpacing.normal),
        TextFormField(
          controller: _industryController,
          decoration: const InputDecoration(
            labelText: 'Industry',
          ),
        ),
      ],
    );
  }

  Widget _buildSecuritySection() {
    return _SettingsSection(
      title: 'Security',
      children: [
        SwitchListTile(
          title: const Text('Allow Public Signup'),
          subtitle: const Text('Users can sign up without an invitation'),
          value: _allowPublicSignup,
          onChanged: (v) => setState(() => _allowPublicSignup = v),
        ),
        SwitchListTile(
          title: const Text('Require Email Verification'),
          subtitle: const Text('Users must verify email before accessing'),
          value: _requireEmailVerification,
          onChanged: (v) => setState(() => _requireEmailVerification = v),
        ),
        SwitchListTile(
          title: const Text('Enable Two-Factor Authentication'),
          subtitle: const Text('Require 2FA for all users'),
          value: _enableTwoFactor,
          onChanged: (v) => setState(() => _enableTwoFactor = v),
        ),
        const SizedBox(height: SemanticSpacing.normal),
        TextFormField(
          controller: _sessionTimeoutController,
          decoration: const InputDecoration(
            labelText: 'Session Timeout (minutes)',
          ),
          keyboardType: TextInputType.number,
          validator: (v) {
            if (v == null || v.isEmpty) return 'Required';
            if (int.tryParse(v) == null) return 'Must be a number';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildLocalizationSection() {
    return _SettingsSection(
      title: 'Localization',
      children: [
        TextFormField(
          controller: _timezoneController,
          decoration: const InputDecoration(
            labelText: 'Timezone',
            hintText: 'America/New_York',
          ),
        ),
        const SizedBox(height: SemanticSpacing.normal),
        DropdownButtonFormField<String>(
          value: _dateFormat,
          decoration: const InputDecoration(labelText: 'Date Format'),
          items: const [
            DropdownMenuItem(value: 'MM/dd/yyyy', child: Text('MM/dd/yyyy')),
            DropdownMenuItem(value: 'dd/MM/yyyy', child: Text('dd/MM/yyyy')),
            DropdownMenuItem(value: 'yyyy-MM-dd', child: Text('yyyy-MM-dd')),
          ],
          onChanged: (v) {
            if (v != null) setState(() => _dateFormat = v);
          },
        ),
        const SizedBox(height: SemanticSpacing.normal),
        DropdownButtonFormField<String>(
          value: _currency,
          decoration: const InputDecoration(labelText: 'Currency'),
          items: const [
            DropdownMenuItem(value: 'USD', child: Text('USD - US Dollar')),
            DropdownMenuItem(value: 'EUR', child: Text('EUR - Euro')),
            DropdownMenuItem(value: 'GBP', child: Text('GBP - British Pound')),
            DropdownMenuItem(value: 'CAD', child: Text('CAD - Canadian Dollar')),
          ],
          onChanged: (v) {
            if (v != null) setState(() => _currency = v);
          },
        ),
      ],
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.normal),
          ...children,
        ],
      ),
    );
  }
}

// =============================================================================
// SSO Domains Screen
// =============================================================================

/// Admin: SSO Domains configuration screen.
class AdminSSODomainsScreen extends StatefulWidget {
  const AdminSSODomainsScreen({super.key});

  @override
  State<AdminSSODomainsScreen> createState() => _AdminSSODomainsScreenState();
}

class _AdminSSODomainsScreenState extends State<AdminSSODomainsScreen> {
  late final AdminState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchSSODomains();
  }

  Future<void> _showDomainDialog({SSODomain? domain}) async {
    final result = await showDialog<SSODomain>(
      context: context,
      builder: (context) => _SSODomainDialog(domain: domain),
    );

    if (result == null || !mounted) return;

    if (domain == null) {
      final createResult = await _state.createSSODomain(
        domain: result.domain,
        provider: result.provider,
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
      final updateResult = await _state.updateSSODomain(result);

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
      final domains = _state.ssoDomains.value;

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
            onVerify: () async {
              final result = await _state.verifySSODomain(domain.id);
              if (!mounted) return;
              result.when(
                ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Domain verified')),
                ),
                error: (e) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Verification failed: ${e.message}'),
                    backgroundColor: SemanticColors.error,
                  ),
                ),
              );
            },
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
  final VoidCallback onVerify;

  const _SSODomainCard({
    required this.domain,
    required this.onEdit,
    required this.onDelete,
    required this.onVerify,
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
                    Text(domain.provider.displayName, style: Semantic.caption),
                    const SizedBox(width: SemanticSpacing.normal),
                    _StatusBadge(
                      label: domain.isVerified ? 'Verified' : 'Unverified',
                      isPositive: domain.isVerified,
                    ),
                    const SizedBox(width: SemanticSpacing.tight),
                    _StatusBadge(
                      label: domain.isActive ? 'Active' : 'Inactive',
                      isPositive: domain.isActive,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!domain.isVerified)
            TextButton(
              onPressed: onVerify,
              child: const Text('Verify'),
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

class _SSODomainDialog extends StatefulWidget {
  final SSODomain? domain;

  const _SSODomainDialog({this.domain});

  @override
  State<_SSODomainDialog> createState() => _SSODomainDialogState();
}

class _SSODomainDialogState extends State<_SSODomainDialog> {
  late TextEditingController _domainController;
  late TextEditingController _entityIdController;
  late TextEditingController _ssoUrlController;
  late SSOProvider _provider;
  late bool _isActive;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _domainController = TextEditingController(text: widget.domain?.domain ?? '');
    _entityIdController =
        TextEditingController(text: widget.domain?.entityId ?? '');
    _ssoUrlController = TextEditingController(text: widget.domain?.ssoUrl ?? '');
    _provider = widget.domain?.provider ?? SSOProvider.saml;
    _isActive = widget.domain?.isActive ?? false;
  }

  @override
  void dispose() {
    _domainController.dispose();
    _entityIdController.dispose();
    _ssoUrlController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final result = SSODomain(
      id: widget.domain?.id ?? '',
      companyId: widget.domain?.companyId ?? 'company-001',
      domain: _domainController.text.trim(),
      provider: _provider,
      isVerified: widget.domain?.isVerified ?? false,
      isActive: _isActive,
      entityId:
          _entityIdController.text.isEmpty ? null : _entityIdController.text,
      ssoUrl: _ssoUrlController.text.isEmpty ? null : _ssoUrlController.text,
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
              DropdownButtonFormField<SSOProvider>(
                value: _provider,
                decoration: const InputDecoration(labelText: 'Provider'),
                items: SSOProvider.values
                    .map((p) => DropdownMenuItem(
                          value: p,
                          child: Text(p.displayName),
                        ))
                    .toList(),
                onChanged: (v) {
                  if (v != null) setState(() => _provider = v);
                },
              ),
              const SizedBox(height: SemanticSpacing.normal),
              TextFormField(
                controller: _entityIdController,
                decoration: const InputDecoration(
                  labelText: 'Entity ID',
                  hintText: 'https://idp.example.com/entity',
                ),
              ),
              const SizedBox(height: SemanticSpacing.normal),
              TextFormField(
                controller: _ssoUrlController,
                decoration: const InputDecoration(
                  labelText: 'SSO URL',
                  hintText: 'https://idp.example.com/sso',
                ),
              ),
              if (isEditing) ...[
                const SizedBox(height: SemanticSpacing.normal),
                SwitchListTile(
                  title: const Text('Active'),
                  value: _isActive,
                  onChanged: (v) => setState(() => _isActive = v),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
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

// =============================================================================
// Metrics Screen
// =============================================================================

/// Admin: System Metrics dashboard.
class AdminMetricsScreen extends StatefulWidget {
  const AdminMetricsScreen({super.key});

  @override
  State<AdminMetricsScreen> createState() => _AdminMetricsScreenState();
}

class _AdminMetricsScreenState extends State<AdminMetricsScreen> {
  late final AdminState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchSystemMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'System Metrics',
            subtitle: 'Real-time system performance and usage statistics.',
            actions: [
              AppButton(
                label: 'Refresh',
                onPressed: () => _state.fetchSystemMetrics(refresh: true),
                isFullWidth: false,
                icon: const Icon(Icons.refresh, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingMetrics.value &&
                  _state.systemMetrics.value == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final metrics = _state.systemMetrics.value;
              if (metrics == null) {
                return const Center(child: Text('No metrics available'));
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUsageSection(metrics),
                    const SizedBox(height: SemanticSpacing.section),
                    _buildPerformanceSection(metrics),
                    const SizedBox(height: SemanticSpacing.section),
                    _buildAISection(metrics),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageSection(SystemMetrics metrics) {
    return _SettingsSection(
      title: 'Usage Statistics',
      children: [
        _MetricsRow(
          items: [
            _MetricItem(
              label: 'Total Users',
              value: metrics.totalUsers.toString(),
            ),
            _MetricItem(
              label: 'Active Users',
              value: metrics.activeUsers.toString(),
            ),
            _MetricItem(
              label: 'Active Rate',
              value:
                  '${((metrics.activeUsers / metrics.totalUsers) * 100).toStringAsFixed(1)}%',
            ),
          ],
        ),
        const SizedBox(height: SemanticSpacing.normal),
        _MetricsRow(
          items: [
            _MetricItem(
              label: 'Total Tickets',
              value: metrics.totalTickets.toString(),
            ),
            _MetricItem(
              label: 'Open Tickets',
              value: metrics.openTickets.toString(),
            ),
            _MetricItem(
              label: 'Resolution Rate',
              value:
                  '${(((metrics.totalTickets - metrics.openTickets) / metrics.totalTickets) * 100).toStringAsFixed(1)}%',
            ),
          ],
        ),
        const SizedBox(height: SemanticSpacing.normal),
        _MetricsRow(
          items: [
            _MetricItem(
              label: 'Total Assets',
              value: metrics.totalAssets.toString(),
            ),
            _MetricItem(
              label: 'Locations',
              value: metrics.totalLocations.toString(),
            ),
            _MetricItem(
              label: 'Assets/Location',
              value: (metrics.totalAssets / metrics.totalLocations)
                  .toStringAsFixed(1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPerformanceSection(SystemMetrics metrics) {
    return _SettingsSection(
      title: 'System Performance',
      children: [
        _MetricsRow(
          items: [
            _MetricItem(
              label: 'Avg Response Time',
              value: '${metrics.avgResponseTimeMs.toStringAsFixed(0)} ms',
              status: metrics.avgResponseTimeMs < 500
                  ? _MetricStatus.good
                  : metrics.avgResponseTimeMs < 1000
                      ? _MetricStatus.warning
                      : _MetricStatus.critical,
            ),
            _MetricItem(
              label: 'Error Rate',
              value: '${(metrics.errorRate * 100).toStringAsFixed(2)}%',
              status: metrics.errorRate < 0.01
                  ? _MetricStatus.good
                  : metrics.errorRate < 0.05
                      ? _MetricStatus.warning
                      : _MetricStatus.critical,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAISection(SystemMetrics metrics) {
    return _SettingsSection(
      title: 'AI Usage (Today)',
      children: [
        _MetricsRow(
          items: [
            _MetricItem(
              label: 'Generations',
              value: metrics.aiGenerationsToday.toString(),
            ),
            _MetricItem(
              label: 'Tokens Used',
              value: _formatNumber(metrics.aiTokensUsedToday),
            ),
            _MetricItem(
              label: 'Avg Tokens/Gen',
              value: metrics.aiGenerationsToday > 0
                  ? (metrics.aiTokensUsedToday / metrics.aiGenerationsToday)
                      .toStringAsFixed(0)
                  : '0',
            ),
          ],
        ),
      ],
    );
  }

  String _formatNumber(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return n.toString();
  }
}

class _MetricsRow extends StatelessWidget {
  final List<_MetricItem> items;

  const _MetricsRow({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .map((item) => Expanded(
                child: item,
              ))
          .toList(),
    );
  }
}

enum _MetricStatus { good, warning, critical }

class _MetricItem extends StatelessWidget {
  final String label;
  final String value;
  final _MetricStatus? status;

  const _MetricItem({
    required this.label,
    required this.value,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color? valueColor;
    if (status != null) {
      switch (status!) {
        case _MetricStatus.good:
          valueColor = SemanticColors.success;
        case _MetricStatus.warning:
          valueColor = SemanticColors.warning;
        case _MetricStatus.critical:
          valueColor = SemanticColors.error;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Semantic.caption),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: Semantic.sectionTitle.copyWith(color: valueColor),
        ),
      ],
    );
  }
}

// =============================================================================
// Workflows Screen
// =============================================================================

/// Admin: Workflows configuration screen.
class AdminWorkflowsScreen extends StatefulWidget {
  const AdminWorkflowsScreen({super.key});

  @override
  State<AdminWorkflowsScreen> createState() => _AdminWorkflowsScreenState();
}

class _AdminWorkflowsScreenState extends State<AdminWorkflowsScreen> {
  late final AdminState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchWorkflows();
  }

  Future<void> _toggleActive(Workflow workflow) async {
    final result = await _state.toggleWorkflowActive(workflow.id);
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

  Future<void> _deleteWorkflow(Workflow workflow) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Workflow'),
        content: Text('Delete "${workflow.name}"? This cannot be undone.'),
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

    final result = await _state.deleteWorkflow(workflow.id);
    if (!mounted) return;
    result.when(
      ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Workflow deleted')),
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
            title: 'Workflows',
            subtitle: 'Configure automated workflows for tickets and assets.',
            actions: [
              AppButton(
                label: 'Create Workflow',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Workflow editor coming soon')),
                  );
                },
                isFullWidth: false,
                icon: const Icon(Icons.add, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingWorkflows.value &&
                  _state.workflows.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.workflows.value.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_tree,
                          size: 64, color: AppColors.textTertiary),
                      const SizedBox(height: SemanticSpacing.section),
                      Text('No workflows configured', style: Semantic.cardTitle),
                      const SizedBox(height: SemanticSpacing.tight),
                      Text(
                        'Create workflows to automate your processes.',
                        style: Semantic.bodySecondary,
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemCount: _state.workflows.value.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: SemanticSpacing.normal),
                itemBuilder: (context, index) {
                  final workflow = _state.workflows.value[index];
                  return _WorkflowCard(
                    workflow: workflow,
                    onToggle: () => _toggleActive(workflow),
                    onDelete: () => _deleteWorkflow(workflow),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _WorkflowCard extends StatelessWidget {
  final Workflow workflow;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const _WorkflowCard({
    required this.workflow,
    required this.onToggle,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_tree,
                color: workflow.isActive
                    ? SemanticColors.primary
                    : SemanticColors.textSecondary,
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(workflow.name, style: Semantic.formLabel),
                    if (workflow.description != null)
                      Text(workflow.description!, style: Semantic.caption),
                  ],
                ),
              ),
              _StatusBadge(
                label: workflow.type.displayName,
                isPositive: true,
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Switch(
                value: workflow.isActive,
                onChanged: (_) => onToggle(),
              ),
              IconButton(
                icon: Icon(Icons.delete, size: 18, color: SemanticColors.error),
                onPressed: onDelete,
                tooltip: 'Delete',
              ),
            ],
          ),
          const Divider(height: SemanticSpacing.section),
          Text('${workflow.steps.length} steps', style: Semantic.caption),
          const SizedBox(height: SemanticSpacing.tight),
          Wrap(
            spacing: SemanticSpacing.tight,
            children: workflow.steps.map((step) {
              return Chip(
                label: Text(step.name, style: Semantic.badge),
                avatar: Text('${step.order}', style: Semantic.badge),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Document Processing Screen
// =============================================================================

/// Admin: Document Processing configuration screen.
class AdminDocumentProcessingScreen extends StatefulWidget {
  const AdminDocumentProcessingScreen({super.key});

  @override
  State<AdminDocumentProcessingScreen> createState() =>
      _AdminDocumentProcessingScreenState();
}

class _AdminDocumentProcessingScreenState
    extends State<AdminDocumentProcessingScreen> {
  late final AdminState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchDocumentConfigs();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Document Processing',
            subtitle: 'Configure document extraction and processing rules.',
            actions: [
              AppButton(
                label: 'Add Configuration',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Configuration editor coming soon')),
                  );
                },
                isFullWidth: false,
                icon: const Icon(Icons.add, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingDocConfigs.value &&
                  _state.documentConfigs.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.documentConfigs.value.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.description,
                          size: 64, color: AppColors.textTertiary),
                      const SizedBox(height: SemanticSpacing.section),
                      Text('No document configurations',
                          style: Semantic.cardTitle),
                      const SizedBox(height: SemanticSpacing.tight),
                      Text(
                        'Configure how documents are processed and extracted.',
                        style: Semantic.bodySecondary,
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemCount: _state.documentConfigs.value.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: SemanticSpacing.normal),
                itemBuilder: (context, index) {
                  final config = _state.documentConfigs.value[index];
                  return _DocumentConfigCard(config: config);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _DocumentConfigCard extends StatelessWidget {
  final DocumentConfig config;

  const _DocumentConfigCard({required this.config});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                color: config.isActive
                    ? SemanticColors.primary
                    : SemanticColors.textSecondary,
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(config.name, style: Semantic.formLabel),
                    if (config.description != null)
                      Text(config.description!, style: Semantic.caption),
                  ],
                ),
              ),
              _StatusBadge(
                label: config.documentType.displayName,
                isPositive: true,
              ),
              const SizedBox(width: SemanticSpacing.tight),
              _StatusBadge(
                label: config.isActive ? 'Active' : 'Inactive',
                isPositive: config.isActive,
              ),
              if (config.autoProcess) ...[
                const SizedBox(width: SemanticSpacing.tight),
                _StatusBadge(label: 'Auto', isPositive: true),
              ],
            ],
          ),
          const SizedBox(height: SemanticSpacing.normal),
          Text('Extraction Fields:', style: Semantic.caption),
          const SizedBox(height: 4.0),
          Wrap(
            spacing: SemanticSpacing.tight,
            runSpacing: 4.0,
            children: config.extractionFields
                .map((f) => Chip(label: Text(f, style: Semantic.badge)))
                .toList(),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Prompts Screen
// =============================================================================

/// Admin: AI Prompts management screen.
class AdminPromptsScreen extends StatefulWidget {
  const AdminPromptsScreen({super.key});

  @override
  State<AdminPromptsScreen> createState() => _AdminPromptsScreenState();
}

class _AdminPromptsScreenState extends State<AdminPromptsScreen> {
  late final AdminState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchPrompts();
  }

  Future<void> _toggleActive(AIPrompt prompt) async {
    final result = await _state.togglePromptActive(prompt.id);
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

  Future<void> _deletePrompt(AIPrompt prompt) async {
    if (prompt.isSystem) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('System prompts cannot be deleted')),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Prompt'),
        content: Text('Delete "${prompt.name}"? This cannot be undone.'),
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

    final result = await _state.deletePrompt(prompt.id);
    if (!mounted) return;
    result.when(
      ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Prompt deleted')),
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
            title: 'AI Prompts',
            subtitle: 'Manage AI prompt templates for various use cases.',
            actions: [
              AppButton(
                label: 'Create Prompt',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Prompt editor coming soon')),
                  );
                },
                isFullWidth: false,
                icon: const Icon(Icons.add, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingPrompts.value &&
                  _state.prompts.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.prompts.value.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.psychology,
                          size: 64, color: AppColors.textTertiary),
                      const SizedBox(height: SemanticSpacing.section),
                      Text('No prompts configured', style: Semantic.cardTitle),
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemCount: _state.prompts.value.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: SemanticSpacing.normal),
                itemBuilder: (context, index) {
                  final prompt = _state.prompts.value[index];
                  return _PromptCard(
                    prompt: prompt,
                    onToggle: () => _toggleActive(prompt),
                    onDelete: () => _deletePrompt(prompt),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _PromptCard extends StatelessWidget {
  final AIPrompt prompt;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const _PromptCard({
    required this.prompt,
    required this.onToggle,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.psychology,
                color: prompt.isActive
                    ? SemanticColors.primary
                    : SemanticColors.textSecondary,
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(prompt.name, style: Semantic.formLabel),
                        if (prompt.isSystem) ...[
                          const SizedBox(width: SemanticSpacing.tight),
                          Icon(Icons.lock,
                              size: 14, color: SemanticColors.textSecondary),
                        ],
                      ],
                    ),
                    if (prompt.description != null)
                      Text(prompt.description!, style: Semantic.caption),
                  ],
                ),
              ),
              _StatusBadge(
                label: prompt.type.displayName,
                isPositive: true,
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Switch(
                value: prompt.isActive,
                onChanged: (_) => onToggle(),
              ),
              if (!prompt.isSystem)
                IconButton(
                  icon:
                      Icon(Icons.delete, size: 18, color: SemanticColors.error),
                  onPressed: onDelete,
                  tooltip: 'Delete',
                ),
            ],
          ),
          const Divider(height: SemanticSpacing.section),
          Text('Template:', style: Semantic.caption),
          const SizedBox(height: 4.0),
          Container(
            padding: const EdgeInsets.all(SemanticSpacing.tight),
            decoration: BoxDecoration(
              color: SemanticColors.bgSecondary,
              borderRadius: BorderRadius.circular(SemanticRadius.normal),
            ),
            child: Text(
              prompt.template.length > 200
                  ? '${prompt.template.substring(0, 200)}...'
                  : prompt.template,
              style: Semantic.body.copyWith(fontFamily: 'monospace'),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// AI Generations Screen
// =============================================================================

/// Admin: AI Generations history screen.
class AdminAIGenerationsScreen extends StatefulWidget {
  const AdminAIGenerationsScreen({super.key});

  @override
  State<AdminAIGenerationsScreen> createState() =>
      _AdminAIGenerationsScreenState();
}

class _AdminAIGenerationsScreenState extends State<AdminAIGenerationsScreen> {
  late final AdminState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchGenerations();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'AI Generations',
            subtitle: 'View AI generation history and usage.',
            actions: [
              AppButton(
                label: 'Refresh',
                onPressed: () => _state.fetchGenerations(refresh: true),
                isFullWidth: false,
                icon: const Icon(Icons.refresh, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          _buildFilters(),
          const SizedBox(height: SemanticSpacing.normal),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingGenerations.value &&
                  _state.generations.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              final gens = _state.filteredGenerations.value;
              if (gens.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.auto_awesome,
                          size: 64, color: AppColors.textTertiary),
                      const SizedBox(height: SemanticSpacing.section),
                      Text('No generations found', style: Semantic.cardTitle),
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemCount: gens.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: SemanticSpacing.normal),
                itemBuilder: (context, index) {
                  return _GenerationCard(generation: gens[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Watch((context) {
      final filter = _state.generationsFilter.value;

      return Wrap(
        spacing: SemanticSpacing.tight,
        children: [
          FilterChip(
            label: const Text('All'),
            selected: filter == null,
            onSelected: (_) => _state.setGenerationsFilter(null),
          ),
          ...AIGenerationStatus.values.map((status) {
            return FilterChip(
              label: Text(status.displayName),
              selected: filter == status,
              onSelected: (_) => _state.setGenerationsFilter(status),
            );
          }),
        ],
      );
    });
  }
}

class _GenerationCard extends StatelessWidget {
  final AIGeneration generation;

  const _GenerationCard({required this.generation});

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (generation.status) {
      AIGenerationStatus.completed => SemanticColors.success,
      AIGenerationStatus.running => SemanticColors.info,
      AIGenerationStatus.failed => SemanticColors.error,
      AIGenerationStatus.pending => SemanticColors.warning,
    };

    return Container(
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Expanded(
                child: Text(
                  generation.promptName ?? 'Unknown Prompt',
                  style: Semantic.formLabel,
                ),
              ),
              Text(
                _formatTime(generation.createdAt),
                style: Semantic.caption,
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.tight),
          Row(
            children: [
              Text(
                generation.status.displayName,
                style: Semantic.badge.copyWith(color: statusColor),
              ),
              const SizedBox(width: SemanticSpacing.normal),
              if (generation.userName != null)
                Text('by ${generation.userName}', style: Semantic.caption),
              const Spacer(),
              if (generation.tokensUsed != null)
                Text('${generation.tokensUsed} tokens', style: Semantic.caption),
              if (generation.latencyMs != null) ...[
                const SizedBox(width: SemanticSpacing.normal),
                Text('${generation.latencyMs}ms', style: Semantic.caption),
              ],
            ],
          ),
          if (generation.error != null) ...[
            const SizedBox(height: SemanticSpacing.tight),
            Container(
              padding: const EdgeInsets.all(SemanticSpacing.tight),
              decoration: BoxDecoration(
                color: SemanticColors.errorBg,
                borderRadius: BorderRadius.circular(SemanticRadius.normal),
              ),
              child: Text(
                generation.error!,
                style: Semantic.caption.copyWith(color: SemanticColors.error),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }
}

// =============================================================================
// Gap Analysis Screen
// =============================================================================

/// Admin: Gap Analysis screen.
class AdminGapAnalysisScreen extends StatefulWidget {
  const AdminGapAnalysisScreen({super.key});

  @override
  State<AdminGapAnalysisScreen> createState() => _AdminGapAnalysisScreenState();
}

class _AdminGapAnalysisScreenState extends State<AdminGapAnalysisScreen> {
  late final AdminState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchGapItems();
  }

  Future<void> _updateStatus(GapAnalysisItem item, GapStatus newStatus) async {
    final updated = item.copyWith(
      status: newStatus,
      resolvedAt: newStatus == GapStatus.resolved ? DateTime.now() : null,
    );

    final result = await _state.updateGapItem(updated);
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Gap Analysis',
            subtitle: 'Identify and track compliance and operational gaps.',
            actions: [
              AppButton(
                label: 'Run Analysis',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Analysis in progress...')),
                  );
                  _state.fetchGapItems(refresh: true);
                },
                isFullWidth: false,
                icon: const Icon(Icons.play_arrow, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          _buildFilters(),
          const SizedBox(height: SemanticSpacing.normal),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingGaps.value && _state.gapItems.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              final gaps = _state.filteredGapItems.value;
              if (gaps.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle,
                          size: 64, color: SemanticColors.success),
                      const SizedBox(height: SemanticSpacing.section),
                      Text('No gaps found', style: Semantic.cardTitle),
                      const SizedBox(height: SemanticSpacing.tight),
                      Text(
                        'All systems are operating within expected parameters.',
                        style: Semantic.bodySecondary,
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemCount: gaps.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: SemanticSpacing.normal),
                itemBuilder: (context, index) {
                  return _GapCard(
                    gap: gaps[index],
                    onUpdateStatus: (status) =>
                        _updateStatus(gaps[index], status),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Watch((context) {
      final severityFilter = _state.gapSeverityFilter.value;
      final statusFilter = _state.gapStatusFilter.value;

      return Row(
        children: [
          Text('Severity:', style: Semantic.caption),
          const SizedBox(width: SemanticSpacing.tight),
          Wrap(
            spacing: 4.0,
            children: [
              FilterChip(
                label: const Text('All'),
                selected: severityFilter == null,
                onSelected: (_) => _state.setGapFilters(
                  severity: null,
                  status: statusFilter,
                ),
              ),
              ...GapSeverity.values.map((s) {
                return FilterChip(
                  label: Text(s.displayName),
                  selected: severityFilter == s,
                  onSelected: (_) => _state.setGapFilters(
                    severity: s,
                    status: statusFilter,
                  ),
                );
              }),
            ],
          ),
          const SizedBox(width: SemanticSpacing.section),
          Text('Status:', style: Semantic.caption),
          const SizedBox(width: SemanticSpacing.tight),
          Wrap(
            spacing: 4.0,
            children: [
              FilterChip(
                label: const Text('All'),
                selected: statusFilter == null,
                onSelected: (_) => _state.setGapFilters(
                  severity: severityFilter,
                  status: null,
                ),
              ),
              ...GapStatus.values.map((s) {
                return FilterChip(
                  label: Text(s.displayName),
                  selected: statusFilter == s,
                  onSelected: (_) => _state.setGapFilters(
                    severity: severityFilter,
                    status: s,
                  ),
                );
              }),
            ],
          ),
        ],
      );
    });
  }
}

class _GapCard extends StatelessWidget {
  final GapAnalysisItem gap;
  final ValueChanged<GapStatus> onUpdateStatus;

  const _GapCard({
    required this.gap,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    final severityColor = switch (gap.severity) {
      GapSeverity.critical => SemanticColors.error,
      GapSeverity.high => SemanticColors.warning,
      GapSeverity.medium => SemanticColors.info,
      GapSeverity.low => SemanticColors.textSecondary,
    };

    return Container(
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: severityColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  gap.severity.displayName.toUpperCase(),
                  style: Semantic.badge.copyWith(color: severityColor),
                ),
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: SemanticColors.bgSecondary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(gap.category, style: Semantic.badge),
              ),
              const Spacer(),
              DropdownButton<GapStatus>(
                value: gap.status,
                underline: const SizedBox.shrink(),
                items: GapStatus.values
                    .map((s) => DropdownMenuItem(
                          value: s,
                          child: Text(s.displayName),
                        ))
                    .toList(),
                onChanged: (s) {
                  if (s != null) onUpdateStatus(s);
                },
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.normal),
          Text(gap.title, style: Semantic.formLabel),
          const SizedBox(height: 4.0),
          Text(gap.description, style: Semantic.body),
          if (gap.recommendation != null) ...[
            const SizedBox(height: SemanticSpacing.normal),
            Container(
              padding: const EdgeInsets.all(SemanticSpacing.tight),
              decoration: BoxDecoration(
                color: SemanticColors.infoBg,
                borderRadius: BorderRadius.circular(SemanticRadius.normal),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lightbulb_outline,
                      size: 16, color: SemanticColors.info),
                  const SizedBox(width: SemanticSpacing.tight),
                  Expanded(
                    child: Text(
                      gap.recommendation!,
                      style: Semantic.caption.copyWith(
                        color: SemanticColors.info,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (gap.assigneeName != null || gap.dueDate != null) ...[
            const SizedBox(height: SemanticSpacing.normal),
            Row(
              children: [
                if (gap.assigneeName != null) ...[
                  Icon(Icons.person_outline,
                      size: 16, color: SemanticColors.textSecondary),
                  const SizedBox(width: 4.0),
                  Text(gap.assigneeName!, style: Semantic.caption),
                ],
                if (gap.dueDate != null) ...[
                  const SizedBox(width: SemanticSpacing.normal),
                  Icon(Icons.schedule,
                      size: 16, color: SemanticColors.textSecondary),
                  const SizedBox(width: 4.0),
                  Text(
                    'Due ${_formatDate(gap.dueDate!)}',
                    style: Semantic.caption,
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
