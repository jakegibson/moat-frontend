import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class AssetsPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;
  final Function(int) onPageChanged;
  final bool isLoading;

  const AssetsPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    required this.onPageChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) {
      // Don't show pagination if there's only one page
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacingXL,
        vertical: AppSizes.spacingLG,
      ),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous button
          _buildNavigationButton(
            icon: Icons.chevron_left,
            label: 'Previous',
            onPressed: currentPage > 1 && !isLoading
                ? () => onPageChanged(currentPage - 1)
                : null,
            iconFirst: true,
          ),

          SizedBox(width: AppSizes.spacingMD),

          // Page numbers
          ..._buildPageNumbers(),

          SizedBox(width: AppSizes.spacingMD),

          // Next button
          _buildNavigationButton(
            icon: Icons.chevron_right,
            label: 'Next',
            onPressed: currentPage < totalPages && !isLoading
                ? () => onPageChanged(currentPage + 1)
                : null,
            iconFirst: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    required bool iconFirst,
  }) {
    final isDisabled = onPressed == null;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacingMD,
          vertical: AppSizes.spacingSM,
        ),
        foregroundColor:
            isDisabled ? AppColors.textTertiary : AppColors.textSecondary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: iconFirst
            ? [
                Icon(
                  icon,
                  size: 20,
                  color: isDisabled
                      ? AppColors.textTertiary
                      : AppColors.textSecondary,
                ),
                SizedBox(width: AppSizes.spacingXS),
                Text(
                  label,
                  style: AppTextStyles.textSMMedium.copyWith(
                    color: isDisabled
                        ? AppColors.textTertiary
                        : AppColors.textSecondary,
                  ),
                ),
              ]
            : [
                Text(
                  label,
                  style: AppTextStyles.textSMMedium.copyWith(
                    color: isDisabled
                        ? AppColors.textTertiary
                        : AppColors.textSecondary,
                  ),
                ),
                SizedBox(width: AppSizes.spacingXS),
                Icon(
                  icon,
                  size: 20,
                  color: isDisabled
                      ? AppColors.textTertiary
                      : AppColors.textSecondary,
                ),
              ],
      ),
    );
  }

  List<Widget> _buildPageNumbers() {
    List<Widget> pages = [];
    const int maxVisible = 10;

    if (totalPages <= maxVisible) {
      // Show all pages
      for (int i = 1; i <= totalPages; i++) {
        if (i > 1) pages.add(SizedBox(width: AppSizes.spacingXS));
        pages.add(_buildPageButton(i));
      }
    } else {
      // Smart pagination with ellipsis
      // Always show first page
      pages.add(_buildPageButton(1));

      // Calculate range around current page
      int start = max(2, currentPage - 3);
      int end = min(totalPages - 1, currentPage + 3);

      // Adjust range if we're near the beginning or end
      if (currentPage <= 4) {
        end = min(7, totalPages - 1);
      } else if (currentPage >= totalPages - 3) {
        start = max(totalPages - 6, 2);
      }

      if (start > 2) {
        pages.add(SizedBox(width: AppSizes.spacingXS));
        pages.add(_buildEllipsis());
      }

      for (int i = start; i <= end; i++) {
        pages.add(SizedBox(width: AppSizes.spacingXS));
        pages.add(_buildPageButton(i));
      }

      if (end < totalPages - 1) {
        pages.add(SizedBox(width: AppSizes.spacingXS));
        pages.add(_buildEllipsis());
      }

      // Always show last page
      pages.add(SizedBox(width: AppSizes.spacingXS));
      pages.add(_buildPageButton(totalPages));
    }

    return pages;
  }

  Widget _buildPageButton(int pageNumber) {
    final isCurrentPage = pageNumber == currentPage;

    return SizedBox(
      width: 36,
      height: 36,
      child: TextButton(
        onPressed: !isCurrentPage && !isLoading
            ? () => onPageChanged(pageNumber)
            : null,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor:
              isCurrentPage ? AppColors.bgSecondary : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusSM),
          ),
        ),
        child: Text(
          pageNumber.toString(),
          style: AppTextStyles.textSMMedium.copyWith(
            color:
                isCurrentPage ? AppColors.textPrimary : AppColors.textSecondary,
            fontWeight: isCurrentPage ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildEllipsis() {
    return SizedBox(
      width: 36,
      height: 36,
      child: Center(
        child: Text(
          '...',
          style: AppTextStyles.textSMMedium.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
      ),
    );
  }
}
