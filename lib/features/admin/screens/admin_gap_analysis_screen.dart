import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../../../gen/moat/v1/admin.pb.dart' as admin;
import '../state/admin_state.dart';

/// Admin: Gap Analysis screen.
class AdminGapAnalysisScreen extends StatefulWidget {
  const AdminGapAnalysisScreen({super.key});

  @override
  State<AdminGapAnalysisScreen> createState() => _AdminGapAnalysisScreenState();
}

class _AdminGapAnalysisScreenState extends State<AdminGapAnalysisScreen> {
  late final AdminState _state;
  String? _selectedCompanyId;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchCompanySummaries();
  }

  void _runAnalysis() {
    if (_selectedCompanyId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a company first')),
      );
      return;
    }
    _state.fetchGapAnalysis(_selectedCompanyId!);
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
            subtitle: 'Analyze asset data completeness and quality.',
            actions: [
              AppButton(
                label: 'Run Analysis',
                onPressed: _runAnalysis,
                isFullWidth: false,
                icon: const Icon(Icons.play_arrow, size: 18),
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          // Company selector
          Watch((context) {
            final companies = _state.companySummaries.value;
            return Row(
              children: [
                Text('Company:', style: Semantic.caption),
                const SizedBox(width: SemanticSpacing.tight),
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<String?>(
                    initialValue: _selectedCompanyId,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Select a company',
                    ),
                    items: companies
                        .map((c) => DropdownMenuItem(
                              value: c.companyId,
                              child: Text(c.companyName),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _selectedCompanyId = v),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingGapAnalysis.value) {
                return const Center(child: CircularProgressIndicator());
              }

              final analysis = _state.gapAnalysis.value;
              if (analysis == null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.assessment,
                          size: 64, color: AppColors.textTertiary),
                      const SizedBox(height: SemanticSpacing.section),
                      Text('Select a company and run analysis',
                          style: Semantic.cardTitle),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryCard(analysis),
                    const SizedBox(height: SemanticSpacing.section),
                    _buildFieldCompletenessSection(analysis),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(admin.GapAnalysisResponse analysis) {
    final completenessPercent =
        analysis.overallCompletionPercentage.toStringAsFixed(1);
    final color = analysis.overallCompletionPercentage >= 80
        ? SemanticColors.success
        : analysis.overallCompletionPercentage >= 50
            ? SemanticColors.warning
            : SemanticColors.error;

    return Container(
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: color.withValues(alpha: 0.1),
            child: Text(
              '$completenessPercent%',
              style: Semantic.sectionTitle.copyWith(color: color),
            ),
          ),
          const SizedBox(width: SemanticSpacing.section),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Overall Completeness', style: Semantic.sectionTitle),
                const SizedBox(height: SemanticSpacing.tight),
                Text(
                  'Total assets: ${analysis.totalAssets}',
                  style: Semantic.body,
                ),
                Text(
                  'Fields analyzed: ${analysis.fieldCompleteness.length}',
                  style: Semantic.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldCompletenessSection(admin.GapAnalysisResponse analysis) {
    if (analysis.fieldCompleteness.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Field Completeness', style: Semantic.sectionTitle),
        const SizedBox(height: SemanticSpacing.normal),
        ...analysis.fieldCompleteness
            .map((fc) => FieldCompletenessCard(field: fc)),
      ],
    );
  }
}

/// Card displaying field completeness metrics
class FieldCompletenessCard extends StatelessWidget {
  final admin.FieldCompleteness field;

  const FieldCompletenessCard({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    final completenessPercent = field.completionPercentage.toStringAsFixed(1);
    final color = field.completionPercentage >= 80
        ? SemanticColors.success
        : field.completionPercentage >= 50
            ? SemanticColors.warning
            : SemanticColors.error;

    return Container(
      margin: const EdgeInsets.only(bottom: SemanticSpacing.normal),
      padding: const EdgeInsets.all(SemanticSpacing.cardPadding),
      decoration: BoxDecoration(
        color: SemanticColors.bgCard,
        border: Border.all(color: SemanticColors.border),
        borderRadius: BorderRadius.circular(SemanticRadius.card),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(field.fieldName, style: Semantic.formLabel),
                const SizedBox(height: 4.0),
                Text(
                  '${field.filledCount} filled, ${field.missingCount} missing',
                  style: Semantic.caption,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(SemanticRadius.small),
            ),
            child: Text(
              '$completenessPercent%',
              style: Semantic.body.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
