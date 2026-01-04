import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';

/// Page navigation controls for the PDF viewer.
///
/// Displays current page / total pages with previous/next buttons.
class PdfPageNavigation extends StatelessWidget {
  final ValueNotifier<int> currentPage;
  final int totalPages;
  final VoidCallback onPageUp;
  final VoidCallback onPageDown;

  const PdfPageNavigation({
    required this.currentPage,
    required this.totalPages,
    required this.onPageUp,
    required this.onPageDown,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          // Previous page button
          IconButton(
            onPressed: onPageDown,
            icon: const Icon(Icons.keyboard_arrow_up),
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            color: AppColors.textSecondary,
            tooltip: 'Previous page',
          ),
          // Page indicator
          ValueListenableBuilder<int>(
            valueListenable: currentPage,
            builder: (context, page, _) {
              return Text(
                '$page / $totalPages',
                style: AppTextStyles.textSM.copyWith(
                  color: AppColors.textSecondary,
                ),
              );
            },
          ),
          // Next page button
          IconButton(
            onPressed: onPageUp,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            color: AppColors.textSecondary,
            tooltip: 'Next page',
          ),
        ],
      ),
    );
  }
}
