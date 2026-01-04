import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/app_sizes.dart';
import '../../core/styles/app_text_styles.dart';
import 'main_menu_gradient_button.dart';

class ButtonReports2 extends StatelessWidget {
  const ButtonReports2({super.key, this.selected = false, this.onTap});

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
              Color(0xFF10B981), // Emerald
              Color(0xFF34D399),
              Color(0xFF6EE7B7),
              Color(0xFF34D399),
              Color(0xFF059669),
              Color(0xFF047857),
            ],
            transform: GradientRotation(300 * (3.141592653589793 / 180)),
          ),
          icon: SvgPicture.asset('assets/icons/icon-chart.svg'),
        ),
        SizedBox(height: AppSizes.spacingMD),
        const Text('Reports 2', style: AppTextStyles.text2XSSemiBoldTertiary),
      ],
    );
  }
}
