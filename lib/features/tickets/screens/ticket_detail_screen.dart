import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../data/task_models.dart';
import '../state/task_detail_state.dart';
import '../widgets/photos_section.dart';
import '../widgets/assignee_dropdown.dart';
import 'edit_ticket_drawer.dart';

/// Figma design colors (light theme)
class _DesignColors {
  static const Color bgPrimary = Color(0xFFFFFFFF);
  static const Color bgSecondary = Color(0xFFF1F0EE);
  static const Color borderPrimary = Color(0xFFD3D1CF);
  static const Color borderSecondary = Color(0xFFE4E1DF);
  static const Color textPrimary = Color(0xFF161616);
  static const Color textSecondary = Color(0xFF535352);
  static const Color textTertiary = Color(0xFF848281);
  static const Color accentBlue = Color(0xFF2563EB);
  static const Color accentBlueBg = Color(0xFFDBEAFE);
  static const Color badgeServiceRequest = Color(0xFFF97066);
  static const Color badgeServiceRequestBg = Color(0xFFFEF3F2);
  static const Color badgeMaintenance = Color(0xFF17B26A);
  static const Color badgeMaintenanceBg = Color(0xFFECFDF3);
  static const Color statusInProgress = Color(0xFFF79009);
  static const Color statusOpen = Color(0xFF2563EB);
  static const Color statusResolved = Color(0xFF17B26A);
}

class TicketDetailScreen extends StatefulWidget {
  final String externalId;

  const TicketDetailScreen({required this.externalId, super.key});

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  late final TaskDetailState _state;

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

  ThemeData get _lightTheme => ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          surface: _DesignColors.bgPrimary,
          onSurface: _DesignColors.textPrimary,
          primary: _DesignColors.accentBlue,
        ),
        scaffoldBackgroundColor: _DesignColors.bgPrimary,
        inputDecorationTheme: const InputDecorationTheme(
          filled: false,
          border: InputBorder.none,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _lightTheme,
      child: Scaffold(
        backgroundColor: _DesignColors.bgPrimary,
        body: Watch((context) {
        final task = _state.selectedTask.value;
        final isLoading = _state.isLoading.value;
        final error = _state.error.value;

        if (isLoading && task == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: _DesignColors.accentBlue,
            ),
          );
        }

        if (error != null && task == null) {
          return _buildErrorView(context, error);
        }

        if (task == null) {
          return Center(
            child: Text(
              'Ticket not found',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: _DesignColors.textTertiary,
              ),
            ),
          );
        }

        // Load attachments when task is available
        if (_state.taskAttachments.value.isEmpty) {
          _loadAttachments(task.id);
        }

        return _buildContent(context, task);
      }),
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, dynamic error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: _DesignColors.badgeServiceRequest,
            ),
            const SizedBox(height: 16),
            const Text(
              'Failed to load ticket',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _DesignColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.message ?? 'Unknown error',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: _DesignColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: _loadTask,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: _DesignColors.accentBlue,
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

  Widget _buildContent(BuildContext context, TaskWithDetails task) {
    return Column(
      children: [
        // Main scrollable content
        Expanded(
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: _buildHeader(context, task),
              ),
              // Content
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Title
                    Text(
                      task.title,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 1.33,
                        color: _DesignColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Assignee section
                    _buildAssigneeSection(context, task),
                    const SizedBox(height: 24),

                    // Description
                    if (task.description != null &&
                        task.description!.isNotEmpty) ...[
                      _buildDescriptionSection(context, task),
                      const SizedBox(height: 24),
                    ],

                    // Photos section
                    Watch((context) {
                      final attachments = _state.taskAttachments.value;
                      return _buildPhotosSection(task, attachments);
                    }),
                    const SizedBox(height: 24),

                    // Location section
                    _buildLocationSection(context, task),
                    const SizedBox(height: 24),

                    // Requested by section
                    if (task.requestedByName != null) ...[
                      _buildRequestedBySection(context, task),
                      const SizedBox(height: 24),
                    ],

                    // Bottom spacing for status bar
                    const SizedBox(height: 80),
                  ]),
                ),
              ),
            ],
          ),
        ),

        // Bottom status action bar
        Watch((context) {
          final isLoading = _state.isLoading.value;
          return _buildStatusBar(context, task, isLoading);
        }),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, TaskWithDetails task) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      decoration: const BoxDecoration(
        color: _DesignColors.bgPrimary,
        border: Border(
          bottom: BorderSide(color: _DesignColors.borderSecondary),
        ),
      ),
      child: Row(
        children: [
          // Close button
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _DesignColors.bgPrimary,
                border: Border.all(color: _DesignColors.borderPrimary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.close,
                size: 20,
                color: _DesignColors.textPrimary,
              ),
            ),
          ),
          const Spacer(),
          // Type badge
          _buildTypeBadge(task.taskType),
          const SizedBox(width: 12),
          // Edit button (only for created status)
          if (task.status == TaskStatus.created)
            GestureDetector(
              onTap: () => _handleEditTicket(task),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _DesignColors.bgPrimary,
                  border: Border.all(color: _DesignColors.borderPrimary),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: _DesignColors.textPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTypeBadge(TaskType type) {
    final isServiceRequest = type == TaskType.serviceRequest;
    final color = isServiceRequest
        ? _DesignColors.badgeServiceRequest
        : _DesignColors.badgeMaintenance;
    final bgColor = isServiceRequest
        ? _DesignColors.badgeServiceRequestBg
        : _DesignColors.badgeMaintenanceBg;
    final text = isServiceRequest ? 'Service Request' : 'Maintenance';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  Widget _buildAssigneeSection(BuildContext context, TaskWithDetails task) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _DesignColors.bgPrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _DesignColors.borderSecondary),
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
                  color: _DesignColors.accentBlueBg,
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
                            color: _DesignColors.accentBlue,
                          ),
                        )
                      : const Icon(
                          Icons.person_outline,
                          size: 20,
                          color: _DesignColors.accentBlue,
                        ),
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
                        color: _DesignColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      task.assigneeName ?? 'Unassigned',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _DesignColors.textPrimary,
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
                        color: _DesignColors.textPrimary,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: _DesignColors.textPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: _DesignColors.borderSecondary),
          ),
          // Location row
          Row(
            children: [
              // Location icon in circle
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: _DesignColors.accentBlueBg,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.location_on_outlined, size: 20, color: _DesignColors.accentBlue),
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
                        color: _DesignColors.textPrimary,
                      ),
                    ),
                    if (task.specificLocation != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        task.specificLocation!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: _DesignColors.textTertiary,
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

  Widget _buildDescriptionSection(BuildContext context, TaskWithDetails task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _DesignColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        // Description with left accent border
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _DesignColors.accentBlueBg.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              left: BorderSide(
                color: _DesignColors.accentBlue,
                width: 4,
              ),
            ),
          ),
          child: Text(
            task.description!,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: _DesignColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotosSection(
      TaskWithDetails task, List<TaskAttachment> attachments) {
    final images =
        attachments.where((a) => a.contentType.startsWith('image/')).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _DesignColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
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
                            color: _DesignColors.bgSecondary,
                            child: const Icon(
                              Icons.broken_image_outlined,
                              color: _DesignColors.textTertiary,
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
                    color: _DesignColors.bgSecondary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _DesignColors.borderPrimary,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: _DesignColors.textTertiary,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection(BuildContext context, TaskWithDetails task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _DesignColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _DesignColors.bgSecondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Location icon
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: _DesignColors.accentBlueBg,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.location_on,
                  size: 20,
                  color: _DesignColors.accentBlue,
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
                        color: _DesignColors.textPrimary,
                      ),
                    ),
                    if (task.specificLocation != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        task.specificLocation!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: _DesignColors.textTertiary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Route button
              GestureDetector(
                onTap: () => _handleOpenRoute(task),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: _DesignColors.bgPrimary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: _DesignColors.borderPrimary),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.directions_walk,
                        size: 16,
                        color: _DesignColors.textPrimary,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Route',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: _DesignColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRequestedBySection(BuildContext context, TaskWithDetails task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Requested by',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _DesignColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _DesignColors.bgSecondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _DesignColors.bgPrimary,
                  shape: BoxShape.circle,
                  border: Border.all(color: _DesignColors.borderPrimary),
                ),
                child: Center(
                  child: Text(
                    task.requestedByName![0].toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _DesignColors.textPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.requestedByName!,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _DesignColors.textPrimary,
                      ),
                    ),
                    // Role/department could go here if available
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBar(
      BuildContext context, TaskWithDetails task, bool isLoading) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: _DesignColors.bgPrimary,
        border: Border(
          top: BorderSide(color: _DesignColors.borderSecondary),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0A0A0D12),
            blurRadius: 8,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Status dropdown
            Expanded(
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: _DesignColors.bgSecondary,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: _DesignColors.borderPrimary),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<TaskStatus>(
                    value: task.status,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: _DesignColors.textTertiary,
                    ),
                    dropdownColor: _DesignColors.bgPrimary,
                    items: TaskStatus.values
                        .where((s) => s != TaskStatus.unspecified)
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Row(
                                children: [
                                  _StatusIndicator(status: status),
                                  const SizedBox(width: 8),
                                  Text(
                                    status.displayName,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: _DesignColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: isLoading
                        ? null
                        : (status) {
                            if (status != null && status != task.status) {
                              _handleUpdateStatus(task, status);
                            }
                          },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Update Status button
            GestureDetector(
              onTap: isLoading ? null : () => _handleUpdateStatus(task, task.status),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: _DesignColors.accentBlue,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Update Status',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Handlers

  Future<void> _handleEditTicket(TaskWithDetails task) async {
    final result = await EditTicketDrawer.show(context, task);
    if (result == true) {
      _loadTask();
    }
  }

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
        contentType: file.extension != null
            ? 'image/${file.extension}'
            : 'image/jpeg',
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
              child: Image.network(
                attachment.url,
                fit: BoxFit.contain,
              ),
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
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleOpenRoute(TaskWithDetails task) {
    final query = task.specificLocation != null
        ? '${task.locationName} ${task.specificLocation}'
        : task.locationName ?? '';

    if (query.isNotEmpty) {
      // Open Google Maps
      final url =
          'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}';
      // In a real app, use url_launcher package
      debugPrint('Opening maps: $url');
    }
  }

  Future<void> _handleUpdateStatus(
      TaskWithDetails task, TaskStatus status) async {
    if (status == TaskStatus.resolved) {
      // Show resolve dialog
      final result = await showDialog<_ResolveResult>(
        context: context,
        builder: (context) => const _ResolveDialog(),
      );

      if (result != null) {
        await _state.updateTaskStatus(
          id: task.id,
          status: status,
          resolutionType: result.resolutionType,
          notes: result.notes,
        );
        _loadTask();
      }
    } else if (status != task.status) {
      await _state.updateTaskStatus(
        id: task.id,
        status: status,
      );
      _loadTask();
    }
  }
}

class _StatusIndicator extends StatelessWidget {
  final TaskStatus status;

  const _StatusIndicator({required this.status});

  Color get _color {
    switch (status) {
      case TaskStatus.created:
        return _DesignColors.statusOpen;
      case TaskStatus.inProgress:
        return _DesignColors.statusInProgress;
      case TaskStatus.onHold:
        return const Color(0xFFF59E0B);
      case TaskStatus.resolved:
        return _DesignColors.statusResolved;
      default:
        return _DesignColors.textTertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: _color,
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Dialog for reassigning a task
class _ReassignDialog extends StatefulWidget {
  final String? currentAssigneeId;
  final String? locationId;

  const _ReassignDialog({
    this.currentAssigneeId,
    this.locationId,
  });

  @override
  State<_ReassignDialog> createState() => _ReassignDialogState();
}

class _ReassignDialogState extends State<_ReassignDialog> {
  AssignmentSelection? _selection;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: _DesignColors.bgPrimary,
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
                color: _DesignColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: AssigneeDropdown(
                locationId: widget.locationId,
                value: _selection,
                onChanged: (value) {
                  setState(() => _selection = value);
                },
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _DesignColors.textTertiary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _selection != null
                      ? () => Navigator.pop(context, _selection)
                      : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: _selection != null
                          ? _DesignColors.accentBlue
                          : _DesignColors.bgSecondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Reassign',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _selection != null
                            ? Colors.white
                            : _DesignColors.textTertiary,
                      ),
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

class _ResolveResult {
  final ResolutionType resolutionType;
  final String? notes;

  _ResolveResult({required this.resolutionType, this.notes});
}

class _ResolveDialog extends StatefulWidget {
  const _ResolveDialog();

  @override
  State<_ResolveDialog> createState() => _ResolveDialogState();
}

class _ResolveDialogState extends State<_ResolveDialog> {
  ResolutionType _resolutionType = ResolutionType.completed;
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: _DesignColors.bgPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resolve Ticket',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _DesignColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Resolution Type',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _DesignColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            ...ResolutionType.values
                .where((r) => r != ResolutionType.unspecified)
                .map(
                  (type) => GestureDetector(
                    onTap: () => setState(() => _resolutionType = type),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _resolutionType == type
                                    ? _DesignColors.accentBlue
                                    : _DesignColors.borderPrimary,
                                width: 2,
                              ),
                            ),
                            child: _resolutionType == type
                                ? Center(
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _DesignColors.accentBlue,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            type.displayName,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: _DesignColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: _DesignColors.borderPrimary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _notesController,
                maxLines: 3,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: _DesignColors.textPrimary,
                ),
                decoration: const InputDecoration(
                  hintText: 'Notes (optional)',
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: _DesignColors.textTertiary,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _DesignColors.textTertiary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => Navigator.pop(
                    context,
                    _ResolveResult(
                      resolutionType: _resolutionType,
                      notes: _notesController.text.isEmpty
                          ? null
                          : _notesController.text,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: _DesignColors.accentBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Resolve',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
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
