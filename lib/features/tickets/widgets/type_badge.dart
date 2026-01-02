import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/task_models.dart';

class TypeBadge extends StatelessWidget {
  final TaskType type;

  const TypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final (typeName, textColor, borderColor, bgColor) = _getTypeStyle();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacingXS,
        vertical: AppSizes.spacingXXS,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: Text(
        typeName,
        style: AppTextStyles.textXSMedium.copyWith(color: textColor),
      ),
    );
  }

  (String, Color, Color, Color) _getTypeStyle() {
    switch (type) {
      case TaskType.serviceRequest:
        return (
          'Service Request',
          AppColors.utilityBlue700,
          AppColors.utilityBlue200,
          AppColors.utilityBlue50,
        );
      case TaskType.maintenance:
        // Figma design uses green for Maintenance badges
        return (
          'Maintenance',
          AppColors.utilityGreen700,
          AppColors.utilityGreen200,
          AppColors.utilityGreen50,
        );
      case TaskType.warranty:
        // Figma design uses red/error colors for Warranty badges
        return (
          'Warranty',
          AppColors.utilityError700,
          AppColors.utilityError200,
          AppColors.utilityError50,
        );
      case TaskType.other:
      default:
        return (
          type.displayName,
          AppColors.gray,
          AppColors.borderSecondary,
          AppColors.bgSecondary,
        );
    }
  }
}
