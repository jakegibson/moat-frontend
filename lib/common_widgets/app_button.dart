import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';

enum AppButtonVariant { primary, secondary, text, outlined, danger }

/// Reusable button component matching v0 design
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final EdgeInsetsGeometry? padding;
  final AppButtonVariant variant;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool disabled;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.padding,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height = 44.0,
    this.borderRadius = 8.0,
    this.disabled = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || disabled || isLoading;

    switch (variant) {
      case AppButtonVariant.primary:
        return _buildPrimaryButton(isDisabled);
      case AppButtonVariant.secondary:
        return _buildSecondaryButton(isDisabled);
      case AppButtonVariant.outlined:
        return _buildOutlinedButton(isDisabled);
      case AppButtonVariant.text:
        return _buildTextButton(isDisabled);
      case AppButtonVariant.danger:
        return _buildDangerButton(isDisabled);
    }
  }

  Widget _buildPrimaryButton(bool isDisabled) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.blueLight700,
          foregroundColor: foregroundColor ?? AppColors.white,
          disabledBackgroundColor: AppColors.blueLight700.withValues(alpha: 0.5),
          disabledForegroundColor: AppColors.white.withValues(alpha: 0.7),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: AppSizes.spacingLG),
        ),
        child: _buildButtonChild(isDisabled, AppColors.white),
      ),
    );
  }

  Widget _buildSecondaryButton(bool isDisabled) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: FilledButton(
        onPressed: isDisabled ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.bgSecondary,
          foregroundColor: foregroundColor ?? AppColors.textPrimary,
          disabledBackgroundColor: AppColors.bgSecondary.withValues(alpha: 0.5),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: AppSizes.spacingLG),
        ),
        child: _buildButtonChild(isDisabled, AppColors.textPrimary),
      ),
    );
  }

  Widget _buildOutlinedButton(bool isDisabled) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          foregroundColor: foregroundColor ?? AppColors.textPrimary,
          side: BorderSide(
            color: isDisabled
                ? AppColors.borderPrimary.withValues(alpha: 0.5)
                : AppColors.borderPrimary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: AppSizes.spacingLG),
        ),
        child: _buildButtonChild(isDisabled, AppColors.textPrimary),
      ),
    );
  }

  Widget _buildTextButton(bool isDisabled) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColors.blueLight700,
          padding: padding ?? EdgeInsets.symmetric(horizontal: AppSizes.spacingLG),
        ),
        child: _buildButtonChild(isDisabled, AppColors.blueLight700),
      ),
    );
  }

  Widget _buildDangerButton(bool isDisabled) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.utilityError500,
          foregroundColor: foregroundColor ?? AppColors.white,
          disabledBackgroundColor: AppColors.utilityError500.withValues(alpha: 0.5),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: AppSizes.spacingLG),
        ),
        child: _buildButtonChild(isDisabled, AppColors.white),
      ),
    );
  }

  Widget _buildButtonChild(bool isDisabled, Color indicatorColor) {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: indicatorColor,
        ),
      );
    }

    final textWidget = Text(
      label,
      style: textStyle ?? AppTextStyles.textSMSemibold,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    if (icon == null) {
      return textWidget;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon!,
        SizedBox(width: AppSizes.spacingSM),
        textWidget,
      ],
    );
  }
}
