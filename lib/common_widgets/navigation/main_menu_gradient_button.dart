import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: selected ? Colors.white : Colors.transparent,
            width: selected ? 4.0 : 0.0,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    offset: const Offset(-1, 2),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
