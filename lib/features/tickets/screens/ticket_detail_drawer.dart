import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/right_side_drawer.dart';
import '../../../core/di/injection.dart';
import '../data/task_models.dart';
import '../state/task_detail_state.dart';
import '../widgets/assignee_dropdown.dart';
import '../widgets/photos_section.dart';

/// Design colors (light theme) - matching v0
class _Colors {
  static const Color bgPrimary = Color(0xFFFFFFFF);
  static const Color bgSecondary = Color(0xFFF1F0EE);
  static const Color borderPrimary = Color(0xFFD3D1CF);
  static const Color borderSecondary = Color(0xFFE4E2E0);
  static const Color textPrimary = Color(0xFF161616);
  static const Color textSecondary = Color(0xFF535352);
  static const Color textTertiary = Color(0xFF848281);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color accentBlue = Color(0xFF2563EB);
  static const Color accentBlueBg = Color(0xFFDBEAFE);
  static const Color utilityBlue500 = Color(0xFF3B82F6);
  static const Color utilityOrange500 = Color(0xFFF97316);

  // Status colors
  static const Color statusCreated = Color(0xFF2563EB);
  static const Color statusCreatedBg = Color(0xFFDBEAFE);
  static const Color statusInProgress = Color(0xFFF79009);
  static const Color statusInProgressBg = Color(0xFFFEF3C7);
  static const Color statusOnHold = Color(0xFFF59E0B);
  static const Color statusOnHoldBg = Color(0xFFFEF3C7);
  static const Color statusResolved = Color(0xFF17B26A);
  static const Color statusResolvedBg = Color(0xFFECFDF3);
}

/// A right-side drawer that displays ticket details.
/// Matches v0's EditTicketDrawer design.
class TicketDetailDrawer extends StatefulWidget {
  final String externalId;
  final VoidCallback? onClose;
  final VoidCallback? onUpdated;

  const TicketDetailDrawer({
    super.key,
    required this.externalId,
    this.onClose,
    this.onUpdated,
  });

  /// Shows the ticket detail drawer from the right side.
  static Future<bool?> show(BuildContext context, String externalId) {
    return RightSideDrawer.show<bool>(
      context: context,
      width: 420,
      builder: (context) => TicketDetailDrawer(
        externalId: externalId,
        onClose: () => Navigator.of(context).pop(),
        onUpdated: () => Navigator.of(context).pop(true),
      ),
    );
  }

  @override
  State<TicketDetailDrawer> createState() => _TicketDetailDrawerState();
}

class _TicketDetailDrawerState extends State<TicketDetailDrawer> {
  late final TaskDetailState _state;
  int _selectedTabIndex = 0; // 0 = Details, 1 = Activity
  Widget? _activeOverlay;

  @override
  void initState() {
    super.initState();
    _state = getIt<TaskDetailState>();
    _loadTask();
  }

  void _loadTask() {
    _state.fetchTaskByExternalId(widget.externalId);
  }

  void _loadAttachments(String taskId) {
    _state.fetchAttachments(taskId);
  }

  @override
  void dispose() {
    _state.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          surface: _Colors.bgPrimary,
          onSurface: _Colors.textPrimary,
          primary: _Colors.accentBlue,
        ),
        scaffoldBackgroundColor: _Colors.bgPrimary,
      ),
      child: Container(
        color: _Colors.bgPrimary,
        child: Watch((context) {
          final task = _state.selectedTask.value;
          final isLoading = _state.isLoading.value;
          final error = _state.error.value;

          if (isLoading && task == null) {
            return const Center(
              child: CircularProgressIndicator(color: _Colors.accentBlue),
            );
          }

          if (error != null && task == null) {
            return _buildErrorView(error);
          }

          if (task == null) {
            return const Center(
              child: Text(
                'Ticket not found',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: _Colors.textTertiary,
                ),
              ),
            );
          }

          // Load attachments when task is available
          if (!_state.attachmentsFetched.value) {
            _loadAttachments(task.id);
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Stack(
              key: ValueKey(_activeOverlay != null),
              children: [
                _activeOverlay ?? _buildContent(task),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildErrorView(dynamic error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: _Colors.utilityOrange500),
            const SizedBox(height: 16),
            const Text(
              'Failed to load ticket',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _Colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.message ?? 'Unknown error',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _Colors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: _loadTask,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: _Colors.accentBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(TaskWithDetails task) {
    return Column(
      children: [
        // Header (like MainDrawerHeader)
        _buildHeader(task),
        // Tab navigation
        _TabNavigation(
          selectedIndex: _selectedTabIndex,
          onTabSelected: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
          activityCount: 0, // TODO: Implement activity count
        ),
        // Content
        Expanded(
          child: _selectedTabIndex == 0
              ? SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Assignee + Location card
                      _buildAssigneeListCard(task),
                      const SizedBox(height: 24),

                      // Description
                      if (task.description != null && task.description!.isNotEmpty) ...[
                        _buildDescriptionSection(task),
                        const SizedBox(height: 24),
                      ],

                      // Photos section
                      Watch((context) {
                        final attachments = _state.taskAttachments.value;
                        return _buildPhotosSection(task, attachments);
                      }),
                      const SizedBox(height: 24),

                      // Relevant Assets (if any)
                      // TODO: Implement asset linking

                      // Task Info section
                      _buildTaskInfoSection(task),
                      const SizedBox(height: 80), // Space for bottom button
                    ],
                  ),
                )
              : _buildActivityTab(task),
        ),
        // Bottom "Update Status" button (only on Details tab)
        if (_selectedTabIndex == 0 && _activeOverlay == null) _buildBottomButton(task),
      ],
    );
  }

  Widget _buildHeader(TaskWithDetails task) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First row: Close button, status tag, edit button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Close button
              IconButton(
                onPressed: widget.onClose ?? () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  size: 20.0,
                  color: _Colors.textPrimary,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: _Colors.bgSecondary,
                ),
              ),
              // Status tag
              _StatusTag(status: task.status),
              // Edit button (only if status is Created)
              if (task.status == TaskStatus.created)
                IconButton(
                  onPressed: () {
                    // TODO: Implement edit mode
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 20.0,
                    color: _Colors.textPrimary,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: _Colors.bgSecondary,
                  ),
                )
              else
                const SizedBox(width: 40),
            ],
          ),
          const SizedBox(height: 8),
          // Title on new line
          Text(
            task.title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: _Colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssigneeListCard(TaskWithDetails task) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _Colors.bgPrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _Colors.borderSecondary),
      ),
      child: Column(
        children: [
          // Assignee row
          Row(
            children: [
              // Avatar
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: _Colors.accentBlueBg,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: task.assigneeName != null
                      ? Text(
                          task.assigneeName![0].toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _Colors.accentBlue,
                          ),
                        )
                      : const Icon(Icons.person_outline, size: 20, color: _Colors.accentBlue),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Assigned to',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: _Colors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      task.assigneeName ?? 'Unassigned',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _Colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              // Reassign button
              GestureDetector(
                onTap: () => _handleReassign(task),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Reassign',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _Colors.textPrimary,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right, size: 20, color: _Colors.textPrimary),
                  ],
                ),
              ),
            ],
          ),
          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: _Colors.borderSecondary),
          ),
          // Location row
          Row(
            children: [
              // Location icon in circle
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: _Colors.accentBlueBg,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.location_on_outlined, size: 20, color: _Colors.accentBlue),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.locationName ?? 'Unknown Location',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _Colors.textPrimary,
                      ),
                    ),
                    if (task.specificLocation != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        task.specificLocation!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: _Colors.textTertiary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(TaskWithDetails task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _Colors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        // Description with left blue border only (no background, matching v0)
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: _Colors.utilityBlue500, width: 4.0),
            ),
          ),
          child: Text(
            task.description!,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              height: 1.5,
              color: _Colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotosSection(TaskWithDetails task, List<TaskAttachment> attachments) {
    final images = attachments.where((a) => a.contentType.startsWith('image/')).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _Colors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // Existing photos
              ...images.map((attachment) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => _handleViewPhoto(attachment),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          attachment.url,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 80,
                            height: 80,
                            color: _Colors.bgSecondary,
                            child: const Icon(
                              Icons.broken_image_outlined,
                              color: _Colors.textTertiary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              // Add photo button
              GestureDetector(
                onTap: () => _handleAddPhoto(task.id),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: _Colors.bgSecondary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: _Colors.borderSecondary),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: _Colors.textTertiary,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskInfoSection(TaskWithDetails task) {
    // Format the created date like "Nov 12, 2025 at 3:18pm"
    final localCreatedAt = task.createdAt.isUtc ? task.createdAt.toLocal() : task.createdAt;
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('h:mma');
    final formattedDate =
        '${dateFormat.format(localCreatedAt)} at ${timeFormat.format(localCreatedAt).toLowerCase()}';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _Colors.bgSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Ticket row
          if (task.externalId != null)
            _buildInfoRow('Ticket', '#${task.externalId}'),

          // Type row
          _buildInfoRow(
            'Type',
            task.taskType == TaskType.serviceRequest ? 'Service Request' : 'Maintenance',
          ),

          // Created date row
          _buildInfoRow('Created', formattedDate),

          // Created by row
          if (task.requestedByName != null)
            _buildInfoRowWithAvatar('Created By', task.requestedByName!),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _Colors.textTertiary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _Colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRowWithAvatar(String label, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _Colors.textTertiary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            height: 20.0,
            width: 20.0,
            decoration: const BoxDecoration(
              color: _Colors.utilityBlue500,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  color: _Colors.textWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _Colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTab(TaskWithDetails task) {
    // Activity tab placeholder
    return const Center(
      child: Text(
        'Activity coming soon',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: _Colors.textTertiary,
        ),
      ),
    );
  }

  Widget _buildBottomButton(TaskWithDetails task) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 32),
      decoration: const BoxDecoration(
        color: _Colors.bgPrimary,
        border: Border(
          top: BorderSide(color: _Colors.borderSecondary),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _activeOverlay = _UpdateStatusOverlay(
                  currentStatus: task.status,
                  taskId: task.id,
                  onBack: () {
                    setState(() {
                      _activeOverlay = null;
                    });
                  },
                  onStatusUpdated: (newStatus, notes, resolutionType) async {
                    await _state.updateTaskStatus(
                      id: task.id,
                      status: newStatus,
                      notes: notes,
                      resolutionType: resolutionType,
                    );
                    _loadTask();

                    // Show completed screen if resolved
                    if (newStatus == TaskStatus.resolved) {
                      setState(() {
                        _activeOverlay = _TaskCompletedOverlay(
                          onBackToTicket: () {
                            setState(() {
                              _activeOverlay = null;
                            });
                          },
                          onBackToMyTickets: () {
                            widget.onUpdated?.call();
                          },
                        );
                      });
                    } else {
                      setState(() {
                        _activeOverlay = null;
                      });
                      widget.onUpdated?.call();
                    }
                  },
                );
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _Colors.textPrimary,
              foregroundColor: _Colors.textWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Update Status',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Handlers

  Future<void> _handleReassign(TaskWithDetails task) async {
    final result = await showDialog<AssignmentSelection>(
      context: context,
      builder: (context) => _ReassignDialog(
        currentAssigneeId: task.assigneeId,
        locationId: task.locationId,
      ),
    );

    if (result != null) {
      await _state.updateTaskAssignment(
        id: task.id,
        assigneeId: result.memberId,
        assignedRoleId: result.roleId,
      );
      _loadTask();
    }
  }

  Future<void> _handleAddPhoto(String taskId) async {
    final file = await PhotoPicker.pickPhoto();
    if (file != null && file.bytes != null) {
      await _state.uploadAttachment(
        taskId: taskId,
        fileName: file.name,
        contentType: file.extension != null ? 'image/${file.extension}' : 'image/jpeg',
        sizeBytes: file.size,
        bytes: file.bytes!,
      );
    }
  }

  void _handleViewPhoto(TaskAttachment attachment) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(attachment.url, fit: BoxFit.contain),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Status tag badge
class _StatusTag extends StatelessWidget {
  final TaskStatus status;

  const _StatusTag({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case TaskStatus.created:
        bgColor = _Colors.statusCreatedBg;
        textColor = _Colors.statusCreated;
        text = 'Created';
        break;
      case TaskStatus.inProgress:
        bgColor = _Colors.statusInProgressBg;
        textColor = _Colors.statusInProgress;
        text = 'In Progress';
        break;
      case TaskStatus.onHold:
        bgColor = _Colors.statusOnHoldBg;
        textColor = _Colors.statusOnHold;
        text = 'On Hold';
        break;
      case TaskStatus.resolved:
        bgColor = _Colors.statusResolvedBg;
        textColor = _Colors.statusResolved;
        text = 'Resolved';
        break;
      default:
        bgColor = _Colors.bgSecondary;
        textColor = _Colors.textTertiary;
        text = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}

/// Tab navigation (Details / Activity)
class _TabNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final int? activityCount;

  const _TabNavigation({
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
        color: _Colors.bgPrimary,
        border: Border(
          bottom: BorderSide(color: _Colors.borderSecondary),
        ),
      ),
      child: Row(
        children: [
          _TabButton(
            label: 'Details',
            isSelected: selectedIndex == 0,
            onTap: () => onTabSelected(0),
          ),
          const SizedBox(width: 8),
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
          color: isSelected ? _Colors.textPrimary : _Colors.bgPrimary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? _Colors.textPrimary : _Colors.borderSecondary,
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
                color: isSelected ? _Colors.textWhite : _Colors.textPrimary,
              ),
            ),
            if (count != null && count! > 0) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? _Colors.bgPrimary : _Colors.bgSecondary,
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
                      color: isSelected ? _Colors.textPrimary : _Colors.textSecondary,
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

/// Update Status overlay (like v0's UpdateStatusDrawer)
class _UpdateStatusOverlay extends StatefulWidget {
  final TaskStatus currentStatus;
  final String taskId;
  final VoidCallback onBack;
  final Future<void> Function(TaskStatus, String?, ResolutionType?) onStatusUpdated;

  const _UpdateStatusOverlay({
    required this.currentStatus,
    required this.taskId,
    required this.onBack,
    required this.onStatusUpdated,
  });

  @override
  State<_UpdateStatusOverlay> createState() => _UpdateStatusOverlayState();
}

class _UpdateStatusOverlayState extends State<_UpdateStatusOverlay> {
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
      color: _Colors.bgSecondary,
      child: Column(
        children: [
          // Header
          Container(
            color: _Colors.bgPrimary,
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.onBack,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20.0,
                    color: _Colors.textPrimary,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: _Colors.bgSecondary,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Update Status',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: _Colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: _Colors.borderSecondary),
          // Status options
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _StatusSelectorCard(
                    status: TaskStatus.created,
                    description: 'Work has not started on this ticket',
                    isSelected: _selectedStatus == TaskStatus.created,
                    onTap: () => _selectStatus(TaskStatus.created),
                  ),
                  const SizedBox(height: 16),
                  _StatusSelectorCard(
                    status: TaskStatus.inProgress,
                    description: 'Work has started on this ticket',
                    isSelected: _selectedStatus == TaskStatus.inProgress,
                    onTap: () => _selectStatus(TaskStatus.inProgress),
                  ),
                  const SizedBox(height: 16),
                  _StatusSelectorCard(
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
                  const SizedBox(height: 16),
                  _StatusSelectorCard(
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
class _StatusSelectorCard extends StatelessWidget {
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

  const _StatusSelectorCard({
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
        return _Colors.statusCreated;
      case TaskStatus.inProgress:
        return _Colors.statusInProgress;
      case TaskStatus.onHold:
        return _Colors.statusOnHold;
      case TaskStatus.resolved:
        return _Colors.statusResolved;
      default:
        return _Colors.textTertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _Colors.bgPrimary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? _statusColor : _Colors.borderSecondary,
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
                      color: isSelected ? _statusColor : _Colors.borderPrimary,
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
                const SizedBox(width: 12),
                Text(
                  status.displayName,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _Colors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: _Colors.textTertiary,
                ),
              ),
            ),
            // Expanded content when selected
            if (isSelected && showNotesField) ...[
              const SizedBox(height: 16),
              if (showResolutionType && onResolutionTypeChanged != null) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 8),
                  child: Text(
                    'Resolution Type',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _Colors.textSecondary,
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
                                          ? _Colors.accentBlue
                                          : _Colors.borderPrimary,
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
                                              color: _Colors.accentBlue,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  type.displayName,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    color: _Colors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                const SizedBox(height: 8),
              ],
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: _Colors.borderPrimary),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: notesController,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: _Colors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: notesPlaceholder ?? 'Notes (optional)',
                      hintStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: _Colors.textTertiary,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _statusColor,
                      foregroundColor: _Colors.textWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
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

/// Task completed overlay (like v0's TaskCompletedDrawer)
class _TaskCompletedOverlay extends StatelessWidget {
  final VoidCallback onBackToTicket;
  final VoidCallback onBackToMyTickets;

  const _TaskCompletedOverlay({
    required this.onBackToTicket,
    required this.onBackToMyTickets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _Colors.bgSecondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/confetti.png',
            height: 200,
            errorBuilder: (_, __, ___) => const Icon(
              Icons.celebration,
              size: 100,
              color: _Colors.utilityOrange500,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Complete!',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: _Colors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Your ticket has been resolved! We will notify the submitter that you have successfully resolved their issue.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: _Colors.textTertiary,
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
                  backgroundColor: _Colors.textPrimary,
                  foregroundColor: _Colors.textWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: onBackToTicket,
                style: OutlinedButton.styleFrom(
                  foregroundColor: _Colors.textPrimary,
                  side: const BorderSide(color: _Colors.borderPrimary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
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

/// Dialog for reassigning a task
class _ReassignDialog extends StatefulWidget {
  final String? currentAssigneeId;
  final String? locationId;

  const _ReassignDialog({this.currentAssigneeId, this.locationId});

  @override
  State<_ReassignDialog> createState() => _ReassignDialogState();
}

class _ReassignDialogState extends State<_ReassignDialog> {
  AssignmentSelection? _selection;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: _Colors.bgPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
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
                color: _Colors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: AssigneeDropdown(
                locationId: widget.locationId,
                value: _selection,
                onChanged: (value) => setState(() => _selection = value),
              ),
            ),
            const SizedBox(height: 24),
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
                      color: _Colors.textTertiary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _selection != null ? () => Navigator.pop(context, _selection) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selection != null ? _Colors.accentBlue : _Colors.bgSecondary,
                    foregroundColor: _selection != null ? Colors.white : _Colors.textTertiary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
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
