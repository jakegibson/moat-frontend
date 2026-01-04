//
//  Generated code. Do not modify.
//  source: moat/v1/warranty_coverage.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'warranty_coverage.pb.dart' as $7;
import 'warranty_coverage.pbjson.dart';

export 'warranty_coverage.pb.dart';

abstract class WarrantyCoverageServiceBase extends $pb.GeneratedService {
  $async.Future<$7.WarrantyCoverage> getWarrantyCoverage($pb.ServerContext ctx, $7.GetWarrantyCoverageRequest request);
  $async.Future<$7.ListWarrantyCoveragesResponse> listWarrantyCoverages($pb.ServerContext ctx, $7.ListWarrantyCoveragesRequest request);
  $async.Future<$7.WarrantyCoverage> createWarrantyCoverage($pb.ServerContext ctx, $7.CreateWarrantyCoverageRequest request);
  $async.Future<$7.WarrantyCoverage> updateWarrantyCoverage($pb.ServerContext ctx, $7.UpdateWarrantyCoverageRequest request);
  $async.Future<$7.DeleteWarrantyCoverageResponse> deleteWarrantyCoverage($pb.ServerContext ctx, $7.DeleteWarrantyCoverageRequest request);
  $async.Future<$7.WarrantyCoverageHistory> addCoverageHistory($pb.ServerContext ctx, $7.AddCoverageHistoryRequest request);
  $async.Future<$7.GetCoverageHistoryResponse> getCoverageHistory($pb.ServerContext ctx, $7.GetCoverageHistoryRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'GetWarrantyCoverage': return $7.GetWarrantyCoverageRequest();
      case 'ListWarrantyCoverages': return $7.ListWarrantyCoveragesRequest();
      case 'CreateWarrantyCoverage': return $7.CreateWarrantyCoverageRequest();
      case 'UpdateWarrantyCoverage': return $7.UpdateWarrantyCoverageRequest();
      case 'DeleteWarrantyCoverage': return $7.DeleteWarrantyCoverageRequest();
      case 'AddCoverageHistory': return $7.AddCoverageHistoryRequest();
      case 'GetCoverageHistory': return $7.GetCoverageHistoryRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'GetWarrantyCoverage': return this.getWarrantyCoverage(ctx, request as $7.GetWarrantyCoverageRequest);
      case 'ListWarrantyCoverages': return this.listWarrantyCoverages(ctx, request as $7.ListWarrantyCoveragesRequest);
      case 'CreateWarrantyCoverage': return this.createWarrantyCoverage(ctx, request as $7.CreateWarrantyCoverageRequest);
      case 'UpdateWarrantyCoverage': return this.updateWarrantyCoverage(ctx, request as $7.UpdateWarrantyCoverageRequest);
      case 'DeleteWarrantyCoverage': return this.deleteWarrantyCoverage(ctx, request as $7.DeleteWarrantyCoverageRequest);
      case 'AddCoverageHistory': return this.addCoverageHistory(ctx, request as $7.AddCoverageHistoryRequest);
      case 'GetCoverageHistory': return this.getCoverageHistory(ctx, request as $7.GetCoverageHistoryRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => WarrantyCoverageServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => WarrantyCoverageServiceBase$messageJson;
}

