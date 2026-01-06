import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_sizes.dart';
import '../../core/styles/app_text_styles.dart';
import 'main_menu_gradient_button.dart';

class ButtonExplore extends StatelessWidget {
  const ButtonExplore({super.key, this.selected = false, this.onTap});

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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0711, 0.2449, 0.3898, 0.5346, 0.7230, 1.0754],
            colors: AppColors.gradientExploreColors,
            transform: GradientRotation(300 * (3.141592653589793 / 180)),
          ),
          icon: Icon(
            Icons.explore_outlined,
            color: AppColors.white,
            size: 20,
          ),
        ),
        SizedBox(height: AppSizes.spacingMD),
        const Text('Explore', style: AppTextStyles.text2XSSemiBoldTertiary),
      ],
    );
  }
}
