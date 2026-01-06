//
//  Generated code. Do not modify.
//  source: moat/v1/asset.proto
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

import 'asset.pb.dart' as $5;
import 'asset.pbjson.dart';

export 'asset.pb.dart';

abstract class AssetServiceBase extends $pb.GeneratedService {
  $async.Future<$5.Asset> createAsset($pb.ServerContext ctx, $5.CreateAssetRequest request);
  $async.Future<$5.AssetWithDetails> getAsset($pb.ServerContext ctx, $5.GetAssetRequest request);
  $async.Future<$5.Asset> updateAsset($pb.ServerContext ctx, $5.UpdateAssetRequest request);
  $async.Future<$5.DeleteAssetResponse> deleteAsset($pb.ServerContext ctx, $5.DeleteAssetRequest request);
  $async.Future<$5.ListAssetsResponse> listAssets($pb.ServerContext ctx, $5.ListAssetsRequest request);
  $async.Future<$5.BulkUpdateAssetsResponse> bulkUpdateAssets($pb.ServerContext ctx, $5.BulkUpdateAssetsRequest request);
  $async.Future<$5.BulkDeleteAssetsResponse> bulkDeleteAssets($pb.ServerContext ctx, $5.BulkDeleteAssetsRequest request);
  $async.Future<$5.GetAssetLocationsResponse> getAssetLocations($pb.ServerContext ctx, $5.GetAssetLocationsRequest request);
  $async.Future<$5.GetAssetDivisionsResponse> getAssetDivisions($pb.ServerContext ctx, $5.GetAssetDivisionsRequest request);
  $async.Future<$5.AssetStatistics> getAssetStatistics($pb.ServerContext ctx, $5.GetAssetStatisticsRequest request);
  $async.Future<$5.GetAssetFileUploadUrlResponse> getAssetFileUploadUrl($pb.ServerContext ctx, $5.GetAssetFileUploadUrlRequest request);
  $async.Future<$5.AssetFile> confirmAssetFileUpload($pb.ServerContext ctx, $5.ConfirmAssetFileUploadRequest request);
  $async.Future<$5.ListAssetFilesResponse> listAssetFiles($pb.ServerContext ctx, $5.ListAssetFilesRequest request);
  $async.Future<$5.DeleteAssetFileResponse> deleteAssetFile($pb.ServerContext ctx, $5.DeleteAssetFileRequest request);
  $async.Future<$5.AssetFile> updateAssetFile($pb.ServerContext ctx, $5.UpdateAssetFileRequest request);
  $async.Future<$5.ListAssetMessagesResponse> listAssetMessages($pb.ServerContext ctx, $5.ListAssetMessagesRequest request);
  $async.Future<$5.CreateAssetMessageResponse> createAssetMessage($pb.ServerContext ctx, $5.CreateAssetMessageRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateAsset': return $5.CreateAssetRequest();
      case 'GetAsset': return $5.GetAssetRequest();
      case 'UpdateAsset': return $5.UpdateAssetRequest();
      case 'DeleteAsset': return $5.DeleteAssetRequest();
      case 'ListAssets': return $5.ListAssetsRequest();
      case 'BulkUpdateAssets': return $5.BulkUpdateAssetsRequest();
      case 'BulkDeleteAssets': return $5.BulkDeleteAssetsRequest();
      case 'GetAssetLocations': return $5.GetAssetLocationsRequest();
      case 'GetAssetDivisions': return $5.GetAssetDivisionsRequest();
      case 'GetAssetStatistics': return $5.GetAssetStatisticsRequest();
      case 'GetAssetFileUploadUrl': return $5.GetAssetFileUploadUrlRequest();
      case 'ConfirmAssetFileUpload': return $5.ConfirmAssetFileUploadRequest();
      case 'ListAssetFiles': return $5.ListAssetFilesRequest();
      case 'DeleteAssetFile': return $5.DeleteAssetFileRequest();
      case 'UpdateAssetFile': return $5.UpdateAssetFileRequest();
      case 'ListAssetMessages': return $5.ListAssetMessagesRequest();
      case 'CreateAssetMessage': return $5.CreateAssetMessageRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateAsset': return this.createAsset(ctx, request as $5.CreateAssetRequest);
      case 'GetAsset': return this.getAsset(ctx, request as $5.GetAssetRequest);
      case 'UpdateAsset': return this.updateAsset(ctx, request as $5.UpdateAssetRequest);
      case 'DeleteAsset': return this.deleteAsset(ctx, request as $5.DeleteAssetRequest);
      case 'ListAssets': return this.listAssets(ctx, request as $5.ListAssetsRequest);
      case 'BulkUpdateAssets': return this.bulkUpdateAssets(ctx, request as $5.BulkUpdateAssetsRequest);
      case 'BulkDeleteAssets': return this.bulkDeleteAssets(ctx, request as $5.BulkDeleteAssetsRequest);
      case 'GetAssetLocations': return this.getAssetLocations(ctx, request as $5.GetAssetLocationsRequest);
      case 'GetAssetDivisions': return this.getAssetDivisions(ctx, request as $5.GetAssetDivisionsRequest);
      case 'GetAssetStatistics': return this.getAssetStatistics(ctx, request as $5.GetAssetStatisticsRequest);
      case 'GetAssetFileUploadUrl': return this.getAssetFileUploadUrl(ctx, request as $5.GetAssetFileUploadUrlRequest);
      case 'ConfirmAssetFileUpload': return this.confirmAssetFileUpload(ctx, request as $5.ConfirmAssetFileUploadRequest);
      case 'ListAssetFiles': return this.listAssetFiles(ctx, request as $5.ListAssetFilesRequest);
      case 'DeleteAssetFile': return this.deleteAssetFile(ctx, request as $5.DeleteAssetFileRequest);
      case 'UpdateAssetFile': return this.updateAssetFile(ctx, request as $5.UpdateAssetFileRequest);
      case 'ListAssetMessages': return this.listAssetMessages(ctx, request as $5.ListAssetMessagesRequest);
      case 'CreateAssetMessage': return this.createAssetMessage(ctx, request as $5.CreateAssetMessageRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AssetServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AssetServiceBase$messageJson;
}

