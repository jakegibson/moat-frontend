import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/ticketing_client.dart';
import '../data/ticketing_models.dart';

/// State management for ticketing settings (assignment rules).
///
/// Uses Signals for reactive state updates.
@lazySingleton
class TicketingState {
  final TicketingClient _client;

  TicketingState(this._client);

  // ==========================================================================
  // Core State
  // ==========================================================================

  final rules = signal<List<AssignmentRule>>([]);
  final taskTypes = signal<List<String>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);

  // Sort state
  final sortField = signal('priority');
  final sortAscending = signal(true);

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  late final ruleCount = computed(() => rules.value.length);

  late final activeRules = computed(
    () => rules.value.where((r) => r.isActive).toList(),
  );

  late final activeRuleCount = computed(() => activeRules.value.length);

  late final inactiveRules = computed(
    () => rules.value.where((r) => !r.isActive).toList(),
  );

  /// Rules sorted by current sort field.
  late final sortedRules = computed(() {
    final sorted = List<AssignmentRule>.from(rules.value);

    sorted.sort((a, b) {
      int comparison;
      switch (sortField.value) {
        case 'name':
          comparison = a.name.compareTo(b.name);
        case 'isActive':
          comparison = (a.isActive ? 1 : 0).compareTo(b.isActive ? 1 : 0);
        case 'priority':
        default:
          comparison = a.priority.compareTo(b.priority);
      }
      return sortAscending.value ? comparison : -comparison;
    });

    return sorted;
  });

  // ==========================================================================
  // Operations
  // ==========================================================================

  /// Fetch all assignment rules and task types.
  Future<void> fetchRules({bool refresh = false}) async {
    if (isLoading.value && !refresh) return;

    isLoading.value = true;
    error.value = null;

    // Fetch rules and task types in parallel
    final results = await Future.wait([
      _client.listRules().toResult(),
      _client.getTaskTypes().toResult(),
    ]);

    batch(() {
      final rulesResult = results[0] as Result<List<AssignmentRule>>;
      final typesResult = results[1] as Result<List<String>>;

      rulesResult.when(
        ok: (data) => rules.value = data,
        error: (e) => error.value = e,
      );

      typesResult.when(
        ok: (data) => taskTypes.value = data,
        error: (_) {}, // Task types are not critical
      );

      isLoading.value = false;
    });
  }

  /// Set sort field and direction.
  void setSort(String field, {bool? ascending}) {
    if (sortField.value == field && ascending == null) {
      // Toggle direction if same field
      sortAscending.value = !sortAscending.value;
    } else {
      sortField.value = field;
      if (ascending != null) {
        sortAscending.value = ascending;
      }
    }
  }

  /// Create a new assignment rule.
  Future<Result<AssignmentRule>> createRule({
    required String name,
    String? description,
    required int priority,
    required AssignmentConditions conditions,
    required AssignmentType assignmentType,
    required AssignmentMethod assignmentMethod,
  }) async {
    final result = await _client
        .createRule(
          name: name,
          description: description,
          priority: priority,
          conditions: conditions,
          assignmentType: assignmentType,
          assignmentMethod: assignmentMethod,
        )
        .toResult();

    result.when(
      ok: (newRule) {
        rules.value = [...rules.value, newRule];
      },
      error: (e) => error.value = e,
    );

    return result;
  }

  /// Update an existing assignment rule.
  Future<Result<AssignmentRule>> updateRule(AssignmentRule rule) async {
    // Optimistic update
    final previousRules = rules.value;
    rules.value = rules.value.map((r) => r.id == rule.id ? rule : r).toList();

    final result = await _client.updateRule(rule).toResult();

    result.when(
      ok: (updatedRule) {
        rules.value =
            rules.value.map((r) => r.id == rule.id ? updatedRule : r).toList();
      },
      error: (e) {
        // Rollback on error
        rules.value = previousRules;
        error.value = e;
      },
    );

    return result;
  }

  /// Toggle rule active status.
  Future<Result<AssignmentRule>> toggleRuleActive(String ruleId) async {
    // Optimistic update
    final previousRules = rules.value;
    rules.value = rules.value
        .map((r) => r.id == ruleId ? r.copyWith(isActive: !r.isActive) : r)
        .toList();

    final result = await _client.toggleRuleActive(ruleId).toResult();

    result.when(
      ok: (updatedRule) {
        rules.value = rules.value
            .map((r) => r.id == ruleId ? updatedRule : r)
            .toList();
      },
      error: (e) {
        // Rollback on error
        rules.value = previousRules;
        error.value = e;
      },
    );

    return result;
  }

  /// Delete an assignment rule.
  Future<Result<void>> deleteRule(String ruleId) async {
    // Optimistic update
    final previousRules = rules.value;
    rules.value = rules.value.where((r) => r.id != ruleId).toList();

    final result = await _client.deleteRule(ruleId).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        // Rollback on error
        rules.value = previousRules;
        error.value = e;
      },
    );

    return result;
  }
}
