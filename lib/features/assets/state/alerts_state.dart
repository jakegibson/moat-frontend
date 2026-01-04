import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../data/alerts_client.dart';
import '../data/alerts_models.dart';

/// State management for asset alerts.
///
/// Uses Signals for reactive state updates.
@lazySingleton
class AlertsState {
  final AlertsClient _client;

  AlertsState(this._client);

  // ==========================================================================
  // Core State
  // ==========================================================================

  final alerts = signal<List<AssetAlert>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);

  // Filter state
  final searchQuery = signal('');
  final selectedLocationId = signal<String?>(null);
  final selectedType = signal<AlertType?>(null);
  final sortField = signal('alertDueDate');
  final sortAscending = signal(true);

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  late final alertCount = computed(() => alerts.value.length);

  late final overdueAlerts = computed(
    () => alerts.value.where((a) => a.isOverdue).toList(),
  );

  late final overdueCount = computed(() => overdueAlerts.value.length);

  late final upcomingAlerts = computed(
    () => alerts.value.where((a) => !a.isOverdue).toList(),
  );

  late final warrantyAlerts = computed(
    () => alerts.value
        .where((a) => a.type == AlertType.warranty)
        .toList(),
  );

  late final maintenanceAlerts = computed(
    () => alerts.value
        .where((a) =>
            a.type == AlertType.maintenance || a.type == AlertType.complete)
        .toList(),
  );

  /// Alerts grouped by location for easier display.
  late final alertsByLocation = computed(() {
    final map = <String, List<AssetAlert>>{};
    for (final alert in alerts.value) {
      final location = alert.locationName ?? 'Unknown';
      map.putIfAbsent(location, () => []).add(alert);
    }
    return map;
  });

  /// Unique locations from alerts.
  late final locations = computed(() {
    final locs = <String>{};
    for (final alert in alerts.value) {
      if (alert.locationName != null) {
        locs.add(alert.locationName!);
      }
    }
    return locs.toList()..sort();
  });

  /// Unique divisions from alerts.
  late final divisions = computed(() {
    final divs = <String>{};
    for (final alert in alerts.value) {
      if (alert.division != null) {
        divs.add(alert.division!);
      }
    }
    return divs.toList()..sort();
  });

  /// Filtered and sorted alerts based on current filters.
  late final filteredAlerts = computed(() {
    var result = List<AssetAlert>.from(alerts.value);

    // Apply search filter
    final query = searchQuery.value.toLowerCase();
    if (query.isNotEmpty) {
      result = result
          .where((a) =>
              a.name.toLowerCase().contains(query) ||
              a.assetName.toLowerCase().contains(query) ||
              a.reason.toLowerCase().contains(query) ||
              (a.locationName?.toLowerCase().contains(query) ?? false) ||
              (a.division?.toLowerCase().contains(query) ?? false))
          .toList();
    }

    // Apply location filter
    final locId = selectedLocationId.value;
    if (locId != null) {
      result = result.where((a) => a.locationId == locId).toList();
    }

    // Apply type filter
    final type = selectedType.value;
    if (type != null) {
      result = result.where((a) => a.type == type).toList();
    }

    // Apply sorting
    result.sort((a, b) {
      int comparison;
      switch (sortField.value) {
        case 'name':
          comparison = a.name.compareTo(b.name);
        case 'assetName':
          comparison = a.assetName.compareTo(b.assetName);
        case 'locationName':
          comparison =
              (a.locationName ?? '').compareTo(b.locationName ?? '');
        case 'reason':
          comparison = a.reason.compareTo(b.reason);
        case 'type':
          comparison = a.type.index.compareTo(b.type.index);
        case 'alertDueDate':
        default:
          comparison = a.alertDueDate.compareTo(b.alertDueDate);
      }
      return sortAscending.value ? comparison : -comparison;
    });

    return result;
  });

  // ==========================================================================
  // Operations
  // ==========================================================================

  /// Fetch all alerts.
  Future<void> fetchAlerts({bool refresh = false}) async {
    if (isLoading.value && !refresh) return;

    isLoading.value = true;
    error.value = null;

    final result = await _client.listAlerts().toResult();

    batch(() {
      result.when(
        ok: (data) => alerts.value = data,
        error: (e) => error.value = e,
      );
      isLoading.value = false;
    });
  }

  /// Set search query.
  void setSearch(String query) {
    searchQuery.value = query;
  }

  /// Set location filter.
  void setLocationFilter(String? locationId) {
    selectedLocationId.value = locationId;
  }

  /// Set type filter.
  void setTypeFilter(AlertType? type) {
    selectedType.value = type;
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

  /// Clear all filters.
  void clearFilters() {
    batch(() {
      searchQuery.value = '';
      selectedLocationId.value = null;
      selectedType.value = null;
    });
  }

  /// Resolve/complete an alert.
  Future<Result<void>> resolveAlert(String alertId) async {
    // Optimistic update
    final previousAlerts = alerts.value;
    alerts.value = alerts.value.where((a) => a.id != alertId).toList();

    final result = await _client.resolveAlert(alertId).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        // Rollback on error
        alerts.value = previousAlerts;
        error.value = e;
      },
    );

    return result;
  }
}
