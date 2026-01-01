import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';
import 'hr.dart';

/// Header component for drawers matching v0 design
/// Includes close button, title, optional trailing widget, and divider
class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({
    super.key,
    required this.title,
    this.trailing,
    this.onClose,
    this.showDivider = true,
  });

  final String title;
  final Widget? trailing;
  final VoidCallback? onClose;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(AppSizes.spacingLG),
          child: Row(
            children: [
              // Close button
              InkWell(
                onTap: onClose ?? () => Navigator.of(context).pop(),
                borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.bgQuaternary,
                    borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(width: AppSizes.spacingMD),
              // Title
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.textLGSemibold,
                ),
              ),
              // Trailing widget (optional)
              if (trailing != null) trailing!,
            ],
          ),
        ),
        if (showDivider) const Hr(),
      ],
    );
  }
}
