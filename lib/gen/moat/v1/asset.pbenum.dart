//
//  Generated code. Do not modify.
//  source: moat/v1/asset.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AssetStatus extends $pb.ProtobufEnum {
  static const AssetStatus ASSET_STATUS_UNSPECIFIED = AssetStatus._(0, _omitEnumNames ? '' : 'ASSET_STATUS_UNSPECIFIED');
  static const AssetStatus ASSET_STATUS_DRAFT = AssetStatus._(1, _omitEnumNames ? '' : 'ASSET_STATUS_DRAFT');
  static const AssetStatus ASSET_STATUS_ACTIVE = AssetStatus._(2, _omitEnumNames ? '' : 'ASSET_STATUS_ACTIVE');
  static const AssetStatus ASSET_STATUS_INACTIVE = AssetStatus._(3, _omitEnumNames ? '' : 'ASSET_STATUS_INACTIVE');
  static const AssetStatus ASSET_STATUS_RETIRED = AssetStatus._(4, _omitEnumNames ? '' : 'ASSET_STATUS_RETIRED');
  static const AssetStatus ASSET_STATUS_DISPOSED = AssetStatus._(5, _omitEnumNames ? '' : 'ASSET_STATUS_DISPOSED');

  static const $core.List<AssetStatus> values = <AssetStatus> [
    ASSET_STATUS_UNSPECIFIED,
    ASSET_STATUS_DRAFT,
    ASSET_STATUS_ACTIVE,
    ASSET_STATUS_INACTIVE,
    ASSET_STATUS_RETIRED,
    ASSET_STATUS_DISPOSED,
  ];

  static final $core.Map<$core.int, AssetStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AssetStatus? valueOf($core.int value) => _byValue[value];

  const AssetStatus._(super.v, super.n);
}

class AssetProcessStatus extends $pb.ProtobufEnum {
  static const AssetProcessStatus ASSET_PROCESS_STATUS_UNSPECIFIED = AssetProcessStatus._(0, _omitEnumNames ? '' : 'ASSET_PROCESS_STATUS_UNSPECIFIED');
  static const AssetProcessStatus ASSET_PROCESS_STATUS_CREATED = AssetProcessStatus._(1, _omitEnumNames ? '' : 'ASSET_PROCESS_STATUS_CREATED');
  static const AssetProcessStatus ASSET_PROCESS_STATUS_PENDING = AssetProcessStatus._(2, _omitEnumNames ? '' : 'ASSET_PROCESS_STATUS_PENDING');
  static const AssetProcessStatus ASSET_PROCESS_STATUS_PROCESSING = AssetProcessStatus._(3, _omitEnumNames ? '' : 'ASSET_PROCESS_STATUS_PROCESSING');
  static const AssetProcessStatus ASSET_PROCESS_STATUS_COMPLETED = AssetProcessStatus._(4, _omitEnumNames ? '' : 'ASSET_PROCESS_STATUS_COMPLETED');
  static const AssetProcessStatus ASSET_PROCESS_STATUS_FAILED = AssetProcessStatus._(5, _omitEnumNames ? '' : 'ASSET_PROCESS_STATUS_FAILED');

  static const $core.List<AssetProcessStatus> values = <AssetProcessStatus> [
    ASSET_PROCESS_STATUS_UNSPECIFIED,
    ASSET_PROCESS_STATUS_CREATED,
    ASSET_PROCESS_STATUS_PENDING,
    ASSET_PROCESS_STATUS_PROCESSING,
    ASSET_PROCESS_STATUS_COMPLETED,
    ASSET_PROCESS_STATUS_FAILED,
  ];

  static final $core.Map<$core.int, AssetProcessStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AssetProcessStatus? valueOf($core.int value) => _byValue[value];

  const AssetProcessStatus._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
