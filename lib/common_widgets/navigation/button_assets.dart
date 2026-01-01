import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/app_sizes.dart';
import '../../core/styles/app_text_styles.dart';
import 'main_menu_gradient_button.dart';

class ButtonAssets extends StatelessWidget {
  const ButtonAssets({super.key, this.selected = false, this.onTap});

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
            stops: const [0.0705, 0.3463, 0.4006, 0.4758, 0.6513, 0.9396],
            colors: const [
              Color(0xFFC37B4C),
              Color(0xFFA4B3B3),
              Color(0xFF9FBCC3),
              Color(0xFF8DAFBB),
              Color(0xFF317293),
              Color(0xFF004263),
            ],
            transform: GradientRotation(10 * (3.141592653589793 / 180)),
          ),
          icon: SvgPicture.asset('assets/icons/icon-box.svg'),
        ),
        SizedBox(height: AppSizes.spacingMD),
        const Text('Assets', style: AppTextStyles.text2XSSemiBoldTertiary),
      ],
    );
  }
}
