/// Permission checks for task management operations.
///
/// This is a client-side helper for UI gating. The server enforces
/// actual permissions - these are for UX only.
class TaskPermissions {
  final String? userId;
  final String? userRole;

  const TaskPermissions({
    this.userId,
    this.userRole,
  });

  /// Can the user create new tasks?
  bool get canCreateTask => _isAtLeast(UserRole.member);

  /// Can the user create task definitions?
  bool get canCreateTaskDef => _isAtLeast(UserRole.manager);

  /// Can the user edit task definitions?
  bool get canEditTaskDef => _isAtLeast(UserRole.manager);

  /// Can the user delete task definitions?
  bool get canDeleteTaskDef => _isAtLeast(UserRole.admin);

  /// Can the user assign tasks to others?
  bool get canAssignTasks => _isAtLeast(UserRole.manager);

  /// Can the user view all tasks (not just their own)?
  bool get canViewAllTasks => _isAtLeast(UserRole.manager);

  /// Can the user edit this specific task?
  bool canEditTask(String? assigneeId) {
    if (_isAtLeast(UserRole.manager)) return true;
    return userId != null && assigneeId == userId;
  }

  /// Can the user claim this task?
  bool canClaimTask(String? currentAssigneeId) {
    if (currentAssigneeId != null) return false;
    return _isAtLeast(UserRole.member);
  }

  /// Can the user update task status?
  bool canUpdateStatus(String? assigneeId) {
    if (_isAtLeast(UserRole.manager)) return true;
    return userId != null && assigneeId == userId;
  }

  /// Can the user add comments?
  bool get canComment => _isAtLeast(UserRole.member);

  /// Can the user edit their own comment?
  bool canEditComment(String? authorId) {
    if (_isAtLeast(UserRole.admin)) return true;
    return userId != null && authorId == userId;
  }

  /// Can the user delete comments?
  bool canDeleteComment(String? authorId) {
    if (_isAtLeast(UserRole.admin)) return true;
    return userId != null && authorId == userId;
  }

  /// Can the user manage assignment rules?
  bool get canManageAssignmentRules => _isAtLeast(UserRole.admin);

  /// Can the user access bulk operations?
  bool get canBulkUpdate => _isAtLeast(UserRole.manager);

  /// Can the user view task def history?
  bool get canViewHistory => _isAtLeast(UserRole.member);

  bool _isAtLeast(UserRole required) {
    final current = UserRole.fromString(userRole);
    return current.level >= required.level;
  }
}

/// User role with hierarchy level.
enum UserRole {
  guest(0),
  member(1),
  manager(2),
  admin(3);

  final int level;
  const UserRole(this.level);

  static UserRole fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'manager':
        return UserRole.manager;
      case 'member':
        return UserRole.member;
      default:
        return UserRole.guest;
    }
  }
}
