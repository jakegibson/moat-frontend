//
//  Generated code. Do not modify.
//  source: moat/v1/admin.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PromptCategory extends $pb.ProtobufEnum {
  static const PromptCategory PROMPT_CATEGORY_UNSPECIFIED = PromptCategory._(0, _omitEnumNames ? '' : 'PROMPT_CATEGORY_UNSPECIFIED');
  static const PromptCategory PROMPT_CATEGORY_EXTRACTION = PromptCategory._(1, _omitEnumNames ? '' : 'PROMPT_CATEGORY_EXTRACTION');
  static const PromptCategory PROMPT_CATEGORY_ANALYSIS = PromptCategory._(2, _omitEnumNames ? '' : 'PROMPT_CATEGORY_ANALYSIS');
  static const PromptCategory PROMPT_CATEGORY_GENERATION = PromptCategory._(3, _omitEnumNames ? '' : 'PROMPT_CATEGORY_GENERATION');
  static const PromptCategory PROMPT_CATEGORY_CLASSIFICATION = PromptCategory._(4, _omitEnumNames ? '' : 'PROMPT_CATEGORY_CLASSIFICATION');

  static const $core.List<PromptCategory> values = <PromptCategory> [
    PROMPT_CATEGORY_UNSPECIFIED,
    PROMPT_CATEGORY_EXTRACTION,
    PROMPT_CATEGORY_ANALYSIS,
    PROMPT_CATEGORY_GENERATION,
    PROMPT_CATEGORY_CLASSIFICATION,
  ];

  static final $core.Map<$core.int, PromptCategory> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PromptCategory? valueOf($core.int value) => _byValue[value];

  const PromptCategory._(super.v, super.n);
}

class Environment extends $pb.ProtobufEnum {
  static const Environment ENVIRONMENT_UNSPECIFIED = Environment._(0, _omitEnumNames ? '' : 'ENVIRONMENT_UNSPECIFIED');
  static const Environment ENVIRONMENT_DEVELOPMENT = Environment._(1, _omitEnumNames ? '' : 'ENVIRONMENT_DEVELOPMENT');
  static const Environment ENVIRONMENT_STAGING = Environment._(2, _omitEnumNames ? '' : 'ENVIRONMENT_STAGING');
  static const Environment ENVIRONMENT_PRODUCTION = Environment._(3, _omitEnumNames ? '' : 'ENVIRONMENT_PRODUCTION');

  static const $core.List<Environment> values = <Environment> [
    ENVIRONMENT_UNSPECIFIED,
    ENVIRONMENT_DEVELOPMENT,
    ENVIRONMENT_STAGING,
    ENVIRONMENT_PRODUCTION,
  ];

  static final $core.Map<$core.int, Environment> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Environment? valueOf($core.int value) => _byValue[value];

  const Environment._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
