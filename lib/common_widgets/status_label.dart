import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';

/// Status label/badge component matching v0 design
class StatusLabel extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsetsGeometry? padding;

  const StatusLabel({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.padding,
  });

  /// Factory for ticket type labels
  factory StatusLabel.forTicketType(String type) {
    final typeLower = type.toLowerCase();

    if (typeLower.contains('maintenance')) {
      return StatusLabel(
        label: 'Maintenance',
        backgroundColor: AppColors.utilityBlue50,
        textColor: AppColors.utilityBlue700,
      );
    } else if (typeLower.contains('inspection')) {
      return StatusLabel(
        label: 'Inspection',
        backgroundColor: AppColors.utilityGreenLight50,
        textColor: AppColors.utilityGreen700,
      );
    } else if (typeLower.contains('repair')) {
      return StatusLabel(
        label: 'Repair',
        backgroundColor: AppColors.utilityOrange50,
        textColor: AppColors.utilityOrange700,
      );
    } else {
      return StatusLabel(
        label: type,
        backgroundColor: AppColors.bgQuaternary,
        textColor: AppColors.textSecondary,
      );
    }
  }

  /// Factory for ticket status labels
  factory StatusLabel.forTicketStatus(String status) {
    final statusLower = status.toLowerCase();

    if (statusLower.contains('new') || statusLower.contains('open')) {
      return StatusLabel(
        label: 'New',
        backgroundColor: AppColors.utilityBlue50,
        textColor: AppColors.utilityBlue700,
      );
    } else if (statusLower.contains('progress') || statusLower.contains('working')) {
      return StatusLabel(
        label: 'In Progress',
        backgroundColor: AppColors.utilityOrange50,
        textColor: AppColors.utilityOrange700,
      );
    } else if (statusLower.contains('resolved') || statusLower.contains('done')) {
      return StatusLabel(
        label: 'Resolved',
        backgroundColor: AppColors.utilityGreenLight50,
        textColor: AppColors.utilityGreen700,
      );
    } else if (statusLower.contains('closed')) {
      return StatusLabel(
        label: 'Closed',
        backgroundColor: AppColors.bgQuaternary,
        textColor: AppColors.textSecondary,
      );
    } else if (statusLower.contains('pending') || statusLower.contains('blocked')) {
      return StatusLabel(
        label: 'Pending',
        backgroundColor: AppColors.utilityAmber50,
        textColor: AppColors.utilityAmber800,
      );
    } else {
      return StatusLabel(
        label: status,
        backgroundColor: AppColors.bgQuaternary,
        textColor: AppColors.textSecondary,
      );
    }
  }

  /// Factory for priority labels
  factory StatusLabel.forPriority(String priority) {
    final priorityLower = priority.toLowerCase();

    if (priorityLower.contains('critical') || priorityLower.contains('urgent')) {
      return StatusLabel(
        label: 'Critical',
        backgroundColor: AppColors.utilityErrorLight50,
        textColor: AppColors.utilityError700,
      );
    } else if (priorityLower.contains('high')) {
      return StatusLabel(
        label: 'High',
        backgroundColor: AppColors.utilityOrange50,
        textColor: AppColors.utilityOrange700,
      );
    } else if (priorityLower.contains('medium')) {
      return StatusLabel(
        label: 'Medium',
        backgroundColor: AppColors.utilityAmber50,
        textColor: AppColors.utilityAmber800,
      );
    } else if (priorityLower.contains('low')) {
      return StatusLabel(
        label: 'Low',
        backgroundColor: AppColors.utilityGreenLight50,
        textColor: AppColors.utilityGreen700,
      );
    } else {
      return StatusLabel(
        label: priority,
        backgroundColor: AppColors.bgQuaternary,
        textColor: AppColors.textSecondary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: AppSizes.spacingMD, vertical: AppSizes.spacingXS),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
      ),
      child: Text(
        label,
        style: AppTextStyles.textXSMedium.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
