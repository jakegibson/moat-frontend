import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../../tickets/state/task_metrics_state.dart';
import '../../assets/state/assets_state.dart';
import '../../settings/state/members_state.dart';

/// Dashboard screen with key metrics and quick actions.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final TaskMetricsState _metricsState;
  late final AssetsState _assetsState;
  late final MembersState _membersState;

  @override
  void initState() {
    super.initState();
    _metricsState = getIt<TaskMetricsState>();
    _assetsState = getIt<AssetsState>();
    _membersState = getIt<MembersState>();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.wait([
      _metricsState.fetchMetrics(),
      _assetsState.fetchAssets(refresh: true),
      _membersState.fetchMembers(refresh: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Dashboard',
            subtitle: 'Overview of your operations and key metrics.',
            actions: [
              AppButton(
                label: 'Refresh',
                onPressed: _loadData,
                isFullWidth: false,
                variant: AppButtonVariant.secondary,
                icon: const Icon(Icons.refresh, size: 18),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMetricsSection(),
                  const SizedBox(height: SemanticSpacing.large),
                  _buildQuickActionsSection(),
                  const SizedBox(height: SemanticSpacing.large),
                  _buildOverviewCardsSection(),
                  const SizedBox(height: SemanticSpacing.page),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ticket Metrics', style: Semantic.sectionTitle),
        const SizedBox(height: SemanticSpacing.section),
        Watch((context) {
          if (_metricsState.isLoading.value) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 800;
              final cardWidth = isWide
                  ? (constraints.maxWidth - (3 * SemanticSpacing.section)) / 4
                  : (constraints.maxWidth - SemanticSpacing.section) / 2;

              return Wrap(
                spacing: SemanticSpacing.section,
                runSpacing: SemanticSpacing.section,
                children: [
                  _buildMetricCard(
                    title: 'Total Tickets',
                    value: _metricsState.total.value.toString(),
                    subtitle: '${_metricsState.totalLastMonth.value} this month',
                    icon: Icons.confirmation_number,
                    color: SemanticColors.info,
                    width: cardWidth,
                  ),
                  _buildMetricCard(
                    title: 'Overdue',
                    value: _metricsState.overdueCount.value.toString(),
                    subtitle: 'Need attention',
                    icon: Icons.warning_amber,
                    color: SemanticColors.error,
                    width: cardWidth,
                  ),
                  _buildMetricCard(
                    title: 'Avg. Time to Close',
                    value: _formatHours(_metricsState.avgTimeToClose.value),
                    subtitle: _formatChange(_metricsState.timeToCloseChange.value),
                    icon: Icons.timer,
                    color: SemanticColors.success,
                    width: cardWidth,
                  ),
                  _buildMetricCard(
                    title: 'Avg. Response Time',
                    value: _formatHours(_metricsState.avgResponseTime.value),
                    subtitle:
                        _formatChange(_metricsState.responseTimeChange.value),
                    icon: Icons.speed,
                    color: SemanticColors.warning,
                    width: cardWidth,
                  ),
                ],
              );
            },
          );
        }),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
    required double width,
  }) {
    return Container(
      width: width,
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: SemanticSpacing.relaxed),
          Text(value, style: Semantic.metric),
          const SizedBox(height: SemanticSpacing.tight),
          Text(title, style: Semantic.bodySmall),
          Text(subtitle, style: Semantic.caption),
        ],
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions', style: Semantic.sectionTitle),
        const SizedBox(height: SemanticSpacing.section),
        Wrap(
          spacing: SemanticSpacing.relaxed,
          runSpacing: SemanticSpacing.relaxed,
          children: [
            _buildQuickAction(
              icon: Icons.add_circle_outline,
              label: 'New Ticket',
              onTap: () => context.go(Routes.ticketsList),
            ),
            _buildQuickAction(
              icon: Icons.inventory_2_outlined,
              label: 'View Assets',
              onTap: () => context.go(Routes.assetsList),
            ),
            _buildQuickAction(
              icon: Icons.people_outline,
              label: 'Manage Team',
              onTap: () => context.go(Routes.settingsMembers),
            ),
            _buildQuickAction(
              icon: Icons.settings_outlined,
              label: 'Settings',
              onTap: () => context.go(Routes.settings),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(SemanticRadius.card),
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
        decoration: BoxDecoration(
          color: SemanticColors.bgSecondary,
          borderRadius: BorderRadius.circular(SemanticRadius.card),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32, color: AppColors.textSecondary),
            const SizedBox(height: SemanticSpacing.normal),
            Text(label, style: Semantic.formLabel, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Overview', style: Semantic.sectionTitle),
        const SizedBox(height: SemanticSpacing.section),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;

            return Wrap(
              spacing: SemanticSpacing.section,
              runSpacing: SemanticSpacing.section,
              children: [
                _buildOverviewCard(
                  title: 'Assets',
                  isWide: isWide,
                  constraints: constraints,
                  child: Watch((context) {
                    if (_assetsState.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final total = _assetsState.assetCount.value;
                    final active = _assetsState.activeAssets.value.length;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: SemanticColors.infoBg,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.inventory_2,
                                color: SemanticColors.info,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: SemanticSpacing.section),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('$total Total', style: Semantic.cardTitle),
                                Text('$active Active',
                                    style: Semantic.bodySecondary),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: SemanticSpacing.section),
                        AppButton(
                          label: 'View Assets',
                          onPressed: () => context.go(Routes.assetsList),
                          variant: AppButtonVariant.outlined,
                          isFullWidth: true,
                        ),
                      ],
                    );
                  }),
                ),
                _buildOverviewCard(
                  title: 'Team',
                  isWide: isWide,
                  constraints: constraints,
                  child: Watch((context) {
                    if (_membersState.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final total = _membersState.memberCount.value;
                    final active = _membersState.activeMembers.value.length;
                    final pending = _membersState.pendingMembers.value.length;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: SemanticColors.successBg,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.people,
                                color: SemanticColors.success,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: SemanticSpacing.section),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('$total Total', style: Semantic.cardTitle),
                                Text(
                                  '$active Active, $pending Pending',
                                  style: Semantic.bodySecondary,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: SemanticSpacing.section),
                        AppButton(
                          label: 'Manage Team',
                          onPressed: () => context.go(Routes.settingsMembers),
                          variant: AppButtonVariant.outlined,
                          isFullWidth: true,
                        ),
                      ],
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildOverviewCard({
    required String title,
    required Widget child,
    required bool isWide,
    required BoxConstraints constraints,
  }) {
    final width = isWide
        ? (constraints.maxWidth - SemanticSpacing.section) / 2
        : constraints.maxWidth;

    return Container(
      width: width,
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Semantic.subtitle),
          const SizedBox(height: SemanticSpacing.section),
          child,
        ],
      ),
    );
  }

  String _formatHours(double hours) {
    if (hours < 1) return '${(hours * 60).round()}m';
    if (hours < 24) return '${hours.toStringAsFixed(1)}h';
    final days = hours / 24;
    return '${days.toStringAsFixed(1)}d';
  }

  String _formatChange(double? change) {
    if (change == null) return 'vs last period';
    final sign = change >= 0 ? '+' : '';
    return '$sign${change.toStringAsFixed(1)}% vs last week';
  }
}
