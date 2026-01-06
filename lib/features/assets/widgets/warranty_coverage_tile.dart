import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../data/warranty_models.dart';

/// Tile widget for displaying a warranty coverage with actions.
class WarrantyCoverageTile extends StatelessWidget {
  final WarrantyCoverage coverage;
  final DateTime? warrantyStartDate;
  final DateTime? assetCreatedDate;
  final List<WarrantyCoverageHistory> coverageHistory;
  final VoidCallback? onEdit;
  final VoidCallback? onResolve;

  const WarrantyCoverageTile({
    required this.coverage,
    this.warrantyStartDate,
    this.assetCreatedDate,
    this.coverageHistory = const [],
    this.onEdit,
    this.onResolve,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    DateTime? expirationDateTime = coverage.endDate;
    int? daysBetween;
    bool isExpired = false;
    bool isResolved = false;
    bool wasCreatedAfterExpiration = false;

    // Calculate expiration status
    if (expirationDateTime != null && !coverage.isLifetimeWarranty) {
      daysBetween = expirationDateTime.difference(now).inDays;
      isExpired = expirationDateTime.isBefore(now);

      // Check if asset was created after warranty expiration
      if (assetCreatedDate != null) {
        wasCreatedAfterExpiration = assetCreatedDate!.isAfter(expirationDateTime);
      }

      // Check if this coverage has been resolved
      final filteredHistory = coverageHistory
          .where((h) => h.coverageId == coverage.id)
          .toList();

      if (filteredHistory.isNotEmpty) {
        final expDate = expirationDateTime;
        isResolved = filteredHistory.any((h) {
          final historyDate = h.date;
          final daysDiff = historyDate.difference(expDate).inDays;
          return daysDiff.abs() < 60 || historyDate.isAfter(expDate);
        });
      }
    }

    final backgroundColor =
        isExpired ? AppColors.bgSecondary : AppColors.white;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.spacing2XL),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderPrimary),
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with name, page number, and edit button
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        coverage.name ?? 'Unknown Warranty',
                        style: AppTextStyles.textMDMedium,
                      ),
                    ),
                    if (coverage.pageNumber != null) ...[
                      SizedBox(width: AppSizes.radiusLG),
                      _PageNumberTag(pageNumber: coverage.pageNumber!),
                    ],
                    if (onEdit != null) ...[
                      SizedBox(width: AppSizes.radiusLG),
                      IconButton(
                        icon: const Icon(Icons.edit_outlined, size: 18),
                        onPressed: onEdit,
                        tooltip: 'Edit Warranty',
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),

          // Description
          if (coverage.description != null &&
              coverage.description!.isNotEmpty) ...[
            SizedBox(height: AppSizes.spacingLG),
            Text(
              coverage.description!,
              style: AppTextStyles.textSM.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],

          // Warranty coverage info
          if (coverage.isLifetimeWarranty ||
              expirationDateTime != null ||
              daysBetween != null) ...[
            SizedBox(height: AppSizes.spacingXL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Warranty coverage',
                  style: AppTextStyles.textMD,
                ),
                Text(
                  _formatWarrantyExpiration(),
                  style: AppTextStyles.textMDMedium,
                ),
              ],
            ),

            // Expiration warning and resolve button
            if (!coverage.isLifetimeWarranty &&
                daysBetween != null &&
                daysBetween <= 60) ...[
              SizedBox(height: AppSizes.spacingXL),
              Divider(color: AppColors.borderPrimary),
              SizedBox(height: AppSizes.spacingXL),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isExpired
                        ? 'Expired'
                        : 'Expires in $daysBetween day${daysBetween == 1 ? '' : 's'}',
                    style: AppTextStyles.textMDMedium.copyWith(
                      color: isResolved || wasCreatedAfterExpiration
                          ? AppColors.textPrimary
                          : AppColors.error,
                    ),
                  ),
                  if (onResolve != null)
                    OutlinedButton(
                      onPressed: onResolve,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isResolved
                            ? backgroundColor
                            : wasCreatedAfterExpiration
                                ? AppColors.primary
                                : AppColors.error,
                        foregroundColor: isResolved
                            ? AppColors.textPrimary
                            : AppColors.white,
                        side: BorderSide(
                          color: isResolved
                              ? AppColors.borderPrimary
                              : AppColors.transparent,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: Text(isResolved ? 'Resolved' : 'Resolve'),
                    ),
                ],
              ),
            ],
          ],
        ],
      ),
    );
  }

  String _formatWarrantyExpiration() {
    if (coverage.isLifetimeWarranty) {
      return 'Lifetime';
    }

    if (coverage.endDate != null) {
      return DateFormatter.formatFriendlyDate(dateTime: coverage.endDate!);
    }

    if (coverage.expirationInMonths != null) {
      final months = coverage.expirationInMonths!;
      if (months >= 12 && months % 12 == 0) {
        final years = months ~/ 12;
        return '$years year${years > 1 ? 's' : ''}';
      }
      return '$months month${months > 1 ? 's' : ''}';
    }

    return 'Unknown';
  }
}

/// Small tag showing the page number in the warranty document.
class _PageNumberTag extends StatelessWidget {
  final int pageNumber;

  const _PageNumberTag({required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.spacingSM, vertical: AppSizes.spacingXXS),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(AppSizes.radiusXS),
      ),
      child: Text(
        'p.$pageNumber',
        style: AppTextStyles.textXS.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
