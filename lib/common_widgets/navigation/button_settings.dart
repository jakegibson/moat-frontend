import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/app_colors.dart';
import 'main_menu_gradient_button.dart';

class ButtonSettings extends StatelessWidget {
  const ButtonSettings({super.key, this.selected = false, this.onTap});

  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MainMenuGradientButton(
      onTap: onTap,
      selected: selected,
      gradient: LinearGradient(
        colors: selected ? [AppColors.bgSecondary] : [Colors.transparent],
        stops: const [0.0],
      ),
      icon: SvgPicture.asset('assets/icons/icon-settings-gear.svg'),
    );
  }
}
