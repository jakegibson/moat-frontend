import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';

/// Simple horizontal rule/divider matching v0 design
class Hr extends StatelessWidget {
  const Hr({
    super.key,
    this.color,
    this.height = 1.0,
    this.margin,
  });

  final Color? color;
  final double height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      color: color ?? AppColors.borderPrimary,
    );
  }
}
