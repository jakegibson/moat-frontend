import 'dart:typed_data';
import 'dart:ui';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show FileUploadInputElement, FileReader, document;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/attachment_upload_widget.dart';
import '../../../common_widgets/right_side_drawer.dart';
import '../../../core/di/injection.dart';
import '../../auth/state/auth_state.dart';
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

  // Status colors (dot indicator only, no background)
  static const Color statusCreated = Color(0xFF2563EB);
  static const Color statusInProgress = Color(0xFFF79009);
  static const Color statusOnHold = Color(0xFFF59E0B);
  static const Color statusResolved = Color(0xFF17B26A);
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
  late final AuthState _authState;
  int _selectedTabIndex = 0; // 0 = Details, 1 = Activity
  Widget? _activeOverlay;
  bool _activityFetched = false;
  bool _isSubmittingComment = false;

  /// Current user's member ID (for activity alignment)
  String? get _currentUserId => _authState.user.value?.id;

  @override
  void initState() {
    super.initState();
    _state = getIt<TaskDetailState>();
    _authState = getIt<AuthState>();
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
              ...images.asMap().entries.map((entry) {
                final index = entry.key;
                final attachment = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => _handleViewPhoto(
                      images: images,
                      initialIndex: index,
                      uploaderName: task.requestedByName,
                    ),
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
                );
              }),
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
                    // Date header (plain centered text like v0)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 16,
                        top: reversedIndex > 0 ? 24 : 8,
                      ),
                      child: Center(
                        child: Text(
                          dateKey,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _Colors.textSecondary,
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
                        currentUserId: _currentUserId,
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
          taskId: task.id,
          isLoading: _isSubmittingComment,
          onSubmit: (content, attachmentIds) async {
            setState(() => _isSubmittingComment = true);
            await _state.createComment(
              taskId: task.id,
              content: content,
              attachmentIds: attachmentIds,
            );
            setState(() => _isSubmittingComment = false);
          },
          state: _state,
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

  void _handleViewPhoto({
    required List<TaskAttachment> images,
    required int initialIndex,
    String? uploaderName,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => _FullScreenImageViewer(
        images: images,
        initialIndex: initialIndex,
        uploaderName: uploaderName,
      ),
    );
  }
}

/// Full-screen image viewer with blurred background, navigation, and metadata
class _FullScreenImageViewer extends StatefulWidget {
  final List<TaskAttachment> images;
  final int initialIndex;
  final String? uploaderName;

  const _FullScreenImageViewer({
    required this.images,
    required this.initialIndex,
    this.uploaderName,
  });

  @override
  State<_FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<_FullScreenImageViewer> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  String _formatDate(DateTime date) {
    final localDate = date.isUtc ? date.toLocal() : date;
    return DateFormat('MMM d, yyyy').format(localDate);
  }

  String _getInitials(String? name) {
    if (name == null || name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final currentImage = widget.images[_currentIndex];

    return Stack(
      children: [
        // Blurred background (light to support dark text)
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
        ),
        // Main content
        SafeArea(
          child: Column(
            children: [
              // Header with avatar, name, date, and counter
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // Close button (top left)
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: _Colors.bgSecondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: _Colors.textPrimary,
                          size: 20,
                        ),
                      ),
                    ),
                    // Center: Avatar + Name + Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Avatar
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: _Colors.utilityBlue500,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _getInitials(widget.uploaderName),
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Name
                          Text(
                            widget.uploaderName ?? 'Unknown',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _Colors.textPrimary,
                            ),
                          ),
                          // Date
                          Text(
                            'Added ${_formatDate(currentImage.createdAt)}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: _Colors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Counter (top right)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _Colors.bgSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${_currentIndex + 1} of ${widget.images.length}',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: _Colors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Image viewer with navigation
              Expanded(
                child: Stack(
                  children: [
                    // PageView for images
                    PageView.builder(
                      controller: _pageController,
                      itemCount: widget.images.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final image = widget.images[index];
                        return Padding(
                          padding: const EdgeInsets.all(24),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                image.url,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => Container(
                                  width: 200,
                                  height: 200,
                                  color: _Colors.bgSecondary,
                                  child: const Icon(
                                    Icons.broken_image_outlined,
                                    color: _Colors.textTertiary,
                                    size: 48,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // Left navigation arrow
                    if (_currentIndex > 0)
                      Positioned(
                        left: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: _goToPrevious,
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: _Colors.bgSecondary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.chevron_left,
                                color: _Colors.textPrimary,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    // Right navigation arrow
                    if (_currentIndex < widget.images.length - 1)
                      Positioned(
                        right: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: _goToNext,
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: _Colors.bgSecondary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.chevron_right,
                                color: _Colors.textPrimary,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Status indicator with dot + text and border (matching design)
class _StatusTag extends StatelessWidget {
  final TaskStatus status;

  const _StatusTag({required this.status});

  @override
  Widget build(BuildContext context) {
    Color dotColor;
    String text;

    switch (status) {
      case TaskStatus.created:
        dotColor = _Colors.statusCreated;
        text = 'Created';
        break;
      case TaskStatus.inProgress:
        dotColor = _Colors.statusInProgress;
        text = 'In Progress';
        break;
      case TaskStatus.onHold:
        dotColor = _Colors.statusOnHold;
        text = 'On Hold';
        break;
      case TaskStatus.resolved:
        dotColor = _Colors.statusResolved;
        text = 'Resolved';
        break;
      default:
        dotColor = _Colors.textTertiary;
        text = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _Colors.bgPrimary,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _Colors.borderSecondary),
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
          const SizedBox(width: 6),
          // Status text
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _Colors.textSecondary,
            ),
          ),
        ],
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

/// Activity item widget - displays a single activity entry with chat-bubble style (like v0)
class _ActivityItemWidget extends StatelessWidget {
  final TaskActivity activity;
  final bool isLast;
  final String? currentUserId;

  const _ActivityItemWidget({
    required this.activity,
    required this.isLast,
    this.currentUserId,
  });

  /// Check if this activity is from the current user
  bool get _isCurrentUser {
    if (currentUserId == null) return false;
    // For comments, check the comment's createdBy
    if (activity.eventType == 'comment_added' && activity.comment?.createdBy != null) {
      return activity.comment!.createdBy!.id == currentUserId;
    }
    // For other events, check changedBy
    return activity.changedBy?.id == currentUserId;
  }

  /// Get the user name for display
  String get _userName {
    if (activity.eventType == 'comment_added' && activity.comment?.createdBy != null) {
      return activity.comment!.createdBy!.name;
    }
    return activity.changedBy?.name ?? 'Moat';
  }

  /// Check if this is a system event (auto-assignment)
  bool get _isSystemEvent {
    return activity.eventType == 'claimed' ||
        (activity.eventType == 'assigned' && activity.changedBy == null);
  }

  @override
  Widget build(BuildContext context) {
    // Route to specific builders based on event type
    switch (activity.eventType) {
      case 'comment_added':
        if (activity.comment == null) return const SizedBox.shrink();
        return _buildCommentItem();
      case 'status_changed':
        return _buildStatusUpdateItem();
      case 'created':
        return _buildCreatedItem();
      case 'assigned':
      case 'reassigned':
      case 'claimed':
        return _buildAssignmentItem();
      case 'task_def_updated':
        return _buildFieldUpdateItem();
      default:
        return _buildCreatedItem();
    }
  }

  /// Builds a created ticket activity item
  Widget _buildCreatedItem() {
    return _ActivityBubble(
      isCurrentUser: _isCurrentUser,
      userName: _userName,
      timestamp: activity.createdAt,
      isSystemUser: false,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Created',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _isCurrentUser ? _Colors.textWhite : _Colors.textPrimary,
              ),
            ),
            TextSpan(
              text: ' ticket',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _isCurrentUser ? _Colors.textWhite : _Colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds an assignment activity item
  Widget _buildAssignmentItem() {
    // Extract assignee name from changes
    final assigneeNameChange = activity.changes?['assignee_name'] as Map<String, dynamic>?;
    final assigneeName = assigneeNameChange?['new'] as String? ?? 'Assigned User';
    final isAutoAssigned = _isSystemEvent;

    return _ActivityBubble(
      isCurrentUser: isAutoAssigned ? false : _isCurrentUser,
      userName: isAutoAssigned ? 'Moat' : _userName,
      timestamp: activity.createdAt,
      isSystemUser: isAutoAssigned,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: isAutoAssigned ? 'Auto-Assigned' : 'Assigned',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: (isAutoAssigned || !_isCurrentUser) ? _Colors.textPrimary : _Colors.textWhite,
              ),
            ),
            TextSpan(
              text: ' to $assigneeName',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: (isAutoAssigned || !_isCurrentUser) ? _Colors.textPrimary : _Colors.textWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a status update activity item
  Widget _buildStatusUpdateItem() {
    final statusChange = activity.changes?['status'] as Map<String, dynamic>?;
    final newStatusStr = statusChange?['new'] as String?;
    if (newStatusStr == null) return const SizedBox.shrink();

    final resolutionTypeChange = activity.changes?['resolution_type'] as Map<String, dynamic>?;
    final resolutionTypeStr = resolutionTypeChange?['new'] as String?;

    final hasContent = (activity.notes != null && activity.notes!.isNotEmpty) ||
        activity.attachments.isNotEmpty;

    return _ActivityBubble(
      isCurrentUser: _isCurrentUser,
      userName: _userName,
      timestamp: activity.createdAt,
      isSystemUser: false,
      hasAttachedContent: hasContent,
      attachedContent: hasContent
          ? _buildNotesAndAttachments(activity.notes, activity.attachments)
          : null,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Changed status',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _isCurrentUser ? _Colors.textWhite : _Colors.textPrimary,
              ),
            ),
            TextSpan(
              text: ' to ${_formatStatus(newStatusStr)}${resolutionTypeStr != null ? ' / ${_formatResolutionType(resolutionTypeStr)}' : ''}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _isCurrentUser ? _Colors.textWhite : _Colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a comment activity item
  Widget _buildCommentItem() {
    final comment = activity.comment!;
    final hasAttachments = activity.attachments.isNotEmpty;

    return _ActivityBubble(
      isCurrentUser: _isCurrentUser,
      userName: comment.createdBy?.name ?? _userName,
      timestamp: activity.createdAt,
      isSystemUser: false,
      isComment: true,
      // Attachments go in white container below bubble (like status updates)
      hasAttachedContent: hasAttachments,
      attachedContent: hasAttachments
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: _buildAttachmentGallery(activity.attachments),
            )
          : null,
      child: Text(
        comment.content,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: _isCurrentUser ? _Colors.textWhite : _Colors.textPrimary,
        ),
      ),
    );
  }

  /// Builds a field update activity item
  Widget _buildFieldUpdateItem() {
    if (activity.changes == null || activity.changes!.isEmpty) {
      return const SizedBox.shrink();
    }

    final changeKey = activity.changes!.keys.first;
    final changeData = activity.changes![changeKey] as Map<String, dynamic>?;
    if (changeData == null) return const SizedBox.shrink();

    final oldValue = changeData['old'] as String?;
    final newValue = changeData['new'] as String?;
    if (newValue == null) return const SizedBox.shrink();

    String fieldLabel;
    switch (changeKey) {
      case 'title':
        fieldLabel = 'Title';
        break;
      case 'description':
        fieldLabel = 'Description';
        break;
      case 'location_id':
        fieldLabel = 'Location';
        break;
      case 'specific_location':
        fieldLabel = 'Area';
        break;
      default:
        fieldLabel = changeKey;
    }

    return _ActivityBubble(
      isCurrentUser: _isCurrentUser,
      userName: _userName,
      timestamp: activity.createdAt,
      isSystemUser: false,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Edited $fieldLabel',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _isCurrentUser ? _Colors.textWhite : _Colors.textPrimary,
              ),
            ),
            if (oldValue != null)
              TextSpan(
                text: ' from "$oldValue"',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: _isCurrentUser ? _Colors.textWhite : _Colors.textPrimary,
                ),
              ),
            TextSpan(
              text: ' to "$newValue"',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _isCurrentUser ? _Colors.textWhite : _Colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a notes and attachments container for status updates
  Widget _buildNotesAndAttachments(String? notes, List<TaskAttachment> attachments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (notes != null && notes.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              notes,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _Colors.textPrimary,
              ),
            ),
          ),
        if (attachments.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(12),
            child: _buildAttachmentGallery(attachments),
          ),
      ],
    );
  }

  /// Builds an attachment gallery
  Widget _buildAttachmentGallery(List<TaskAttachment> attachments) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: attachments.asMap().entries.map((entry) {
            final attachment = entry.value;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: 100,
                height: 100,
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
              ),
            );
          }).toList(),
        ),
      ),
    );
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

  String _formatResolutionType(String type) {
    switch (type.toLowerCase()) {
      case 'completed':
        return 'Completed';
      case 'non_issue':
        return 'Non-Issue';
      case 'duplicate':
        return 'Duplicate';
      case 'will_not_fix':
        return 'Will Not Fix';
      default:
        return type;
    }
  }
}

/// Chat bubble wrapper that handles alignment and styling (like v0)
class _ActivityBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String userName;
  final DateTime timestamp;
  final bool isSystemUser;
  final Widget child;
  final bool hasAttachedContent;
  final Widget? attachedContent;
  final bool isComment;

  const _ActivityBubble({
    required this.isCurrentUser,
    required this.userName,
    required this.timestamp,
    required this.isSystemUser,
    required this.child,
    this.hasAttachedContent = false,
    this.attachedContent,
    this.isComment = false,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('h:mma');
    final formattedTime = timeFormat.format(timestamp.toLocal()).toLowerCase();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Line 1: Name + Timestamp (name omitted for current user)
            Padding(
              padding: EdgeInsets.only(
                left: (!isCurrentUser && !isSystemUser) ? 32.0 + 8 : (isSystemUser ? 32.0 + 8 : 0),
                right: isCurrentUser ? 0 : 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Only show name for non-current users
                  if (!isCurrentUser || isSystemUser) ...[
                    Text(
                      userName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _Colors.textTertiary,
                      ),
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    formattedTime,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: _Colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            // Line 2: Avatar + Bubble
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar on left for non-current users
                if (!isCurrentUser) ...[
                  _UserAvatar(
                    userName: userName,
                    isSystemUser: isSystemUser,
                  ),
                  const SizedBox(width: 8),
                ],
                // Bubble content
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Main bubble
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isCurrentUser ? _Colors.textPrimary : _Colors.bgSecondary,
                            borderRadius: _getBubbleRadius(hasContent: hasAttachedContent),
                          ),
                          child: child,
                        ),
                        // Attached content below bubble (white container for notes/attachments)
                        if (hasAttachedContent && attachedContent != null)
                          Container(
                            decoration: BoxDecoration(
                              color: _Colors.bgPrimary,
                              border: Border.all(color: _Colors.borderSecondary),
                              borderRadius: isCurrentUser
                                  ? const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                    )
                                  : const BorderRadius.only(
                                      bottomRight: Radius.circular(16),
                                    ),
                            ),
                            child: attachedContent,
                          ),
                      ],
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

  BorderRadius _getBubbleRadius({bool hasContent = false}) {
    if (hasContent) {
      // Top-only radius when there's attached content below
      return const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      );
    }

    // Speech bubble corners - missing one corner based on alignment
    if (isCurrentUser) {
      return const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        // No bottom-right = speech bubble pointing right
      );
    } else {
      return const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
        // No bottom-left = speech bubble pointing left
      );
    }
  }
}

/// User avatar for activity items
class _UserAvatar extends StatelessWidget {
  final String userName;
  final bool isSystemUser;

  const _UserAvatar({
    required this.userName,
    this.isSystemUser = false,
  });

  String _getInitials() {
    final parts = userName.trim().split(' ');
    if (parts.isEmpty || parts[0].isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    if (isSystemUser) {
      // System user (Moat) - use settings icon
      return Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: _Colors.utilityBlue500,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.settings_suggest,
            color: _Colors.textWhite,
            size: 16,
          ),
        ),
      );
    }

    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: _Colors.utilityBlue500,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _getInitials(),
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: _Colors.textWhite,
          ),
        ),
      ),
    );
  }
}

/// Comment input section at the bottom of the activity tab (matches v0 parity)
class _CommentInputSection extends StatefulWidget {
  final String taskId;
  final bool isLoading;
  final Future<void> Function(String content, List<String>? attachmentIds) onSubmit;
  final TaskDetailState state;

  const _CommentInputSection({
    required this.taskId,
    required this.isLoading,
    required this.onSubmit,
    required this.state,
  });

  @override
  State<_CommentInputSection> createState() => _CommentInputSectionState();
}

class _CommentInputSectionState extends State<_CommentInputSection> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final List<AttachmentUploadState> _pendingAttachments = [];
  bool _isUploading = false;

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
    setState(() {});
  }

  /// Handle image picker - uses HTML5 file input for web (like v0)
  void _handleImagePicker() {
    final input = html.FileUploadInputElement()
      ..accept = 'image/jpeg,image/png,image/gif,image/webp,image/heic,image/heif,application/pdf'
      ..multiple = false
      ..style.display = 'none';

    input.onChange.listen((e) async {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        final file = files.first;
        try {
          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);
          await reader.onLoadEnd.first;

          if (reader.result != null) {
            final bytes = reader.result as Uint8List;
            final fileName = file.name;
            final extension = _getFileExtension(fileName);
            final mimeType = _getMimeTypeFromExtension(extension);

            _addFileToUpload(
              bytes: bytes,
              fileName: fileName,
              mimeType: mimeType,
            );
          }
        } catch (e) {
          _showErrorSnackBar('Error reading file: $e');
        }
      }
      input.remove();
    });

    html.document.body!.append(input);
    input.click();
  }

  String _getFileExtension(String fileName) {
    final parts = fileName.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  String _getMimeTypeFromExtension(String extension) {
    switch (extension.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      case 'heic':
      case 'heif':
        return 'image/heic';
      case 'pdf':
        return 'application/pdf';
      default:
        return 'application/octet-stream';
    }
  }

  void _addFileToUpload({
    required Uint8List bytes,
    required String fileName,
    required String mimeType,
  }) {
    // Validate file size (max 10MB)
    const maxSize = 10 * 1024 * 1024;
    if (bytes.length > maxSize) {
      _showErrorSnackBar('File too large (max 10MB)');
      return;
    }

    // Validate file type
    const supportedTypes = [
      'image/jpeg',
      'image/png',
      'image/gif',
      'image/webp',
      'image/heic',
      'application/pdf',
    ];
    if (!supportedTypes.contains(mimeType)) {
      _showErrorSnackBar('Unsupported file type. Supported: JPEG, PNG, GIF, WebP, HEIC, PDF');
      return;
    }

    final localId = '${DateTime.now().millisecondsSinceEpoch}_${fileName.hashCode}';
    final uploadState = AttachmentUploadState(
      localId: localId,
      fileName: fileName,
      bytes: bytes,
      mimeType: mimeType,
      sizeBytes: bytes.length,
      status: UploadStatus.pending,
    );

    setState(() {
      _pendingAttachments.add(uploadState);
    });
  }

  void _removeAttachment(String localId) {
    setState(() {
      _pendingAttachments.removeWhere((a) => a.localId == localId);
    });
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _handleSubmit() async {
    final content = _controller.text.trim();
    if (content.isEmpty && _pendingAttachments.isEmpty) return;
    if (widget.isLoading || _isUploading) return;

    setState(() => _isUploading = true);

    try {
      // Upload all pending attachments first
      final attachmentIds = <String>[];
      for (var i = 0; i < _pendingAttachments.length; i++) {
        final attachment = _pendingAttachments[i];
        if (attachment.status == UploadStatus.pending) {
          // Update status to uploading
          setState(() {
            _pendingAttachments[i] = attachment.copyWith(status: UploadStatus.uploading);
          });

          // Upload via state
          final result = await widget.state.uploadAttachment(
            taskId: widget.taskId,
            fileName: attachment.fileName,
            contentType: attachment.mimeType,
            sizeBytes: attachment.sizeBytes,
            bytes: attachment.bytes.toList(),
          );

          result.when(
            ok: (uploaded) {
              setState(() {
                _pendingAttachments[i] = attachment.copyWith(
                  status: UploadStatus.completed,
                  uploadedAttachmentId: uploaded.id,
                );
              });
              attachmentIds.add(uploaded.id);
            },
            error: (e) {
              setState(() {
                _pendingAttachments[i] = attachment.copyWith(
                  status: UploadStatus.failed,
                  errorMessage: e.message,
                );
              });
            },
          );
        } else if (attachment.status == UploadStatus.completed &&
            attachment.uploadedAttachmentId != null) {
          attachmentIds.add(attachment.uploadedAttachmentId!);
        }
      }

      // Check for failed uploads
      final failedUploads = _pendingAttachments.where((a) => a.status == UploadStatus.failed);
      if (failedUploads.isNotEmpty) {
        _showErrorSnackBar('Some attachments failed to upload. Please retry or remove them.');
        return;
      }

      // Submit comment with attachment IDs
      await widget.onSubmit(content, attachmentIds.isNotEmpty ? attachmentIds : null);

      // Clear on success
      _controller.clear();
      setState(() {
        _pendingAttachments.clear();
      });
      _focusNode.requestFocus();
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isProcessing = widget.isLoading || _isUploading;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Attachment preview section (above input, like v0)
        if (_pendingAttachments.isNotEmpty)
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            decoration: const BoxDecoration(
              color: _Colors.bgPrimary,
              border: Border(
                top: BorderSide(color: _Colors.borderSecondary),
              ),
            ),
            child: Column(
              children: _pendingAttachments.map((attachment) {
                return _PendingAttachmentThumbnail(
                  upload: attachment,
                  onRetry: () {
                    final index = _pendingAttachments.indexWhere((a) => a.localId == attachment.localId);
                    if (index != -1) {
                      setState(() {
                        _pendingAttachments[index] = attachment.copyWith(
                          status: UploadStatus.pending,
                          errorMessage: null,
                        );
                      });
                    }
                  },
                  onDelete: () => _removeAttachment(attachment.localId),
                );
              }).toList(),
            ),
          ),
        // Input field
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _Colors.bgPrimary,
            border: _pendingAttachments.isEmpty
                ? const Border(top: BorderSide(color: _Colors.borderSecondary))
                : null,
          ),
          child: SafeArea(
            top: false,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Text input - no border (like v0)
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    maxLines: null,
                    enabled: !isProcessing,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _handleSubmit(),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: _Colors.textPrimary,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Write a message...',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: _Colors.textTertiary,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                // Image picker button (like v0)
                InkWell(
                  onTap: isProcessing ? null : _handleImagePicker,
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.image_outlined,
                      size: 24,
                      color: isProcessing ? _Colors.borderSecondary : _Colors.textTertiary,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                // Send button - circular with arrow-up icon (like v0)
                GestureDetector(
                  onTap: isProcessing ? null : _handleSubmit,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: _Colors.textPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: isProcessing
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
                        : const Icon(
                            Icons.arrow_upward,
                            size: 20,
                            color: _Colors.textWhite,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Pending attachment thumbnail for the comment input (like v0)
class _PendingAttachmentThumbnail extends StatelessWidget {
  final AttachmentUploadState upload;
  final VoidCallback onRetry;
  final VoidCallback onDelete;

  const _PendingAttachmentThumbnail({
    required this.upload,
    required this.onRetry,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isFailed = upload.status == UploadStatus.failed;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isFailed ? Colors.red.shade300 : _Colors.borderPrimary,
          width: isFailed ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: _Colors.bgPrimary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Status icon
              _buildStatusIcon(),
              const SizedBox(width: 12),
              // File info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      upload.fileName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _Colors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _buildMetadataText(),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: _Colors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
              // Delete button
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: _Colors.textTertiary,
                ),
              ),
            ],
          ),
          // Progress bar (only for uploading)
          if (upload.status == UploadStatus.uploading) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const LinearProgressIndicator(
                backgroundColor: _Colors.bgSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(_Colors.textPrimary),
                minHeight: 4,
              ),
            ),
          ],
          // Error message and retry link
          if (isFailed && upload.errorMessage != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 68),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        upload.errorMessage!,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: Colors.red.shade700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: onRetry,
                        child: const Text(
                          'Try again',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _Colors.textPrimary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _buildMetadataText() {
    final size = _formatFileSize(upload.sizeBytes);
    if (upload.status == UploadStatus.uploading) {
      return '$size • uploading...';
    } else if (upload.status == UploadStatus.completed) {
      return '$size • 100%';
    }
    return size;
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Widget _buildStatusIcon() {
    switch (upload.status) {
      case UploadStatus.pending:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: upload.mimeType == 'application/pdf'
              ? const Icon(Icons.picture_as_pdf, color: Color(0xFF2563EB), size: 28)
              : const Icon(Icons.image, color: Color(0xFF2563EB), size: 28),
        );
      case UploadStatus.uploading:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2563EB)),
              ),
            ),
          ),
        );
      case UploadStatus.completed:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.check_circle, color: Colors.green.shade700, size: 28),
        );
      case UploadStatus.failed:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.error_outline, color: Colors.red.shade700, size: 28),
        );
    }
  }
}
