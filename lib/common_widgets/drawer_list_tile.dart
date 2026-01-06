import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';

/// A list tile widget for drawer/settings sections.
///
/// Displays a title with optional leading icon, value, and trailing arrow.
/// Used in profile drawer, settings screens, etc.
class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    this.leading,
    this.value,
    this.showTrailingIcon = false,
    this.onTap,
    this.horizontalPadding = AppSizes.spacing2XL,
  });

  final String title;
  final Widget? leading;
  final String? value;
  final bool showTrailingIcon;
  final VoidCallback? onTap;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: AppColors.bgSecondary,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: AppSizes.spacingLG,
          ),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                SizedBox(width: AppSizes.spacingLG),
              ],
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.textMD,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (value != null) ...[
                SizedBox(width: AppSizes.spacingLG),
                Flexible(
                  child: Text(
                    value!,
                    style: AppTextStyles.textMDTertiary,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
              if (showTrailingIcon) ...[
                SizedBox(width: AppSizes.spacingMD),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                  color: AppColors.textTertiary,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
