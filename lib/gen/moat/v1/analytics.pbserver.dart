//
//  Generated code. Do not modify.
//  source: moat/v1/analytics.proto
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

import '../../google/protobuf/empty.pb.dart' as $3;
import 'analytics.pb.dart' as $4;
import 'analytics.pbjson.dart';

export 'analytics.pb.dart';

abstract class AnalyticsServiceBase extends $pb.GeneratedService {
  $async.Future<$4.TranslateNaturalLanguageResponse> translateNaturalLanguage($pb.ServerContext ctx, $4.TranslateNaturalLanguageRequest request);
  $async.Future<$4.GetQueryTemplatesResponse> getQueryTemplates($pb.ServerContext ctx, $4.GetQueryTemplatesRequest request);
  $async.Future<$4.GetCubeSchemaResponse> getCubeSchema($pb.ServerContext ctx, $4.GetCubeSchemaRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'TranslateNaturalLanguage': return $4.TranslateNaturalLanguageRequest();
      case 'GetQueryTemplates': return $4.GetQueryTemplatesRequest();
      case 'GetCubeSchema': return $4.GetCubeSchemaRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'TranslateNaturalLanguage': return this.translateNaturalLanguage(ctx, request as $4.TranslateNaturalLanguageRequest);
      case 'GetQueryTemplates': return this.getQueryTemplates(ctx, request as $4.GetQueryTemplatesRequest);
      case 'GetCubeSchema': return this.getCubeSchema(ctx, request as $4.GetCubeSchemaRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AnalyticsServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AnalyticsServiceBase$messageJson;
}

abstract class DashboardServiceBase extends $pb.GeneratedService {
  $async.Future<$4.Dashboard> createDashboard($pb.ServerContext ctx, $4.CreateDashboardRequest request);
  $async.Future<$4.Dashboard> getDashboard($pb.ServerContext ctx, $4.GetDashboardRequest request);
  $async.Future<$4.ListDashboardsResponse> listDashboards($pb.ServerContext ctx, $4.ListDashboardsRequest request);
  $async.Future<$4.Dashboard> updateDashboard($pb.ServerContext ctx, $4.UpdateDashboardRequest request);
  $async.Future<$3.Empty> deleteDashboard($pb.ServerContext ctx, $4.DeleteDashboardRequest request);
  $async.Future<$4.SavedQuery> createSavedQuery($pb.ServerContext ctx, $4.CreateSavedQueryRequest request);
  $async.Future<$4.SavedQuery> getSavedQuery($pb.ServerContext ctx, $4.GetSavedQueryRequest request);
  $async.Future<$4.ListSavedQueriesResponse> listSavedQueries($pb.ServerContext ctx, $4.ListSavedQueriesRequest request);
  $async.Future<$4.SavedQuery> updateSavedQuery($pb.ServerContext ctx, $4.UpdateSavedQueryRequest request);
  $async.Future<$3.Empty> deleteSavedQuery($pb.ServerContext ctx, $4.DeleteSavedQueryRequest request);
  $async.Future<$4.DashboardItem> addQueryToDashboard($pb.ServerContext ctx, $4.AddQueryToDashboardRequest request);
  $async.Future<$3.Empty> removeQueryFromDashboard($pb.ServerContext ctx, $4.RemoveQueryFromDashboardRequest request);
  $async.Future<$4.Dashboard> updateDashboardLayout($pb.ServerContext ctx, $4.UpdateDashboardLayoutRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateDashboard': return $4.CreateDashboardRequest();
      case 'GetDashboard': return $4.GetDashboardRequest();
      case 'ListDashboards': return $4.ListDashboardsRequest();
      case 'UpdateDashboard': return $4.UpdateDashboardRequest();
      case 'DeleteDashboard': return $4.DeleteDashboardRequest();
      case 'CreateSavedQuery': return $4.CreateSavedQueryRequest();
      case 'GetSavedQuery': return $4.GetSavedQueryRequest();
      case 'ListSavedQueries': return $4.ListSavedQueriesRequest();
      case 'UpdateSavedQuery': return $4.UpdateSavedQueryRequest();
      case 'DeleteSavedQuery': return $4.DeleteSavedQueryRequest();
      case 'AddQueryToDashboard': return $4.AddQueryToDashboardRequest();
      case 'RemoveQueryFromDashboard': return $4.RemoveQueryFromDashboardRequest();
      case 'UpdateDashboardLayout': return $4.UpdateDashboardLayoutRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateDashboard': return this.createDashboard(ctx, request as $4.CreateDashboardRequest);
      case 'GetDashboard': return this.getDashboard(ctx, request as $4.GetDashboardRequest);
      case 'ListDashboards': return this.listDashboards(ctx, request as $4.ListDashboardsRequest);
      case 'UpdateDashboard': return this.updateDashboard(ctx, request as $4.UpdateDashboardRequest);
      case 'DeleteDashboard': return this.deleteDashboard(ctx, request as $4.DeleteDashboardRequest);
      case 'CreateSavedQuery': return this.createSavedQuery(ctx, request as $4.CreateSavedQueryRequest);
      case 'GetSavedQuery': return this.getSavedQuery(ctx, request as $4.GetSavedQueryRequest);
      case 'ListSavedQueries': return this.listSavedQueries(ctx, request as $4.ListSavedQueriesRequest);
      case 'UpdateSavedQuery': return this.updateSavedQuery(ctx, request as $4.UpdateSavedQueryRequest);
      case 'DeleteSavedQuery': return this.deleteSavedQuery(ctx, request as $4.DeleteSavedQueryRequest);
      case 'AddQueryToDashboard': return this.addQueryToDashboard(ctx, request as $4.AddQueryToDashboardRequest);
      case 'RemoveQueryFromDashboard': return this.removeQueryFromDashboard(ctx, request as $4.RemoveQueryFromDashboardRequest);
      case 'UpdateDashboardLayout': return this.updateDashboardLayout(ctx, request as $4.UpdateDashboardLayoutRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => DashboardServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => DashboardServiceBase$messageJson;
}

