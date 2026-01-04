import 'package:injectable/injectable.dart';

import 'ticketing_models.dart';

/// Client for ticketing settings API calls.
///
/// Currently returns mock data until proto clients are generated.
@lazySingleton
class TicketingClient {
  TicketingClient();

  // Internal mock data - remove when using real API
  static final _mockRules = <AssignmentRule>[
    AssignmentRule(
      id: 'rule-001',
      companyId: 'company-001',
      name: 'Maintenance to Technicians',
      description: 'Auto-assign maintenance tasks to technician role',
      isActive: true,
      priority: 10,
      conditions: const AssignmentConditions(
        taskTypes: ['Maintenance'],
        roleNames: ['Technician'],
      ),
      assignmentType: AssignmentType.role,
      assignmentMethod: AssignmentMethod.leastLoaded,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    AssignmentRule(
      id: 'rule-002',
      companyId: 'company-001',
      name: 'Warranty Claims',
      description: 'Route warranty issues to warranty specialists',
      isActive: true,
      priority: 20,
      conditions: const AssignmentConditions(
        taskTypes: ['Warranty'],
        roleNames: ['Warranty Specialist', 'Admin'],
      ),
      assignmentType: AssignmentType.role,
      assignmentMethod: AssignmentMethod.random,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    AssignmentRule(
      id: 'rule-003',
      companyId: 'company-001',
      name: 'Main Building Tasks',
      description: 'All tasks for Main Building go to on-site team',
      isActive: true,
      priority: 5,
      conditions: const AssignmentConditions(
        locationIds: ['loc-001'],
        roleNames: ['Location Manager', 'Technician'],
      ),
      assignmentType: AssignmentType.role,
      assignmentMethod: AssignmentMethod.leastLoaded,
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
    ),
    AssignmentRule(
      id: 'rule-004',
      companyId: 'company-001',
      name: 'Urgent Inspections',
      description: 'Inspection tasks assigned to senior staff',
      isActive: false,
      priority: 15,
      conditions: const AssignmentConditions(
        taskTypes: ['Inspection'],
        roleNames: ['Admin'],
      ),
      assignmentType: AssignmentType.role,
      assignmentMethod: AssignmentMethod.random,
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    ),
  ];

  /// List all assignment rules.
  Future<List<AssignmentRule>> listRules() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Sort by priority (lower = higher priority)
    final sorted = List<AssignmentRule>.from(_mockRules)
      ..sort((a, b) => a.priority.compareTo(b.priority));
    return sorted;
  }

  /// Get a single rule by ID.
  Future<AssignmentRule> getRule(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final rule = _mockRules.where((r) => r.id == id).firstOrNull;
    if (rule == null) {
      throw Exception('Rule not found: $id');
    }
    return rule;
  }

  /// Create a new assignment rule.
  Future<AssignmentRule> createRule({
    required String name,
    String? description,
    required int priority,
    required AssignmentConditions conditions,
    required AssignmentType assignmentType,
    required AssignmentMethod assignmentMethod,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final newRule = AssignmentRule(
      id: 'rule-${DateTime.now().millisecondsSinceEpoch}',
      companyId: 'company-001',
      name: name,
      description: description,
      isActive: true,
      priority: priority,
      conditions: conditions,
      assignmentType: assignmentType,
      assignmentMethod: assignmentMethod,
      createdAt: DateTime.now(),
    );

    _mockRules.add(newRule);
    return newRule;
  }

  /// Update an existing assignment rule.
  Future<AssignmentRule> updateRule(AssignmentRule rule) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _mockRules.indexWhere((r) => r.id == rule.id);
    if (index == -1) {
      throw Exception('Rule not found: ${rule.id}');
    }

    final updated = rule.copyWith(updatedAt: DateTime.now());
    _mockRules[index] = updated;
    return updated;
  }

  /// Toggle rule active status.
  Future<AssignmentRule> toggleRuleActive(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _mockRules.indexWhere((r) => r.id == id);
    if (index == -1) {
      throw Exception('Rule not found: $id');
    }

    final rule = _mockRules[index];
    final updated = rule.copyWith(
      isActive: !rule.isActive,
      updatedAt: DateTime.now(),
    );
    _mockRules[index] = updated;
    return updated;
  }

  /// Delete an assignment rule.
  Future<void> deleteRule(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _mockRules.indexWhere((r) => r.id == id);
    if (index == -1) {
      throw Exception('Rule not found: $id');
    }

    _mockRules.removeAt(index);
  }

  /// Get available task types.
  Future<List<String>> getTaskTypes() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return TaskType.all;
  }
}
