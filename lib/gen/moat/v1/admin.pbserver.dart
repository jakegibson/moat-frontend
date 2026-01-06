//
//  Generated code. Do not modify.
//  source: moat/v1/admin.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'admin.pb.dart' as $2;
import 'admin.pbjson.dart';

export 'admin.pb.dart';

abstract class AdminServiceBase extends $pb.GeneratedService {
  $async.Future<$2.ListSSODomainsResponse> listSSODomains($pb.ServerContext ctx, $2.ListSSODomainsRequest request);
  $async.Future<$2.SSODomain> getSSODomain($pb.ServerContext ctx, $2.GetSSODomainRequest request);
  $async.Future<$2.SSODomain> createSSODomain($pb.ServerContext ctx, $2.CreateSSODomainRequest request);
  $async.Future<$2.SSODomain> updateSSODomain($pb.ServerContext ctx, $2.UpdateSSODomainRequest request);
  $async.Future<$2.DeleteSSODomainResponse> deleteSSODomain($pb.ServerContext ctx, $2.DeleteSSODomainRequest request);
  $async.Future<$2.ListPromptTemplatesResponse> listPromptTemplates($pb.ServerContext ctx, $2.ListPromptTemplatesRequest request);
  $async.Future<$2.PromptTemplateDetail> getPromptTemplate($pb.ServerContext ctx, $2.GetPromptTemplateRequest request);
  $async.Future<$2.PromptTemplate> createPromptTemplate($pb.ServerContext ctx, $2.CreatePromptTemplateRequest request);
  $async.Future<$2.PromptTemplate> updatePromptTemplate($pb.ServerContext ctx, $2.UpdatePromptTemplateRequest request);
  $async.Future<$2.DeletePromptTemplateResponse> deletePromptTemplate($pb.ServerContext ctx, $2.DeletePromptTemplateRequest request);
  $async.Future<$2.PromptVersion> createPromptVersion($pb.ServerContext ctx, $2.CreatePromptVersionRequest request);
  $async.Future<$2.ActivatePromptVersionResponse> activatePromptVersion($pb.ServerContext ctx, $2.ActivatePromptVersionRequest request);
  $async.Future<$2.DeactivatePromptVersionResponse> deactivatePromptVersion($pb.ServerContext ctx, $2.DeactivatePromptVersionRequest request);
  $async.Future<$2.PromotePromptVersionResponse> promotePromptVersion($pb.ServerContext ctx, $2.PromotePromptVersionRequest request);
  $async.Future<$2.GenerationStats> getGenerationStats($pb.ServerContext ctx, $2.GetGenerationStatsRequest request);
  $async.Future<$2.ListGenerationsResponse> listGenerations($pb.ServerContext ctx, $2.ListGenerationsRequest request);
  $async.Future<$2.GenerationDetail> getGeneration($pb.ServerContext ctx, $2.GetGenerationRequest request);
  $async.Future<$2.GetRecentErrorsResponse> getRecentErrors($pb.ServerContext ctx, $2.GetRecentErrorsRequest request);
  $async.Future<$2.AssetAIHistory> getAssetAIHistory($pb.ServerContext ctx, $2.GetAssetAIHistoryRequest request);
  $async.Future<$2.GapAnalysisResponse> getAssetGapAnalysis($pb.ServerContext ctx, $2.GetAssetGapAnalysisRequest request);
  $async.Future<$2.GetAssetsMissingFieldsResponse> getAssetsMissingFields($pb.ServerContext ctx, $2.GetAssetsMissingFieldsRequest request);
  $async.Future<$2.SystemOverviewResponse> getSystemOverview($pb.ServerContext ctx, $2.GetSystemOverviewRequest request);
  $async.Future<$2.GetCompanySummariesResponse> getCompanySummaries($pb.ServerContext ctx, $2.GetCompanySummariesRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ListSSODomains': return $2.ListSSODomainsRequest();
      case 'GetSSODomain': return $2.GetSSODomainRequest();
      case 'CreateSSODomain': return $2.CreateSSODomainRequest();
      case 'UpdateSSODomain': return $2.UpdateSSODomainRequest();
      case 'DeleteSSODomain': return $2.DeleteSSODomainRequest();
      case 'ListPromptTemplates': return $2.ListPromptTemplatesRequest();
      case 'GetPromptTemplate': return $2.GetPromptTemplateRequest();
      case 'CreatePromptTemplate': return $2.CreatePromptTemplateRequest();
      case 'UpdatePromptTemplate': return $2.UpdatePromptTemplateRequest();
      case 'DeletePromptTemplate': return $2.DeletePromptTemplateRequest();
      case 'CreatePromptVersion': return $2.CreatePromptVersionRequest();
      case 'ActivatePromptVersion': return $2.ActivatePromptVersionRequest();
      case 'DeactivatePromptVersion': return $2.DeactivatePromptVersionRequest();
      case 'PromotePromptVersion': return $2.PromotePromptVersionRequest();
      case 'GetGenerationStats': return $2.GetGenerationStatsRequest();
      case 'ListGenerations': return $2.ListGenerationsRequest();
      case 'GetGeneration': return $2.GetGenerationRequest();
      case 'GetRecentErrors': return $2.GetRecentErrorsRequest();
      case 'GetAssetAIHistory': return $2.GetAssetAIHistoryRequest();
      case 'GetAssetGapAnalysis': return $2.GetAssetGapAnalysisRequest();
      case 'GetAssetsMissingFields': return $2.GetAssetsMissingFieldsRequest();
      case 'GetSystemOverview': return $2.GetSystemOverviewRequest();
      case 'GetCompanySummaries': return $2.GetCompanySummariesRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ListSSODomains': return this.listSSODomains(ctx, request as $2.ListSSODomainsRequest);
      case 'GetSSODomain': return this.getSSODomain(ctx, request as $2.GetSSODomainRequest);
      case 'CreateSSODomain': return this.createSSODomain(ctx, request as $2.CreateSSODomainRequest);
      case 'UpdateSSODomain': return this.updateSSODomain(ctx, request as $2.UpdateSSODomainRequest);
      case 'DeleteSSODomain': return this.deleteSSODomain(ctx, request as $2.DeleteSSODomainRequest);
      case 'ListPromptTemplates': return this.listPromptTemplates(ctx, request as $2.ListPromptTemplatesRequest);
      case 'GetPromptTemplate': return this.getPromptTemplate(ctx, request as $2.GetPromptTemplateRequest);
      case 'CreatePromptTemplate': return this.createPromptTemplate(ctx, request as $2.CreatePromptTemplateRequest);
      case 'UpdatePromptTemplate': return this.updatePromptTemplate(ctx, request as $2.UpdatePromptTemplateRequest);
      case 'DeletePromptTemplate': return this.deletePromptTemplate(ctx, request as $2.DeletePromptTemplateRequest);
      case 'CreatePromptVersion': return this.createPromptVersion(ctx, request as $2.CreatePromptVersionRequest);
      case 'ActivatePromptVersion': return this.activatePromptVersion(ctx, request as $2.ActivatePromptVersionRequest);
      case 'DeactivatePromptVersion': return this.deactivatePromptVersion(ctx, request as $2.DeactivatePromptVersionRequest);
      case 'PromotePromptVersion': return this.promotePromptVersion(ctx, request as $2.PromotePromptVersionRequest);
      case 'GetGenerationStats': return this.getGenerationStats(ctx, request as $2.GetGenerationStatsRequest);
      case 'ListGenerations': return this.listGenerations(ctx, request as $2.ListGenerationsRequest);
      case 'GetGeneration': return this.getGeneration(ctx, request as $2.GetGenerationRequest);
      case 'GetRecentErrors': return this.getRecentErrors(ctx, request as $2.GetRecentErrorsRequest);
      case 'GetAssetAIHistory': return this.getAssetAIHistory(ctx, request as $2.GetAssetAIHistoryRequest);
      case 'GetAssetGapAnalysis': return this.getAssetGapAnalysis(ctx, request as $2.GetAssetGapAnalysisRequest);
      case 'GetAssetsMissingFields': return this.getAssetsMissingFields(ctx, request as $2.GetAssetsMissingFieldsRequest);
      case 'GetSystemOverview': return this.getSystemOverview(ctx, request as $2.GetSystemOverviewRequest);
      case 'GetCompanySummaries': return this.getCompanySummaries(ctx, request as $2.GetCompanySummariesRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AdminServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AdminServiceBase$messageJson;
}

