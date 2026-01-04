// Cube.js query and response models.
//
// These models represent the Cube.js REST API query format and response structure.
// See: https://cube.dev/docs/product/apis-integrations/rest-api/query-format

/// Represents a Cube.js query request.
class CubeQuery {
  final List<String> measures;
  final List<String>? dimensions;
  final List<CubeFilter>? filters;
  final List<CubeTimeDimension>? timeDimensions;
  final int? limit;
  final int? offset;
  final List<List<String>>? order;

  CubeQuery({
    required this.measures,
    this.dimensions,
    this.filters,
    this.timeDimensions,
    this.limit,
    this.offset,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'measures': measures,
    };
    if (dimensions != null && dimensions!.isNotEmpty) {
      json['dimensions'] = dimensions;
    }
    if (filters != null && filters!.isNotEmpty) {
      json['filters'] = filters!.map((f) => f.toJson()).toList();
    }
    if (timeDimensions != null && timeDimensions!.isNotEmpty) {
      json['timeDimensions'] = timeDimensions!.map((t) => t.toJson()).toList();
    }
    if (limit != null) json['limit'] = limit;
    if (offset != null) json['offset'] = offset;
    if (order != null) json['order'] = order;
    return json;
  }
}

/// Filter for Cube.js queries.
class CubeFilter {
  final String member;
  final String operator;
  final List<dynamic>? values;

  CubeFilter({
    required this.member,
    required this.operator,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'member': member,
      'operator': operator,
    };
    if (values != null) json['values'] = values;
    return json;
  }
}

/// Time dimension for Cube.js queries.
class CubeTimeDimension {
  final String dimension;
  final String? dateRange;
  final List<String>? dateRangeList;
  final String? granularity;

  CubeTimeDimension({
    required this.dimension,
    this.dateRange,
    this.dateRangeList,
    this.granularity,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'dimension': dimension,
    };
    if (dateRange != null) json['dateRange'] = dateRange;
    if (dateRangeList != null) json['dateRange'] = dateRangeList;
    if (granularity != null) json['granularity'] = granularity;
    return json;
  }
}

/// Response from Cube.js /load endpoint.
class CubeResponse {
  final List<Map<String, dynamic>> data;
  final CubeAnnotation? annotation;
  final String? query;

  CubeResponse({
    required this.data,
    this.annotation,
    this.query,
  });

  factory CubeResponse.fromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List<dynamic>? ?? [];
    return CubeResponse(
      data: dataList.map((e) => e as Map<String, dynamic>).toList(),
      annotation: json['annotation'] != null
          ? CubeAnnotation.fromJson(json['annotation'] as Map<String, dynamic>)
          : null,
      query: json['query']?.toString(),
    );
  }

  /// Get a single numeric value from the first row of data.
  num? getValue(String key) {
    if (data.isEmpty) return null;
    final value = data.first[key];
    if (value == null) return null;
    if (value is num) return value;
    return num.tryParse(value.toString());
  }

  /// Get a string value from the first row of data.
  String? getString(String key) {
    if (data.isEmpty) return null;
    return data.first[key]?.toString();
  }
}

/// Annotation metadata from Cube.js response.
class CubeAnnotation {
  final Map<String, CubeFieldAnnotation> measures;
  final Map<String, CubeFieldAnnotation> dimensions;

  CubeAnnotation({
    required this.measures,
    required this.dimensions,
  });

  factory CubeAnnotation.fromJson(Map<String, dynamic> json) {
    final measuresJson = json['measures'] as Map<String, dynamic>? ?? {};
    final dimensionsJson = json['dimensions'] as Map<String, dynamic>? ?? {};

    return CubeAnnotation(
      measures: measuresJson.map(
        (k, v) => MapEntry(k, CubeFieldAnnotation.fromJson(v as Map<String, dynamic>)),
      ),
      dimensions: dimensionsJson.map(
        (k, v) => MapEntry(k, CubeFieldAnnotation.fromJson(v as Map<String, dynamic>)),
      ),
    );
  }
}

/// Annotation for a single field.
class CubeFieldAnnotation {
  final String title;
  final String? shortTitle;
  final String type;

  CubeFieldAnnotation({
    required this.title,
    this.shortTitle,
    required this.type,
  });

  factory CubeFieldAnnotation.fromJson(Map<String, dynamic> json) {
    return CubeFieldAnnotation(
      title: json['title'] as String? ?? '',
      shortTitle: json['shortTitle'] as String?,
      type: json['type'] as String? ?? 'string',
    );
  }
}

/// Dashboard summary metrics.
class DashboardMetrics {
  final int totalTasks;
  final int openTasks;
  final int resolvedTasks;
  final int overdueTasks;
  final double avgCompletionTimeHours;
  final int totalAssets;
  final double totalAssetValue;
  final int assetsWithWarranty;
  final int totalMembers;
  final int activeMembers;
  final int totalLocations;

  DashboardMetrics({
    required this.totalTasks,
    required this.openTasks,
    required this.resolvedTasks,
    required this.overdueTasks,
    required this.avgCompletionTimeHours,
    required this.totalAssets,
    required this.totalAssetValue,
    required this.assetsWithWarranty,
    required this.totalMembers,
    required this.activeMembers,
    required this.totalLocations,
  });

  factory DashboardMetrics.empty() {
    return DashboardMetrics(
      totalTasks: 0,
      openTasks: 0,
      resolvedTasks: 0,
      overdueTasks: 0,
      avgCompletionTimeHours: 0,
      totalAssets: 0,
      totalAssetValue: 0,
      totalMembers: 0,
      activeMembers: 0,
      totalLocations: 0,
      assetsWithWarranty: 0,
    );
  }
}

/// Task breakdown by status for donut chart.
class TaskStatusBreakdown {
  final String status;
  final int count;

  TaskStatusBreakdown({
    required this.status,
    required this.count,
  });
}

/// Task breakdown by priority for donut chart.
class TaskPriorityBreakdown {
  final String priority;
  final int count;

  TaskPriorityBreakdown({
    required this.priority,
    required this.count,
  });
}

/// Time series data point for sparklines and charts.
class TimeSeriesDataPoint {
  final DateTime date;
  final num value;

  TimeSeriesDataPoint({
    required this.date,
    required this.value,
  });
}

/// Asset breakdown by CSI division code.
class AssetDivisionBreakdown {
  final String division;
  final String divisionName;
  final int count;

  AssetDivisionBreakdown({
    required this.division,
    required this.divisionName,
    required this.count,
  });
}

/// Asset breakdown by location.
class AssetLocationBreakdown {
  final String locationId;
  final String locationName;
  final int count;

  AssetLocationBreakdown({
    required this.locationId,
    required this.locationName,
    required this.count,
  });
}

/// Asset age distribution data for bar chart.
class AssetAgeData {
  final int yearsOld;
  final int count;

  AssetAgeData({
    required this.yearsOld,
    required this.count,
  });
}

/// Maintenance score metrics for gauge chart.
class MaintenanceScoreMetrics {
  final int totalMaintenanceResolved;
  final int onTimeCount;

  MaintenanceScoreMetrics({
    required this.totalMaintenanceResolved,
    required this.onTimeCount,
  });

  /// Score as percentage (0-100).
  int get score {
    if (totalMaintenanceResolved == 0) return 0;
    return ((onTimeCount / totalMaintenanceResolved) * 100).round();
  }
}

/// Facility dashboard summary metrics.
class FacilityDashboardMetrics {
  final int activeFacilities;
  final int assetsManaged;
  final int openTickets;
  final int maintenanceScore;

  FacilityDashboardMetrics({
    required this.activeFacilities,
    required this.assetsManaged,
    required this.openTickets,
    required this.maintenanceScore,
  });

  factory FacilityDashboardMetrics.empty() {
    return FacilityDashboardMetrics(
      activeFacilities: 0,
      assetsManaged: 0,
      openTickets: 0,
      maintenanceScore: 0,
    );
  }
}

// =============================================================================
// Cube.js Meta API Models (for Data Explorer)
// =============================================================================

/// Response from Cube.js /meta endpoint.
class CubeMeta {
  final List<CubeDefinition> cubes;

  CubeMeta({required this.cubes});

  factory CubeMeta.fromJson(Map<String, dynamic> json) {
    final cubesList = json['cubes'] as List<dynamic>? ?? [];
    return CubeMeta(
      cubes: cubesList
          .map((c) => CubeDefinition.fromJson(c as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Get all available measures across all cubes.
  List<CubeMember> get allMeasures =>
      cubes.expand((c) => c.measures).toList();

  /// Get all available dimensions across all cubes.
  List<CubeMember> get allDimensions =>
      cubes.expand((c) => c.dimensions).toList();
}

/// Definition of a single cube (table/view).
class CubeDefinition {
  final String name;
  final String title;
  final List<CubeMember> measures;
  final List<CubeMember> dimensions;

  CubeDefinition({
    required this.name,
    required this.title,
    required this.measures,
    required this.dimensions,
  });

  factory CubeDefinition.fromJson(Map<String, dynamic> json) {
    final measuresList = json['measures'] as List<dynamic>? ?? [];
    final dimensionsList = json['dimensions'] as List<dynamic>? ?? [];

    return CubeDefinition(
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? json['name'] as String? ?? '',
      measures: measuresList
          .map((m) => CubeMember.fromJson(m as Map<String, dynamic>))
          .toList(),
      dimensions: dimensionsList
          .map((d) => CubeMember.fromJson(d as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// A member (measure or dimension) of a cube.
class CubeMember {
  final String name;
  final String title;
  final String? shortTitle;
  final String type;
  final String? description;

  CubeMember({
    required this.name,
    required this.title,
    this.shortTitle,
    required this.type,
    this.description,
  });

  factory CubeMember.fromJson(Map<String, dynamic> json) {
    return CubeMember(
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? json['name'] as String? ?? '',
      shortTitle: json['shortTitle'] as String?,
      type: json['type'] as String? ?? 'string',
      description: json['description'] as String?,
    );
  }

  /// The cube name this member belongs to (e.g., "tasks" from "tasks.count").
  String get cubeName => name.split('.').first;

  /// The short field name (e.g., "count" from "tasks.count").
  String get fieldName => name.split('.').last;

  /// Display label for UI.
  String get displayName => shortTitle ?? title;

  /// Whether this is a time-based dimension.
  bool get isTimeDimension => type == 'time';
}

/// Chart type options for the data explorer.
enum ExplorerChartType {
  bar,
  line,
  pie,
  table,
  number,
}

extension ExplorerChartTypeExtension on ExplorerChartType {
  String get displayName {
    switch (this) {
      case ExplorerChartType.bar:
        return 'Bar Chart';
      case ExplorerChartType.line:
        return 'Line Chart';
      case ExplorerChartType.pie:
        return 'Pie Chart';
      case ExplorerChartType.table:
        return 'Table';
      case ExplorerChartType.number:
        return 'Number';
    }
  }

  String get icon {
    switch (this) {
      case ExplorerChartType.bar:
        return 'bar_chart';
      case ExplorerChartType.line:
        return 'show_chart';
      case ExplorerChartType.pie:
        return 'pie_chart';
      case ExplorerChartType.table:
        return 'table_chart';
      case ExplorerChartType.number:
        return 'pin';
    }
  }
}
