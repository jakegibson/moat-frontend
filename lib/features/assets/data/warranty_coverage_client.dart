import 'package:injectable/injectable.dart';

import '../../../core/transport/warranty_coverage_service_client.dart';
import '../../../gen/google/protobuf/struct.pb.dart' as struct_pb;
import '../../../gen/moat/v1/warranty_coverage.pb.dart' as pb;
import 'warranty_models.dart';

/// Client for warranty coverage API calls.
///
/// Uses the ConnectRPC WarrantyCoverageServiceClient and converts between
/// protobuf types and domain models.
@lazySingleton
class WarrantyCoverageClient {
  final WarrantyCoverageServiceClient _rpc;

  WarrantyCoverageClient(this._rpc);

  // ============================================================================
  // Warranty Coverage CRUD
  // ============================================================================

  /// Get a single warranty coverage by ID.
  Future<WarrantyCoverage> getWarrantyCoverage(String id) async {
    final request = pb.GetWarrantyCoverageRequest(id: id);
    final response = await _rpc.getWarrantyCoverage(request);
    return _fromProto(response);
  }

  /// List all warranty coverages for an asset.
  Future<List<WarrantyCoverage>> listWarrantyCoverages(
    String assetId, {
    String? status,
  }) async {
    final request = pb.ListWarrantyCoveragesRequest(
      assetId: assetId,
      status: status ?? '',
    );
    final response = await _rpc.listWarrantyCoverages(request);
    return response.coverages.map(_fromProto).toList();
  }

  /// Create a new warranty coverage.
  Future<WarrantyCoverage> createWarrantyCoverage({
    required String assetId,
    required String name,
    String? description,
    required int expirationInMonths,
    int? pageNumber,
    String? fileId,
    Map<String, dynamic>? details,
  }) async {
    final request = pb.CreateWarrantyCoverageRequest(
      assetId: assetId,
      name: name,
      expirationInMonths: expirationInMonths,
    );

    if (description != null) request.description = description;
    if (pageNumber != null) request.pageNumber = pageNumber;
    if (fileId != null) request.fileId = fileId;
    if (details != null) {
      request.details = _toProtoStruct(details);
    }

    final response = await _rpc.createWarrantyCoverage(request);
    return _fromProto(response);
  }

  /// Update an existing warranty coverage.
  Future<WarrantyCoverage> updateWarrantyCoverage({
    required String id,
    String? name,
    String? description,
    int? expirationInMonths,
    int? pageNumber,
    String? fileId,
    Map<String, dynamic>? details,
    bool updateFileAll = false,
  }) async {
    final request = pb.UpdateWarrantyCoverageRequest(
      id: id,
      updateFileAll: updateFileAll,
    );

    if (name != null) request.name = name;
    if (description != null) request.description = description;
    if (expirationInMonths != null) {
      request.expirationInMonths = expirationInMonths;
    }
    if (pageNumber != null) request.pageNumber = pageNumber;
    if (fileId != null) request.fileId = fileId;
    if (details != null) {
      request.details = _toProtoStruct(details);
    }

    final response = await _rpc.updateWarrantyCoverage(request);
    return _fromProto(response);
  }

  /// Delete a warranty coverage (soft delete).
  Future<void> deleteWarrantyCoverage(String id, {String? reason}) async {
    final request = pb.DeleteWarrantyCoverageRequest(
      id: id,
      reason: reason ?? '',
    );
    await _rpc.deleteWarrantyCoverage(request);
  }

  // ============================================================================
  // Warranty Coverage History
  // ============================================================================

  /// Add a resolution history entry to a warranty coverage.
  Future<WarrantyCoverageHistory> addCoverageHistory({
    required String coverageId,
    required WarrantyHistoryType type,
    String? description,
  }) async {
    final request = pb.AddCoverageHistoryRequest(
      coverageId: coverageId,
      type: type.name,
      description: description ?? '',
    );

    final response = await _rpc.addCoverageHistory(request);
    return _historyFromProto(response);
  }

  /// Get the resolution history for a warranty coverage.
  Future<List<WarrantyCoverageHistory>> getCoverageHistory(
      String coverageId) async {
    final request = pb.GetCoverageHistoryRequest(coverageId: coverageId);
    final response = await _rpc.getCoverageHistory(request);
    return response.history.map(_historyFromProto).toList();
  }

  // ============================================================================
  // Conversion Helpers
  // ============================================================================

  WarrantyCoverage _fromProto(pb.WarrantyCoverage proto) {
    Map<String, dynamic>? details;
    if (proto.hasDetails()) {
      details = _fromProtoStruct(proto.details);
    }

    return WarrantyCoverage(
      id: proto.id,
      assetId: proto.assetId,
      name: proto.name.isNotEmpty ? proto.name : null,
      description: proto.description.isNotEmpty ? proto.description : null,
      expirationInMonths: proto.expirationInMonths > 0 ? proto.expirationInMonths : null,
      pageNumber: proto.pageNumber > 0 ? proto.pageNumber : null,
      assetFileId: proto.fileId.isNotEmpty ? proto.fileId : null,
      startDate: proto.hasStartDate()
          ? DateTime.fromMillisecondsSinceEpoch(
              proto.startDate.seconds.toInt() * 1000 +
                  proto.startDate.nanos ~/ 1000000,
            )
          : null,
      endDate: proto.hasEndDate()
          ? DateTime.fromMillisecondsSinceEpoch(
              proto.endDate.seconds.toInt() * 1000 +
                  proto.endDate.nanos ~/ 1000000,
            )
          : null,
      daysRemaining: proto.daysRemaining != 0 ? proto.daysRemaining : null,
      status: proto.status,
      details: details,
      providerName: details?['provider_name'] as String?,
      providerPhone: details?['provider_phone'] as String?,
      providerEmail: details?['provider_email'] as String?,
      providerWebsite: details?['provider_website'] as String?,
    );
  }

  WarrantyCoverageHistory _historyFromProto(pb.WarrantyCoverageHistory proto) {
    return WarrantyCoverageHistory(
      id: proto.id,
      coverageId: proto.coverageId,
      assetId: proto.assetId,
      type: WarrantyHistoryType.fromString(proto.type),
      description: proto.description.isNotEmpty ? proto.description : null,
      userId: proto.userId.isNotEmpty ? proto.userId : null,
      userName: proto.userName.isNotEmpty ? proto.userName : null,
      date: proto.hasCreatedAt()
          ? DateTime.fromMillisecondsSinceEpoch(
              proto.createdAt.seconds.toInt() * 1000 +
                  proto.createdAt.nanos ~/ 1000000,
            )
          : DateTime.now(),
    );
  }

  struct_pb.Struct _toProtoStruct(Map<String, dynamic> map) {
    final struct = struct_pb.Struct();
    for (final entry in map.entries) {
      struct.fields[entry.key] = _toProtoValue(entry.value);
    }
    return struct;
  }

  struct_pb.Value _toProtoValue(dynamic value) {
    if (value == null) {
      return struct_pb.Value()..nullValue = struct_pb.NullValue.NULL_VALUE;
    } else if (value is bool) {
      return struct_pb.Value()..boolValue = value;
    } else if (value is num) {
      return struct_pb.Value()..numberValue = value.toDouble();
    } else if (value is String) {
      return struct_pb.Value()..stringValue = value;
    } else if (value is List) {
      return struct_pb.Value()
        ..listValue = (struct_pb.ListValue()
          ..values.addAll(value.map(_toProtoValue)));
    } else if (value is Map<String, dynamic>) {
      return struct_pb.Value()..structValue = _toProtoStruct(value);
    }
    return struct_pb.Value()..stringValue = value.toString();
  }

  Map<String, dynamic> _fromProtoStruct(struct_pb.Struct struct) {
    final map = <String, dynamic>{};
    for (final entry in struct.fields.entries) {
      map[entry.key] = _fromProtoValue(entry.value);
    }
    return map;
  }

  dynamic _fromProtoValue(struct_pb.Value value) {
    if (value.hasNullValue()) {
      return null;
    } else if (value.hasBoolValue()) {
      return value.boolValue;
    } else if (value.hasNumberValue()) {
      return value.numberValue;
    } else if (value.hasStringValue()) {
      return value.stringValue;
    } else if (value.hasListValue()) {
      return value.listValue.values.map(_fromProtoValue).toList();
    } else if (value.hasStructValue()) {
      return _fromProtoStruct(value.structValue);
    }
    return null;
  }
}
