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
  bool _activityFetched = false;
  bool _isSubmittingComment = false;

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

  void _loadActivity(String taskId) {
    if (!_activityFetched) {
      _activityFetched = true;
      _state.fetchTaskActivity(taskId);
    }
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
        // Tab navigation with activity count from state
        Watch((context) {
          final activityCount = _state.taskActivity.value.length;
          return _TabNavigation(
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
              // Load activity when switching to Activity tab
              if (index == 1) {
                _loadActivity(task.id);
              }
            },
            activityCount: activityCount > 0 ? activityCount : null,
          );
        }),
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
    // Ensure activity is loaded
    _loadActivity(task.id);

    return Column(
      children: [
        // Activity list
        Expanded(
          child: Watch((context) {
            final activity = _state.taskActivity.value;
            final isLoading = _state.isLoading.value;

            if (isLoading && activity.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: _Colors.accentBlue),
              );
            }

            // Filter activities using centralized logic (like v0)
            final filteredActivity = activity.where(_shouldDisplayActivity).toList();

            if (filteredActivity.isEmpty) {
              return const Center(
                child: Text(
                  'No activity yet',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: _Colors.textTertiary,
                  ),
                ),
              );
            }

            // Group by date (oldest first for proper display)
            final groupedActivities = _groupActivitiesByDate(filteredActivity);

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              reverse: true, // Newest at bottom like a chat
              itemCount: groupedActivities.length,
              itemBuilder: (context, sectionIndex) {
                final reversedIndex = groupedActivities.length - 1 - sectionIndex;
                final dateKey = groupedActivities.keys.elementAt(reversedIndex);
                final activities = groupedActivities[dateKey]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date header
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12, top: 8),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: _Colors.bgSecondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            dateKey,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _Colors.textTertiary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Activities for this date
                    ...activities.map((item) {
                      final isLast = item == activities.last && reversedIndex == groupedActivities.length - 1;
                      return _ActivityItemWidget(
                        activity: item,
                        isLast: isLast,
                      );
                    }),
                  ],
                );
              },
            );
          }),
        ),
        // Comment input at bottom
        _CommentInputSection(
          isLoading: _isSubmittingComment,
          onSubmit: (content) async {
            setState(() => _isSubmittingComment = true);
            await _state.createComment(
              taskId: task.id,
              content: content,
            );
            setState(() => _isSubmittingComment = false);
          },
        ),
      ],
    );
  }

  /// Filter activities for display (like v0's shouldDisplayActivity)
  bool _shouldDisplayActivity(TaskActivity activity) {
    // Filter 1: attachment_uploaded events are shown in Photos section, not activity feed
    if (activity.eventType == 'attachment_uploaded') {
      return false;
    }

    // Filter 2: comment_added events must have a valid comment
    if (activity.eventType == 'comment_added') {
      if (activity.comment == null) {
        return false;
      }
    }

    return true;
  }

  /// Group activities by date
  Map<String, List<TaskActivity>> _groupActivitiesByDate(List<TaskActivity> activities) {
    final grouped = <String, List<TaskActivity>>{};

    // Reverse so oldest activities are first (newest at bottom in chat style)
    final reversedActivities = activities.reversed.toList();

    for (final activity in reversedActivities) {
      final dateKey = _formatActivityDate(activity.createdAt);
      grouped.putIfAbsent(dateKey, () => []).add(activity);
    }

    return grouped;
  }

  /// Format date as "Today", "Yesterday", or "Mon DD"
  String _formatActivityDate(DateTime dateTime) {
    final localTime = dateTime.isUtc ? dateTime.toLocal() : dateTime;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final activityDate = DateTime(localTime.year, localTime.month, localTime.day);

    if (activityDate == today) {
      return 'Today';
    } else if (activityDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM d').format(localTime);
    }
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

/// Activity item widget - displays a single activity entry
class _ActivityItemWidget extends StatelessWidget {
  final TaskActivity activity;
  final bool isLast;

  const _ActivityItemWidget({
    required this.activity,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('MMM d, h:mm a');

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _getEventColor(),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getEventIcon(),
                    size: 16,
                    color: Colors.white,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: _Colors.borderSecondary,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event title and timestamp
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _getEventDescription(),
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _Colors.textPrimary,
                          ),
                        ),
                      ),
                      Text(
                        timeFormat.format(activity.createdAt.toLocal()),
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: _Colors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  // Changed by
                  if (activity.changedBy != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'by ${activity.changedBy!.name}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: _Colors.textTertiary,
                      ),
                    ),
                  ],
                  // Notes
                  if (activity.notes != null && activity.notes!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _Colors.bgSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        activity.notes!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: _Colors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                  // Comment content
                  if (activity.comment != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _Colors.accentBlueBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (activity.comment!.createdBy != null) ...[
                            Text(
                              activity.comment!.createdBy!.name,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _Colors.accentBlue,
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                          Text(
                            activity.comment!.content,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: _Colors.textPrimary,
                            ),
                          ),
                          if (activity.comment!.edited) ...[
                            const SizedBox(height: 4),
                            Text(
                              '(edited)',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: _Colors.textTertiary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                  // Attachments
                  if (activity.attachments.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: activity.attachments.map((attachment) {
                        return Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: _Colors.bgSecondary,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: _Colors.borderSecondary),
                          ),
                          child: attachment.isImage && attachment.url.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.network(
                                    attachment.url,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Center(
                                      child: Icon(
                                        attachment.fileIcon,
                                        color: _Colors.textTertiary,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Icon(
                                    attachment.fileIcon,
                                    color: _Colors.textTertiary,
                                    size: 24,
                                  ),
                                ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getEventColor() {
    switch (activity.eventType) {
      case 'created':
        return _Colors.statusCreated;
      case 'status_changed':
        return _Colors.statusInProgress;
      case 'assigned':
      case 'reassigned':
      case 'claimed':
        return const Color(0xFF9333EA); // Purple
      case 'comment_added':
        return _Colors.statusResolved;
      default:
        return _Colors.textTertiary;
    }
  }

  IconData _getEventIcon() {
    switch (activity.eventType) {
      case 'created':
        return Icons.add;
      case 'status_changed':
        return Icons.swap_horiz;
      case 'assigned':
        return Icons.person_add;
      case 'reassigned':
        return Icons.people;
      case 'claimed':
        return Icons.person;
      case 'comment_added':
        return Icons.comment;
      default:
        return Icons.info_outline;
    }
  }

  String _getEventDescription() {
    switch (activity.eventType) {
      case 'created':
        return 'Ticket created';
      case 'status_changed':
        // Extract status change details from changes map
        final statusChange = activity.changes?['status'] as Map<String, dynamic>?;
        if (statusChange != null) {
          final newStatus = statusChange['new'] as String?;
          if (newStatus != null) {
            return 'Status changed to ${_formatStatus(newStatus)}';
          }
        }
        return 'Status changed';
      case 'assigned':
        final assigneeChange = activity.changes?['assignee_name'] as Map<String, dynamic>?;
        if (assigneeChange != null) {
          final newAssignee = assigneeChange['new'] as String?;
          if (newAssignee != null) {
            return 'Assigned to $newAssignee';
          }
        }
        return 'Assigned';
      case 'reassigned':
        final assigneeChange = activity.changes?['assignee_name'] as Map<String, dynamic>?;
        if (assigneeChange != null) {
          final newAssignee = assigneeChange['new'] as String?;
          if (newAssignee != null) {
            return 'Reassigned to $newAssignee';
          }
        }
        return 'Reassigned';
      case 'claimed':
        return 'Ticket claimed';
      case 'comment_added':
        return 'Comment added';
      case 'task_def_updated':
        // Handle field updates
        if (activity.changes != null && activity.changes!.isNotEmpty) {
          final changeKey = activity.changes!.keys.first;
          switch (changeKey) {
            case 'title':
              return 'Title updated';
            case 'description':
              return 'Description updated';
            case 'location_id':
              return 'Location changed';
            case 'specific_location':
              return 'Area updated';
            default:
              return 'Details updated';
          }
        }
        return 'Details updated';
      default:
        return activity.eventDisplayName;
    }
  }

  String _formatStatus(String status) {
    switch (status.toLowerCase()) {
      case 'created':
        return 'Open';
      case 'in_progress':
        return 'In Progress';
      case 'on_hold':
        return 'On Hold';
      case 'resolved':
        return 'Resolved';
      default:
        return status;
    }
  }
}

/// Comment input section at the bottom of the activity tab
class _CommentInputSection extends StatefulWidget {
  final bool isLoading;
  final Future<void> Function(String content) onSubmit;

  const _CommentInputSection({
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  State<_CommentInputSection> createState() => _CommentInputSectionState();
}

class _CommentInputSectionState extends State<_CommentInputSection> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _hasContent = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final hasContent = _controller.text.trim().isNotEmpty;
    if (hasContent != _hasContent) {
      setState(() => _hasContent = hasContent);
    }
  }

  Future<void> _handleSubmit() async {
    final content = _controller.text.trim();
    if (content.isEmpty || widget.isLoading) return;

    await widget.onSubmit(content);
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: _Colors.bgPrimary,
        border: Border(
          top: BorderSide(color: _Colors.borderSecondary),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: _Colors.borderPrimary),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  maxLines: 3,
                  minLines: 1,
                  enabled: !widget.isLoading,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: _Colors.textPrimary,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Add a comment...',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: _Colors.textTertiary,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: _hasContent && !widget.isLoading ? _handleSubmit : null,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: _hasContent && !widget.isLoading
                      ? _Colors.accentBlue
                      : _Colors.bgSecondary,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: widget.isLoading
                    ? const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.send,
                        size: 20,
                        color: _hasContent ? Colors.white : _Colors.textTertiary,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
