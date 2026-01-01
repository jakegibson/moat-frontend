import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class TimeInQueueBar extends StatelessWidget {
  const TimeInQueueBar({super.key, this.scheduledDate, required this.today});

  final DateTime? scheduledDate;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    int daysInQueue =
        scheduledDate != null ? today.difference(scheduledDate!).inDays : 0;
    String inQueueText = switch (daysInQueue) {
      0 => '< 24h',
      1 => '1d',
      2 => '2d',
      3 => '3d',
      4 => '4d',
      5 => '5d',
      6 => '6d',
      7 => '7d',
      _ => '> 1w',
    };

    Gradient inQueueColor = switch (daysInQueue) {
      0 => LinearGradient(
        colors: [AppColors.utilityGreen500, AppColors.utilityGreen700],
      ),
      1 => LinearGradient(
        colors: [AppColors.utilityGreen500, AppColors.utilityGreen700],
      ),
      2 => LinearGradient(colors: [AppColors.lime, AppColors.moss400]),
      3 => LinearGradient(colors: [AppColors.lime, AppColors.moss400]),
      4 => LinearGradient(
        colors: [AppColors.utilityYellow300, AppColors.utilityYellow300],
      ),
      5 => LinearGradient(
        colors: [AppColors.utilityYellow300, AppColors.utilityYellow300],
      ),
      6 => LinearGradient(
        colors: [AppColors.utilityYellow300, AppColors.utilityYellow300],
      ),
      7 => LinearGradient(
        colors: [AppColors.utilityYellow300, AppColors.utilityYellow300],
      ),
      _ => LinearGradient(
        colors: [AppColors.utilityError500, AppColors.utilityError700],
      ),
    };

    double widthFactor = switch (daysInQueue) {
      0 => 0.1,
      1 => 0.2,
      2 => 0.3,
      3 => 0.4,
      4 => 0.5,
      5 => 0.6,
      6 => 0.7,
      7 => 0.8,
      _ => 1.0,
    };

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: widthFactor,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: inQueueColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.radiusXS),
        Text(inQueueText, style: AppTextStyles.textSM),
      ],
    );
  }
}
