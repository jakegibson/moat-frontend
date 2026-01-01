import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';
import 'hr.dart';

/// Bottom action bar for drawers matching v0 design
/// Typically includes Cancel, optional Delete, and Submit buttons
class MainDrawerActions extends StatelessWidget {
  const MainDrawerActions({
    super.key,
    this.onCancel,
    this.onDelete,
    this.onSubmit,
    this.cancelText = 'Cancel',
    this.deleteText = 'Delete',
    this.submitText = 'Save',
    this.showDelete = false,
    this.isSubmitting = false,
    this.isDeleting = false,
    this.submitEnabled = true,
  });

  final VoidCallback? onCancel;
  final VoidCallback? onDelete;
  final VoidCallback? onSubmit;
  final String cancelText;
  final String deleteText;
  final String submitText;
  final bool showDelete;
  final bool isSubmitting;
  final bool isDeleting;
  final bool submitEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Hr(),
        Padding(
          padding: EdgeInsets.all(AppSizes.spacingLG),
          child: Row(
            children: [
              // Cancel button
              Expanded(
                child: OutlinedButton(
                  onPressed: onCancel ?? () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    side: const BorderSide(color: AppColors.borderPrimary),
                    padding: EdgeInsets.symmetric(vertical: AppSizes.spacingMD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    ),
                  ),
                  child: Text(
                    cancelText,
                    style: AppTextStyles.textSMSemibold,
                  ),
                ),
              ),
              // Delete button (optional)
              if (showDelete) ...[
                SizedBox(width: AppSizes.spacingMD),
                Expanded(
                  child: OutlinedButton(
                    onPressed: isDeleting ? null : onDelete,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.utilityError500,
                      side: const BorderSide(color: AppColors.utilityError500),
                      padding:
                          EdgeInsets.symmetric(vertical: AppSizes.spacingMD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                      ),
                    ),
                    child: isDeleting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.utilityError500,
                            ),
                          )
                        : Text(
                            deleteText,
                            style: AppTextStyles.textSMSemibold.copyWith(
                              color: AppColors.utilityError500,
                            ),
                          ),
                  ),
                ),
              ],
              SizedBox(width: AppSizes.spacingMD),
              // Submit button
              Expanded(
                flex: showDelete ? 1 : 2,
                child: ElevatedButton(
                  onPressed: (submitEnabled && !isSubmitting) ? onSubmit : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueLight700,
                    foregroundColor: AppColors.white,
                    disabledBackgroundColor: AppColors.blueLight700.withValues(alpha: 0.5),
                    padding: EdgeInsets.symmetric(vertical: AppSizes.spacingMD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    ),
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.white,
                          ),
                        )
                      : Text(
                          submitText,
                          style: AppTextStyles.textSMSemiboldWhite,
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
