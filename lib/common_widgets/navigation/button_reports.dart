import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/app_sizes.dart';
import '../../core/styles/app_text_styles.dart';
import 'main_menu_gradient_button.dart';

class ButtonReports extends StatelessWidget {
  const ButtonReports({super.key, this.selected = false, this.onTap});

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
            colors: const [
              Color(0xFF6366F1), // Indigo
              Color(0xFF818CF8),
              Color(0xFF8B5CF6), // Purple
              Color(0xFFA78BFA),
              Color(0xFF7C3AED),
              Color(0xFF5B21B6),
            ],
            transform: GradientRotation(300 * (3.141592653589793 / 180)),
          ),
          icon: SvgPicture.asset('assets/icons/icon-chart.svg'),
        ),
        SizedBox(height: AppSizes.spacingMD),
        const Text('Reports', style: AppTextStyles.text2XSSemiBoldTertiary),
      ],
    );
  }
}
