import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';

/// Zoom controls for the PDF viewer.
///
/// Displays current zoom level with zoom in/out buttons.
class PdfPageZoom extends StatelessWidget {
  final double zoomLevel;
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;

  const PdfPageZoom({
    required this.zoomLevel,
    required this.onZoomIn,
    required this.onZoomOut,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final zoomPercent = (zoomLevel * 100).round();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Zoom out button
          IconButton(
            onPressed: zoomLevel > 0.5 ? onZoomOut : null,
            icon: const Icon(Icons.remove),
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            color: AppColors.textSecondary,
            disabledColor: AppColors.gray,
            tooltip: 'Zoom out',
          ),
          // Zoom level
          SizedBox(
            width: 44,
            child: Text(
              '$zoomPercent%',
              style: AppTextStyles.textSM.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Zoom in button
          IconButton(
            onPressed: zoomLevel < 2.0 ? onZoomIn : null,
            icon: const Icon(Icons.add),
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            color: AppColors.textSecondary,
            disabledColor: AppColors.gray,
            tooltip: 'Zoom in',
          ),
        ],
      ),
    );
  }
}
