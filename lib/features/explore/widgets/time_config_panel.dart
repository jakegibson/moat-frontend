import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../state/explore_state.dart';

/// Panel for configuring time dimension options.
class TimeConfigPanel extends StatelessWidget {
  final ExploreState state;

  const TimeConfigPanel({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final timeDim = state.selectedTimeDimension.value;
      final dateRange = state.selectedDateRange.value;
      final granularity = state.selectedGranularity.value;

      if (timeDim == null) return const SizedBox.shrink();

      return Container(
        padding: const EdgeInsets.all(AppSizes.spacingMD),
        decoration: BoxDecoration(
          color: AppColors.utilityPurple50,
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          border: Border.all(color: AppColors.utilityPurple200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selected time dimension
            Row(
              children: [
                const Icon(Icons.schedule,
                    size: 16, color: AppColors.utilityPurple500),
                const SizedBox(width: AppSizes.spacingXS),
                Text(
                  timeDim.displayName,
                  style: AppTextStyles.textSM.copyWith(
                    color: AppColors.utilityPurple700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => state.setTimeDimension(null),
                  child: const Icon(Icons.close,
                      size: 16, color: AppColors.utilityPurple500),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spacingMD),

            // Date range
            Text('Date Range',
                style: AppTextStyles.textXS
                    .copyWith(color: AppColors.textTertiary)),
            const SizedBox(height: AppSizes.spacingXS),
            _buildDropdown(
              value: dateRange,
              items: ExploreState.dateRangeOptions,
              onChanged: (value) => state.setDateRange(value),
            ),
            const SizedBox(height: AppSizes.spacingMD),

            // Granularity
            Text('Group By',
                style: AppTextStyles.textXS
                    .copyWith(color: AppColors.textTertiary)),
            const SizedBox(height: AppSizes.spacingXS),
            _buildDropdown(
              value: granularity,
              items: ExploreState.granularityOptions,
              onChanged: (value) => state.setGranularity(value),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.spacingSM,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusSM),
          icon: const Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.textSecondary),
          style: AppTextStyles.textSM.copyWith(color: AppColors.textPrimary),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                _formatLabel(item),
                style: AppTextStyles.textSM.copyWith(color: AppColors.textPrimary),
              ),
            );
          }).toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }

  String _formatLabel(String value) {
    // Capitalize first letter of each word
    return value.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }
}
