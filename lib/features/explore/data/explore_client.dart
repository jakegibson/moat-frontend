import 'package:injectable/injectable.dart';

import '../../../core/transport/analytics_service_client.dart';
import '../../../gen/moat/v1/analytics.pb.dart' as pb;
import 'explore_models.dart';

export 'explore_models.dart';

/// Client for the AnalyticsService (NL queries and templates).
@lazySingleton
class ExploreClient {
  final AnalyticsServiceClient _client;

  ExploreClient(this._client);

  /// Translate a natural language question to a Cube.js query.
  Future<NLQueryResult> translateNaturalLanguage(
    String question, {
    String? preferredChartType,
  }) async {
    final request = pb.TranslateNaturalLanguageRequest()
      ..question = question;

    if (preferredChartType != null) {
      request.preferredChartType = preferredChartType;
    }

    final response = await _client.translateNaturalLanguage(request);

    return NLQueryResult(
      query: _convertQuery(response.query),
      suggestedChartType: response.suggestedChartType,
      explanation: response.explanation,
      confidence: response.confidence,
    );
  }

  /// Get pre-built query templates.
  Future<List<QueryTemplate>> getQueryTemplates() async {
    final request = pb.GetQueryTemplatesRequest();
    final response = await _client.getQueryTemplates(request);

    return response.templates.map(_convertTemplate).toList();
  }

  /// Get the cube schema with descriptions.
  Future<List<CubeSchema>> getCubeSchema() async {
    final request = pb.GetCubeSchemaRequest();
    final response = await _client.getCubeSchema(request);

    return response.cubes.map(_convertCubeDefinition).toList();
  }

  CubeQuerySpec _convertQuery(pb.CubeQuery query) {
    return CubeQuerySpec(
      measures: query.measures.toList(),
      dimensions: query.dimensions.toList(),
      timeDimensions: query.timeDimensions
          .map((td) => TimeDimensionSpec(
                dimension: td.dimension,
                granularity: td.granularity.isEmpty ? null : td.granularity,
                dateRange: td.dateRange.toList(),
              ))
          .toList(),
      filters: query.filters
          .map((f) => FilterSpec(
                member: f.member,
                operator: f.operator,
                values: f.values.toList(),
              ))
          .toList(),
      order: query.order
          .map((o) => OrderSpec(
                member: o.member,
                direction: o.direction,
              ))
          .toList(),
      limit: query.limit > 0 ? query.limit : null,
    );
  }

  QueryTemplate _convertTemplate(pb.QueryTemplate template) {
    return QueryTemplate(
      id: template.id,
      name: template.name,
      description: template.description,
      category: template.category,
      icon: template.icon,
      chartType: template.chartType,
      query: _convertQuery(template.query),
    );
  }

  CubeSchema _convertCubeDefinition(pb.CubeDefinition def) {
    return CubeSchema(
      name: def.name,
      title: def.title,
      description: def.description,
      measures: def.measures
          .map((m) => CubeMemberSchema(
                name: m.name,
                title: m.title,
                description: m.description,
                type: m.type,
              ))
          .toList(),
      dimensions: def.dimensions
          .map((d) => CubeMemberSchema(
                name: d.name,
                title: d.title,
                description: d.description,
                type: d.type,
              ))
          .toList(),
    );
  }
}
