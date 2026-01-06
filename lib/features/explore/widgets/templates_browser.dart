import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/explore_client.dart';
import '../state/explore_state.dart';

/// Browser for pre-built query templates.
class TemplatesBrowser extends StatefulWidget {
  final ExploreState state;

  const TemplatesBrowser({super.key, required this.state});

  @override
  State<TemplatesBrowser> createState() => _TemplatesBrowserState();
}

class _TemplatesBrowserState extends State<TemplatesBrowser> {
  @override
  void initState() {
    super.initState();
    // Load templates on mount if not already loaded
    if (widget.state.templates.value.isEmpty) {
      widget.state.loadTemplates();
    }
  }

  IconData _getIconForTemplate(String iconName) {
    switch (iconName) {
      case 'warning':
        return Icons.warning_amber_outlined;
      case 'location_on':
        return Icons.location_on_outlined;
      case 'schedule':
        return Icons.schedule_outlined;
      case 'check_circle':
        return Icons.check_circle_outline;
      case 'trending_up':
        return Icons.trending_up_outlined;
      case 'inventory':
        return Icons.inventory_2_outlined;
      case 'analytics':
        return Icons.analytics_outlined;
      case 'assessment':
        return Icons.assessment_outlined;
      case 'build':
        return Icons.build_outlined;
      case 'construction':
        return Icons.construction_outlined;
      case 'home':
        return Icons.home_outlined;
      default:
        return Icons.insights_outlined;
    }
  }

  Color _getColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'assets':
        return AppColors.utilityBlue500;
      case 'tasks':
        return AppColors.utilityGreen500;
      case 'warranty':
        return AppColors.utilityWarning500;
      case 'locations':
        return AppColors.blueLight;
      default:
        return AppColors.utilityGray500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final isLoading = widget.state.isLoadingTemplates.value;
      final templates = widget.state.templates.value;
      final categories = widget.state.templateCategories;
      final error = widget.state.error.value;

      if (isLoading && templates.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.spacing2XL),
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (error != null && templates.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.spacingLG),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,
                    size: 32, color: AppColors.utilityError500),
                const SizedBox(height: AppSizes.spacingMD),
                Text(
                  'Failed to load templates',
                  style: AppTextStyles.textSM
                      .copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSizes.spacingMD),
                TextButton(
                  onPressed: () => widget.state.loadTemplates(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      }

      if (templates.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.spacingLG),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lightbulb_outline,
                    size: 48, color: AppColors.textTertiary.withValues(alpha: 0.5)),
                const SizedBox(height: AppSizes.spacingMD),
                Text(
                  'No templates available',
                  style: AppTextStyles.textSM
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        );
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.spacingLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header text
            Text(
              'Quick Insights',
              style: AppTextStyles.textSMSemibold,
            ),
            const SizedBox(height: AppSizes.spacingXS),
            Text(
              'Pre-built queries for common questions',
              style: AppTextStyles.textXS.copyWith(color: AppColors.textTertiary),
            ),
            const SizedBox(height: AppSizes.spacingLG),

            // Templates by category
            for (final category in categories) ...[
              _buildCategorySection(
                category,
                widget.state.getTemplatesByCategory(category),
              ),
              const SizedBox(height: AppSizes.spacingLG),
            ],
          ],
        ),
      );
    });
  }

  Widget _buildCategorySection(String category, List<QueryTemplate> templates) {
    final color = _getColorForCategory(category);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category header
        Row(
          children: [
            Container(
              width: 4,
              height: 16,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: AppSizes.spacingSM),
            Text(
              category,
              style: AppTextStyles.textXS.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spacingSM),

        // Template cards
        ...templates.map((template) => Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.spacingSM),
              child: _buildTemplateCard(template, color),
            )),
      ],
    );
  }

  Widget _buildTemplateCard(QueryTemplate template, Color accentColor) {
    return Watch((context) {
      final isLoading = widget.state.isLoadingData.value;

      return Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        child: InkWell(
          onTap: isLoading ? null : () => widget.state.applyTemplate(template),
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          child: Container(
            padding: const EdgeInsets.all(AppSizes.spacingMD),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderSecondary),
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            ),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                  ),
                  child: Icon(
                    _getIconForTemplate(template.icon),
                    size: 18,
                    color: accentColor,
                  ),
                ),
                const SizedBox(width: AppSizes.spacingMD),

                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        template.name,
                        style: AppTextStyles.textSMSemibold,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        template.description,
                        style: AppTextStyles.textXS
                            .copyWith(color: AppColors.textTertiary),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Arrow
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
