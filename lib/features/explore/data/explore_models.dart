// Data models for the Explore feature (NL queries and Cube.js integration).

/// Result from NL query translation.
class NLQueryResult {
  final CubeQuerySpec query;
  final String suggestedChartType;
  final String explanation;
  final double confidence;

  NLQueryResult({
    required this.query,
    required this.suggestedChartType,
    required this.explanation,
    required this.confidence,
  });
}

/// A Cube.js query specification.
class CubeQuerySpec {
  final List<String> measures;
  final List<String> dimensions;
  final List<TimeDimensionSpec> timeDimensions;
  final List<FilterSpec> filters;
  final List<OrderSpec> order;
  final int? limit;

  CubeQuerySpec({
    required this.measures,
    required this.dimensions,
    required this.timeDimensions,
    required this.filters,
    required this.order,
    this.limit,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (measures.isNotEmpty) {
      json['measures'] = measures;
    }
    if (dimensions.isNotEmpty) {
      json['dimensions'] = dimensions;
    }
    if (timeDimensions.isNotEmpty) {
      json['timeDimensions'] = timeDimensions.map((td) => td.toJson()).toList();
    }
    if (filters.isNotEmpty) {
      json['filters'] = filters.map((f) => f.toJson()).toList();
    }
    if (order.isNotEmpty) {
      json['order'] = order.map((o) => o.toJson()).toList();
    }
    if (limit != null) {
      json['limit'] = limit;
    }

    return json;
  }
}

/// Time dimension specification for Cube.js queries.
class TimeDimensionSpec {
  final String dimension;
  final String? granularity;
  final List<String> dateRange;

  TimeDimensionSpec({
    required this.dimension,
    this.granularity,
    required this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{'dimension': dimension};
    if (granularity != null && granularity!.isNotEmpty) {
      json['granularity'] = granularity;
    }
    if (dateRange.isNotEmpty) {
      json['dateRange'] = dateRange.length == 1 ? dateRange.first : dateRange;
    }
    return json;
  }
}

/// Filter specification for Cube.js queries.
class FilterSpec {
  final String member;
  final String operator;
  final List<String> values;

  FilterSpec({
    required this.member,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() => {
        'member': member,
        'operator': operator,
        'values': values,
      };
}

/// Order specification for Cube.js queries.
class OrderSpec {
  final String member;
  final String direction;

  OrderSpec({
    required this.member,
    required this.direction,
  });

  List<String> toJson() => [member, direction];
}

/// Pre-built query template.
class QueryTemplate {
  final String id;
  final String name;
  final String description;
  final String category;
  final String icon;
  final String chartType;
  final CubeQuerySpec query;

  QueryTemplate({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    required this.chartType,
    required this.query,
  });
}

/// Schema for a data cube.
class CubeSchema {
  final String name;
  final String title;
  final String description;
  final List<CubeMemberSchema> measures;
  final List<CubeMemberSchema> dimensions;

  CubeSchema({
    required this.name,
    required this.title,
    required this.description,
    required this.measures,
    required this.dimensions,
  });
}

/// Schema for a cube member (measure or dimension).
class CubeMemberSchema {
  final String name;
  final String title;
  final String description;
  final String type;

  CubeMemberSchema({
    required this.name,
    required this.title,
    required this.description,
    required this.type,
  });
}
