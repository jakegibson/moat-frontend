import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../../gen/moat/v1/admin.pb.dart';

/// ConnectRPC client for AdminService.
///
/// Uses generated protobuf types and the ConnectRPC transport for type-safe
/// RPC calls. Requires admin privileges (ADMIN_COMPANY_ID membership).
@lazySingleton
class AdminServiceClient {
  final Client _client;

  AdminServiceClient(Transport transport) : _client = Client(transport);

  static const _service = '/moat.v1.AdminService';

  // ============================================================================
  // SSO Domain Management
  // ============================================================================

  Future<ListSSODomainsResponse> listSSODomains(ListSSODomainsRequest request) {
    return _client.unary(
      Spec<ListSSODomainsRequest, ListSSODomainsResponse>(
        '$_service/ListSSODomains',
        StreamType.unary,
        ListSSODomainsRequest.create,
        ListSSODomainsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<SSODomain> getSSODomain(GetSSODomainRequest request) {
    return _client.unary(
      Spec<GetSSODomainRequest, SSODomain>(
        '$_service/GetSSODomain',
        StreamType.unary,
        GetSSODomainRequest.create,
        SSODomain.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<SSODomain> createSSODomain(CreateSSODomainRequest request) {
    return _client.unary(
      Spec<CreateSSODomainRequest, SSODomain>(
        '$_service/CreateSSODomain',
        StreamType.unary,
        CreateSSODomainRequest.create,
        SSODomain.create,
      ),
      request,
    );
  }

  Future<SSODomain> updateSSODomain(UpdateSSODomainRequest request) {
    return _client.unary(
      Spec<UpdateSSODomainRequest, SSODomain>(
        '$_service/UpdateSSODomain',
        StreamType.unary,
        UpdateSSODomainRequest.create,
        SSODomain.create,
      ),
      request,
    );
  }

  Future<DeleteSSODomainResponse> deleteSSODomain(
      DeleteSSODomainRequest request) {
    return _client.unary(
      Spec<DeleteSSODomainRequest, DeleteSSODomainResponse>(
        '$_service/DeleteSSODomain',
        StreamType.unary,
        DeleteSSODomainRequest.create,
        DeleteSSODomainResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Prompt Template Management
  // ============================================================================

  Future<ListPromptTemplatesResponse> listPromptTemplates(
      ListPromptTemplatesRequest request) {
    return _client.unary(
      Spec<ListPromptTemplatesRequest, ListPromptTemplatesResponse>(
        '$_service/ListPromptTemplates',
        StreamType.unary,
        ListPromptTemplatesRequest.create,
        ListPromptTemplatesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<PromptTemplateDetail> getPromptTemplate(
      GetPromptTemplateRequest request) {
    return _client.unary(
      Spec<GetPromptTemplateRequest, PromptTemplateDetail>(
        '$_service/GetPromptTemplate',
        StreamType.unary,
        GetPromptTemplateRequest.create,
        PromptTemplateDetail.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<PromptTemplate> createPromptTemplate(
      CreatePromptTemplateRequest request) {
    return _client.unary(
      Spec<CreatePromptTemplateRequest, PromptTemplate>(
        '$_service/CreatePromptTemplate',
        StreamType.unary,
        CreatePromptTemplateRequest.create,
        PromptTemplate.create,
      ),
      request,
    );
  }

  Future<PromptTemplate> updatePromptTemplate(
      UpdatePromptTemplateRequest request) {
    return _client.unary(
      Spec<UpdatePromptTemplateRequest, PromptTemplate>(
        '$_service/UpdatePromptTemplate',
        StreamType.unary,
        UpdatePromptTemplateRequest.create,
        PromptTemplate.create,
      ),
      request,
    );
  }

  Future<DeletePromptTemplateResponse> deletePromptTemplate(
      DeletePromptTemplateRequest request) {
    return _client.unary(
      Spec<DeletePromptTemplateRequest, DeletePromptTemplateResponse>(
        '$_service/DeletePromptTemplate',
        StreamType.unary,
        DeletePromptTemplateRequest.create,
        DeletePromptTemplateResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // Prompt Version Management
  // ============================================================================

  Future<PromptVersion> createPromptVersion(
      CreatePromptVersionRequest request) {
    return _client.unary(
      Spec<CreatePromptVersionRequest, PromptVersion>(
        '$_service/CreatePromptVersion',
        StreamType.unary,
        CreatePromptVersionRequest.create,
        PromptVersion.create,
      ),
      request,
    );
  }

  Future<ActivatePromptVersionResponse> activatePromptVersion(
      ActivatePromptVersionRequest request) {
    return _client.unary(
      Spec<ActivatePromptVersionRequest, ActivatePromptVersionResponse>(
        '$_service/ActivatePromptVersion',
        StreamType.unary,
        ActivatePromptVersionRequest.create,
        ActivatePromptVersionResponse.create,
      ),
      request,
    );
  }

  Future<DeactivatePromptVersionResponse> deactivatePromptVersion(
      DeactivatePromptVersionRequest request) {
    return _client.unary(
      Spec<DeactivatePromptVersionRequest, DeactivatePromptVersionResponse>(
        '$_service/DeactivatePromptVersion',
        StreamType.unary,
        DeactivatePromptVersionRequest.create,
        DeactivatePromptVersionResponse.create,
      ),
      request,
    );
  }

  Future<PromotePromptVersionResponse> promotePromptVersion(
      PromotePromptVersionRequest request) {
    return _client.unary(
      Spec<PromotePromptVersionRequest, PromotePromptVersionResponse>(
        '$_service/PromotePromptVersion',
        StreamType.unary,
        PromotePromptVersionRequest.create,
        PromotePromptVersionResponse.create,
      ),
      request,
    );
  }

  // ============================================================================
  // AI Generation Tracking
  // ============================================================================

  Future<GenerationStats> getGenerationStats(
      GetGenerationStatsRequest request) {
    return _client.unary(
      Spec<GetGenerationStatsRequest, GenerationStats>(
        '$_service/GetGenerationStats',
        StreamType.unary,
        GetGenerationStatsRequest.create,
        GenerationStats.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<ListGenerationsResponse> listGenerations(
      ListGenerationsRequest request) {
    return _client.unary(
      Spec<ListGenerationsRequest, ListGenerationsResponse>(
        '$_service/ListGenerations',
        StreamType.unary,
        ListGenerationsRequest.create,
        ListGenerationsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GenerationDetail> getGeneration(GetGenerationRequest request) {
    return _client.unary(
      Spec<GetGenerationRequest, GenerationDetail>(
        '$_service/GetGeneration',
        StreamType.unary,
        GetGenerationRequest.create,
        GenerationDetail.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GetRecentErrorsResponse> getRecentErrors(
      GetRecentErrorsRequest request) {
    return _client.unary(
      Spec<GetRecentErrorsRequest, GetRecentErrorsResponse>(
        '$_service/GetRecentErrors',
        StreamType.unary,
        GetRecentErrorsRequest.create,
        GetRecentErrorsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<AssetAIHistory> getAssetAIHistory(GetAssetAIHistoryRequest request) {
    return _client.unary(
      Spec<GetAssetAIHistoryRequest, AssetAIHistory>(
        '$_service/GetAssetAIHistory',
        StreamType.unary,
        GetAssetAIHistoryRequest.create,
        AssetAIHistory.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // Gap Analysis
  // ============================================================================

  Future<GapAnalysisResponse> getAssetGapAnalysis(
      GetAssetGapAnalysisRequest request) {
    return _client.unary(
      Spec<GetAssetGapAnalysisRequest, GapAnalysisResponse>(
        '$_service/GetAssetGapAnalysis',
        StreamType.unary,
        GetAssetGapAnalysisRequest.create,
        GapAnalysisResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GetAssetsMissingFieldsResponse> getAssetsMissingFields(
      GetAssetsMissingFieldsRequest request) {
    return _client.unary(
      Spec<GetAssetsMissingFieldsRequest, GetAssetsMissingFieldsResponse>(
        '$_service/GetAssetsMissingFields',
        StreamType.unary,
        GetAssetsMissingFieldsRequest.create,
        GetAssetsMissingFieldsResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  // ============================================================================
  // System Statistics
  // ============================================================================

  Future<SystemOverviewResponse> getSystemOverview(
      GetSystemOverviewRequest request) {
    return _client.unary(
      Spec<GetSystemOverviewRequest, SystemOverviewResponse>(
        '$_service/GetSystemOverview',
        StreamType.unary,
        GetSystemOverviewRequest.create,
        SystemOverviewResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }

  Future<GetCompanySummariesResponse> getCompanySummaries(
      GetCompanySummariesRequest request) {
    return _client.unary(
      Spec<GetCompanySummariesRequest, GetCompanySummariesResponse>(
        '$_service/GetCompanySummaries',
        StreamType.unary,
        GetCompanySummariesRequest.create,
        GetCompanySummariesResponse.create,
        idempotency: Idempotency.noSideEffects,
      ),
      request,
    );
  }
}
