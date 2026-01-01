import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_text_styles.dart';

class AppDecorations {
  AppDecorations._();

  static const formInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(20.0),
    hintStyle: AppTextStyles.bodyGray,
    fillColor: AppColors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMD)),
      borderSide: BorderSide(color: AppColors.borderSecondary, width: 1.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMD)),
      borderSide: BorderSide(color: AppColors.borderSecondary, width: 1.0),
    ),
  );

  static const formInputBorderedDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(20.0),
    fillColor: AppColors.white,
    filled: true,
    hintStyle: AppTextStyles.bodyGray,
    labelStyle: AppTextStyles.textXSTertiary,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMD)),
      borderSide: BorderSide(color: AppColors.borderPrimary, width: 1.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMD)),
      borderSide: BorderSide(color: AppColors.borderPrimary, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMD)),
      borderSide: BorderSide(color: AppColors.borderPrimary, width: 1.0),
    ),
  );
}
