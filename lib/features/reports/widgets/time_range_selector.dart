import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

enum TimeRange {
  twelveMonths('12 months'),
  thirtyDays('30 days'),
  sevenDays('7 days'),
  twentyFourHours('24 hours');

  final String label;
  const TimeRange(this.label);
}

class TimeRangeSelector extends StatelessWidget {
  const TimeRangeSelector({
    super.key,
    required this.selectedRange,
    required this.onChanged,
  });

  final TimeRange selectedRange;
  final ValueChanged<TimeRange> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: TimeRange.values.map((range) {
          final isSelected = range == selectedRange;
          return GestureDetector(
            onTap: () => onChanged(range),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spacingLG,
                vertical: AppSizes.spacingMD,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.bgPrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(AppSizes.radiusSM),
              ),
              child: Text(
                range.label,
                style: isSelected
                    ? AppTextStyles.textSMSemiboldWhite
                    : AppTextStyles.textSMSecondary,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
