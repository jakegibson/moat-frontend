import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_sizes.dart';
import '../../core/styles/app_text_styles.dart';
import 'main_menu_gradient_button.dart';

class ButtonDashboards extends StatelessWidget {
  const ButtonDashboards({super.key, this.selected = false, this.onTap});

  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MainMenuGradientButton(
          onTap: onTap,
          selected: selected,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.blueLight,
              AppColors.blueLight700,
            ],
          ),
          icon: const Icon(
            Icons.dashboard_outlined,
            color: AppColors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: AppSizes.spacingMD),
        const Text('Dashboards', style: AppTextStyles.text2XSSemiBoldTertiary),
      ],
    );
  }
}
