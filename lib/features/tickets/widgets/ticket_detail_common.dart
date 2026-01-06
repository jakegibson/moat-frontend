import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../data/task_models.dart';
import 'assignee_dropdown.dart';

/// Status indicator with dot + text and border
class TicketStatusTag extends StatelessWidget {
  final TaskStatus status;

  const TicketStatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color dotColor;
    String text;

    switch (status) {
      case TaskStatus.created:
        dotColor = AppColors.statusCreated;
        text = 'Created';
        break;
      case TaskStatus.inProgress:
        dotColor = AppColors.statusInProgress;
        text = 'In Progress';
        break;
      case TaskStatus.onHold:
        dotColor = AppColors.statusOnHold;
        text = 'On Hold';
        break;
      case TaskStatus.resolved:
        dotColor = AppColors.statusResolved;
        text = 'Resolved';
        break;
      default:
        dotColor = AppColors.textTertiary;
        text = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Status dot
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: AppSizes.spacingSM),
          // Status text
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Tab navigation for Details / Activity
class TicketDetailTabNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final int? activityCount;

  const TicketDetailTabNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    this.activityCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderSecondary),
        ),
      ),
      child: Row(
        children: [
          _TabButton(
            label: 'Details',
            isSelected: selectedIndex == 0,
            onTap: () => onTabSelected(0),
          ),
          SizedBox(width: AppSizes.spacingMD),
          _TabButton(
            label: 'Activity',
            isSelected: selectedIndex == 1,
            onTap: () => onTabSelected(1),
            count: activityCount,
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final int? count;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.textPrimary : AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius2XL),
          border: Border.all(
            color: isSelected ? AppColors.textPrimary : AppColors.borderSecondary,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.textWhite : AppColors.textPrimary,
              ),
            ),
            if (count != null && count! > 0) ...[
              SizedBox(width: AppSizes.spacingSM),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.white : AppColors.bgSecondary,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                child: Center(
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Dialog for reassigning a task
class ReassignDialog extends StatefulWidget {
  final String? currentAssigneeId;
  final String? locationId;

  const ReassignDialog({
    super.key,
    this.currentAssigneeId,
    this.locationId,
  });

  /// Shows the reassign dialog and returns the selected assignment
  static Future<AssignmentSelection?> show(
    BuildContext context, {
    String? currentAssigneeId,
    String? locationId,
  }) {
    return showDialog<AssignmentSelection>(
      context: context,
      builder: (context) => ReassignDialog(
        currentAssigneeId: currentAssigneeId,
        locationId: locationId,
      ),
    );
  }

  @override
  State<ReassignDialog> createState() => _ReassignDialogState();
}

class _ReassignDialogState extends State<ReassignDialog> {
  AssignmentSelection? _selection;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radius16)),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacing3XL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reassign Ticket',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: AppSizes.spacingXL),
            SizedBox(
              width: 300,
              child: AssigneeDropdown(
                locationId: widget.locationId,
                value: _selection,
                onChanged: (value) => setState(() => _selection = value),
              ),
            ),
            SizedBox(height: AppSizes.spacing3XL),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.spacingMD),
                ElevatedButton(
                  onPressed: _selection != null ? () => Navigator.pop(context, _selection) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selection != null ? AppColors.accentBlue : AppColors.bgSecondary,
                    foregroundColor: _selection != null ? AppColors.white : AppColors.textTertiary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Reassign',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper class for picking photos
class PhotoPicker {
  /// Picks a photo using HTML5 file input (web only)
  static Future<PickedFile?> pickPhoto() async {
    // This is a placeholder - the actual implementation uses dart:html
    // which we can't import here directly. The caller should handle this.
    return null;
  }
}

/// Represents a picked file
class PickedFile {
  final String name;
  final List<int>? bytes;
  final int size;
  final String? extension;

  PickedFile({
    required this.name,
    this.bytes,
    required this.size,
    this.extension,
  });
}
