//
//  Generated code. Do not modify.
//  source: moat/v1/analytics.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/empty.pb.dart' as $3;
import '../../google/protobuf/timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// TranslateNaturalLanguageRequest contains a natural language analytics question.
class TranslateNaturalLanguageRequest extends $pb.GeneratedMessage {
  factory TranslateNaturalLanguageRequest({
    $core.String? question,
    $core.String? preferredChartType,
  }) {
    final $result = create();
    if (question != null) {
      $result.question = question;
    }
    if (preferredChartType != null) {
      $result.preferredChartType = preferredChartType;
    }
    return $result;
  }
  TranslateNaturalLanguageRequest._() : super();
  factory TranslateNaturalLanguageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TranslateNaturalLanguageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TranslateNaturalLanguageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'question')
    ..aOS(2, _omitFieldNames ? '' : 'preferredChartType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TranslateNaturalLanguageRequest clone() => TranslateNaturalLanguageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TranslateNaturalLanguageRequest copyWith(void Function(TranslateNaturalLanguageRequest) updates) => super.copyWith((message) => updates(message as TranslateNaturalLanguageRequest)) as TranslateNaturalLanguageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TranslateNaturalLanguageRequest create() => TranslateNaturalLanguageRequest._();
  TranslateNaturalLanguageRequest createEmptyInstance() => create();
  static $pb.PbList<TranslateNaturalLanguageRequest> createRepeated() => $pb.PbList<TranslateNaturalLanguageRequest>();
  @$core.pragma('dart2js:noInline')
  static TranslateNaturalLanguageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TranslateNaturalLanguageRequest>(create);
  static TranslateNaturalLanguageRequest? _defaultInstance;

  /// The natural language question (e.g., "Show me overdue tasks by location")
  @$pb.TagNumber(1)
  $core.String get question => $_getSZ(0);
  @$pb.TagNumber(1)
  set question($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => $_clearField(1);

  /// Optional: preferred chart type (bar, line, pie, table, number)
  @$pb.TagNumber(2)
  $core.String get preferredChartType => $_getSZ(1);
  @$pb.TagNumber(2)
  set preferredChartType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPreferredChartType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreferredChartType() => $_clearField(2);
}

/// TranslateNaturalLanguageResponse contains the generated Cube.js query.
class TranslateNaturalLanguageResponse extends $pb.GeneratedMessage {
  factory TranslateNaturalLanguageResponse({
    CubeQuery? query,
    $core.String? suggestedChartType,
    $core.String? explanation,
    $core.double? confidence,
  }) {
    final $result = create();
    if (query != null) {
      $result.query = query;
    }
    if (suggestedChartType != null) {
      $result.suggestedChartType = suggestedChartType;
    }
    if (explanation != null) {
      $result.explanation = explanation;
    }
    if (confidence != null) {
      $result.confidence = confidence;
    }
    return $result;
  }
  TranslateNaturalLanguageResponse._() : super();
  factory TranslateNaturalLanguageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TranslateNaturalLanguageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TranslateNaturalLanguageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOM<CubeQuery>(1, _omitFieldNames ? '' : 'query', subBuilder: CubeQuery.create)
    ..aOS(2, _omitFieldNames ? '' : 'suggestedChartType')
    ..aOS(3, _omitFieldNames ? '' : 'explanation')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'confidence', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TranslateNaturalLanguageResponse clone() => TranslateNaturalLanguageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TranslateNaturalLanguageResponse copyWith(void Function(TranslateNaturalLanguageResponse) updates) => super.copyWith((message) => updates(message as TranslateNaturalLanguageResponse)) as TranslateNaturalLanguageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TranslateNaturalLanguageResponse create() => TranslateNaturalLanguageResponse._();
  TranslateNaturalLanguageResponse createEmptyInstance() => create();
  static $pb.PbList<TranslateNaturalLanguageResponse> createRepeated() => $pb.PbList<TranslateNaturalLanguageResponse>();
  @$core.pragma('dart2js:noInline')
  static TranslateNaturalLanguageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TranslateNaturalLanguageResponse>(create);
  static TranslateNaturalLanguageResponse? _defaultInstance;

  /// The generated Cube.js query in JSON format
  @$pb.TagNumber(1)
  CubeQuery get query => $_getN(0);
  @$pb.TagNumber(1)
  set query(CubeQuery v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => $_clearField(1);
  @$pb.TagNumber(1)
  CubeQuery ensureQuery() => $_ensure(0);

  /// Suggested chart type based on the query
  @$pb.TagNumber(2)
  $core.String get suggestedChartType => $_getSZ(1);
  @$pb.TagNumber(2)
  set suggestedChartType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuggestedChartType() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuggestedChartType() => $_clearField(2);

  /// Human-readable explanation of what the query does
  @$pb.TagNumber(3)
  $core.String get explanation => $_getSZ(2);
  @$pb.TagNumber(3)
  set explanation($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExplanation() => $_has(2);
  @$pb.TagNumber(3)
  void clearExplanation() => $_clearField(3);

  /// Confidence score (0-1) for the translation
  @$pb.TagNumber(4)
  $core.double get confidence => $_getN(3);
  @$pb.TagNumber(4)
  set confidence($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasConfidence() => $_has(3);
  @$pb.TagNumber(4)
  void clearConfidence() => $_clearField(4);
}

/// CubeQuery represents a Cube.js query structure.
class CubeQuery extends $pb.GeneratedMessage {
  factory CubeQuery({
    $core.Iterable<$core.String>? measures,
    $core.Iterable<$core.String>? dimensions,
    $core.Iterable<TimeDimension>? timeDimensions,
    $core.Iterable<CubeFilter>? filters,
    $core.Iterable<CubeOrder>? order,
    $core.int? limit,
  }) {
    final $result = create();
    if (measures != null) {
      $result.measures.addAll(measures);
    }
    if (dimensions != null) {
      $result.dimensions.addAll(dimensions);
    }
    if (timeDimensions != null) {
      $result.timeDimensions.addAll(timeDimensions);
    }
    if (filters != null) {
      $result.filters.addAll(filters);
    }
    if (order != null) {
      $result.order.addAll(order);
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  CubeQuery._() : super();
  factory CubeQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CubeQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CubeQuery', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'measures')
    ..pPS(2, _omitFieldNames ? '' : 'dimensions')
    ..pc<TimeDimension>(3, _omitFieldNames ? '' : 'timeDimensions', $pb.PbFieldType.PM, subBuilder: TimeDimension.create)
    ..pc<CubeFilter>(4, _omitFieldNames ? '' : 'filters', $pb.PbFieldType.PM, subBuilder: CubeFilter.create)
    ..pc<CubeOrder>(5, _omitFieldNames ? '' : 'order', $pb.PbFieldType.PM, subBuilder: CubeOrder.create)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CubeQuery clone() => CubeQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CubeQuery copyWith(void Function(CubeQuery) updates) => super.copyWith((message) => updates(message as CubeQuery)) as CubeQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CubeQuery create() => CubeQuery._();
  CubeQuery createEmptyInstance() => create();
  static $pb.PbList<CubeQuery> createRepeated() => $pb.PbList<CubeQuery>();
  @$core.pragma('dart2js:noInline')
  static CubeQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CubeQuery>(create);
  static CubeQuery? _defaultInstance;

  /// Measures to aggregate (e.g., ["tasks_analytics.count", "tasks_analytics.overdue_count"])
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get measures => $_getList(0);

  /// Dimensions to group by (e.g., ["tasks_analytics.location_name", "tasks_analytics.status"])
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get dimensions => $_getList(1);

  /// Time dimensions for date-based queries
  @$pb.TagNumber(3)
  $pb.PbList<TimeDimension> get timeDimensions => $_getList(2);

  /// Filters to apply
  @$pb.TagNumber(4)
  $pb.PbList<CubeFilter> get filters => $_getList(3);

  /// Order by clauses
  @$pb.TagNumber(5)
  $pb.PbList<CubeOrder> get order => $_getList(4);

  /// Result limit
  @$pb.TagNumber(6)
  $core.int get limit => $_getIZ(5);
  @$pb.TagNumber(6)
  set limit($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearLimit() => $_clearField(6);
}

/// TimeDimension specifies a time-based dimension with granularity and date range.
class TimeDimension extends $pb.GeneratedMessage {
  factory TimeDimension({
    $core.String? dimension,
    $core.String? granularity,
    $core.Iterable<$core.String>? dateRange,
  }) {
    final $result = create();
    if (dimension != null) {
      $result.dimension = dimension;
    }
    if (granularity != null) {
      $result.granularity = granularity;
    }
    if (dateRange != null) {
      $result.dateRange.addAll(dateRange);
    }
    return $result;
  }
  TimeDimension._() : super();
  factory TimeDimension.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeDimension.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimeDimension', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dimension')
    ..aOS(2, _omitFieldNames ? '' : 'granularity')
    ..pPS(3, _omitFieldNames ? '' : 'dateRange')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimeDimension clone() => TimeDimension()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimeDimension copyWith(void Function(TimeDimension) updates) => super.copyWith((message) => updates(message as TimeDimension)) as TimeDimension;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeDimension create() => TimeDimension._();
  TimeDimension createEmptyInstance() => create();
  static $pb.PbList<TimeDimension> createRepeated() => $pb.PbList<TimeDimension>();
  @$core.pragma('dart2js:noInline')
  static TimeDimension getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeDimension>(create);
  static TimeDimension? _defaultInstance;

  /// The time dimension (e.g., "tasks_analytics.created_at")
  @$pb.TagNumber(1)
  $core.String get dimension => $_getSZ(0);
  @$pb.TagNumber(1)
  set dimension($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDimension() => $_has(0);
  @$pb.TagNumber(1)
  void clearDimension() => $_clearField(1);

  /// Granularity (day, week, month, quarter, year)
  @$pb.TagNumber(2)
  $core.String get granularity => $_getSZ(1);
  @$pb.TagNumber(2)
  set granularity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGranularity() => $_has(1);
  @$pb.TagNumber(2)
  void clearGranularity() => $_clearField(2);

  /// Date range (e.g., "last 30 days", "this month", or ["2024-01-01", "2024-12-31"])
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get dateRange => $_getList(2);
}

/// CubeFilter represents a filter condition.
class CubeFilter extends $pb.GeneratedMessage {
  factory CubeFilter({
    $core.String? member,
    $core.String? operator,
    $core.Iterable<$core.String>? values,
  }) {
    final $result = create();
    if (member != null) {
      $result.member = member;
    }
    if (operator != null) {
      $result.operator = operator;
    }
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  CubeFilter._() : super();
  factory CubeFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CubeFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CubeFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'member')
    ..aOS(2, _omitFieldNames ? '' : 'operator')
    ..pPS(3, _omitFieldNames ? '' : 'values')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CubeFilter clone() => CubeFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CubeFilter copyWith(void Function(CubeFilter) updates) => super.copyWith((message) => updates(message as CubeFilter)) as CubeFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CubeFilter create() => CubeFilter._();
  CubeFilter createEmptyInstance() => create();
  static $pb.PbList<CubeFilter> createRepeated() => $pb.PbList<CubeFilter>();
  @$core.pragma('dart2js:noInline')
  static CubeFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CubeFilter>(create);
  static CubeFilter? _defaultInstance;

  /// The member to filter (e.g., "tasks_analytics.status")
  @$pb.TagNumber(1)
  $core.String get member => $_getSZ(0);
  @$pb.TagNumber(1)
  set member($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearMember() => $_clearField(1);

  /// The operator (equals, notEquals, contains, gt, lt, gte, lte, etc.)
  @$pb.TagNumber(2)
  $core.String get operator => $_getSZ(1);
  @$pb.TagNumber(2)
  set operator($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperator() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperator() => $_clearField(2);

  /// The values to filter by
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get values => $_getList(2);
}

/// CubeOrder represents an order by clause.
class CubeOrder extends $pb.GeneratedMessage {
  factory CubeOrder({
    $core.String? member,
    $core.String? direction,
  }) {
    final $result = create();
    if (member != null) {
      $result.member = member;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    return $result;
  }
  CubeOrder._() : super();
  factory CubeOrder.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CubeOrder.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CubeOrder', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'member')
    ..aOS(2, _omitFieldNames ? '' : 'direction')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CubeOrder clone() => CubeOrder()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CubeOrder copyWith(void Function(CubeOrder) updates) => super.copyWith((message) => updates(message as CubeOrder)) as CubeOrder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CubeOrder create() => CubeOrder._();
  CubeOrder createEmptyInstance() => create();
  static $pb.PbList<CubeOrder> createRepeated() => $pb.PbList<CubeOrder>();
  @$core.pragma('dart2js:noInline')
  static CubeOrder getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CubeOrder>(create);
  static CubeOrder? _defaultInstance;

  /// The member to order by
  @$pb.TagNumber(1)
  $core.String get member => $_getSZ(0);
  @$pb.TagNumber(1)
  set member($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearMember() => $_clearField(1);

  /// Direction (asc or desc)
  @$pb.TagNumber(2)
  $core.String get direction => $_getSZ(1);
  @$pb.TagNumber(2)
  set direction($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => $_clearField(2);
}

/// GetQueryTemplatesRequest is empty - templates are predefined.
class GetQueryTemplatesRequest extends $pb.GeneratedMessage {
  factory GetQueryTemplatesRequest() => create();
  GetQueryTemplatesRequest._() : super();
  factory GetQueryTemplatesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetQueryTemplatesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetQueryTemplatesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetQueryTemplatesRequest clone() => GetQueryTemplatesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetQueryTemplatesRequest copyWith(void Function(GetQueryTemplatesRequest) updates) => super.copyWith((message) => updates(message as GetQueryTemplatesRequest)) as GetQueryTemplatesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetQueryTemplatesRequest create() => GetQueryTemplatesRequest._();
  GetQueryTemplatesRequest createEmptyInstance() => create();
  static $pb.PbList<GetQueryTemplatesRequest> createRepeated() => $pb.PbList<GetQueryTemplatesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetQueryTemplatesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetQueryTemplatesRequest>(create);
  static GetQueryTemplatesRequest? _defaultInstance;
}

/// GetQueryTemplatesResponse contains pre-built query templates.
class GetQueryTemplatesResponse extends $pb.GeneratedMessage {
  factory GetQueryTemplatesResponse({
    $core.Iterable<QueryTemplate>? templates,
  }) {
    final $result = create();
    if (templates != null) {
      $result.templates.addAll(templates);
    }
    return $result;
  }
  GetQueryTemplatesResponse._() : super();
  factory GetQueryTemplatesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetQueryTemplatesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetQueryTemplatesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<QueryTemplate>(1, _omitFieldNames ? '' : 'templates', $pb.PbFieldType.PM, subBuilder: QueryTemplate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetQueryTemplatesResponse clone() => GetQueryTemplatesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetQueryTemplatesResponse copyWith(void Function(GetQueryTemplatesResponse) updates) => super.copyWith((message) => updates(message as GetQueryTemplatesResponse)) as GetQueryTemplatesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetQueryTemplatesResponse create() => GetQueryTemplatesResponse._();
  GetQueryTemplatesResponse createEmptyInstance() => create();
  static $pb.PbList<GetQueryTemplatesResponse> createRepeated() => $pb.PbList<GetQueryTemplatesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetQueryTemplatesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetQueryTemplatesResponse>(create);
  static GetQueryTemplatesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QueryTemplate> get templates => $_getList(0);
}

/// QueryTemplate is a pre-built analytics query with metadata.
class QueryTemplate extends $pb.GeneratedMessage {
  factory QueryTemplate({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.String? category,
    $core.String? icon,
    CubeQuery? query,
    $core.String? chartType,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (category != null) {
      $result.category = category;
    }
    if (icon != null) {
      $result.icon = icon;
    }
    if (query != null) {
      $result.query = query;
    }
    if (chartType != null) {
      $result.chartType = chartType;
    }
    return $result;
  }
  QueryTemplate._() : super();
  factory QueryTemplate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTemplate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'QueryTemplate', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'category')
    ..aOS(5, _omitFieldNames ? '' : 'icon')
    ..aOM<CubeQuery>(6, _omitFieldNames ? '' : 'query', subBuilder: CubeQuery.create)
    ..aOS(7, _omitFieldNames ? '' : 'chartType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTemplate clone() => QueryTemplate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTemplate copyWith(void Function(QueryTemplate) updates) => super.copyWith((message) => updates(message as QueryTemplate)) as QueryTemplate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTemplate create() => QueryTemplate._();
  QueryTemplate createEmptyInstance() => create();
  static $pb.PbList<QueryTemplate> createRepeated() => $pb.PbList<QueryTemplate>();
  @$core.pragma('dart2js:noInline')
  static QueryTemplate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTemplate>(create);
  static QueryTemplate? _defaultInstance;

  /// Unique template ID
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// Display name (e.g., "Expiring Warranties")
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// Description of what this template shows
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// Category for grouping (e.g., "assets", "tasks", "team")
  @$pb.TagNumber(4)
  $core.String get category => $_getSZ(3);
  @$pb.TagNumber(4)
  set category($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);

  /// Icon name for UI display
  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => $_clearField(5);

  /// The pre-built Cube.js query
  @$pb.TagNumber(6)
  CubeQuery get query => $_getN(5);
  @$pb.TagNumber(6)
  set query(CubeQuery v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasQuery() => $_has(5);
  @$pb.TagNumber(6)
  void clearQuery() => $_clearField(6);
  @$pb.TagNumber(6)
  CubeQuery ensureQuery() => $_ensure(5);

  /// Suggested chart type
  @$pb.TagNumber(7)
  $core.String get chartType => $_getSZ(6);
  @$pb.TagNumber(7)
  set chartType($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasChartType() => $_has(6);
  @$pb.TagNumber(7)
  void clearChartType() => $_clearField(7);
}

/// GetCubeSchemaRequest is empty - returns full schema.
class GetCubeSchemaRequest extends $pb.GeneratedMessage {
  factory GetCubeSchemaRequest() => create();
  GetCubeSchemaRequest._() : super();
  factory GetCubeSchemaRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCubeSchemaRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCubeSchemaRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCubeSchemaRequest clone() => GetCubeSchemaRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCubeSchemaRequest copyWith(void Function(GetCubeSchemaRequest) updates) => super.copyWith((message) => updates(message as GetCubeSchemaRequest)) as GetCubeSchemaRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCubeSchemaRequest create() => GetCubeSchemaRequest._();
  GetCubeSchemaRequest createEmptyInstance() => create();
  static $pb.PbList<GetCubeSchemaRequest> createRepeated() => $pb.PbList<GetCubeSchemaRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCubeSchemaRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCubeSchemaRequest>(create);
  static GetCubeSchemaRequest? _defaultInstance;
}

/// GetCubeSchemaResponse contains the available analytics schema.
class GetCubeSchemaResponse extends $pb.GeneratedMessage {
  factory GetCubeSchemaResponse({
    $core.Iterable<CubeDefinition>? cubes,
  }) {
    final $result = create();
    if (cubes != null) {
      $result.cubes.addAll(cubes);
    }
    return $result;
  }
  GetCubeSchemaResponse._() : super();
  factory GetCubeSchemaResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCubeSchemaResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCubeSchemaResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<CubeDefinition>(1, _omitFieldNames ? '' : 'cubes', $pb.PbFieldType.PM, subBuilder: CubeDefinition.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCubeSchemaResponse clone() => GetCubeSchemaResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCubeSchemaResponse copyWith(void Function(GetCubeSchemaResponse) updates) => super.copyWith((message) => updates(message as GetCubeSchemaResponse)) as GetCubeSchemaResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCubeSchemaResponse create() => GetCubeSchemaResponse._();
  GetCubeSchemaResponse createEmptyInstance() => create();
  static $pb.PbList<GetCubeSchemaResponse> createRepeated() => $pb.PbList<GetCubeSchemaResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCubeSchemaResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCubeSchemaResponse>(create);
  static GetCubeSchemaResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CubeDefinition> get cubes => $_getList(0);
}

/// CubeDefinition describes an available data cube.
class CubeDefinition extends $pb.GeneratedMessage {
  factory CubeDefinition({
    $core.String? name,
    $core.String? title,
    $core.String? description,
    $core.Iterable<CubeMember>? measures,
    $core.Iterable<CubeMember>? dimensions,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (measures != null) {
      $result.measures.addAll(measures);
    }
    if (dimensions != null) {
      $result.dimensions.addAll(dimensions);
    }
    return $result;
  }
  CubeDefinition._() : super();
  factory CubeDefinition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CubeDefinition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CubeDefinition', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pc<CubeMember>(4, _omitFieldNames ? '' : 'measures', $pb.PbFieldType.PM, subBuilder: CubeMember.create)
    ..pc<CubeMember>(5, _omitFieldNames ? '' : 'dimensions', $pb.PbFieldType.PM, subBuilder: CubeMember.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CubeDefinition clone() => CubeDefinition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CubeDefinition copyWith(void Function(CubeDefinition) updates) => super.copyWith((message) => updates(message as CubeDefinition)) as CubeDefinition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CubeDefinition create() => CubeDefinition._();
  CubeDefinition createEmptyInstance() => create();
  static $pb.PbList<CubeDefinition> createRepeated() => $pb.PbList<CubeDefinition>();
  @$core.pragma('dart2js:noInline')
  static CubeDefinition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CubeDefinition>(create);
  static CubeDefinition? _defaultInstance;

  /// Cube name (e.g., "assets_analytics")
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Human-readable title
  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  /// Description of what this cube contains
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// Available measures
  @$pb.TagNumber(4)
  $pb.PbList<CubeMember> get measures => $_getList(3);

  /// Available dimensions
  @$pb.TagNumber(5)
  $pb.PbList<CubeMember> get dimensions => $_getList(4);
}

/// CubeMember describes a measure or dimension.
class CubeMember extends $pb.GeneratedMessage {
  factory CubeMember({
    $core.String? name,
    $core.String? title,
    $core.String? description,
    $core.String? type,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  CubeMember._() : super();
  factory CubeMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CubeMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CubeMember', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CubeMember clone() => CubeMember()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CubeMember copyWith(void Function(CubeMember) updates) => super.copyWith((message) => updates(message as CubeMember)) as CubeMember;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CubeMember create() => CubeMember._();
  CubeMember createEmptyInstance() => create();
  static $pb.PbList<CubeMember> createRepeated() => $pb.PbList<CubeMember>();
  @$core.pragma('dart2js:noInline')
  static CubeMember getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CubeMember>(create);
  static CubeMember? _defaultInstance;

  /// Full member name (e.g., "assets_analytics.count")
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Human-readable title
  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  /// Description of what this member represents
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// Data type (string, number, time, boolean)
  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);
}

class Dashboard extends $pb.GeneratedMessage {
  factory Dashboard({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.bool? isDefault,
    $core.Iterable<DashboardItem>? items,
    $core.String? createdById,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isDefault != null) {
      $result.isDefault = isDefault;
    }
    if (items != null) {
      $result.items.addAll(items);
    }
    if (createdById != null) {
      $result.createdById = createdById;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Dashboard._() : super();
  factory Dashboard.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Dashboard.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Dashboard', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOB(4, _omitFieldNames ? '' : 'isDefault')
    ..pc<DashboardItem>(5, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: DashboardItem.create)
    ..aOS(6, _omitFieldNames ? '' : 'createdById')
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Dashboard clone() => Dashboard()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Dashboard copyWith(void Function(Dashboard) updates) => super.copyWith((message) => updates(message as Dashboard)) as Dashboard;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Dashboard create() => Dashboard._();
  Dashboard createEmptyInstance() => create();
  static $pb.PbList<Dashboard> createRepeated() => $pb.PbList<Dashboard>();
  @$core.pragma('dart2js:noInline')
  static Dashboard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Dashboard>(create);
  static Dashboard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isDefault => $_getBF(3);
  @$pb.TagNumber(4)
  set isDefault($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsDefault() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsDefault() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<DashboardItem> get items => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get createdById => $_getSZ(5);
  @$pb.TagNumber(6)
  set createdById($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedById() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedById() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($0.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureCreatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($0.Timestamp v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureUpdatedAt() => $_ensure(7);
}

class CreateDashboardRequest extends $pb.GeneratedMessage {
  factory CreateDashboardRequest({
    $core.String? name,
    $core.String? description,
    $core.bool? isDefault,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isDefault != null) {
      $result.isDefault = isDefault;
    }
    return $result;
  }
  CreateDashboardRequest._() : super();
  factory CreateDashboardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDashboardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateDashboardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOB(3, _omitFieldNames ? '' : 'isDefault')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDashboardRequest clone() => CreateDashboardRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDashboardRequest copyWith(void Function(CreateDashboardRequest) updates) => super.copyWith((message) => updates(message as CreateDashboardRequest)) as CreateDashboardRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDashboardRequest create() => CreateDashboardRequest._();
  CreateDashboardRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDashboardRequest> createRepeated() => $pb.PbList<CreateDashboardRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDashboardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDashboardRequest>(create);
  static CreateDashboardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isDefault => $_getBF(2);
  @$pb.TagNumber(3)
  set isDefault($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsDefault() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsDefault() => $_clearField(3);
}

class GetDashboardRequest extends $pb.GeneratedMessage {
  factory GetDashboardRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetDashboardRequest._() : super();
  factory GetDashboardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDashboardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDashboardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDashboardRequest clone() => GetDashboardRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDashboardRequest copyWith(void Function(GetDashboardRequest) updates) => super.copyWith((message) => updates(message as GetDashboardRequest)) as GetDashboardRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDashboardRequest create() => GetDashboardRequest._();
  GetDashboardRequest createEmptyInstance() => create();
  static $pb.PbList<GetDashboardRequest> createRepeated() => $pb.PbList<GetDashboardRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDashboardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDashboardRequest>(create);
  static GetDashboardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class ListDashboardsRequest extends $pb.GeneratedMessage {
  factory ListDashboardsRequest({
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  ListDashboardsRequest._() : super();
  factory ListDashboardsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDashboardsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListDashboardsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListDashboardsRequest clone() => ListDashboardsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDashboardsRequest copyWith(void Function(ListDashboardsRequest) updates) => super.copyWith((message) => updates(message as ListDashboardsRequest)) as ListDashboardsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDashboardsRequest create() => ListDashboardsRequest._();
  ListDashboardsRequest createEmptyInstance() => create();
  static $pb.PbList<ListDashboardsRequest> createRepeated() => $pb.PbList<ListDashboardsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListDashboardsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDashboardsRequest>(create);
  static ListDashboardsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class ListDashboardsResponse extends $pb.GeneratedMessage {
  factory ListDashboardsResponse({
    $core.Iterable<Dashboard>? dashboards,
    $core.int? total,
  }) {
    final $result = create();
    if (dashboards != null) {
      $result.dashboards.addAll(dashboards);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ListDashboardsResponse._() : super();
  factory ListDashboardsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDashboardsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListDashboardsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<Dashboard>(1, _omitFieldNames ? '' : 'dashboards', $pb.PbFieldType.PM, subBuilder: Dashboard.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListDashboardsResponse clone() => ListDashboardsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDashboardsResponse copyWith(void Function(ListDashboardsResponse) updates) => super.copyWith((message) => updates(message as ListDashboardsResponse)) as ListDashboardsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDashboardsResponse create() => ListDashboardsResponse._();
  ListDashboardsResponse createEmptyInstance() => create();
  static $pb.PbList<ListDashboardsResponse> createRepeated() => $pb.PbList<ListDashboardsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListDashboardsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDashboardsResponse>(create);
  static ListDashboardsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Dashboard> get dashboards => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

class UpdateDashboardRequest extends $pb.GeneratedMessage {
  factory UpdateDashboardRequest({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.bool? isDefault,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (isDefault != null) {
      $result.isDefault = isDefault;
    }
    return $result;
  }
  UpdateDashboardRequest._() : super();
  factory UpdateDashboardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDashboardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDashboardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOB(4, _omitFieldNames ? '' : 'isDefault')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDashboardRequest clone() => UpdateDashboardRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDashboardRequest copyWith(void Function(UpdateDashboardRequest) updates) => super.copyWith((message) => updates(message as UpdateDashboardRequest)) as UpdateDashboardRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDashboardRequest create() => UpdateDashboardRequest._();
  UpdateDashboardRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDashboardRequest> createRepeated() => $pb.PbList<UpdateDashboardRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDashboardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDashboardRequest>(create);
  static UpdateDashboardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isDefault => $_getBF(3);
  @$pb.TagNumber(4)
  set isDefault($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsDefault() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsDefault() => $_clearField(4);
}

class DeleteDashboardRequest extends $pb.GeneratedMessage {
  factory DeleteDashboardRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteDashboardRequest._() : super();
  factory DeleteDashboardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteDashboardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteDashboardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteDashboardRequest clone() => DeleteDashboardRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteDashboardRequest copyWith(void Function(DeleteDashboardRequest) updates) => super.copyWith((message) => updates(message as DeleteDashboardRequest)) as DeleteDashboardRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDashboardRequest create() => DeleteDashboardRequest._();
  DeleteDashboardRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteDashboardRequest> createRepeated() => $pb.PbList<DeleteDashboardRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteDashboardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDashboardRequest>(create);
  static DeleteDashboardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class SavedQuery extends $pb.GeneratedMessage {
  factory SavedQuery({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    CubeQuery? query,
    $core.String? chartType,
    ChartConfig? chartConfig,
    $core.String? sourceType,
    $core.String? nlQuestion,
    $core.String? createdById,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (query != null) {
      $result.query = query;
    }
    if (chartType != null) {
      $result.chartType = chartType;
    }
    if (chartConfig != null) {
      $result.chartConfig = chartConfig;
    }
    if (sourceType != null) {
      $result.sourceType = sourceType;
    }
    if (nlQuestion != null) {
      $result.nlQuestion = nlQuestion;
    }
    if (createdById != null) {
      $result.createdById = createdById;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  SavedQuery._() : super();
  factory SavedQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SavedQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SavedQuery', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOM<CubeQuery>(4, _omitFieldNames ? '' : 'query', subBuilder: CubeQuery.create)
    ..aOS(5, _omitFieldNames ? '' : 'chartType')
    ..aOM<ChartConfig>(6, _omitFieldNames ? '' : 'chartConfig', subBuilder: ChartConfig.create)
    ..aOS(7, _omitFieldNames ? '' : 'sourceType')
    ..aOS(8, _omitFieldNames ? '' : 'nlQuestion')
    ..aOS(9, _omitFieldNames ? '' : 'createdById')
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SavedQuery clone() => SavedQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SavedQuery copyWith(void Function(SavedQuery) updates) => super.copyWith((message) => updates(message as SavedQuery)) as SavedQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SavedQuery create() => SavedQuery._();
  SavedQuery createEmptyInstance() => create();
  static $pb.PbList<SavedQuery> createRepeated() => $pb.PbList<SavedQuery>();
  @$core.pragma('dart2js:noInline')
  static SavedQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SavedQuery>(create);
  static SavedQuery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  CubeQuery get query => $_getN(3);
  @$pb.TagNumber(4)
  set query(CubeQuery v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuery() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuery() => $_clearField(4);
  @$pb.TagNumber(4)
  CubeQuery ensureQuery() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get chartType => $_getSZ(4);
  @$pb.TagNumber(5)
  set chartType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChartType() => $_has(4);
  @$pb.TagNumber(5)
  void clearChartType() => $_clearField(5);

  @$pb.TagNumber(6)
  ChartConfig get chartConfig => $_getN(5);
  @$pb.TagNumber(6)
  set chartConfig(ChartConfig v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasChartConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearChartConfig() => $_clearField(6);
  @$pb.TagNumber(6)
  ChartConfig ensureChartConfig() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get sourceType => $_getSZ(6);
  @$pb.TagNumber(7)
  set sourceType($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSourceType() => $_has(6);
  @$pb.TagNumber(7)
  void clearSourceType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get nlQuestion => $_getSZ(7);
  @$pb.TagNumber(8)
  set nlQuestion($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNlQuestion() => $_has(7);
  @$pb.TagNumber(8)
  void clearNlQuestion() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get createdById => $_getSZ(8);
  @$pb.TagNumber(9)
  set createdById($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatedById() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedById() => $_clearField(9);

  @$pb.TagNumber(10)
  $0.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(10)
  set createdAt($0.Timestamp v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureCreatedAt() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.Timestamp get updatedAt => $_getN(10);
  @$pb.TagNumber(11)
  set updatedAt($0.Timestamp v) { $_setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUpdatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdatedAt() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureUpdatedAt() => $_ensure(10);
}

class ChartConfig extends $pb.GeneratedMessage {
  factory ChartConfig({
    $core.String? title,
    $core.String? xAxisLabel,
    $core.String? yAxisLabel,
    $core.bool? showLegend,
    $core.Iterable<$core.String>? colorPalette,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (xAxisLabel != null) {
      $result.xAxisLabel = xAxisLabel;
    }
    if (yAxisLabel != null) {
      $result.yAxisLabel = yAxisLabel;
    }
    if (showLegend != null) {
      $result.showLegend = showLegend;
    }
    if (colorPalette != null) {
      $result.colorPalette.addAll(colorPalette);
    }
    return $result;
  }
  ChartConfig._() : super();
  factory ChartConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChartConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChartConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'xAxisLabel')
    ..aOS(3, _omitFieldNames ? '' : 'yAxisLabel')
    ..aOB(4, _omitFieldNames ? '' : 'showLegend')
    ..pPS(5, _omitFieldNames ? '' : 'colorPalette')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChartConfig clone() => ChartConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChartConfig copyWith(void Function(ChartConfig) updates) => super.copyWith((message) => updates(message as ChartConfig)) as ChartConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChartConfig create() => ChartConfig._();
  ChartConfig createEmptyInstance() => create();
  static $pb.PbList<ChartConfig> createRepeated() => $pb.PbList<ChartConfig>();
  @$core.pragma('dart2js:noInline')
  static ChartConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChartConfig>(create);
  static ChartConfig? _defaultInstance;

  /// Chart-specific configuration (colors, labels, etc.)
  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get xAxisLabel => $_getSZ(1);
  @$pb.TagNumber(2)
  set xAxisLabel($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasXAxisLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearXAxisLabel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get yAxisLabel => $_getSZ(2);
  @$pb.TagNumber(3)
  set yAxisLabel($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasYAxisLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearYAxisLabel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get showLegend => $_getBF(3);
  @$pb.TagNumber(4)
  set showLegend($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasShowLegend() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowLegend() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get colorPalette => $_getList(4);
}

class CreateSavedQueryRequest extends $pb.GeneratedMessage {
  factory CreateSavedQueryRequest({
    $core.String? name,
    $core.String? description,
    CubeQuery? query,
    $core.String? chartType,
    ChartConfig? chartConfig,
    $core.String? sourceType,
    $core.String? nlQuestion,
    $core.String? dashboardId,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (query != null) {
      $result.query = query;
    }
    if (chartType != null) {
      $result.chartType = chartType;
    }
    if (chartConfig != null) {
      $result.chartConfig = chartConfig;
    }
    if (sourceType != null) {
      $result.sourceType = sourceType;
    }
    if (nlQuestion != null) {
      $result.nlQuestion = nlQuestion;
    }
    if (dashboardId != null) {
      $result.dashboardId = dashboardId;
    }
    return $result;
  }
  CreateSavedQueryRequest._() : super();
  factory CreateSavedQueryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSavedQueryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSavedQueryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOM<CubeQuery>(3, _omitFieldNames ? '' : 'query', subBuilder: CubeQuery.create)
    ..aOS(4, _omitFieldNames ? '' : 'chartType')
    ..aOM<ChartConfig>(5, _omitFieldNames ? '' : 'chartConfig', subBuilder: ChartConfig.create)
    ..aOS(6, _omitFieldNames ? '' : 'sourceType')
    ..aOS(7, _omitFieldNames ? '' : 'nlQuestion')
    ..aOS(8, _omitFieldNames ? '' : 'dashboardId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSavedQueryRequest clone() => CreateSavedQueryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSavedQueryRequest copyWith(void Function(CreateSavedQueryRequest) updates) => super.copyWith((message) => updates(message as CreateSavedQueryRequest)) as CreateSavedQueryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSavedQueryRequest create() => CreateSavedQueryRequest._();
  CreateSavedQueryRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSavedQueryRequest> createRepeated() => $pb.PbList<CreateSavedQueryRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSavedQueryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSavedQueryRequest>(create);
  static CreateSavedQueryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  CubeQuery get query => $_getN(2);
  @$pb.TagNumber(3)
  set query(CubeQuery v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuery() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuery() => $_clearField(3);
  @$pb.TagNumber(3)
  CubeQuery ensureQuery() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get chartType => $_getSZ(3);
  @$pb.TagNumber(4)
  set chartType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChartType() => $_has(3);
  @$pb.TagNumber(4)
  void clearChartType() => $_clearField(4);

  @$pb.TagNumber(5)
  ChartConfig get chartConfig => $_getN(4);
  @$pb.TagNumber(5)
  set chartConfig(ChartConfig v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasChartConfig() => $_has(4);
  @$pb.TagNumber(5)
  void clearChartConfig() => $_clearField(5);
  @$pb.TagNumber(5)
  ChartConfig ensureChartConfig() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get sourceType => $_getSZ(5);
  @$pb.TagNumber(6)
  set sourceType($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSourceType() => $_has(5);
  @$pb.TagNumber(6)
  void clearSourceType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get nlQuestion => $_getSZ(6);
  @$pb.TagNumber(7)
  set nlQuestion($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNlQuestion() => $_has(6);
  @$pb.TagNumber(7)
  void clearNlQuestion() => $_clearField(7);

  /// Optional: add directly to a dashboard
  @$pb.TagNumber(8)
  $core.String get dashboardId => $_getSZ(7);
  @$pb.TagNumber(8)
  set dashboardId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDashboardId() => $_has(7);
  @$pb.TagNumber(8)
  void clearDashboardId() => $_clearField(8);
}

class GetSavedQueryRequest extends $pb.GeneratedMessage {
  factory GetSavedQueryRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetSavedQueryRequest._() : super();
  factory GetSavedQueryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSavedQueryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSavedQueryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSavedQueryRequest clone() => GetSavedQueryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSavedQueryRequest copyWith(void Function(GetSavedQueryRequest) updates) => super.copyWith((message) => updates(message as GetSavedQueryRequest)) as GetSavedQueryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSavedQueryRequest create() => GetSavedQueryRequest._();
  GetSavedQueryRequest createEmptyInstance() => create();
  static $pb.PbList<GetSavedQueryRequest> createRepeated() => $pb.PbList<GetSavedQueryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSavedQueryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSavedQueryRequest>(create);
  static GetSavedQueryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class ListSavedQueriesRequest extends $pb.GeneratedMessage {
  factory ListSavedQueriesRequest({
    $core.int? limit,
    $core.int? offset,
    $core.String? dashboardId,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (dashboardId != null) {
      $result.dashboardId = dashboardId;
    }
    return $result;
  }
  ListSavedQueriesRequest._() : super();
  factory ListSavedQueriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSavedQueriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSavedQueriesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'dashboardId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSavedQueriesRequest clone() => ListSavedQueriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSavedQueriesRequest copyWith(void Function(ListSavedQueriesRequest) updates) => super.copyWith((message) => updates(message as ListSavedQueriesRequest)) as ListSavedQueriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSavedQueriesRequest create() => ListSavedQueriesRequest._();
  ListSavedQueriesRequest createEmptyInstance() => create();
  static $pb.PbList<ListSavedQueriesRequest> createRepeated() => $pb.PbList<ListSavedQueriesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSavedQueriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSavedQueriesRequest>(create);
  static ListSavedQueriesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get dashboardId => $_getSZ(2);
  @$pb.TagNumber(3)
  set dashboardId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDashboardId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDashboardId() => $_clearField(3);
}

class ListSavedQueriesResponse extends $pb.GeneratedMessage {
  factory ListSavedQueriesResponse({
    $core.Iterable<SavedQuery>? queries,
    $core.int? total,
  }) {
    final $result = create();
    if (queries != null) {
      $result.queries.addAll(queries);
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ListSavedQueriesResponse._() : super();
  factory ListSavedQueriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSavedQueriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSavedQueriesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..pc<SavedQuery>(1, _omitFieldNames ? '' : 'queries', $pb.PbFieldType.PM, subBuilder: SavedQuery.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSavedQueriesResponse clone() => ListSavedQueriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSavedQueriesResponse copyWith(void Function(ListSavedQueriesResponse) updates) => super.copyWith((message) => updates(message as ListSavedQueriesResponse)) as ListSavedQueriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSavedQueriesResponse create() => ListSavedQueriesResponse._();
  ListSavedQueriesResponse createEmptyInstance() => create();
  static $pb.PbList<ListSavedQueriesResponse> createRepeated() => $pb.PbList<ListSavedQueriesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSavedQueriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSavedQueriesResponse>(create);
  static ListSavedQueriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SavedQuery> get queries => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

class UpdateSavedQueryRequest extends $pb.GeneratedMessage {
  factory UpdateSavedQueryRequest({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    CubeQuery? query,
    $core.String? chartType,
    ChartConfig? chartConfig,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (query != null) {
      $result.query = query;
    }
    if (chartType != null) {
      $result.chartType = chartType;
    }
    if (chartConfig != null) {
      $result.chartConfig = chartConfig;
    }
    return $result;
  }
  UpdateSavedQueryRequest._() : super();
  factory UpdateSavedQueryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSavedQueryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSavedQueryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOM<CubeQuery>(4, _omitFieldNames ? '' : 'query', subBuilder: CubeQuery.create)
    ..aOS(5, _omitFieldNames ? '' : 'chartType')
    ..aOM<ChartConfig>(6, _omitFieldNames ? '' : 'chartConfig', subBuilder: ChartConfig.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSavedQueryRequest clone() => UpdateSavedQueryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSavedQueryRequest copyWith(void Function(UpdateSavedQueryRequest) updates) => super.copyWith((message) => updates(message as UpdateSavedQueryRequest)) as UpdateSavedQueryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSavedQueryRequest create() => UpdateSavedQueryRequest._();
  UpdateSavedQueryRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSavedQueryRequest> createRepeated() => $pb.PbList<UpdateSavedQueryRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSavedQueryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSavedQueryRequest>(create);
  static UpdateSavedQueryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  CubeQuery get query => $_getN(3);
  @$pb.TagNumber(4)
  set query(CubeQuery v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuery() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuery() => $_clearField(4);
  @$pb.TagNumber(4)
  CubeQuery ensureQuery() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get chartType => $_getSZ(4);
  @$pb.TagNumber(5)
  set chartType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChartType() => $_has(4);
  @$pb.TagNumber(5)
  void clearChartType() => $_clearField(5);

  @$pb.TagNumber(6)
  ChartConfig get chartConfig => $_getN(5);
  @$pb.TagNumber(6)
  set chartConfig(ChartConfig v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasChartConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearChartConfig() => $_clearField(6);
  @$pb.TagNumber(6)
  ChartConfig ensureChartConfig() => $_ensure(5);
}

class DeleteSavedQueryRequest extends $pb.GeneratedMessage {
  factory DeleteSavedQueryRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteSavedQueryRequest._() : super();
  factory DeleteSavedQueryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSavedQueryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSavedQueryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSavedQueryRequest clone() => DeleteSavedQueryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSavedQueryRequest copyWith(void Function(DeleteSavedQueryRequest) updates) => super.copyWith((message) => updates(message as DeleteSavedQueryRequest)) as DeleteSavedQueryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSavedQueryRequest create() => DeleteSavedQueryRequest._();
  DeleteSavedQueryRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSavedQueryRequest> createRepeated() => $pb.PbList<DeleteSavedQueryRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSavedQueryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSavedQueryRequest>(create);
  static DeleteSavedQueryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class DashboardItem extends $pb.GeneratedMessage {
  factory DashboardItem({
    $core.String? id,
    $core.String? dashboardId,
    SavedQuery? query,
    GridPosition? position,
    $core.String? customTitle,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (dashboardId != null) {
      $result.dashboardId = dashboardId;
    }
    if (query != null) {
      $result.query = query;
    }
    if (position != null) {
      $result.position = position;
    }
    if (customTitle != null) {
      $result.customTitle = customTitle;
    }
    return $result;
  }
  DashboardItem._() : super();
  factory DashboardItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DashboardItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DashboardItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'dashboardId')
    ..aOM<SavedQuery>(3, _omitFieldNames ? '' : 'query', subBuilder: SavedQuery.create)
    ..aOM<GridPosition>(4, _omitFieldNames ? '' : 'position', subBuilder: GridPosition.create)
    ..aOS(5, _omitFieldNames ? '' : 'customTitle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DashboardItem clone() => DashboardItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DashboardItem copyWith(void Function(DashboardItem) updates) => super.copyWith((message) => updates(message as DashboardItem)) as DashboardItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DashboardItem create() => DashboardItem._();
  DashboardItem createEmptyInstance() => create();
  static $pb.PbList<DashboardItem> createRepeated() => $pb.PbList<DashboardItem>();
  @$core.pragma('dart2js:noInline')
  static DashboardItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DashboardItem>(create);
  static DashboardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dashboardId => $_getSZ(1);
  @$pb.TagNumber(2)
  set dashboardId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDashboardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDashboardId() => $_clearField(2);

  @$pb.TagNumber(3)
  SavedQuery get query => $_getN(2);
  @$pb.TagNumber(3)
  set query(SavedQuery v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuery() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuery() => $_clearField(3);
  @$pb.TagNumber(3)
  SavedQuery ensureQuery() => $_ensure(2);

  @$pb.TagNumber(4)
  GridPosition get position => $_getN(3);
  @$pb.TagNumber(4)
  set position(GridPosition v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => $_clearField(4);
  @$pb.TagNumber(4)
  GridPosition ensurePosition() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get customTitle => $_getSZ(4);
  @$pb.TagNumber(5)
  set customTitle($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCustomTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearCustomTitle() => $_clearField(5);
}

class GridPosition extends $pb.GeneratedMessage {
  factory GridPosition({
    $core.int? x,
    $core.int? y,
    $core.int? width,
    $core.int? height,
  }) {
    final $result = create();
    if (x != null) {
      $result.x = x;
    }
    if (y != null) {
      $result.y = y;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  GridPosition._() : super();
  factory GridPosition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GridPosition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GridPosition', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'y', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GridPosition clone() => GridPosition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GridPosition copyWith(void Function(GridPosition) updates) => super.copyWith((message) => updates(message as GridPosition)) as GridPosition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GridPosition create() => GridPosition._();
  GridPosition createEmptyInstance() => create();
  static $pb.PbList<GridPosition> createRepeated() => $pb.PbList<GridPosition>();
  @$core.pragma('dart2js:noInline')
  static GridPosition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GridPosition>(create);
  static GridPosition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => $_clearField(4);
}

class AddQueryToDashboardRequest extends $pb.GeneratedMessage {
  factory AddQueryToDashboardRequest({
    $core.String? dashboardId,
    $core.String? savedQueryId,
    GridPosition? position,
    $core.String? customTitle,
  }) {
    final $result = create();
    if (dashboardId != null) {
      $result.dashboardId = dashboardId;
    }
    if (savedQueryId != null) {
      $result.savedQueryId = savedQueryId;
    }
    if (position != null) {
      $result.position = position;
    }
    if (customTitle != null) {
      $result.customTitle = customTitle;
    }
    return $result;
  }
  AddQueryToDashboardRequest._() : super();
  factory AddQueryToDashboardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddQueryToDashboardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddQueryToDashboardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dashboardId')
    ..aOS(2, _omitFieldNames ? '' : 'savedQueryId')
    ..aOM<GridPosition>(3, _omitFieldNames ? '' : 'position', subBuilder: GridPosition.create)
    ..aOS(4, _omitFieldNames ? '' : 'customTitle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddQueryToDashboardRequest clone() => AddQueryToDashboardRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddQueryToDashboardRequest copyWith(void Function(AddQueryToDashboardRequest) updates) => super.copyWith((message) => updates(message as AddQueryToDashboardRequest)) as AddQueryToDashboardRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddQueryToDashboardRequest create() => AddQueryToDashboardRequest._();
  AddQueryToDashboardRequest createEmptyInstance() => create();
  static $pb.PbList<AddQueryToDashboardRequest> createRepeated() => $pb.PbList<AddQueryToDashboardRequest>();
  @$core.pragma('dart2js:noInline')
  static AddQueryToDashboardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddQueryToDashboardRequest>(create);
  static AddQueryToDashboardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dashboardId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dashboardId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDashboardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDashboardId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get savedQueryId => $_getSZ(1);
  @$pb.TagNumber(2)
  set savedQueryId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSavedQueryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSavedQueryId() => $_clearField(2);

  @$pb.TagNumber(3)
  GridPosition get position => $_getN(2);
  @$pb.TagNumber(3)
  set position(GridPosition v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => $_clearField(3);
  @$pb.TagNumber(3)
  GridPosition ensurePosition() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get customTitle => $_getSZ(3);
  @$pb.TagNumber(4)
  set customTitle($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustomTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustomTitle() => $_clearField(4);
}

class RemoveQueryFromDashboardRequest extends $pb.GeneratedMessage {
  factory RemoveQueryFromDashboardRequest({
    $core.String? dashboardId,
    $core.String? savedQueryId,
  }) {
    final $result = create();
    if (dashboardId != null) {
      $result.dashboardId = dashboardId;
    }
    if (savedQueryId != null) {
      $result.savedQueryId = savedQueryId;
    }
    return $result;
  }
  RemoveQueryFromDashboardRequest._() : super();
  factory RemoveQueryFromDashboardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveQueryFromDashboardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveQueryFromDashboardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dashboardId')
    ..aOS(2, _omitFieldNames ? '' : 'savedQueryId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveQueryFromDashboardRequest clone() => RemoveQueryFromDashboardRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveQueryFromDashboardRequest copyWith(void Function(RemoveQueryFromDashboardRequest) updates) => super.copyWith((message) => updates(message as RemoveQueryFromDashboardRequest)) as RemoveQueryFromDashboardRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveQueryFromDashboardRequest create() => RemoveQueryFromDashboardRequest._();
  RemoveQueryFromDashboardRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveQueryFromDashboardRequest> createRepeated() => $pb.PbList<RemoveQueryFromDashboardRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveQueryFromDashboardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveQueryFromDashboardRequest>(create);
  static RemoveQueryFromDashboardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dashboardId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dashboardId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDashboardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDashboardId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get savedQueryId => $_getSZ(1);
  @$pb.TagNumber(2)
  set savedQueryId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSavedQueryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSavedQueryId() => $_clearField(2);
}

class UpdateDashboardLayoutRequest extends $pb.GeneratedMessage {
  factory UpdateDashboardLayoutRequest({
    $core.String? dashboardId,
    $core.Iterable<DashboardItemPosition>? items,
  }) {
    final $result = create();
    if (dashboardId != null) {
      $result.dashboardId = dashboardId;
    }
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  UpdateDashboardLayoutRequest._() : super();
  factory UpdateDashboardLayoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDashboardLayoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDashboardLayoutRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dashboardId')
    ..pc<DashboardItemPosition>(2, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: DashboardItemPosition.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDashboardLayoutRequest clone() => UpdateDashboardLayoutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDashboardLayoutRequest copyWith(void Function(UpdateDashboardLayoutRequest) updates) => super.copyWith((message) => updates(message as UpdateDashboardLayoutRequest)) as UpdateDashboardLayoutRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDashboardLayoutRequest create() => UpdateDashboardLayoutRequest._();
  UpdateDashboardLayoutRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDashboardLayoutRequest> createRepeated() => $pb.PbList<UpdateDashboardLayoutRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDashboardLayoutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDashboardLayoutRequest>(create);
  static UpdateDashboardLayoutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dashboardId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dashboardId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDashboardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDashboardId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<DashboardItemPosition> get items => $_getList(1);
}

class DashboardItemPosition extends $pb.GeneratedMessage {
  factory DashboardItemPosition({
    $core.String? savedQueryId,
    GridPosition? position,
    $core.String? customTitle,
  }) {
    final $result = create();
    if (savedQueryId != null) {
      $result.savedQueryId = savedQueryId;
    }
    if (position != null) {
      $result.position = position;
    }
    if (customTitle != null) {
      $result.customTitle = customTitle;
    }
    return $result;
  }
  DashboardItemPosition._() : super();
  factory DashboardItemPosition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DashboardItemPosition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DashboardItemPosition', package: const $pb.PackageName(_omitMessageNames ? '' : 'moat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'savedQueryId')
    ..aOM<GridPosition>(2, _omitFieldNames ? '' : 'position', subBuilder: GridPosition.create)
    ..aOS(3, _omitFieldNames ? '' : 'customTitle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DashboardItemPosition clone() => DashboardItemPosition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DashboardItemPosition copyWith(void Function(DashboardItemPosition) updates) => super.copyWith((message) => updates(message as DashboardItemPosition)) as DashboardItemPosition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DashboardItemPosition create() => DashboardItemPosition._();
  DashboardItemPosition createEmptyInstance() => create();
  static $pb.PbList<DashboardItemPosition> createRepeated() => $pb.PbList<DashboardItemPosition>();
  @$core.pragma('dart2js:noInline')
  static DashboardItemPosition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DashboardItemPosition>(create);
  static DashboardItemPosition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get savedQueryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set savedQueryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSavedQueryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSavedQueryId() => $_clearField(1);

  @$pb.TagNumber(2)
  GridPosition get position => $_getN(1);
  @$pb.TagNumber(2)
  set position(GridPosition v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => $_clearField(2);
  @$pb.TagNumber(2)
  GridPosition ensurePosition() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get customTitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set customTitle($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCustomTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomTitle() => $_clearField(3);
}

/// AnalyticsService provides AI-powered analytics query generation and templates.
class AnalyticsServiceApi {
  $pb.RpcClient _client;
  AnalyticsServiceApi(this._client);

  /// TranslateNaturalLanguage converts a natural language question into a Cube.js query.
  $async.Future<TranslateNaturalLanguageResponse> translateNaturalLanguage($pb.ClientContext? ctx, TranslateNaturalLanguageRequest request) =>
    _client.invoke<TranslateNaturalLanguageResponse>(ctx, 'AnalyticsService', 'TranslateNaturalLanguage', request, TranslateNaturalLanguageResponse())
  ;
  /// GetQueryTemplates returns pre-built query templates for common analytics questions.
  $async.Future<GetQueryTemplatesResponse> getQueryTemplates($pb.ClientContext? ctx, GetQueryTemplatesRequest request) =>
    _client.invoke<GetQueryTemplatesResponse>(ctx, 'AnalyticsService', 'GetQueryTemplates', request, GetQueryTemplatesResponse())
  ;
  /// GetCubeSchema returns the available cubes, measures, and dimensions with descriptions.
  $async.Future<GetCubeSchemaResponse> getCubeSchema($pb.ClientContext? ctx, GetCubeSchemaRequest request) =>
    _client.invoke<GetCubeSchemaResponse>(ctx, 'AnalyticsService', 'GetCubeSchema', request, GetCubeSchemaResponse())
  ;
}

/// DashboardService provides CRUD operations for user-created dashboards and saved queries.
class DashboardServiceApi {
  $pb.RpcClient _client;
  DashboardServiceApi(this._client);

  /// Dashboard CRUD
  $async.Future<Dashboard> createDashboard($pb.ClientContext? ctx, CreateDashboardRequest request) =>
    _client.invoke<Dashboard>(ctx, 'DashboardService', 'CreateDashboard', request, Dashboard())
  ;
  $async.Future<Dashboard> getDashboard($pb.ClientContext? ctx, GetDashboardRequest request) =>
    _client.invoke<Dashboard>(ctx, 'DashboardService', 'GetDashboard', request, Dashboard())
  ;
  $async.Future<ListDashboardsResponse> listDashboards($pb.ClientContext? ctx, ListDashboardsRequest request) =>
    _client.invoke<ListDashboardsResponse>(ctx, 'DashboardService', 'ListDashboards', request, ListDashboardsResponse())
  ;
  $async.Future<Dashboard> updateDashboard($pb.ClientContext? ctx, UpdateDashboardRequest request) =>
    _client.invoke<Dashboard>(ctx, 'DashboardService', 'UpdateDashboard', request, Dashboard())
  ;
  $async.Future<$3.Empty> deleteDashboard($pb.ClientContext? ctx, DeleteDashboardRequest request) =>
    _client.invoke<$3.Empty>(ctx, 'DashboardService', 'DeleteDashboard', request, $3.Empty())
  ;
  /// Saved Query CRUD
  $async.Future<SavedQuery> createSavedQuery($pb.ClientContext? ctx, CreateSavedQueryRequest request) =>
    _client.invoke<SavedQuery>(ctx, 'DashboardService', 'CreateSavedQuery', request, SavedQuery())
  ;
  $async.Future<SavedQuery> getSavedQuery($pb.ClientContext? ctx, GetSavedQueryRequest request) =>
    _client.invoke<SavedQuery>(ctx, 'DashboardService', 'GetSavedQuery', request, SavedQuery())
  ;
  $async.Future<ListSavedQueriesResponse> listSavedQueries($pb.ClientContext? ctx, ListSavedQueriesRequest request) =>
    _client.invoke<ListSavedQueriesResponse>(ctx, 'DashboardService', 'ListSavedQueries', request, ListSavedQueriesResponse())
  ;
  $async.Future<SavedQuery> updateSavedQuery($pb.ClientContext? ctx, UpdateSavedQueryRequest request) =>
    _client.invoke<SavedQuery>(ctx, 'DashboardService', 'UpdateSavedQuery', request, SavedQuery())
  ;
  $async.Future<$3.Empty> deleteSavedQuery($pb.ClientContext? ctx, DeleteSavedQueryRequest request) =>
    _client.invoke<$3.Empty>(ctx, 'DashboardService', 'DeleteSavedQuery', request, $3.Empty())
  ;
  /// Dashboard Items (add/remove queries from dashboards)
  $async.Future<DashboardItem> addQueryToDashboard($pb.ClientContext? ctx, AddQueryToDashboardRequest request) =>
    _client.invoke<DashboardItem>(ctx, 'DashboardService', 'AddQueryToDashboard', request, DashboardItem())
  ;
  $async.Future<$3.Empty> removeQueryFromDashboard($pb.ClientContext? ctx, RemoveQueryFromDashboardRequest request) =>
    _client.invoke<$3.Empty>(ctx, 'DashboardService', 'RemoveQueryFromDashboard', request, $3.Empty())
  ;
  $async.Future<Dashboard> updateDashboardLayout($pb.ClientContext? ctx, UpdateDashboardLayoutRequest request) =>
    _client.invoke<Dashboard>(ctx, 'DashboardService', 'UpdateDashboardLayout', request, Dashboard())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
