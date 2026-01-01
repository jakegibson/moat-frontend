//
//  Generated code. Do not modify.
//  source: google/protobuf/timestamp.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Timestamp extends $pb.GeneratedMessage {
  factory Timestamp({
    $fixnum.Int64? seconds,
    $core.int? nanos,
  }) {
    final result = create();
    if (seconds != null) result.seconds = seconds;
    if (nanos != null) result.nanos = nanos;
    return result;
  }

  Timestamp._();

  factory Timestamp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);

  factory Timestamp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Timestamp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'google.protobuf'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seconds')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nanos',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Timestamp clone() => Timestamp()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Timestamp copyWith(void Function(Timestamp) updates) =>
      super.copyWith((message) => updates(message as Timestamp)) as Timestamp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Timestamp create() => Timestamp._();

  Timestamp createEmptyInstance() => create();

  static $pb.PbList<Timestamp> createRepeated() => $pb.PbList<Timestamp>();

  @$core.pragma('dart2js:noInline')
  static Timestamp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timestamp>(create);
  static Timestamp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get seconds => $_getI64(0);
  @$pb.TagNumber(1)
  set seconds($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeconds() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get nanos => $_getIZ(1);
  @$pb.TagNumber(2)
  set nanos($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNanos() => $_has(1);
  @$pb.TagNumber(2)
  void clearNanos() => clearField(2);

  /// Creates a Timestamp from a DateTime.
  factory Timestamp.fromDateTime($core.DateTime dateTime) {
    final utc = dateTime.toUtc();
    final seconds = $fixnum.Int64(utc.millisecondsSinceEpoch ~/ 1000);
    final nanos = (utc.microsecond * 1000) + (utc.millisecond % 1000 * 1000000);
    return Timestamp(seconds: seconds, nanos: nanos);
  }

  /// Converts this Timestamp to a DateTime.
  $core.DateTime toDateTime() {
    final millis = seconds.toInt() * 1000 + nanos ~/ 1000000;
    return $core.DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true);
  }
}
