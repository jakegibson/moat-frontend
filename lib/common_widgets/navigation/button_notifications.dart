import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_sizes.dart';
import '../../core/styles/app_text_styles.dart';

class ButtonNotifications extends StatelessWidget {
  const ButtonNotifications({
    super.key,
    this.selected = false,
    this.onTap,
    this.unreadCount = 0,
  });

  final bool selected;
  final VoidCallback? onTap;
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: selected ? AppColors.white : AppColors.transparent,
                  borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: AppColors.black.withAlpha(100),
                            offset: const Offset(-1, 2),
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                          ),
                        ]
                      : [],
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.spacingSM),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/icon-message.svg'),
                  ),
                ),
              ),
            ),
            if (unreadCount > 0)
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.utilityError500,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: AppSizes.spacingMD),
        const Text('Activity', style: AppTextStyles.text2XSSemiBoldTertiary),
      ],
    );
  }
}
