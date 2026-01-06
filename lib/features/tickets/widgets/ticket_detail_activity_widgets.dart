import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../data/task_models.dart';

/// Activity item widget - displays a single activity entry with chat-bubble style
class ActivityItemWidget extends StatelessWidget {
  final TaskActivity activity;
  final bool isLast;
  final String? currentUserId;

  const ActivityItemWidget({
    super.key,
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
    return ActivityBubble(
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
                color: _isCurrentUser ? AppColors.textWhite : AppColors.textPrimary,
              ),
            ),
            TextSpan(
              text: ' ticket',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _isCurrentUser ? AppColors.textWhite : AppColors.textPrimary,
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

    return ActivityBubble(
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
                color: (isAutoAssigned || !_isCurrentUser) ? AppColors.textPrimary : AppColors.textWhite,
              ),
            ),
            TextSpan(
              text: ' to $assigneeName',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: (isAutoAssigned || !_isCurrentUser) ? AppColors.textPrimary : AppColors.textWhite,
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

    return ActivityBubble(
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
                color: _isCurrentUser ? AppColors.textWhite : AppColors.textPrimary,
              ),
            ),
            TextSpan(
              text: ' to ${_formatStatus(newStatusStr)}${resolutionTypeStr != null ? ' / ${_formatResolutionType(resolutionTypeStr)}' : ''}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _isCurrentUser ? AppColors.textWhite : AppColors.textPrimary,
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

    return ActivityBubble(
      isCurrentUser: _isCurrentUser,
      userName: comment.createdBy?.name ?? _userName,
      timestamp: activity.createdAt,
      isSystemUser: false,
      isComment: true,
      // Attachments go in white container below bubble (like status updates)
      hasAttachedContent: hasAttachments,
      attachedContent: hasAttachments
          ? Padding(
              padding: const EdgeInsets.all(AppSizes.spacingLG),
              child: _buildAttachmentGallery(activity.attachments),
            )
          : null,
      child: Text(
        comment.content,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: _isCurrentUser ? AppColors.textWhite : AppColors.textPrimary,
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

    return ActivityBubble(
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
                color: _isCurrentUser ? AppColors.textWhite : AppColors.textPrimary,
              ),
            ),
            if (oldValue != null)
              TextSpan(
                text: ' from "$oldValue"',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: _isCurrentUser ? AppColors.textWhite : AppColors.textPrimary,
                ),
              ),
            TextSpan(
              text: ' to "$newValue"',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _isCurrentUser ? AppColors.textWhite : AppColors.textPrimary,
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
            padding: const EdgeInsets.all(AppSizes.spacingLG),
            child: Text(
              notes,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        if (attachments.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(AppSizes.spacingLG),
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
                  color: AppColors.bgSecondary,
                  borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  border: Border.all(color: AppColors.borderSecondary),
                ),
                child: attachment.isImage && attachment.url.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                        child: Image.network(
                          attachment.url,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Center(
                            child: Icon(
                              attachment.fileIcon,
                              color: AppColors.textTertiary,
                              size: 24,
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Icon(
                          attachment.fileIcon,
                          color: AppColors.textTertiary,
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

/// Chat bubble wrapper that handles alignment and styling
class ActivityBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String userName;
  final DateTime timestamp;
  final bool isSystemUser;
  final Widget child;
  final bool hasAttachedContent;
  final Widget? attachedContent;
  final bool isComment;

  const ActivityBubble({
    super.key,
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
                        color: AppColors.textTertiary,
                      ),
                    ),
                    SizedBox(width: AppSizes.spacingXS),
                  ],
                  Text(
                    formattedTime,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.spacingXS),
            // Line 2: Avatar + Bubble
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar on left for non-current users
                if (!isCurrentUser) ...[
                  ActivityUserAvatar(
                    userName: userName,
                    isSystemUser: isSystemUser,
                  ),
                  SizedBox(width: AppSizes.spacingMD),
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
                            color: isCurrentUser ? AppColors.textPrimary : AppColors.bgSecondary,
                            borderRadius: _getBubbleRadius(hasContent: hasAttachedContent),
                          ),
                          child: child,
                        ),
                        // Attached content below bubble (white container for notes/attachments)
                        if (hasAttachedContent && attachedContent != null)
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.borderSecondary),
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
class ActivityUserAvatar extends StatelessWidget {
  final String userName;
  final bool isSystemUser;

  const ActivityUserAvatar({
    super.key,
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
          color: AppColors.utilityBlue500,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.settings_suggest,
            color: AppColors.textWhite,
            size: 16,
          ),
        ),
      );
    }

    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: AppColors.utilityBlue500,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _getInitials(),
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textWhite,
          ),
        ),
      ),
    );
  }
}
