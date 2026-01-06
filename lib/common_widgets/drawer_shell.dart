import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';
import 'hr.dart';

/// Standardized drawer shell component for consistent right-side drawer UI.
///
/// Provides a complete drawer layout with:
/// - Consistent container styling (width, shadow, border)
/// - Header with close button and title
/// - Scrollable body area
/// - Optional footer/actions section
///
/// Example usage:
/// ```dart
/// DrawerShell(
///   title: 'Create Ticket',
///   onClose: () => Navigator.of(context).pop(),
///   body: MyFormContent(),
///   footer: DrawerShellActions(
///     onCancel: () => Navigator.of(context).pop(),
///     onSubmit: _handleSubmit,
///     submitText: 'Create',
///   ),
/// )
/// ```
class DrawerShell extends StatelessWidget {
  /// The drawer title displayed in the header.
  final String title;

  /// Called when the close button is pressed.
  /// Defaults to `Navigator.of(context).pop()` if not provided.
  final VoidCallback? onClose;

  /// Optional widget displayed after the title in the header.
  final Widget? trailing;

  /// The main content of the drawer.
  /// Wrapped in a scrollable area by default.
  final Widget body;

  /// Optional footer widget, typically [DrawerShellActions].
  /// Displayed at the bottom with a divider above.
  final Widget? footer;

  /// Drawer width. Defaults to 420.
  final double width;

  /// Whether to show a divider below the header.
  final bool showHeaderDivider;

  /// Whether the body should be scrollable.
  /// Set to false if body handles its own scrolling.
  final bool scrollableBody;

  /// Padding for the body content.
  final EdgeInsets bodyPadding;

  const DrawerShell({
    required this.title,
    required this.body,
    this.onClose,
    this.trailing,
    this.footer,
    this.width = 420,
    this.showHeaderDivider = true,
    this.scrollableBody = true,
    this.bodyPadding = const EdgeInsets.all(16),
    super.key,
  });

  /// Shows a drawer as a modal overlay from the right side.
  ///
  /// Returns the result when the drawer is closed.
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget body,
    Widget? trailing,
    Widget? footer,
    double width = 420,
    bool barrierDismissible = true,
    bool showHeaderDivider = true,
    bool scrollableBody = true,
    EdgeInsets bodyPadding = const EdgeInsets.all(16),
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Close drawer',
      barrierColor: AppColors.black.withAlpha(66),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: AppColors.transparent,
            child: DrawerShell(
              title: title,
              body: body,
              trailing: trailing,
              footer: footer,
              width: width,
              showHeaderDivider: showHeaderDivider,
              scrollableBody: scrollableBody,
              bodyPadding: bodyPadding,
              onClose: () => Navigator.of(context).pop(),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ));

        return SlideTransition(
          position: slideAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: screenHeight,
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          left: BorderSide(color: AppColors.borderPrimary),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSM,
            blurRadius: 24,
            offset: Offset(-8, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          _DrawerHeader(
            title: title,
            onClose: onClose ?? () => Navigator.of(context).pop(),
            trailing: trailing,
            showDivider: showHeaderDivider,
          ),

          // Body
          Expanded(
            child: scrollableBody
                ? SingleChildScrollView(
                    padding: bodyPadding,
                    child: body,
                  )
                : Padding(
                    padding: bodyPadding,
                    child: body,
                  ),
          ),

          // Footer
          if (footer != null) footer!,
        ],
      ),
    );
  }
}

/// Header component for [DrawerShell].
class _DrawerHeader extends StatelessWidget {
  final String title;
  final VoidCallback onClose;
  final Widget? trailing;
  final bool showDivider;

  const _DrawerHeader({
    required this.title,
    required this.onClose,
    this.trailing,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(AppSizes.spacingLG),
          child: Row(
            children: [
              // Close button
              _CloseButton(onTap: onClose),
              SizedBox(width: AppSizes.spacingMD),
              // Title
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.textLGSemibold,
                ),
              ),
              // Trailing widget
              if (trailing != null) trailing!,
            ],
          ),
        ),
        if (showDivider) const Hr(),
      ],
    );
  }
}

/// Close button matching design system.
class _CloseButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CloseButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusSM),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.bgQuaternary,
          borderRadius: BorderRadius.circular(AppSizes.radiusSM),
        ),
        child: const Icon(
          Icons.close,
          size: 18,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

/// Standard action buttons for drawer footer.
///
/// Provides consistent Cancel, optional Delete, and Submit buttons.
class DrawerShellActions extends StatelessWidget {
  /// Called when Cancel is pressed. Defaults to `Navigator.pop()`.
  final VoidCallback? onCancel;

  /// Called when Delete is pressed. Only shown if [showDelete] is true.
  final VoidCallback? onDelete;

  /// Called when Submit is pressed.
  final VoidCallback? onSubmit;

  /// Text for the cancel button.
  final String cancelText;

  /// Text for the delete button.
  final String deleteText;

  /// Text for the submit button.
  final String submitText;

  /// Whether to show the delete button.
  final bool showDelete;

  /// Whether the submit action is in progress.
  final bool isSubmitting;

  /// Whether the delete action is in progress.
  final bool isDeleting;

  /// Whether the submit button should be enabled.
  final bool submitEnabled;

  const DrawerShellActions({
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
    super.key,
  });

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
                    disabledBackgroundColor:
                        AppColors.blueLight700.withValues(alpha: 0.5),
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

/// Pill-style action buttons for drawer footer.
///
/// Alternative style with rounded pill buttons, matching CreateTicketDrawer design.
class DrawerShellPillActions extends StatelessWidget {
  /// Called when Cancel is pressed. Defaults to `Navigator.pop()`.
  final VoidCallback? onCancel;

  /// Called when Submit is pressed.
  final VoidCallback? onSubmit;

  /// Text for the cancel button.
  final String cancelText;

  /// Text for the submit button.
  final String submitText;

  /// Whether the submit action is in progress.
  final bool isSubmitting;

  /// Whether the submit button should be enabled.
  final bool submitEnabled;

  const DrawerShellPillActions({
    this.onCancel,
    this.onSubmit,
    this.cancelText = 'Cancel',
    this.submitText = 'Submit',
    this.isSubmitting = false,
    this.submitEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacing2XL,
        vertical: AppSizes.spacingXL,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.bgSecondary)),
      ),
      child: isSubmitting
          ? const Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Cancel button
                GestureDetector(
                  onTap: onCancel ?? () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.spacingXL,
                      vertical: AppSizes.spacingMD + 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                      border: Border.all(color: AppColors.borderSecondary),
                    ),
                    child: Text(
                      cancelText,
                      style: AppTextStyles.textSMSemibold,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.spacingLG),
                // Submit button
                GestureDetector(
                  onTap: submitEnabled ? onSubmit : null,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.spacingXL,
                      vertical: AppSizes.spacingMD + 2,
                    ),
                    decoration: BoxDecoration(
                      color: submitEnabled
                          ? AppColors.primary
                          : AppColors.bgQuaternary,
                      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                    ),
                    child: Text(
                      submitText,
                      style: AppTextStyles.textSMSemibold.copyWith(
                        color:
                            submitEnabled ? AppColors.white : AppColors.textTertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
