import 'package:injectable/injectable.dart';

import 'alerts_models.dart';

/// Client for asset alert-related API calls.
///
/// Currently returns mock data until proto clients are generated.
@lazySingleton
class AlertsClient {
  AlertsClient();

  // Internal mock data - remove when using real API
  static final _mockAlerts = <AssetAlert>[
    AssetAlert(
      id: 'alert-001',
      name: 'HVAC Warranty Expiring',
      reason: 'Warranty coverage expires in 30 days',
      type: AlertType.warranty,
      assetId: 'asset-001',
      assetName: 'HVAC Unit - Main Building',
      locationId: 'loc-001',
      locationName: 'Main Building',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      expirationDate: DateTime.now().add(const Duration(days: 30)),
      isExpirationAlert: true,
      division: 'Mechanical',
    ),
    AssetAlert(
      id: 'alert-002',
      name: 'Elevator Maintenance Due',
      reason: 'Quarterly inspection required',
      type: AlertType.maintenance,
      assetId: 'asset-002',
      assetName: 'Elevator #1',
      maintenanceId: 'maint-001',
      locationId: 'loc-001',
      locationName: 'Main Building',
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      dueDate: DateTime.now().add(const Duration(days: 5)),
      division: 'Vertical Transport',
    ),
    AssetAlert(
      id: 'alert-003',
      name: 'Fire System Inspection Overdue',
      reason: 'Annual inspection past due',
      type: AlertType.resolve,
      assetId: 'asset-003',
      assetName: 'Fire Suppression System',
      maintenanceId: 'maint-002',
      locationId: 'loc-002',
      locationName: 'Warehouse',
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
      dueDate: DateTime.now().subtract(const Duration(days: 15)),
      division: 'Fire Protection',
    ),
    AssetAlert(
      id: 'alert-004',
      name: 'Generator Service Required',
      reason: 'Scheduled maintenance',
      type: AlertType.complete,
      assetId: 'asset-004',
      assetName: 'Backup Generator',
      maintenanceId: 'maint-003',
      locationId: 'loc-001',
      locationName: 'Main Building',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      dueDate: DateTime.now().add(const Duration(days: 14)),
      division: 'Electrical',
    ),
    AssetAlert(
      id: 'alert-005',
      name: 'Camera System Warranty',
      reason: 'Extended warranty expires soon',
      type: AlertType.warranty,
      assetId: 'asset-005',
      assetName: 'Security Camera System',
      locationId: 'loc-003',
      locationName: 'Parking Lot',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      expirationDate: DateTime.now().add(const Duration(days: 60)),
      isExpirationAlert: true,
      division: 'Security',
    ),
    AssetAlert(
      id: 'alert-006',
      name: 'Roof Inspection Due',
      reason: 'Bi-annual roof inspection',
      type: AlertType.maintenance,
      assetId: 'asset-006',
      assetName: 'Roof System - Main',
      maintenanceId: 'maint-004',
      locationId: 'loc-001',
      locationName: 'Main Building',
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      dueDate: DateTime.now().add(const Duration(days: 10)),
      division: 'Roofing',
    ),
  ];

  /// List all alerts.
  Future<List<AssetAlert>> listAlerts({
    String? locationId,
    AlertType? type,
    String? search,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    var filtered = List<AssetAlert>.from(_mockAlerts);

    // Apply location filter
    if (locationId != null) {
      filtered = filtered.where((a) => a.locationId == locationId).toList();
    }

    // Apply type filter
    if (type != null) {
      filtered = filtered.where((a) => a.type == type).toList();
    }

    // Apply search filter
    if (search != null && search.isNotEmpty) {
      final searchLower = search.toLowerCase();
      filtered = filtered
          .where((a) =>
              a.name.toLowerCase().contains(searchLower) ||
              a.assetName.toLowerCase().contains(searchLower) ||
              a.reason.toLowerCase().contains(searchLower) ||
              (a.locationName?.toLowerCase().contains(searchLower) ?? false))
          .toList();
    }

    // Sort by due date (overdue first, then upcoming)
    filtered.sort((a, b) => a.alertDueDate.compareTo(b.alertDueDate));

    return filtered;
  }

  /// Get a single alert by ID.
  Future<AssetAlert> getAlert(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final alert = _mockAlerts.where((a) => a.id == id).firstOrNull;
    if (alert == null) {
      throw Exception('Alert not found: $id');
    }
    return alert;
  }

  /// Mark an alert as resolved/completed.
  Future<void> resolveAlert(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _mockAlerts.indexWhere((a) => a.id == id);
    if (index == -1) {
      throw Exception('Alert not found: $id');
    }

    _mockAlerts.removeAt(index);
  }

  /// Get count of alerts by type.
  Future<Map<AlertType, int>> getAlertCounts() async {
    await Future.delayed(const Duration(milliseconds: 200));

    final counts = <AlertType, int>{};
    for (final alert in _mockAlerts) {
      counts[alert.type] = (counts[alert.type] ?? 0) + 1;
    }
    return counts;
  }

  /// Get count of overdue alerts.
  Future<int> getOverdueCount() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockAlerts.where((a) => a.isOverdue).length;
  }
}
