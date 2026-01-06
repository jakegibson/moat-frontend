import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';

/// Reusable text form field with consistent styling.
///
/// Provides a labeled text input with:
/// - Consistent label styling
/// - Standard input decoration
/// - Optional validation
/// - Support for password fields and multiline
///
/// Example usage:
/// ```dart
/// AppTextFormField(
///   label: 'Email',
///   controller: _emailController,
///   validator: (value) => value?.isEmpty == true ? 'Required' : null,
/// )
/// ```
class AppTextFormField extends StatelessWidget {
  /// The label displayed above the text field.
  final String label;

  /// Controller for the text field.
  final TextEditingController controller;

  /// Optional validation function.
  final String? Function(String?)? validator;

  /// Whether to obscure the text (for passwords).
  final bool obscureText;

  /// Maximum number of lines for the text field.
  final int? maxLines;

  /// Hint text displayed when the field is empty.
  final String? hintText;

  /// Keyboard type for the text field.
  final TextInputType? keyboardType;

  /// Text input action for the keyboard.
  final TextInputAction? textInputAction;

  /// Called when the field is submitted.
  final void Function(String)? onFieldSubmitted;

  /// Whether the field is enabled.
  final bool enabled;

  /// Optional prefix icon.
  final Widget? prefixIcon;

  /// Optional suffix icon.
  final Widget? suffixIcon;

  /// Focus node for the text field.
  final FocusNode? focusNode;

  /// Whether the field should autofocus.
  final bool autofocus;

  /// Called when the text changes.
  final void Function(String)? onChanged;

  const AppTextFormField({
    required this.label,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.autofocus = false,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        Text(
          label,
          style: AppTextStyles.textSMSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSizes.spacingXS),

        // Text field
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : maxLines,
          enabled: enabled,
          focusNode: focusNode,
          autofocus: autofocus,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          style: AppTextStyles.textMD,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.textMD.copyWith(
              color: AppColors.textTertiary,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: enabled ? AppColors.white : AppColors.bgSecondary,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSizes.spacingMD,
              vertical: AppSizes.spacingMD,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              borderSide: const BorderSide(color: AppColors.borderPrimary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              borderSide: const BorderSide(color: AppColors.borderPrimary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              borderSide: const BorderSide(
                color: AppColors.blueLight700,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              borderSide: const BorderSide(color: AppColors.utilityError500),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              borderSide: const BorderSide(
                color: AppColors.utilityError500,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              borderSide: const BorderSide(color: AppColors.borderSecondary),
            ),
          ),
        ),
      ],
    );
  }
}
