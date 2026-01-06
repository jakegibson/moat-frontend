import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';

/// A right-side drawer panel that slides in from the right edge of the screen.
///
/// This matches the Figma design for ticket detail and create ticket views
/// where the drawer overlays the main content on the right side.
class RightSideDrawer extends StatelessWidget {
  final Widget child;
  final double width;
  final VoidCallback? onClose;
  final bool showOverlay;

  const RightSideDrawer({
    super.key,
    required this.child,
    this.width = 420,
    this.onClose,
    this.showOverlay = true,
  });

  /// Shows a right-side drawer as an overlay.
  /// Returns the result when the drawer is closed.
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
    double width = 420,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Close drawer',
      barrierColor: Colors.black26,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: AppColors.transparent,
            child: RightSideDrawer(
              width: width,
              onClose: () => Navigator.of(context).pop(),
              showOverlay: false,
              child: builder(context),
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
      child: child,
    );
  }
}
