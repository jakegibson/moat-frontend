import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../data/task_models.dart';

/// Update Status overlay for ticket detail drawer
class UpdateStatusOverlay extends StatefulWidget {
  final TaskStatus currentStatus;
  final String taskId;
  final VoidCallback onBack;
  final Future<void> Function(TaskStatus, String?, ResolutionType?) onStatusUpdated;

  const UpdateStatusOverlay({
    super.key,
    required this.currentStatus,
    required this.taskId,
    required this.onBack,
    required this.onStatusUpdated,
  });

  @override
  State<UpdateStatusOverlay> createState() => _UpdateStatusOverlayState();
}

class _UpdateStatusOverlayState extends State<UpdateStatusOverlay> {
  late TaskStatus _selectedStatus;
  final _notesController = TextEditingController();
  ResolutionType _resolutionType = ResolutionType.completed;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.currentStatus;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgSecondary,
      child: Column(
        children: [
          // Header
          Container(
            color: AppColors.white,
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.onBack,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20.0,
                    color: AppColors.textPrimary,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.bgSecondary,
                  ),
                ),
                SizedBox(width: AppSizes.spacingXL),
                const Text(
                  'Update Status',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.borderSecondary),
          // Status options
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spacingXL),
              child: Column(
                children: [
                  StatusSelectorCard(
                    status: TaskStatus.created,
                    description: 'Work has not started on this ticket',
                    isSelected: _selectedStatus == TaskStatus.created,
                    onTap: () => _selectStatus(TaskStatus.created),
                  ),
                  SizedBox(height: AppSizes.spacingXL),
                  StatusSelectorCard(
                    status: TaskStatus.inProgress,
                    description: 'Work has started on this ticket',
                    isSelected: _selectedStatus == TaskStatus.inProgress,
                    onTap: () => _selectStatus(TaskStatus.inProgress),
                  ),
                  SizedBox(height: AppSizes.spacingXL),
                  StatusSelectorCard(
                    status: TaskStatus.onHold,
                    description: 'Waiting for parts or additional information',
                    isSelected: _selectedStatus == TaskStatus.onHold,
                    onTap: () => _selectStatus(TaskStatus.onHold),
                    showNotesField: _selectedStatus == TaskStatus.onHold,
                    notesController: _notesController,
                    notesPlaceholder: 'Why is this on hold?',
                    onSubmit: _submitStatus,
                    isLoading: _isLoading,
                  ),
                  SizedBox(height: AppSizes.spacingXL),
                  StatusSelectorCard(
                    status: TaskStatus.resolved,
                    description: 'Issue has been fixed',
                    isSelected: _selectedStatus == TaskStatus.resolved,
                    onTap: () => _selectStatus(TaskStatus.resolved),
                    showNotesField: _selectedStatus == TaskStatus.resolved,
                    notesController: _notesController,
                    notesPlaceholder: 'How was this resolved?',
                    showResolutionType: true,
                    resolutionType: _resolutionType,
                    onResolutionTypeChanged: (type) {
                      setState(() {
                        _resolutionType = type;
                      });
                    },
                    onSubmit: _submitStatus,
                    isLoading: _isLoading,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectStatus(TaskStatus status) {
    if (status == _selectedStatus) return;

    setState(() {
      _selectedStatus = status;
      _notesController.clear();
    });

    // Auto-submit for Created and In Progress
    if (status == TaskStatus.created || status == TaskStatus.inProgress) {
      _submitStatus();
    }
  }

  Future<void> _submitStatus() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onStatusUpdated(
        _selectedStatus,
        _notesController.text.isEmpty ? null : _notesController.text,
        _selectedStatus == TaskStatus.resolved ? _resolutionType : null,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

/// Status selector card
class StatusSelectorCard extends StatelessWidget {
  final TaskStatus status;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showNotesField;
  final TextEditingController? notesController;
  final String? notesPlaceholder;
  final bool showResolutionType;
  final ResolutionType? resolutionType;
  final Function(ResolutionType)? onResolutionTypeChanged;
  final VoidCallback? onSubmit;
  final bool isLoading;

  const StatusSelectorCard({
    super.key,
    required this.status,
    required this.description,
    required this.isSelected,
    required this.onTap,
    this.showNotesField = false,
    this.notesController,
    this.notesPlaceholder,
    this.showResolutionType = false,
    this.resolutionType,
    this.onResolutionTypeChanged,
    this.onSubmit,
    this.isLoading = false,
  });

  Color get _statusColor {
    switch (status) {
      case TaskStatus.created:
        return AppColors.statusCreated;
      case TaskStatus.inProgress:
        return AppColors.statusInProgress;
      case TaskStatus.onHold:
        return AppColors.statusOnHold;
      case TaskStatus.resolved:
        return AppColors.statusResolved;
      default:
        return AppColors.textTertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.spacingXL),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius16),
          border: Border.all(
            color: isSelected ? _statusColor : AppColors.borderSecondary,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Radio button
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? _statusColor : AppColors.borderPrimary,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _statusColor,
                            ),
                          ),
                        )
                      : null,
                ),
                SizedBox(width: AppSizes.spacingLG),
                Text(
                  status.displayName,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacingMD),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
            ),
            // Expanded content when selected
            if (isSelected && showNotesField) ...[
              SizedBox(height: AppSizes.spacingXL),
              if (showResolutionType && onResolutionTypeChanged != null) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 8),
                  child: Text(
                    'Resolution Type',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                ...ResolutionType.values
                    .where((r) => r != ResolutionType.unspecified)
                    .map((type) => Padding(
                          padding: const EdgeInsets.only(left: 32, bottom: 8),
                          child: GestureDetector(
                            onTap: () => onResolutionTypeChanged!(type),
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: resolutionType == type
                                          ? AppColors.accentBlue
                                          : AppColors.borderPrimary,
                                      width: 2,
                                    ),
                                  ),
                                  child: resolutionType == type
                                      ? Center(
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.accentBlue,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                                SizedBox(width: AppSizes.spacingMD),
                                Text(
                                  type.displayName,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                SizedBox(height: AppSizes.spacingMD),
              ],
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderPrimary),
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  ),
                  child: TextField(
                    controller: notesController,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: notesPlaceholder ?? 'Notes (optional)',
                      hintStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: AppColors.textTertiary,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(AppSizes.spacingLG),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spacingXL),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _statusColor,
                      foregroundColor: AppColors.textWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                      ),
                      elevation: 0,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                        : Text(
                            status == TaskStatus.resolved ? 'Mark as Resolved' : 'Place on Hold',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
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

/// Task completed overlay shown after resolving a ticket
class TaskCompletedOverlay extends StatelessWidget {
  final VoidCallback onBackToTicket;
  final VoidCallback onBackToMyTickets;

  const TaskCompletedOverlay({
    super.key,
    required this.onBackToTicket,
    required this.onBackToMyTickets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgSecondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/confetti.png',
            height: 200,
            errorBuilder: (_, __, ___) => const Icon(
              Icons.celebration,
              size: 100,
              color: AppColors.utilityOrange500,
            ),
          ),
          SizedBox(height: AppSizes.spacing3XL),
          const Text(
            'Complete!',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.spacingXL),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Your ticket has been resolved! We will notify the submitter that you have successfully resolved their issue.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: AppColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: onBackToMyTickets,
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'My Tickets',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.textPrimary,
                  foregroundColor: AppColors.textWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spacingXL),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: onBackToTicket,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textPrimary,
                  side: const BorderSide(color: AppColors.borderPrimary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                  ),
                ),
                child: const Text(
                  'View Ticket',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
