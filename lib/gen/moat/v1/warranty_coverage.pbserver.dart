//
//  Generated code. Do not modify.
//  source: moat/v1/warranty_coverage.proto
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

import 'warranty_coverage.pb.dart' as $10;
import 'warranty_coverage.pbjson.dart';

export 'warranty_coverage.pb.dart';

abstract class WarrantyCoverageServiceBase extends $pb.GeneratedService {
  $async.Future<$10.WarrantyCoverage> getWarrantyCoverage($pb.ServerContext ctx, $10.GetWarrantyCoverageRequest request);
  $async.Future<$10.ListWarrantyCoveragesResponse> listWarrantyCoverages($pb.ServerContext ctx, $10.ListWarrantyCoveragesRequest request);
  $async.Future<$10.WarrantyCoverage> createWarrantyCoverage($pb.ServerContext ctx, $10.CreateWarrantyCoverageRequest request);
  $async.Future<$10.WarrantyCoverage> updateWarrantyCoverage($pb.ServerContext ctx, $10.UpdateWarrantyCoverageRequest request);
  $async.Future<$10.DeleteWarrantyCoverageResponse> deleteWarrantyCoverage($pb.ServerContext ctx, $10.DeleteWarrantyCoverageRequest request);
  $async.Future<$10.WarrantyCoverageHistory> addCoverageHistory($pb.ServerContext ctx, $10.AddCoverageHistoryRequest request);
  $async.Future<$10.GetCoverageHistoryResponse> getCoverageHistory($pb.ServerContext ctx, $10.GetCoverageHistoryRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'GetWarrantyCoverage': return $10.GetWarrantyCoverageRequest();
      case 'ListWarrantyCoverages': return $10.ListWarrantyCoveragesRequest();
      case 'CreateWarrantyCoverage': return $10.CreateWarrantyCoverageRequest();
      case 'UpdateWarrantyCoverage': return $10.UpdateWarrantyCoverageRequest();
      case 'DeleteWarrantyCoverage': return $10.DeleteWarrantyCoverageRequest();
      case 'AddCoverageHistory': return $10.AddCoverageHistoryRequest();
      case 'GetCoverageHistory': return $10.GetCoverageHistoryRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'GetWarrantyCoverage': return this.getWarrantyCoverage(ctx, request as $10.GetWarrantyCoverageRequest);
      case 'ListWarrantyCoverages': return this.listWarrantyCoverages(ctx, request as $10.ListWarrantyCoveragesRequest);
      case 'CreateWarrantyCoverage': return this.createWarrantyCoverage(ctx, request as $10.CreateWarrantyCoverageRequest);
      case 'UpdateWarrantyCoverage': return this.updateWarrantyCoverage(ctx, request as $10.UpdateWarrantyCoverageRequest);
      case 'DeleteWarrantyCoverage': return this.deleteWarrantyCoverage(ctx, request as $10.DeleteWarrantyCoverageRequest);
      case 'AddCoverageHistory': return this.addCoverageHistory(ctx, request as $10.AddCoverageHistoryRequest);
      case 'GetCoverageHistory': return this.getCoverageHistory(ctx, request as $10.GetCoverageHistoryRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => WarrantyCoverageServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => WarrantyCoverageServiceBase$messageJson;
}

