import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show FileUploadInputElement, FileReader, document;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/right_side_drawer.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../auth/state/auth_state.dart';
import '../data/task_models.dart';
import '../state/task_detail_state.dart';
import '../widgets/ticket_detail_activity_widgets.dart';
import '../widgets/ticket_detail_comment_input.dart';
import '../widgets/ticket_detail_common.dart';
import '../widgets/ticket_detail_image_viewer.dart';
import '../widgets/ticket_detail_status_overlay.dart';

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
          surface: AppColors.white,
          onSurface: AppColors.textPrimary,
          primary: AppColors.accentBlue,
        ),
        scaffoldBackgroundColor: AppColors.white,
      ),
      child: Container(
        color: AppColors.white,
        child: Watch((context) {
          final task = _state.selectedTask.value;
          final isLoading = _state.isLoading.value;
          final error = _state.error.value;

          if (isLoading && task == null) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.accentBlue),
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
                  color: AppColors.textTertiary,
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
        padding: const EdgeInsets.all(AppSizes.spacing3XL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: AppColors.utilityOrange500),
            SizedBox(height: AppSizes.spacingXL),
            const Text(
              'Failed to load ticket',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: AppSizes.spacingMD),
            Text(
              error.message ?? 'Unknown error',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spacing3XL),
            GestureDetector(
              onTap: _loadTask,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.accentBlue,
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
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
        // Header
        _buildHeader(task),
        // Tab navigation with activity count from state
        Watch((context) {
          final activityCount = _state.taskActivity.value.length;
          return TicketDetailTabNavigation(
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
                      SizedBox(height: AppSizes.spacing3XL),

                      // Description
                      if (task.description != null && task.description!.isNotEmpty) ...[
                        _buildDescriptionSection(task),
                        SizedBox(height: AppSizes.spacing3XL),
                      ],

                      // Photos section
                      Watch((context) {
                        final attachments = _state.taskAttachments.value;
                        return _buildPhotosSection(task, attachments);
                      }),
                      SizedBox(height: AppSizes.spacing3XL),

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
                  color: AppColors.textPrimary,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.bgSecondary,
                ),
              ),
              // Status tag
              TicketStatusTag(status: task.status),
              // Edit button (only if status is Created)
              if (task.status == TaskStatus.created)
                IconButton(
                  onPressed: () {
                    // TODO: Implement edit mode
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 20.0,
                    color: AppColors.textPrimary,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.bgSecondary,
                  ),
                )
              else
                const SizedBox(width: 40),
            ],
          ),
          SizedBox(height: AppSizes.spacingMD),
          // Title on new line
          Text(
            task.title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssigneeListCard(TaskWithDetails task) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.spacingXL),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius16),
        border: Border.all(color: AppColors.borderSecondary),
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
                  color: AppColors.accentBlueBg,
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
                            color: AppColors.accentBlue,
                          ),
                        )
                      : const Icon(Icons.person_outline, size: 20, color: AppColors.accentBlue),
                ),
              ),
              SizedBox(width: AppSizes.spacingLG),
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
                        color: AppColors.textTertiary,
                      ),
                    ),
                    SizedBox(height: AppSizes.spacingXXS),
                    Text(
                      task.assigneeName ?? 'Unassigned',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              // Reassign button
              GestureDetector(
                onTap: () => _handleReassign(task),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Reassign',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(width: AppSizes.spacingXS),
                    Icon(Icons.chevron_right, size: 20, color: AppColors.textPrimary),
                  ],
                ),
              ),
            ],
          ),
          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: AppColors.borderSecondary),
          ),
          // Location row
          Row(
            children: [
              // Location icon in circle
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.accentBlueBg,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.location_on_outlined, size: 20, color: AppColors.accentBlue),
                ),
              ),
              SizedBox(width: AppSizes.spacingLG),
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
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (task.specificLocation != null) ...[
                      SizedBox(height: AppSizes.spacingXXS),
                      Text(
                        task.specificLocation!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: AppColors.textTertiary,
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
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.spacingXL),
        // Description with left blue border only
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.utilityBlue500, width: 4.0),
            ),
          ),
          child: Text(
            task.description!,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              height: 1.5,
              color: AppColors.textPrimary,
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
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.spacingXL),
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
                    onTap: () => FullScreenImageViewer.show(
                      context,
                      images: images,
                      initialIndex: index,
                      uploaderName: task.requestedByName,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                      child: Image.network(
                        attachment.url,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 80,
                          height: 80,
                          color: AppColors.bgSecondary,
                          child: const Icon(
                            Icons.broken_image_outlined,
                            color: AppColors.textTertiary,
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
                    color: AppColors.bgSecondary,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    border: Border.all(color: AppColors.borderSecondary),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.textTertiary,
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
    // Format the created date
    final localCreatedAt = task.createdAt.isUtc ? task.createdAt.toLocal() : task.createdAt;
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('h:mma');
    final formattedDate =
        '${dateFormat.format(localCreatedAt)} at ${timeFormat.format(localCreatedAt).toLowerCase()}';

    return Container(
      padding: const EdgeInsets.all(AppSizes.spacingXL),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
      ),
      child: Column(
        children: [
          // Ticket row
          if (task.externalId != null) _buildInfoRow('Ticket', '#${task.externalId}'),

          // Type row
          _buildInfoRow(
            'Type',
            task.taskType == TaskType.serviceRequest ? 'Service Request' : 'Maintenance',
          ),

          // Created date row
          _buildInfoRow('Created', formattedDate),

          // Created by row
          if (task.requestedByName != null) _buildInfoRowWithAvatar('Created By', task.requestedByName!),
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
                color: AppColors.textTertiary,
              ),
            ),
          ),
          SizedBox(width: AppSizes.spacingXL),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
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
                color: AppColors.textTertiary,
              ),
            ),
          ),
          SizedBox(width: AppSizes.spacingXL),
          Container(
            height: 20.0,
            width: 20.0,
            decoration: const BoxDecoration(
              color: AppColors.utilityBlue500,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSizes.spacingMD),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
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
                child: CircularProgressIndicator(color: AppColors.accentBlue),
              );
            }

            // Filter activities using centralized logic
            final filteredActivity = activity.where(_shouldDisplayActivity).toList();

            if (filteredActivity.isEmpty) {
              return const Center(
                child: Text(
                  'No activity yet',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: AppColors.textTertiary,
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
                    // Date header (plain centered text)
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
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                    // Activities for this date
                    ...activities.map((item) {
                      final isLast = item == activities.last && reversedIndex == groupedActivities.length - 1;
                      return ActivityItemWidget(
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
        TicketDetailCommentInput(
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

  /// Filter activities for display
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
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.borderSecondary),
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
                _activeOverlay = UpdateStatusOverlay(
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
                        _activeOverlay = TaskCompletedOverlay(
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
              backgroundColor: AppColors.textPrimary,
              foregroundColor: AppColors.textWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusPill),
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
    final result = await ReassignDialog.show(
      context,
      currentAssigneeId: task.assigneeId,
      locationId: task.locationId,
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
    final input = html.FileUploadInputElement()
      ..accept = 'image/jpeg,image/png,image/gif,image/webp'
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
            final extension = fileName.split('.').last.toLowerCase();
            final mimeType = 'image/$extension';

            await _state.uploadAttachment(
              taskId: taskId,
              fileName: fileName,
              contentType: mimeType,
              sizeBytes: bytes.length,
              bytes: bytes.toList(),
            );
          }
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error uploading file: $e'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      }
      input.remove();
    });

    html.document.body!.append(input);
    input.click();
  }
}
