import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../core/config/app_config.dart';
import '../../../core/constants/divisions_of_contruction.dart';
import 'cube_models.dart';

/// Client for direct Cube.js API access with JWT authentication.
///
/// Token flow:
/// 1. Get Firebase token
/// 2. Exchange for Cube.js JWT via Go API (/api/auth/cube-token)
/// 3. Call Cube.js directly with JWT
/// 4. Auto-refresh on 401
@lazySingleton
class AnalyticsClient {
  AnalyticsClient();

  String? _cubeToken;
  int? _tokenExpiresAt;

  /// Get or refresh the Cube.js JWT token.
  Future<String> _getToken() async {
    // Check if token is still valid (with 60s buffer)
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    if (_cubeToken != null && _tokenExpiresAt != null && _tokenExpiresAt! > now + 60) {
      return _cubeToken!;
    }

    // Get fresh token from Go API
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      throw Exception('No authenticated user');
    }

    final idToken = await firebaseUser.getIdToken();
    final response = await http.post(
      Uri.parse('${AppConfig.apiBaseUrl}/api/auth/cube-token'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $idToken',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get Cube.js token: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    _cubeToken = json['token'] as String;
    _tokenExpiresAt = json['expires_at'] as int;

    debugPrint('Cube.js token refreshed, expires at: $_tokenExpiresAt');
    return _cubeToken!;
  }

  /// Clear the cached token (call on logout).
  void clearToken() {
    _cubeToken = null;
    _tokenExpiresAt = null;
  }

  /// Cached metadata for the data explorer.
  CubeMeta? _cachedMeta;

  /// Fetch Cube.js metadata (available cubes, measures, dimensions).
  /// Results are cached for the session.
  Future<CubeMeta> getMeta({bool forceRefresh = false}) async {
    if (_cachedMeta != null && !forceRefresh) {
      return _cachedMeta!;
    }

    final token = await _getToken();
    final url = Uri.parse('${AppConfig.cubeUrl}/cubejs-api/v1/meta');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );

    // If 401/403, refresh token and retry once
    if (response.statusCode == 401 || response.statusCode == 403) {
      _cubeToken = null;
      final newToken = await _getToken();
      response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': newToken,
        },
      );
    }

    if (response.statusCode != 200) {
      debugPrint('Cube.js META ERROR ${response.statusCode}: ${response.body}');
      throw Exception(_parseError(response));
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    _cachedMeta = CubeMeta.fromJson(json);
    debugPrint('Cube.js META loaded: ${_cachedMeta!.cubes.length} cubes');
    return _cachedMeta!;
  }

  /// Execute a Cube.js query directly.
  Future<CubeResponse> query(CubeQuery cubeQuery) async {
    final token = await _getToken();
    final url = Uri.parse('${AppConfig.cubeUrl}/cubejs-api/v1/load');

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode({'query': cubeQuery.toJson()}),
    );

    // If 401/403, refresh token and retry once
    if (response.statusCode == 401 || response.statusCode == 403) {
      _cubeToken = null;
      final newToken = await _getToken();
      response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': newToken,
        },
        body: jsonEncode({'query': cubeQuery.toJson()}),
      );
    }

    if (response.statusCode != 200) {
      debugPrint('Cube.js ERROR ${response.statusCode}: ${response.body}');
      throw Exception(_parseError(response));
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final cubeResponse = CubeResponse.fromJson(json);
    final queryJson = jsonEncode(cubeQuery.toJson());
    if (queryJson.contains('warranty') || queryJson.contains('scheduled_date') || queryJson.contains('installation')) {
      debugPrint('Cube.js QUERY: $queryJson');
      debugPrint('Cube.js RESPONSE (${cubeResponse.data.length} rows): ${cubeResponse.data}');
    }
    return cubeResponse;
  }

  /// Get dashboard summary metrics.
  Future<DashboardMetrics> getDashboardMetrics() async {
    // Run all queries in parallel
    final results = await Future.wait([
      _getTaskMetrics(),
      _getAssetMetrics(),
      _getMemberMetrics(),
      _getLocationMetrics(),
    ]);

    final taskMetrics = results[0];
    final assetMetrics = results[1];
    final memberMetrics = results[2];
    final locationMetrics = results[3];

    return DashboardMetrics(
      totalTasks: (taskMetrics['count'] ?? 0).toInt(),
      openTasks: (taskMetrics['open_count'] ?? 0).toInt(),
      resolvedTasks: (taskMetrics['resolved_count'] ?? 0).toInt(),
      overdueTasks: (taskMetrics['overdue_count'] ?? 0).toInt(),
      avgCompletionTimeHours: (taskMetrics['avg_completion_time_hours'] ?? 0).toDouble(),
      totalAssets: (assetMetrics['count'] ?? 0).toInt(),
      totalAssetValue: (assetMetrics['total_value'] ?? 0).toDouble(),
      assetsWithWarranty: (assetMetrics['with_warranty_count'] ?? 0).toInt(),
      totalMembers: (memberMetrics['count'] ?? 0).toInt(),
      activeMembers: (memberMetrics['active_count'] ?? 0).toInt(),
      totalLocations: (locationMetrics['count'] ?? 0).toInt(),
    );
  }

  /// Get task breakdown by status.
  Future<List<TaskStatusBreakdown>> getTasksByStatus() async {
    final response = await query(CubeQuery(
      measures: ['tasks.count'],
      dimensions: ['tasks.status'],
    ));

    return response.data.map((row) {
      return TaskStatusBreakdown(
        status: row['tasks.status']?.toString() ?? 'unknown',
        count: _parseNum(row['tasks.count']).toInt(),
      );
    }).toList();
  }

  /// Get task breakdown by priority.
  Future<List<TaskPriorityBreakdown>> getTasksByPriority() async {
    final response = await query(CubeQuery(
      measures: ['tasks.count'],
      dimensions: ['tasks.priority'],
    ));

    return response.data.map((row) {
      return TaskPriorityBreakdown(
        priority: row['tasks.priority']?.toString() ?? 'unknown',
        count: _parseNum(row['tasks.count']).toInt(),
      );
    }).toList();
  }

  /// Get tasks created over time for sparkline.
  Future<List<TimeSeriesDataPoint>> getTasksCreatedOverTime({
    String dateRange = 'last 30 days',
    String granularity = 'day',
  }) async {
    final response = await query(CubeQuery(
      measures: ['tasks.count'],
      timeDimensions: [
        CubeTimeDimension(
          dimension: 'tasks.created_at',
          dateRange: dateRange,
          granularity: granularity,
        ),
      ],
    ));

    return response.data.map((row) {
      final dateStr = row['tasks.created_at'] as String?;
      return TimeSeriesDataPoint(
        date: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),
        value: _parseNum(row['tasks.count']),
      );
    }).toList();
  }

  /// Get tasks resolved over time for sparkline.
  Future<List<TimeSeriesDataPoint>> getTasksResolvedOverTime({
    String dateRange = 'last 30 days',
    String granularity = 'day',
  }) async {
    final response = await query(CubeQuery(
      measures: ['tasks.resolved_count'],
      timeDimensions: [
        CubeTimeDimension(
          dimension: 'tasks.completed_date',
          dateRange: dateRange,
          granularity: granularity,
        ),
      ],
    ));

    return response.data.map((row) {
      final dateStr = row['tasks.completed_date'] as String?;
      return TimeSeriesDataPoint(
        date: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),
        value: _parseNum(row['tasks.resolved_count']),
      );
    }).toList();
  }

  /// Get assets created by year for bar chart.
  Future<List<Map<String, dynamic>>> getAssetsByYear() async {
    final response = await query(CubeQuery(
      measures: ['assets.count'],
      timeDimensions: [
        CubeTimeDimension(
          dimension: 'assets.created_at',
          dateRange: 'last 5 years',
          granularity: 'year',
        ),
      ],
    ));

    return response.data.map((row) {
      final dateStr = row['assets.created_at'] as String?;
      final year = dateStr != null ? DateTime.parse(dateStr).year : DateTime.now().year;
      return {
        'year': year,
        'count': _parseNum(row['assets.count']).toInt(),
      };
    }).toList();
  }

  /// Get overdue tasks by date for heatmap calendar.
  Future<Map<DateTime, int>> getOverdueTasksByDate({
    String dateRange = 'last year',
  }) async {
    final response = await query(CubeQuery(
      measures: ['tasks.overdue_count'],
      timeDimensions: [
        CubeTimeDimension(
          dimension: 'tasks.due_date',
          dateRange: dateRange,
          granularity: 'day',
        ),
      ],
    ));

    final result = <DateTime, int>{};
    for (final row in response.data) {
      final dateStr = row['tasks.due_date'] as String?;
      if (dateStr != null) {
        final date = DateTime.parse(dateStr);
        final normalizedDate = DateTime(date.year, date.month, date.day);
        final count = _parseNum(row['tasks.overdue_count']).toInt();
        result[normalizedDate] = count;
      }
    }
    return result;
  }

  /// Get task activity by date for heatmap calendar (active members proxy).
  Future<Map<DateTime, int>> getTaskActivityByDate({
    String dateRange = 'last year',
  }) async {
    final response = await query(CubeQuery(
      measures: ['task_history.count'],
      timeDimensions: [
        CubeTimeDimension(
          dimension: 'task_history.created_at',
          dateRange: dateRange,
          granularity: 'day',
        ),
      ],
    ));

    final result = <DateTime, int>{};
    for (final row in response.data) {
      final dateStr = row['task_history.created_at'] as String?;
      if (dateStr != null) {
        final date = DateTime.parse(dateStr);
        final normalizedDate = DateTime(date.year, date.month, date.day);
        final count = _parseNum(row['task_history.count']).toInt();
        result[normalizedDate] = count;
      }
    }
    return result;
  }

  Future<Map<String, num>> _getTaskMetrics() async {
    final response = await query(CubeQuery(
      measures: [
        'tasks.count',
        'tasks.open_count',
        'tasks.resolved_count',
        'tasks.overdue_count',
        'tasks.avg_completion_time_hours',
      ],
    ));

    if (response.data.isEmpty) {
      return {};
    }

    final row = response.data.first;
    return {
      'count': _parseNum(row['tasks.count']),
      'open_count': _parseNum(row['tasks.open_count']),
      'resolved_count': _parseNum(row['tasks.resolved_count']),
      'overdue_count': _parseNum(row['tasks.overdue_count']),
      'avg_completion_time_hours': _parseNum(row['tasks.avg_completion_time_hours']),
    };
  }

  Future<Map<String, num>> _getAssetMetrics() async {
    final response = await query(CubeQuery(
      measures: [
        'assets.count',
        'assets.total_value',
        'assets.with_warranty_count',
      ],
    ));

    if (response.data.isEmpty) {
      return {};
    }

    final row = response.data.first;
    return {
      'count': _parseNum(row['assets.count']),
      'total_value': _parseNum(row['assets.total_value']),
      'with_warranty_count': _parseNum(row['assets.with_warranty_count']),
    };
  }

  Future<Map<String, num>> _getMemberMetrics() async {
    final response = await query(CubeQuery(
      measures: [
        'members.count',
        'members.active_count',
      ],
    ));

    if (response.data.isEmpty) {
      return {};
    }

    final row = response.data.first;
    return {
      'count': _parseNum(row['members.count']),
      'active_count': _parseNum(row['members.active_count']),
    };
  }

  Future<Map<String, num>> _getLocationMetrics() async {
    final response = await query(CubeQuery(
      measures: ['locations.count'],
    ));

    if (response.data.isEmpty) {
      return {};
    }

    final row = response.data.first;
    return {
      'count': _parseNum(row['locations.count']),
    };
  }

  /// Get assets grouped by CSI division (top N).
  /// Aggregates detailed codes (like "11 67 66") to division level ("11").
  Future<List<AssetDivisionBreakdown>> getAssetsByDivision({
    int limit = 10,
  }) async {
    final response = await query(CubeQuery(
      measures: ['assets.count'],
      dimensions: ['assets.division_of_construction'],
      order: [
        ['assets.count', 'desc']
      ],
      limit: 100, // Get more rows to aggregate properly
    ));

    // Aggregate by 2-digit division code
    final aggregated = <String, int>{};
    for (final row in response.data) {
      final rawCode = row['assets.division_of_construction']?.toString() ?? '';
      final normalizedCode = rawCode.replaceAll(' ', '');
      if (normalizedCode.isEmpty) continue;

      // Get the 2-digit division code
      final divisionCode = normalizedCode.length >= 2
          ? normalizedCode.substring(0, 2)
          : normalizedCode.padLeft(2, '0');

      final count = _parseNum(row['assets.count']).toInt();
      aggregated[divisionCode] = (aggregated[divisionCode] ?? 0) + count;
    }

    // Convert to list, sort by count desc, take top N
    final entries = aggregated.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return entries.take(limit).map((entry) {
      final divisionKey = '${entry.key}0000';
      final divisionName = DivisionsOfConstruction.divisions[divisionKey];
      return AssetDivisionBreakdown(
        division: '${entry.key}0000', // Use 6-digit format for consistency
        divisionName: divisionName != null ? '${entry.key} $divisionName' : entry.key,
        count: entry.value,
      );
    }).toList();
  }

  /// Get assets grouped by location.
  Future<List<AssetLocationBreakdown>> getAssetsByLocation({
    int limit = 10,
  }) async {
    // First get asset counts by location
    final assetResponse = await query(CubeQuery(
      measures: ['assets.count'],
      dimensions: ['assets.location_id'],
      order: [
        ['assets.count', 'desc']
      ],
      limit: limit,
    ));

    if (assetResponse.data.isEmpty) {
      return [];
    }

    // Get location IDs
    final locationIds = assetResponse.data
        .map((row) => row['assets.location_id']?.toString())
        .where((id) => id != null && id.isNotEmpty)
        .cast<String>()
        .toList();

    // Fetch location names
    final locationNames = await _getLocationNames(locationIds);

    return assetResponse.data.map((row) {
      final locationId = row['assets.location_id']?.toString() ?? '';
      return AssetLocationBreakdown(
        locationId: locationId,
        locationName: locationNames[locationId] ?? (locationId.isEmpty ? 'No Location' : 'Unknown Location'),
        count: _parseNum(row['assets.count']).toInt(),
      );
    }).toList();
  }

  /// Fetch location names for given IDs.
  Future<Map<String, String>> _getLocationNames(List<String> locationIds) async {
    if (locationIds.isEmpty) return {};

    final response = await query(CubeQuery(
      measures: [],
      dimensions: ['locations.id', 'locations.name'],
      filters: [
        CubeFilter(
          member: 'locations.id',
          operator: 'equals',
          values: locationIds,
        ),
      ],
    ));

    final names = <String, String>{};
    for (final row in response.data) {
      final id = row['locations.id']?.toString() ?? '';
      final name = row['locations.name']?.toString() ?? '';
      if (id.isNotEmpty) {
        names[id] = name.isNotEmpty ? name : 'Location';
      }
    }
    return names;
  }

  /// Get assets by age (years since installation).
  Future<List<AssetAgeData>> getAssetsByAge({
    int maxYears = 12,
  }) async {
    final response = await query(CubeQuery(
      measures: ['assets.count'],
      timeDimensions: [
        CubeTimeDimension(
          dimension: 'assets.installation_date',
          granularity: 'year',
        ),
      ],
    ));

    debugPrint('getAssetsByAge response: ${response.data}');

    final now = DateTime.now();
    final ageMap = <int, int>{};

    for (final row in response.data) {
      final dateStr = row['assets.installation_date'] as String?;
      debugPrint('  row: installDate=$dateStr, count=${row['assets.count']}');
      if (dateStr != null && dateStr.isNotEmpty) {
        final installYear = DateTime.parse(dateStr).year;
        final age = now.year - installYear;
        debugPrint('    installYear=$installYear, currentYear=${now.year}, age=$age');
        if (age >= 1 && age <= maxYears) {
          ageMap[age] = (ageMap[age] ?? 0) + _parseNum(row['assets.count']).toInt();
        }
      }
    }

    debugPrint('  ageMap result: $ageMap');

    // Fill in all years with 0 for missing data
    return List.generate(maxYears, (i) {
      final year = i + 1;
      return AssetAgeData(
        yearsOld: year,
        count: ageMap[year] ?? 0,
      );
    });
  }

  /// Get maintenance score metrics.
  Future<MaintenanceScoreMetrics> getMaintenanceScore() async {
    final response = await query(CubeQuery(
      measures: [
        'tasks.maintenance_resolved_count',
        'tasks.maintenance_ontime_count',
      ],
    ));

    debugPrint('getMaintenanceScore response: ${response.data}');

    if (response.data.isEmpty) {
      return MaintenanceScoreMetrics(
        totalMaintenanceResolved: 0,
        onTimeCount: 0,
      );
    }

    final row = response.data.first;
    final resolved = _parseNum(row['tasks.maintenance_resolved_count']).toInt();
    final onTime = _parseNum(row['tasks.maintenance_ontime_count']).toInt();
    debugPrint('  maintenanceResolved=$resolved, onTime=$onTime');
    return MaintenanceScoreMetrics(
      totalMaintenanceResolved: resolved,
      onTimeCount: onTime,
    );
  }

  /// Get warranty expiration calendar data.
  Future<Map<DateTime, int>> getWarrantyExpirationCalendar({
    String? dateRange,
  }) async {
    // Use explicit date range for next 3 months (what the heatmap displays)
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, 1);
    final endDate = startDate.add(const Duration(days: 100)); // ~3 months
    final dateRangeList = [
      startDate.toIso8601String().split('T')[0],
      endDate.toIso8601String().split('T')[0],
    ];

    final response = await query(CubeQuery(
      measures: ['assets.count'],
      timeDimensions: [
        CubeTimeDimension(
          dimension: 'assets.warranty_end_date',
          dateRangeList: dateRangeList,
          granularity: 'day',
        ),
      ],
    ));

    debugPrint('getWarrantyExpirationCalendar response (${response.data.length} rows): ${response.data}');

    final result = <DateTime, int>{};
    for (final row in response.data) {
      final dateStr = row['assets.warranty_end_date'] as String?;
      if (dateStr != null && dateStr.isNotEmpty) {
        final date = DateTime.parse(dateStr);
        final normalizedDate = DateTime(date.year, date.month, date.day);
        result[normalizedDate] = _parseNum(row['assets.count']).toInt();
        debugPrint('  warranty date: $normalizedDate -> ${result[normalizedDate]}');
      }
    }
    debugPrint('  warranty result: ${result.length} entries');
    return result;
  }

  /// Get maintenance calendar data (scheduled maintenance tasks).
  Future<Map<DateTime, int>> getMaintenanceCalendar({
    String? dateRange,
  }) async {
    // Use explicit date range for next 3 months (what the heatmap displays)
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, 1);
    final endDate = startDate.add(const Duration(days: 100)); // ~3 months
    final dateRangeList = [
      startDate.toIso8601String().split('T')[0],
      endDate.toIso8601String().split('T')[0],
    ];

    final response = await query(CubeQuery(
      measures: ['tasks.count'],
      timeDimensions: [
        CubeTimeDimension(
          dimension: 'tasks.scheduled_date',
          dateRangeList: dateRangeList,
          granularity: 'day',
        ),
      ],
      filters: [
        CubeFilter(
          member: 'tasks.task_type',
          operator: 'equals',
          values: ['maintenance'],
        ),
      ],
    ));

    debugPrint('getMaintenanceCalendar response (${response.data.length} rows): ${response.data}');

    final result = <DateTime, int>{};
    for (final row in response.data) {
      final dateStr = row['tasks.scheduled_date'] as String?;
      if (dateStr != null && dateStr.isNotEmpty) {
        final date = DateTime.parse(dateStr);
        final normalizedDate = DateTime(date.year, date.month, date.day);
        result[normalizedDate] = _parseNum(row['tasks.count']).toInt();
        debugPrint('  maintenance date: $normalizedDate -> ${result[normalizedDate]}');
      }
    }
    debugPrint('  maintenance result: ${result.length} entries');
    return result;
  }

  /// Get facility dashboard summary metrics.
  Future<FacilityDashboardMetrics> getFacilityMetrics() async {
    final results = await Future.wait([
      _getLocationMetrics(),
      _getAssetMetrics(),
      _getTaskMetrics(),
      getMaintenanceScore(),
    ]);

    final locationMetrics = results[0] as Map<String, num>;
    final assetMetrics = results[1] as Map<String, num>;
    final taskMetrics = results[2] as Map<String, num>;
    final maintenanceScore = results[3] as MaintenanceScoreMetrics;

    return FacilityDashboardMetrics(
      activeFacilities: (locationMetrics['count'] ?? 0).toInt(),
      assetsManaged: (assetMetrics['count'] ?? 0).toInt(),
      openTickets: (taskMetrics['open_count'] ?? 0).toInt(),
      maintenanceScore: maintenanceScore.score,
    );
  }

  num _parseNum(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value;
    return num.tryParse(value.toString()) ?? 0;
  }

  String _parseError(http.Response response) {
    try {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return json['error']?.toString() ?? json['message']?.toString() ?? 'Unknown error';
    } catch (_) {
      return 'Request failed with status ${response.statusCode}';
    }
  }
}
