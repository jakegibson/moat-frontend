import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../../../gen/moat/v1/admin.pb.dart' as admin;
import '../state/admin_state.dart';

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
    _state.fetchSystemOverview();
    _state.fetchGenerationStats();
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
            subtitle: 'System performance and usage statistics.',
            actions: [
              AppButton(
                label: 'Refresh',
                onPressed: () {
                  _state.fetchSystemOverview();
                  _state.fetchGenerationStats();
                },
                isFullWidth: false,
                icon: const Icon(Icons.refresh, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingSystemStats.value &&
                  _state.systemOverview.value == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final overview = _state.systemOverview.value;
              final stats = _state.generationStats.value;

              if (overview == null) {
                return const Center(child: Text('No metrics available'));
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOverviewSection(overview),
                    const SizedBox(height: SemanticSpacing.section),
                    if (stats != null) _buildAISection(stats),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewSection(admin.SystemOverviewResponse overview) {
    return MetricsSettingsSection(
      title: 'System Overview',
      children: [
        MetricsRow(
          items: [
            MetricItem(
              label: 'Total Companies',
              value: overview.companies.total.toString(),
            ),
            MetricItem(
              label: 'Total Users',
              value: overview.members.total.toString(),
            ),
            MetricItem(
              label: 'Total Assets',
              value: overview.assets.total.toString(),
            ),
          ],
        ),
        const SizedBox(height: SemanticSpacing.normal),
        MetricsRow(
          items: [
            MetricItem(
              label: 'Total Tasks',
              value: overview.tasks.total.toString(),
            ),
            MetricItem(
              label: 'Total Files',
              value: overview.files.total.toString(),
            ),
            MetricItem(
              label: 'Storage (GB)',
              value: (overview.files.totalSizeBytes.toInt() /
                      (1024 * 1024 * 1024))
                  .toStringAsFixed(2),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAISection(admin.GenerationStats stats) {
    return MetricsSettingsSection(
      title: 'AI Generation Statistics',
      children: [
        MetricsRow(
          items: [
            MetricItem(
              label: 'Total Generations',
              value: stats.totalGenerations.toString(),
            ),
            MetricItem(
              label: 'Successful',
              value: stats.successful.toString(),
            ),
            MetricItem(
              label: 'Failed',
              value: stats.failed.toString(),
              status:
                  stats.failed > 0 ? MetricStatus.warning : MetricStatus.good,
            ),
          ],
        ),
        const SizedBox(height: SemanticSpacing.normal),
        MetricsRow(
          items: [
            MetricItem(
              label: 'Total Tokens',
              value: _formatNumber(stats.totalTokens.toInt()),
            ),
            MetricItem(
              label: 'Avg Latency',
              value: '${stats.avgLatencyMs.toStringAsFixed(0)}ms',
            ),
            MetricItem(
              label: 'Success Rate',
              value: '${(stats.successRate * 100).toStringAsFixed(1)}%',
              status: stats.successRate > 0.95
                  ? MetricStatus.good
                  : MetricStatus.warning,
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

/// Row of metric items
class MetricsRow extends StatelessWidget {
  final List<MetricItem> items;

  const MetricsRow({super.key, required this.items});

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

/// Status indicator for metrics
enum MetricStatus { good, warning, critical }

/// A single metric item display
class MetricItem extends StatelessWidget {
  final String label;
  final String value;
  final MetricStatus? status;

  const MetricItem({
    super.key,
    required this.label,
    required this.value,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color? valueColor;
    if (status != null) {
      switch (status!) {
        case MetricStatus.good:
          valueColor = SemanticColors.success;
        case MetricStatus.warning:
          valueColor = SemanticColors.warning;
        case MetricStatus.critical:
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

/// Section container for metrics
class MetricsSettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MetricsSettingsSection({
    super.key,
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
          Text(title, style: Semantic.sectionTitle),
          const SizedBox(height: SemanticSpacing.normal),
          ...children,
        ],
      ),
    );
  }
}
