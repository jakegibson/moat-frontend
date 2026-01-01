import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/task_models.dart';

class TicketStatusBadge extends StatelessWidget {
  final TaskStatus status;
  final bool small;
  final bool compact;
  final TicketStatusBadgeSize size;

  const TicketStatusBadge({
    required this.status,
    this.small = false,
    this.compact = false,
    this.size = TicketStatusBadgeSize.medium,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSmall = small || size == TicketStatusBadgeSize.small;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 6.0 : 8.0,
        vertical: isSmall ? 1.0 : 2.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      child: Row(
        spacing: isSmall ? AppSizes.radiusXS : AppSizes.radiusSM,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _getStatusColor(),
            ),
            width: isSmall ? 4 : 6,
            height: isSmall ? 4 : 6,
          ),
          if (!compact)
            Text(
              status.displayName,
              style: isSmall
                  ? AppTextStyles.textXSSecondary
                  : AppTextStyles.textSMSecondary,
            ),
        ],
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case TaskStatus.created:
        return AppColors.utilityWarning500;
      case TaskStatus.inProgress:
        return AppColors.utilityGreen500;
      case TaskStatus.onHold:
        return AppColors.utilityBlue500;
      case TaskStatus.resolved:
        return AppColors.utilityGray500;
      default:
        return AppColors.utilityGray500;
    }
  }
}

enum TicketStatusBadgeSize { small, medium, large }
