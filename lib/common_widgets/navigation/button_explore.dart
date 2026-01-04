import 'package:flutter/material.dart';

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
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0711, 0.2449, 0.3898, 0.5346, 0.7230, 1.0754],
            colors: [
              Color(0xFF06B6D4), // Cyan
              Color(0xFF22D3EE),
              Color(0xFF14B8A6), // Teal
              Color(0xFF2DD4BF),
              Color(0xFF0891B2),
              Color(0xFF0E7490),
            ],
            transform: GradientRotation(300 * (3.141592653589793 / 180)),
          ),
          icon: const Icon(
            Icons.explore_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
        SizedBox(height: AppSizes.spacingMD),
        const Text('Explore', style: AppTextStyles.text2XSSemiBoldTertiary),
      ],
    );
  }
}
