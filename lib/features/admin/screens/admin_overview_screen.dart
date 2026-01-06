import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../state/admin_state.dart';

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
      _state.fetchSystemOverview(),
      _state.fetchCompanySummaries(),
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
              if (_state.isLoadingSystemStats.value &&
                  _state.systemOverview.value == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMetricsGrid(),
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
      final overview = _state.systemOverview.value;
      if (overview == null) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('System Metrics', style: Semantic.sectionTitle),
          const SizedBox(height: SemanticSpacing.normal),
          Wrap(
            spacing: SemanticSpacing.normal,
            runSpacing: SemanticSpacing.normal,
            children: [
              AdminMetricCard(
                icon: Icons.business,
                label: 'Total Companies',
                value: overview.companies.total.toString(),
                subtitle: 'Active organizations',
                color: SemanticColors.info,
              ),
              AdminMetricCard(
                icon: Icons.people_outline,
                label: 'Total Users',
                value: overview.members.total.toString(),
                subtitle: 'Registered members',
                color: SemanticColors.primary,
              ),
              AdminMetricCard(
                icon: Icons.inventory_2_outlined,
                label: 'Total Assets',
                value: overview.assets.total.toString(),
                subtitle: 'Across all companies',
                color: SemanticColors.success,
              ),
              AdminMetricCard(
                icon: Icons.confirmation_number_outlined,
                label: 'Total Tickets',
                value: overview.tasks.total.toString(),
                subtitle: 'All time',
                color: SemanticColors.warning,
              ),
              AdminMetricCard(
                icon: Icons.folder_outlined,
                label: 'Total Files',
                value: overview.files.total.toString(),
                subtitle: 'Stored documents',
                color: SemanticColors.primary,
              ),
            ],
          ),
        ],
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
            AdminQuickActionCard(
              icon: Icons.business,
              label: 'Companies',
              onTap: () => context.goToAdminCompanyManagement(),
            ),
            AdminQuickActionCard(
              icon: Icons.security,
              label: 'SSO Domains',
              onTap: () => context.goToAdminSSODomains(),
            ),
            AdminQuickActionCard(
              icon: Icons.psychology,
              label: 'AI Prompts',
              onTap: () => context.goToAdminPrompts(),
            ),
            AdminQuickActionCard(
              icon: Icons.auto_awesome,
              label: 'AI Generations',
              onTap: () => context.goToAdminAIGenerations(),
            ),
            AdminQuickActionCard(
              icon: Icons.assessment,
              label: 'Gap Analysis',
              onTap: () => context.goToAdminGapAnalysis(),
            ),
            AdminQuickActionCard(
              icon: Icons.analytics,
              label: 'Metrics',
              onTap: () => context.goToAdminMetrics(),
            ),
          ],
        ),
      ],
    );
  }
}

/// A metric card displaying a value with icon and label
class AdminMetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String subtitle;
  final Color color;

  const AdminMetricCard({
    super.key,
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

/// A quick action card for navigation
class AdminQuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const AdminQuickActionCard({
    super.key,
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
