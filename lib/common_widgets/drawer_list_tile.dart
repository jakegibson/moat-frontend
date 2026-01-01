import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';

/// List tile for drawer forms matching v0 design
/// Shows a title/label on the left and value/content on the right
class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    this.value,
    this.valueWidget,
    this.trailing,
    this.onTap,
    this.showChevron = false,
    this.padding,
  });

  final String title;
  final String? value;
  final Widget? valueWidget;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showChevron;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: AppSizes.spacingLG,
            vertical: AppSizes.spacingMD,
          ),
      child: Row(
        children: [
          // Title/Label
          Text(
            title,
            style: AppTextStyles.textSMTertiary,
          ),
          const Spacer(),
          // Value or custom widget
          if (valueWidget != null)
            valueWidget!
          else if (value != null)
            Text(
              value!,
              style: AppTextStyles.textSM,
            ),
          // Trailing widget or chevron
          if (trailing != null) ...[
            SizedBox(width: AppSizes.spacingSM),
            trailing!,
          ] else if (showChevron) ...[
            SizedBox(width: AppSizes.spacingSM),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.textTertiary,
            ),
          ],
        ],
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }
}
