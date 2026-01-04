//
//  Generated code. Do not modify.
//  source: moat/v1/asset.proto
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

import 'asset.pb.dart' as $1;
import 'asset.pbjson.dart';

export 'asset.pb.dart';

abstract class AssetServiceBase extends $pb.GeneratedService {
  $async.Future<$1.Asset> createAsset($pb.ServerContext ctx, $1.CreateAssetRequest request);
  $async.Future<$1.AssetWithDetails> getAsset($pb.ServerContext ctx, $1.GetAssetRequest request);
  $async.Future<$1.Asset> updateAsset($pb.ServerContext ctx, $1.UpdateAssetRequest request);
  $async.Future<$1.DeleteAssetResponse> deleteAsset($pb.ServerContext ctx, $1.DeleteAssetRequest request);
  $async.Future<$1.ListAssetsResponse> listAssets($pb.ServerContext ctx, $1.ListAssetsRequest request);
  $async.Future<$1.BulkUpdateAssetsResponse> bulkUpdateAssets($pb.ServerContext ctx, $1.BulkUpdateAssetsRequest request);
  $async.Future<$1.BulkDeleteAssetsResponse> bulkDeleteAssets($pb.ServerContext ctx, $1.BulkDeleteAssetsRequest request);
  $async.Future<$1.GetAssetLocationsResponse> getAssetLocations($pb.ServerContext ctx, $1.GetAssetLocationsRequest request);
  $async.Future<$1.GetAssetDivisionsResponse> getAssetDivisions($pb.ServerContext ctx, $1.GetAssetDivisionsRequest request);
  $async.Future<$1.AssetStatistics> getAssetStatistics($pb.ServerContext ctx, $1.GetAssetStatisticsRequest request);
  $async.Future<$1.GetAssetFileUploadUrlResponse> getAssetFileUploadUrl($pb.ServerContext ctx, $1.GetAssetFileUploadUrlRequest request);
  $async.Future<$1.AssetFile> confirmAssetFileUpload($pb.ServerContext ctx, $1.ConfirmAssetFileUploadRequest request);
  $async.Future<$1.ListAssetFilesResponse> listAssetFiles($pb.ServerContext ctx, $1.ListAssetFilesRequest request);
  $async.Future<$1.DeleteAssetFileResponse> deleteAssetFile($pb.ServerContext ctx, $1.DeleteAssetFileRequest request);
  $async.Future<$1.AssetFile> updateAssetFile($pb.ServerContext ctx, $1.UpdateAssetFileRequest request);
  $async.Future<$1.ListAssetMessagesResponse> listAssetMessages($pb.ServerContext ctx, $1.ListAssetMessagesRequest request);
  $async.Future<$1.CreateAssetMessageResponse> createAssetMessage($pb.ServerContext ctx, $1.CreateAssetMessageRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateAsset': return $1.CreateAssetRequest();
      case 'GetAsset': return $1.GetAssetRequest();
      case 'UpdateAsset': return $1.UpdateAssetRequest();
      case 'DeleteAsset': return $1.DeleteAssetRequest();
      case 'ListAssets': return $1.ListAssetsRequest();
      case 'BulkUpdateAssets': return $1.BulkUpdateAssetsRequest();
      case 'BulkDeleteAssets': return $1.BulkDeleteAssetsRequest();
      case 'GetAssetLocations': return $1.GetAssetLocationsRequest();
      case 'GetAssetDivisions': return $1.GetAssetDivisionsRequest();
      case 'GetAssetStatistics': return $1.GetAssetStatisticsRequest();
      case 'GetAssetFileUploadUrl': return $1.GetAssetFileUploadUrlRequest();
      case 'ConfirmAssetFileUpload': return $1.ConfirmAssetFileUploadRequest();
      case 'ListAssetFiles': return $1.ListAssetFilesRequest();
      case 'DeleteAssetFile': return $1.DeleteAssetFileRequest();
      case 'UpdateAssetFile': return $1.UpdateAssetFileRequest();
      case 'ListAssetMessages': return $1.ListAssetMessagesRequest();
      case 'CreateAssetMessage': return $1.CreateAssetMessageRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateAsset': return this.createAsset(ctx, request as $1.CreateAssetRequest);
      case 'GetAsset': return this.getAsset(ctx, request as $1.GetAssetRequest);
      case 'UpdateAsset': return this.updateAsset(ctx, request as $1.UpdateAssetRequest);
      case 'DeleteAsset': return this.deleteAsset(ctx, request as $1.DeleteAssetRequest);
      case 'ListAssets': return this.listAssets(ctx, request as $1.ListAssetsRequest);
      case 'BulkUpdateAssets': return this.bulkUpdateAssets(ctx, request as $1.BulkUpdateAssetsRequest);
      case 'BulkDeleteAssets': return this.bulkDeleteAssets(ctx, request as $1.BulkDeleteAssetsRequest);
      case 'GetAssetLocations': return this.getAssetLocations(ctx, request as $1.GetAssetLocationsRequest);
      case 'GetAssetDivisions': return this.getAssetDivisions(ctx, request as $1.GetAssetDivisionsRequest);
      case 'GetAssetStatistics': return this.getAssetStatistics(ctx, request as $1.GetAssetStatisticsRequest);
      case 'GetAssetFileUploadUrl': return this.getAssetFileUploadUrl(ctx, request as $1.GetAssetFileUploadUrlRequest);
      case 'ConfirmAssetFileUpload': return this.confirmAssetFileUpload(ctx, request as $1.ConfirmAssetFileUploadRequest);
      case 'ListAssetFiles': return this.listAssetFiles(ctx, request as $1.ListAssetFilesRequest);
      case 'DeleteAssetFile': return this.deleteAssetFile(ctx, request as $1.DeleteAssetFileRequest);
      case 'UpdateAssetFile': return this.updateAssetFile(ctx, request as $1.UpdateAssetFileRequest);
      case 'ListAssetMessages': return this.listAssetMessages(ctx, request as $1.ListAssetMessagesRequest);
      case 'CreateAssetMessage': return this.createAssetMessage(ctx, request as $1.CreateAssetMessageRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AssetServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AssetServiceBase$messageJson;
}

