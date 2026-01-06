import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/analytics.pb.dart';

/// ConnectRPC client for AnalyticsService.
///
/// Provides AI-powered natural language query translation and pre-built templates.
@lazySingleton
class AnalyticsServiceClient {
  final Client _client;

  AnalyticsServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.AnalyticsService';

  /// Translate a natural language question into a Cube.js query.
  Future<TranslateNaturalLanguageResponse> translateNaturalLanguage(
      TranslateNaturalLanguageRequest request) {
    return _client.unary(
      Spec<TranslateNaturalLanguageRequest, TranslateNaturalLanguageResponse>(
        '$_service/TranslateNaturalLanguage',
        StreamType.unary,
        TranslateNaturalLanguageRequest.create,
        TranslateNaturalLanguageResponse.create,
      ),
      request,
    );
  }

  /// Get pre-built query templates for common analytics questions.
  Future<GetQueryTemplatesResponse> getQueryTemplates(
      GetQueryTemplatesRequest request) {
    return _client.unary(
      Spec<GetQueryTemplatesRequest, GetQueryTemplatesResponse>(
        '$_service/GetQueryTemplates',
        StreamType.unary,
        GetQueryTemplatesRequest.create,
        GetQueryTemplatesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  /// Get the cube schema with descriptions.
  Future<GetCubeSchemaResponse> getCubeSchema(GetCubeSchemaRequest request) {
    return _client.unary(
      Spec<GetCubeSchemaRequest, GetCubeSchemaResponse>(
        '$_service/GetCubeSchema',
        StreamType.unary,
        GetCubeSchemaRequest.create,
        GetCubeSchemaResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }
}
