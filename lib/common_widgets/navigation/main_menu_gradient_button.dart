import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_sizes.dart';

class MainMenuGradientButton extends StatelessWidget {
  const MainMenuGradientButton({
    super.key,
    required this.gradient,
    required this.icon,
    this.selected = false,
    this.onTap,
  });

  final Gradient gradient;
  final Widget icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(AppSizes.radiusXL),
          border: Border.all(
            color: selected ? AppColors.white : AppColors.transparent,
            width: selected ? 4.0 : 0.0,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
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
          child: Center(child: icon),
        ),
      ),
    );
  }
}
