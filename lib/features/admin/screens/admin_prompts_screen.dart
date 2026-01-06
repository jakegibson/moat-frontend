import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/admin_client.dart' show PromptCategory, PromptTemplate;
import '../state/admin_state.dart';

/// Admin: AI Prompts management screen.
class AdminPromptsScreen extends StatefulWidget {
  const AdminPromptsScreen({super.key});

  @override
  State<AdminPromptsScreen> createState() => _AdminPromptsScreenState();
}

class _AdminPromptsScreenState extends State<AdminPromptsScreen> {
  late final AdminState _state;
  PromptCategory? _categoryFilter;

  @override
  void initState() {
    super.initState();
    _state = getIt<AdminState>();
    _state.fetchPromptTemplates();
  }

  List<PromptTemplate> _filterTemplates(List<PromptTemplate> templates) {
    if (_categoryFilter == null) return templates;
    return templates.where((t) => t.category == _categoryFilter).toList();
  }

  Future<void> _deleteTemplate(PromptTemplate template) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Prompt Template'),
        content: Text('Delete "${template.name}"? This cannot be undone.'),
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

    final result = await _state.deletePromptTemplate(template.id);
    if (!mounted) return;
    result.when(
      ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Template deleted')),
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
          const SizedBox(height: SemanticSpacing.normal),
          // Category filter
          Wrap(
            spacing: SemanticSpacing.tight,
            children: [
              FilterChip(
                label: const Text('All'),
                selected: _categoryFilter == null,
                onSelected: (_) => setState(() => _categoryFilter = null),
              ),
              ...PromptCategory.values
                  .where((c) => c != PromptCategory.unspecified)
                  .map((category) {
                return FilterChip(
                  label: Text(_categoryDisplayName(category)),
                  selected: _categoryFilter == category,
                  onSelected: (_) => setState(() => _categoryFilter = category),
                );
              }),
            ],
          ),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoadingPrompts.value &&
                  _state.promptTemplates.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              final allTemplates = _state.promptTemplates.value;
              final templates = _filterTemplates(allTemplates);

              if (templates.isEmpty) {
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
                itemCount: templates.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: SemanticSpacing.normal),
                itemBuilder: (context, index) {
                  final template = templates[index];
                  return PromptTemplateCard(
                    template: template,
                    onDelete: () => _deleteTemplate(template),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  String _categoryDisplayName(PromptCategory category) {
    switch (category) {
      case PromptCategory.extraction:
        return 'Extraction';
      case PromptCategory.analysis:
        return 'Analysis';
      case PromptCategory.generation:
        return 'Generation';
      case PromptCategory.classification:
        return 'Classification';
      case PromptCategory.unspecified:
        return 'Unknown';
    }
  }
}

/// Card displaying a prompt template
class PromptTemplateCard extends StatelessWidget {
  final PromptTemplate template;
  final VoidCallback onDelete;

  const PromptTemplateCard({
    super.key,
    required this.template,
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
              Icon(Icons.psychology, color: SemanticColors.primary),
              const SizedBox(width: SemanticSpacing.tight),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(template.name, style: Semantic.formLabel),
                    if (template.description.isNotEmpty)
                      Text(template.description, style: Semantic.caption),
                  ],
                ),
              ),
              PromptCategoryBadge(
                label: _categoryShortName(template.category),
                isPositive: true,
              ),
              const SizedBox(width: SemanticSpacing.tight),
              Text('${template.versionCount} versions', style: Semantic.caption),
              IconButton(
                icon: Icon(Icons.delete, size: 18, color: SemanticColors.error),
                onPressed: onDelete,
                tooltip: 'Delete',
              ),
            ],
          ),
          const SizedBox(height: SemanticSpacing.tight),
          Row(
            children: [
              Text('Key: ${template.key}', style: Semantic.caption),
            ],
          ),
        ],
      ),
    );
  }

  String _categoryShortName(PromptCategory category) {
    switch (category) {
      case PromptCategory.extraction:
        return 'Extract';
      case PromptCategory.analysis:
        return 'Analyze';
      case PromptCategory.generation:
        return 'Generate';
      case PromptCategory.classification:
        return 'Classify';
      case PromptCategory.unspecified:
        return 'Other';
    }
  }
}

/// Badge for prompt category
class PromptCategoryBadge extends StatelessWidget {
  final String label;
  final bool isPositive;

  const PromptCategoryBadge({
    super.key,
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
