import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/task_models.dart';
import 'ticket_status_badge.dart';
import 'type_badge.dart';

class MobileTicketCard extends StatelessWidget {
  final TaskWithDetails task;
  final VoidCallback? onTap;

  const MobileTicketCard({
    super.key,
    required this.task,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String? assigneeName = task.assigneeName;

    String locationInfo = '';
    if (task.specificLocation != null && task.specificLocation!.isNotEmpty) {
      locationInfo = '${task.specificLocation} ';
      if (task.locationName != null) {
        locationInfo += '• ${task.locationName}';
      }
    } else if (task.locationName != null) {
      locationInfo = task.locationName!;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius2XL),
          border: Border.all(color: AppColors.borderSecondary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.spacingXL,
                vertical: AppSizes.spacing2XL,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: AppTextStyles.textLGSemibold),
                  if (locationInfo.isNotEmpty)
                    Text(locationInfo, style: AppTextStyles.textSMTertiary),
                  SizedBox(height: AppSizes.spacing2XL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TicketStatusBadge(status: task.status),
                      TypeBadge(type: task.taskType),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.spacingXL,
                vertical: AppSizes.spacingMD,
              ),
              decoration: BoxDecoration(
                color: AppColors.bgSecondarySubtitle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSizes.radius2XL),
                  bottomRight: Radius.circular(AppSizes.radius2XL),
                ),
              ),
              child: assigneeName != null && assigneeName.isNotEmpty
                  ? Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.bgQuaternary,
                          child: Text(
                            assigneeName[0].toUpperCase(),
                            style: AppTextStyles.textXSSemibold,
                          ),
                        ),
                        SizedBox(width: AppSizes.spacingLG),
                        Text(assigneeName, style: AppTextStyles.textSMMedium),
                      ],
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 24,
                          color: AppColors.textTertiary,
                        ),
                        SizedBox(width: AppSizes.spacingLG),
                        Text(
                          'Unassigned',
                          style: AppTextStyles.textSMSecondary,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
