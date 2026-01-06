import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../reports/data/cube_models.dart';
import '../state/explore_state.dart';

/// Natural language query input with translation preview.
class NLQueryInput extends StatefulWidget {
  final ExploreState state;

  const NLQueryInput({super.key, required this.state});

  @override
  State<NLQueryInput> createState() => _NLQueryInputState();
}

class _NLQueryInputState extends State<NLQueryInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.state.nlQuestion.value;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    widget.state.setNLQuestion(_controller.text);
  }

  void _handleSubmit() {
    if (_controller.text.trim().isNotEmpty) {
      widget.state.translateNaturalLanguage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.spacingLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text('Ask a Question', style: AppTextStyles.textSMSemibold),
          const SizedBox(height: AppSizes.spacingXS),
          Text(
            'Describe what you want to analyze in plain English',
            style: AppTextStyles.textXS.copyWith(color: AppColors.textTertiary),
          ),
          const SizedBox(height: AppSizes.spacingLG),

          // Input field
          _buildInputField(),
          const SizedBox(height: AppSizes.spacingMD),

          // Example questions
          _buildExampleQuestions(),
          const SizedBox(height: AppSizes.spacingXL),

          // Translation result
          Watch((context) {
            final result = widget.state.nlResult.value;
            if (result == null) return const SizedBox.shrink();
            return _buildTranslationResult(result);
          }),

          // Error display
          Watch((context) {
            final error = widget.state.error.value;
            final result = widget.state.nlResult.value;
            if (error == null || result != null) return const SizedBox.shrink();
            return _buildError(error.message);
          }),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Watch((context) {
      final isTranslating = widget.state.isTranslating.value;
      // Watch nlQuestion to rebuild when text changes
      final question = widget.state.nlQuestion.value;

      return Column(
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: !isTranslating,
            maxLines: 3,
            minLines: 2,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleSubmit(),
            decoration: InputDecoration(
              hintText: 'e.g., "How many assets are under warranty?"',
              hintStyle:
                  AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                borderSide: const BorderSide(color: AppColors.borderSecondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                borderSide: const BorderSide(color: AppColors.borderSecondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                borderSide: BorderSide(color: AppColors.blueLight, width: 2),
              ),
              contentPadding: const EdgeInsets.all(AppSizes.spacingMD),
            ),
            style: AppTextStyles.textSM,
          ),
          const SizedBox(height: AppSizes.spacingMD),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: isTranslating || question.trim().isEmpty
                  ? null
                  : _handleSubmit,
              icon: isTranslating
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.white),
                      ),
                    )
                  : const Icon(Icons.auto_awesome, size: 18),
              label: Text(isTranslating ? 'Translating...' : 'Translate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPurple,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.spacingMD,
                  horizontal: AppSizes.spacingLG,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildExampleQuestions() {
    final examples = [
      'Show assets expiring this month',
      'Tasks completed last week by team',
      'Asset count by location',
      'Overdue tasks summary',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Try asking:',
          style: AppTextStyles.textXS.copyWith(
            color: AppColors.textTertiary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSizes.spacingSM),
        Wrap(
          spacing: AppSizes.spacingSM,
          runSpacing: AppSizes.spacingSM,
          children: examples
              .map((example) => _buildExampleChip(example))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildExampleChip(String text) {
    return InkWell(
      onTap: () {
        _controller.text = text;
        widget.state.setNLQuestion(text);
      },
      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spacingMD,
          vertical: AppSizes.spacingSM,
        ),
        decoration: BoxDecoration(
          color: AppColors.grayHighlightBg,
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
          border: Border.all(color: AppColors.borderSecondary),
        ),
        child: Text(
          text,
          style: AppTextStyles.textXS.copyWith(color: AppColors.textSecondary),
        ),
      ),
    );
  }

  Widget _buildTranslationResult(dynamic result) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.spacingMD),
      decoration: BoxDecoration(
        color: AppColors.accentPurpleBg,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        border: Border.all(color: AppColors.accentPurpleBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(Icons.auto_awesome, size: 16, color: AppColors.accentPurple),
              const SizedBox(width: AppSizes.spacingSM),
              Text(
                'AI Translation',
                style: AppTextStyles.textSMSemibold.copyWith(
                  color: AppColors.accentPurple,
                ),
              ),
              const Spacer(),
              _buildConfidenceBadge(result.confidence),
            ],
          ),
          const SizedBox(height: AppSizes.spacingMD),

          // Explanation
          Text(
            result.explanation,
            style: AppTextStyles.textSM.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: AppSizes.spacingMD),

          // Chart type selector
          _buildChartTypeSelector(result.suggestedChartType),
          const SizedBox(height: AppSizes.spacingLG),

          // Run button
          Watch((context) {
            final isLoading = widget.state.isLoadingData.value;

            return SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : () => widget.state.executeNLQuery(),
                icon: isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.white),
                        ),
                      )
                    : const Icon(Icons.play_arrow, size: 18),
                label: Text(isLoading ? 'Running...' : 'Run Query'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueLight700,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.spacingMD,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildConfidenceBadge(double confidence) {
    final percentage = (confidence * 100).round();
    final color = confidence >= 0.8
        ? AppColors.utilityGreen500
        : confidence >= 0.5
            ? AppColors.utilityWarning500
            : AppColors.utilityError500;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spacingSM,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
      ),
      child: Text(
        '$percentage% confident',
        style: AppTextStyles.textXS.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildChartTypeSelector(String suggestedType) {
    // Chart types that work well for data visualization
    const availableTypes = [
      ExplorerChartType.bar,
      ExplorerChartType.line,
      ExplorerChartType.pie,
      ExplorerChartType.table,
      ExplorerChartType.number,
    ];

    return Watch((context) {
      final selectedType = widget.state.chartType.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Visualization',
                style: AppTextStyles.textXS.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: AppSizes.spacingSM),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spacingXS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.accentPurple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                ),
                child: Text(
                  'AI suggests ${suggestedType.toLowerCase()}',
                  style: AppTextStyles.textXS.copyWith(
                    color: AppColors.accentPurple,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spacingSM),
          Wrap(
            spacing: AppSizes.spacingSM,
            runSpacing: AppSizes.spacingSM,
            children: availableTypes.map((type) {
              final isSelected = selectedType == type;
              return InkWell(
                onTap: () => widget.state.setChartType(type),
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingMD,
                    vertical: AppSizes.spacingSM,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.blueLight700
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.blueLight700
                          : AppColors.borderSecondary,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getChartIconForType(type),
                        size: 14,
                        color: isSelected
                            ? AppColors.white
                            : AppColors.textSecondary,
                      ),
                      const SizedBox(width: AppSizes.spacingXS),
                      Text(
                        type.displayName,
                        style: AppTextStyles.textXS.copyWith(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.textPrimary,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }

  IconData _getChartIconForType(ExplorerChartType type) {
    switch (type) {
      case ExplorerChartType.bar:
        return Icons.bar_chart;
      case ExplorerChartType.line:
        return Icons.show_chart;
      case ExplorerChartType.pie:
        return Icons.pie_chart;
      case ExplorerChartType.table:
        return Icons.table_chart;
      case ExplorerChartType.number:
        return Icons.pin;
    }
  }

  Widget _buildError(String error) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.spacingMD),
      decoration: BoxDecoration(
        color: AppColors.utilityError50,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        border: Border.all(color: AppColors.utilityError200),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline,
              size: 18, color: AppColors.utilityError500),
          const SizedBox(width: AppSizes.spacingSM),
          Expanded(
            child: Text(
              error,
              style:
                  AppTextStyles.textSM.copyWith(color: AppColors.utilityError700),
            ),
          ),
        ],
      ),
    );
  }
}
