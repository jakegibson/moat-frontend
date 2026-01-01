import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../core/styles/app_colors.dart';
import 'main_menu_gradient_button.dart';

class ButtonAdmin extends StatelessWidget {
  const ButtonAdmin({
    super.key,
    this.selected = false,
    this.onTap,
  });

  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MainMenuGradientButton(
      selected: selected,
      onTap: onTap,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: selected
            ? [
                AppColors.admin.withValues(alpha: 0.8),
                AppColors.admin,
              ]
            : [AppColors.bgSecondary],
        stops: selected ? const [0.0, 1.0] : const [0.0],
      ),
      icon: Icon(
        selected
            ? PhosphorIcons.shieldChevron(PhosphorIconsStyle.fill)
            : PhosphorIcons.shieldChevron(PhosphorIconsStyle.light),
        color: selected ? AppColors.white : AppColors.textSecondary,
        size: 24,
      ),
    );
  }
}
