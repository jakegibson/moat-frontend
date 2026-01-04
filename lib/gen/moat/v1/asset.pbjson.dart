//
//  Generated code. Do not modify.
//  source: moat/v1/asset.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use assetStatusDescriptor instead')
const AssetStatus$json = {
  '1': 'AssetStatus',
  '2': [
    {'1': 'ASSET_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'ASSET_STATUS_DRAFT', '2': 1},
    {'1': 'ASSET_STATUS_ACTIVE', '2': 2},
    {'1': 'ASSET_STATUS_INACTIVE', '2': 3},
    {'1': 'ASSET_STATUS_RETIRED', '2': 4},
    {'1': 'ASSET_STATUS_DISPOSED', '2': 5},
  ],
};

/// Descriptor for `AssetStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assetStatusDescriptor = $convert.base64Decode(
    'CgtBc3NldFN0YXR1cxIcChhBU1NFVF9TVEFUVVNfVU5TUEVDSUZJRUQQABIWChJBU1NFVF9TVE'
    'FUVVNfRFJBRlQQARIXChNBU1NFVF9TVEFUVVNfQUNUSVZFEAISGQoVQVNTRVRfU1RBVFVTX0lO'
    'QUNUSVZFEAMSGAoUQVNTRVRfU1RBVFVTX1JFVElSRUQQBBIZChVBU1NFVF9TVEFUVVNfRElTUE'
    '9TRUQQBQ==');

@$core.Deprecated('Use assetProcessStatusDescriptor instead')
const AssetProcessStatus$json = {
  '1': 'AssetProcessStatus',
  '2': [
    {'1': 'ASSET_PROCESS_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'ASSET_PROCESS_STATUS_CREATED', '2': 1},
    {'1': 'ASSET_PROCESS_STATUS_PENDING', '2': 2},
    {'1': 'ASSET_PROCESS_STATUS_PROCESSING', '2': 3},
    {'1': 'ASSET_PROCESS_STATUS_COMPLETED', '2': 4},
    {'1': 'ASSET_PROCESS_STATUS_FAILED', '2': 5},
  ],
};

/// Descriptor for `AssetProcessStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assetProcessStatusDescriptor = $convert.base64Decode(
    'ChJBc3NldFByb2Nlc3NTdGF0dXMSJAogQVNTRVRfUFJPQ0VTU19TVEFUVVNfVU5TUEVDSUZJRU'
    'QQABIgChxBU1NFVF9QUk9DRVNTX1NUQVRVU19DUkVBVEVEEAESIAocQVNTRVRfUFJPQ0VTU19T'
    'VEFUVVNfUEVORElORxACEiMKH0FTU0VUX1BST0NFU1NfU1RBVFVTX1BST0NFU1NJTkcQAxIiCh'
    '5BU1NFVF9QUk9DRVNTX1NUQVRVU19DT01QTEVURUQQBBIfChtBU1NFVF9QUk9DRVNTX1NUQVRV'
    'U19GQUlMRUQQBQ==');

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'company_id', '3': 2, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'technical_name', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'technicalName', '17': true},
    {'1': 'notes', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
    {'1': 'division_of_construction', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'divisionOfConstruction', '17': true},
    {'1': 'internal_id', '3': 7, '4': 1, '5': 9, '9': 3, '10': 'internalId', '17': true},
    {'1': 'status', '3': 8, '4': 1, '5': 14, '6': '.moat.v1.AssetStatus', '10': 'status'},
    {'1': 'process_status', '3': 9, '4': 1, '5': 14, '6': '.moat.v1.AssetProcessStatus', '9': 4, '10': 'processStatus', '17': true},
    {'1': 'location_id', '3': 10, '4': 1, '5': 9, '9': 5, '10': 'locationId', '17': true},
    {'1': 'floor_location', '3': 11, '4': 1, '5': 9, '9': 6, '10': 'floorLocation', '17': true},
    {'1': 'service_area', '3': 12, '4': 1, '5': 9, '9': 7, '10': 'serviceArea', '17': true},
    {'1': 'provider', '3': 13, '4': 1, '5': 9, '9': 8, '10': 'provider', '17': true},
    {'1': 'manufacturer', '3': 14, '4': 1, '5': 9, '9': 9, '10': 'manufacturer', '17': true},
    {'1': 'serial_number', '3': 15, '4': 1, '5': 9, '9': 10, '10': 'serialNumber', '17': true},
    {'1': 'model_number', '3': 16, '4': 1, '5': 9, '9': 11, '10': 'modelNumber', '17': true},
    {'1': 'ai_serial_number', '3': 17, '4': 1, '5': 9, '9': 12, '10': 'aiSerialNumber', '17': true},
    {'1': 'ai_model_number', '3': 18, '4': 1, '5': 9, '9': 13, '10': 'aiModelNumber', '17': true},
    {'1': 'price_value', '3': 19, '4': 1, '5': 1, '9': 14, '10': 'priceValue', '17': true},
    {'1': 'purchase_price', '3': 20, '4': 1, '5': 1, '9': 15, '10': 'purchasePrice', '17': true},
    {'1': 'ai_price_value', '3': 21, '4': 1, '5': 1, '9': 16, '10': 'aiPriceValue', '17': true},
    {'1': 'start_date', '3': 22, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 17, '10': 'startDate', '17': true},
    {'1': 'substantial_completion_date', '3': 23, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 18, '10': 'substantialCompletionDate', '17': true},
    {'1': 'document_date', '3': 24, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 19, '10': 'documentDate', '17': true},
    {'1': 'due_date', '3': 25, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 20, '10': 'dueDate', '17': true},
    {'1': 'installation_date', '3': 26, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 21, '10': 'installationDate', '17': true},
    {'1': 'invoice_date', '3': 27, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 22, '10': 'invoiceDate', '17': true},
    {'1': 'purchase_date', '3': 28, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 23, '10': 'purchaseDate', '17': true},
    {'1': 'warranty_duration_months', '3': 29, '4': 1, '5': 5, '9': 24, '10': 'warrantyDurationMonths', '17': true},
    {'1': 'warranty_start_date', '3': 30, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 25, '10': 'warrantyStartDate', '17': true},
    {'1': 'warranty_end_date', '3': 31, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 26, '10': 'warrantyEndDate', '17': true},
    {'1': 'ai_warranty_start_date', '3': 32, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 27, '10': 'aiWarrantyStartDate', '17': true},
    {'1': 'ignore_warranty_start_date', '3': 33, '4': 1, '5': 8, '10': 'ignoreWarrantyStartDate'},
    {'1': 'all_coverages_resolved_and_expired', '3': 34, '4': 1, '5': 8, '9': 28, '10': 'allCoveragesResolvedAndExpired', '17': true},
    {'1': 'created_at', '3': 35, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 36, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '8': [
    {'1': '_technical_name'},
    {'1': '_notes'},
    {'1': '_division_of_construction'},
    {'1': '_internal_id'},
    {'1': '_process_status'},
    {'1': '_location_id'},
    {'1': '_floor_location'},
    {'1': '_service_area'},
    {'1': '_provider'},
    {'1': '_manufacturer'},
    {'1': '_serial_number'},
    {'1': '_model_number'},
    {'1': '_ai_serial_number'},
    {'1': '_ai_model_number'},
    {'1': '_price_value'},
    {'1': '_purchase_price'},
    {'1': '_ai_price_value'},
    {'1': '_start_date'},
    {'1': '_substantial_completion_date'},
    {'1': '_document_date'},
    {'1': '_due_date'},
    {'1': '_installation_date'},
    {'1': '_invoice_date'},
    {'1': '_purchase_date'},
    {'1': '_warranty_duration_months'},
    {'1': '_warranty_start_date'},
    {'1': '_warranty_end_date'},
    {'1': '_ai_warranty_start_date'},
    {'1': '_all_coverages_resolved_and_expired'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIOCgJpZBgBIAEoCVICaWQSHQoKY29tcGFueV9pZBgCIAEoCVIJY29tcGFueUlkEh'
    'IKBG5hbWUYAyABKAlSBG5hbWUSKgoOdGVjaG5pY2FsX25hbWUYBCABKAlIAFINdGVjaG5pY2Fs'
    'TmFtZYgBARIZCgVub3RlcxgFIAEoCUgBUgVub3Rlc4gBARI9ChhkaXZpc2lvbl9vZl9jb25zdH'
    'J1Y3Rpb24YBiABKAlIAlIWZGl2aXNpb25PZkNvbnN0cnVjdGlvbogBARIkCgtpbnRlcm5hbF9p'
    'ZBgHIAEoCUgDUgppbnRlcm5hbElkiAEBEiwKBnN0YXR1cxgIIAEoDjIULm1vYXQudjEuQXNzZX'
    'RTdGF0dXNSBnN0YXR1cxJHCg5wcm9jZXNzX3N0YXR1cxgJIAEoDjIbLm1vYXQudjEuQXNzZXRQ'
    'cm9jZXNzU3RhdHVzSARSDXByb2Nlc3NTdGF0dXOIAQESJAoLbG9jYXRpb25faWQYCiABKAlIBV'
    'IKbG9jYXRpb25JZIgBARIqCg5mbG9vcl9sb2NhdGlvbhgLIAEoCUgGUg1mbG9vckxvY2F0aW9u'
    'iAEBEiYKDHNlcnZpY2VfYXJlYRgMIAEoCUgHUgtzZXJ2aWNlQXJlYYgBARIfCghwcm92aWRlch'
    'gNIAEoCUgIUghwcm92aWRlcogBARInCgxtYW51ZmFjdHVyZXIYDiABKAlICVIMbWFudWZhY3R1'
    'cmVyiAEBEigKDXNlcmlhbF9udW1iZXIYDyABKAlIClIMc2VyaWFsTnVtYmVyiAEBEiYKDG1vZG'
    'VsX251bWJlchgQIAEoCUgLUgttb2RlbE51bWJlcogBARItChBhaV9zZXJpYWxfbnVtYmVyGBEg'
    'ASgJSAxSDmFpU2VyaWFsTnVtYmVyiAEBEisKD2FpX21vZGVsX251bWJlchgSIAEoCUgNUg1haU'
    '1vZGVsTnVtYmVyiAEBEiQKC3ByaWNlX3ZhbHVlGBMgASgBSA5SCnByaWNlVmFsdWWIAQESKgoO'
    'cHVyY2hhc2VfcHJpY2UYFCABKAFID1INcHVyY2hhc2VQcmljZYgBARIpCg5haV9wcmljZV92YW'
    'x1ZRgVIAEoAUgQUgxhaVByaWNlVmFsdWWIAQESPgoKc3RhcnRfZGF0ZRgWIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBIEVIJc3RhcnREYXRliAEBEl8KG3N1YnN0YW50aWFsX2NvbX'
    'BsZXRpb25fZGF0ZRgXIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIElIZc3Vic3Rh'
    'bnRpYWxDb21wbGV0aW9uRGF0ZYgBARJECg1kb2N1bWVudF9kYXRlGBggASgLMhouZ29vZ2xlLn'
    'Byb3RvYnVmLlRpbWVzdGFtcEgTUgxkb2N1bWVudERhdGWIAQESOgoIZHVlX2RhdGUYGSABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSBRSB2R1ZURhdGWIAQESTAoRaW5zdGFsbGF0aW'
    '9uX2RhdGUYGiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSBVSEGluc3RhbGxhdGlv'
    'bkRhdGWIAQESQgoMaW52b2ljZV9kYXRlGBsgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcEgWUgtpbnZvaWNlRGF0ZYgBARJECg1wdXJjaGFzZV9kYXRlGBwgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcEgXUgxwdXJjaGFzZURhdGWIAQESPQoYd2FycmFudHlfZHVyYXRpb2'
    '5fbW9udGhzGB0gASgFSBhSFndhcnJhbnR5RHVyYXRpb25Nb250aHOIAQESTwoTd2FycmFudHlf'
    'c3RhcnRfZGF0ZRgeIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIGVIRd2FycmFudH'
    'lTdGFydERhdGWIAQESSwoRd2FycmFudHlfZW5kX2RhdGUYHyABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wSBpSD3dhcnJhbnR5RW5kRGF0ZYgBARJUChZhaV93YXJyYW50eV9zdGFydF'
    '9kYXRlGCAgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgbUhNhaVdhcnJhbnR5U3Rh'
    'cnREYXRliAEBEjsKGmlnbm9yZV93YXJyYW50eV9zdGFydF9kYXRlGCEgASgIUhdpZ25vcmVXYX'
    'JyYW50eVN0YXJ0RGF0ZRJPCiJhbGxfY292ZXJhZ2VzX3Jlc29sdmVkX2FuZF9leHBpcmVkGCIg'
    'ASgISBxSHmFsbENvdmVyYWdlc1Jlc29sdmVkQW5kRXhwaXJlZIgBARI5CgpjcmVhdGVkX2F0GC'
    'MgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRf'
    'YXQYJCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXRCEQoPX3RlY2'
    'huaWNhbF9uYW1lQggKBl9ub3Rlc0IbChlfZGl2aXNpb25fb2ZfY29uc3RydWN0aW9uQg4KDF9p'
    'bnRlcm5hbF9pZEIRCg9fcHJvY2Vzc19zdGF0dXNCDgoMX2xvY2F0aW9uX2lkQhEKD19mbG9vcl'
    '9sb2NhdGlvbkIPCg1fc2VydmljZV9hcmVhQgsKCV9wcm92aWRlckIPCg1fbWFudWZhY3R1cmVy'
    'QhAKDl9zZXJpYWxfbnVtYmVyQg8KDV9tb2RlbF9udW1iZXJCEwoRX2FpX3NlcmlhbF9udW1iZX'
    'JCEgoQX2FpX21vZGVsX251bWJlckIOCgxfcHJpY2VfdmFsdWVCEQoPX3B1cmNoYXNlX3ByaWNl'
    'QhEKD19haV9wcmljZV92YWx1ZUINCgtfc3RhcnRfZGF0ZUIeChxfc3Vic3RhbnRpYWxfY29tcG'
    'xldGlvbl9kYXRlQhAKDl9kb2N1bWVudF9kYXRlQgsKCV9kdWVfZGF0ZUIUChJfaW5zdGFsbGF0'
    'aW9uX2RhdGVCDwoNX2ludm9pY2VfZGF0ZUIQCg5fcHVyY2hhc2VfZGF0ZUIbChlfd2FycmFudH'
    'lfZHVyYXRpb25fbW9udGhzQhYKFF93YXJyYW50eV9zdGFydF9kYXRlQhQKEl93YXJyYW50eV9l'
    'bmRfZGF0ZUIZChdfYWlfd2FycmFudHlfc3RhcnRfZGF0ZUIlCiNfYWxsX2NvdmVyYWdlc19yZX'
    'NvbHZlZF9hbmRfZXhwaXJlZA==');

@$core.Deprecated('Use assetWithDetailsDescriptor instead')
const AssetWithDetails$json = {
  '1': 'AssetWithDetails',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'company_id', '3': 2, '4': 1, '5': 9, '10': 'companyId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'technical_name', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'technicalName', '17': true},
    {'1': 'notes', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
    {'1': 'division_of_construction', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'divisionOfConstruction', '17': true},
    {'1': 'internal_id', '3': 7, '4': 1, '5': 9, '9': 3, '10': 'internalId', '17': true},
    {'1': 'status', '3': 8, '4': 1, '5': 14, '6': '.moat.v1.AssetStatus', '10': 'status'},
    {'1': 'process_status', '3': 9, '4': 1, '5': 14, '6': '.moat.v1.AssetProcessStatus', '9': 4, '10': 'processStatus', '17': true},
    {'1': 'location_id', '3': 10, '4': 1, '5': 9, '9': 5, '10': 'locationId', '17': true},
    {'1': 'location_name', '3': 11, '4': 1, '5': 9, '9': 6, '10': 'locationName', '17': true},
    {'1': 'floor_location', '3': 12, '4': 1, '5': 9, '9': 7, '10': 'floorLocation', '17': true},
    {'1': 'service_area', '3': 13, '4': 1, '5': 9, '9': 8, '10': 'serviceArea', '17': true},
    {'1': 'provider', '3': 14, '4': 1, '5': 9, '9': 9, '10': 'provider', '17': true},
    {'1': 'manufacturer', '3': 15, '4': 1, '5': 9, '9': 10, '10': 'manufacturer', '17': true},
    {'1': 'serial_number', '3': 16, '4': 1, '5': 9, '9': 11, '10': 'serialNumber', '17': true},
    {'1': 'model_number', '3': 17, '4': 1, '5': 9, '9': 12, '10': 'modelNumber', '17': true},
    {'1': 'ai_serial_number', '3': 18, '4': 1, '5': 9, '9': 13, '10': 'aiSerialNumber', '17': true},
    {'1': 'ai_model_number', '3': 19, '4': 1, '5': 9, '9': 14, '10': 'aiModelNumber', '17': true},
    {'1': 'price_value', '3': 20, '4': 1, '5': 1, '9': 15, '10': 'priceValue', '17': true},
    {'1': 'purchase_price', '3': 21, '4': 1, '5': 1, '9': 16, '10': 'purchasePrice', '17': true},
    {'1': 'ai_price_value', '3': 22, '4': 1, '5': 1, '9': 17, '10': 'aiPriceValue', '17': true},
    {'1': 'start_date', '3': 23, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 18, '10': 'startDate', '17': true},
    {'1': 'substantial_completion_date', '3': 24, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 19, '10': 'substantialCompletionDate', '17': true},
    {'1': 'document_date', '3': 25, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 20, '10': 'documentDate', '17': true},
    {'1': 'due_date', '3': 26, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 21, '10': 'dueDate', '17': true},
    {'1': 'installation_date', '3': 27, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 22, '10': 'installationDate', '17': true},
    {'1': 'invoice_date', '3': 28, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 23, '10': 'invoiceDate', '17': true},
    {'1': 'purchase_date', '3': 29, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 24, '10': 'purchaseDate', '17': true},
    {'1': 'warranty_duration_months', '3': 30, '4': 1, '5': 5, '9': 25, '10': 'warrantyDurationMonths', '17': true},
    {'1': 'warranty_start_date', '3': 31, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 26, '10': 'warrantyStartDate', '17': true},
    {'1': 'warranty_end_date', '3': 32, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 27, '10': 'warrantyEndDate', '17': true},
    {'1': 'ai_warranty_start_date', '3': 33, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 28, '10': 'aiWarrantyStartDate', '17': true},
    {'1': 'ignore_warranty_start_date', '3': 34, '4': 1, '5': 8, '10': 'ignoreWarrantyStartDate'},
    {'1': 'all_coverages_resolved_and_expired', '3': 35, '4': 1, '5': 8, '9': 29, '10': 'allCoveragesResolvedAndExpired', '17': true},
    {'1': 'created_at', '3': 36, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 37, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'file_count', '3': 38, '4': 1, '5': 5, '10': 'fileCount'},
    {'1': 'message_count', '3': 39, '4': 1, '5': 5, '10': 'messageCount'},
    {'1': 'warranty_coverage_count', '3': 40, '4': 1, '5': 5, '10': 'warrantyCoverageCount'},
    {'1': 'value_estimate_count', '3': 41, '4': 1, '5': 5, '10': 'valueEstimateCount'},
  ],
  '8': [
    {'1': '_technical_name'},
    {'1': '_notes'},
    {'1': '_division_of_construction'},
    {'1': '_internal_id'},
    {'1': '_process_status'},
    {'1': '_location_id'},
    {'1': '_location_name'},
    {'1': '_floor_location'},
    {'1': '_service_area'},
    {'1': '_provider'},
    {'1': '_manufacturer'},
    {'1': '_serial_number'},
    {'1': '_model_number'},
    {'1': '_ai_serial_number'},
    {'1': '_ai_model_number'},
    {'1': '_price_value'},
    {'1': '_purchase_price'},
    {'1': '_ai_price_value'},
    {'1': '_start_date'},
    {'1': '_substantial_completion_date'},
    {'1': '_document_date'},
    {'1': '_due_date'},
    {'1': '_installation_date'},
    {'1': '_invoice_date'},
    {'1': '_purchase_date'},
    {'1': '_warranty_duration_months'},
    {'1': '_warranty_start_date'},
    {'1': '_warranty_end_date'},
    {'1': '_ai_warranty_start_date'},
    {'1': '_all_coverages_resolved_and_expired'},
  ],
};

/// Descriptor for `AssetWithDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetWithDetailsDescriptor = $convert.base64Decode(
    'ChBBc3NldFdpdGhEZXRhaWxzEg4KAmlkGAEgASgJUgJpZBIdCgpjb21wYW55X2lkGAIgASgJUg'
    'ljb21wYW55SWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIqCg50ZWNobmljYWxfbmFtZRgEIAEoCUgA'
    'Ug10ZWNobmljYWxOYW1liAEBEhkKBW5vdGVzGAUgASgJSAFSBW5vdGVziAEBEj0KGGRpdmlzaW'
    '9uX29mX2NvbnN0cnVjdGlvbhgGIAEoCUgCUhZkaXZpc2lvbk9mQ29uc3RydWN0aW9uiAEBEiQK'
    'C2ludGVybmFsX2lkGAcgASgJSANSCmludGVybmFsSWSIAQESLAoGc3RhdHVzGAggASgOMhQubW'
    '9hdC52MS5Bc3NldFN0YXR1c1IGc3RhdHVzEkcKDnByb2Nlc3Nfc3RhdHVzGAkgASgOMhsubW9h'
    'dC52MS5Bc3NldFByb2Nlc3NTdGF0dXNIBFINcHJvY2Vzc1N0YXR1c4gBARIkCgtsb2NhdGlvbl'
    '9pZBgKIAEoCUgFUgpsb2NhdGlvbklkiAEBEigKDWxvY2F0aW9uX25hbWUYCyABKAlIBlIMbG9j'
    'YXRpb25OYW1liAEBEioKDmZsb29yX2xvY2F0aW9uGAwgASgJSAdSDWZsb29yTG9jYXRpb26IAQ'
    'ESJgoMc2VydmljZV9hcmVhGA0gASgJSAhSC3NlcnZpY2VBcmVhiAEBEh8KCHByb3ZpZGVyGA4g'
    'ASgJSAlSCHByb3ZpZGVyiAEBEicKDG1hbnVmYWN0dXJlchgPIAEoCUgKUgxtYW51ZmFjdHVyZX'
    'KIAQESKAoNc2VyaWFsX251bWJlchgQIAEoCUgLUgxzZXJpYWxOdW1iZXKIAQESJgoMbW9kZWxf'
    'bnVtYmVyGBEgASgJSAxSC21vZGVsTnVtYmVyiAEBEi0KEGFpX3NlcmlhbF9udW1iZXIYEiABKA'
    'lIDVIOYWlTZXJpYWxOdW1iZXKIAQESKwoPYWlfbW9kZWxfbnVtYmVyGBMgASgJSA5SDWFpTW9k'
    'ZWxOdW1iZXKIAQESJAoLcHJpY2VfdmFsdWUYFCABKAFID1IKcHJpY2VWYWx1ZYgBARIqCg5wdX'
    'JjaGFzZV9wcmljZRgVIAEoAUgQUg1wdXJjaGFzZVByaWNliAEBEikKDmFpX3ByaWNlX3ZhbHVl'
    'GBYgASgBSBFSDGFpUHJpY2VWYWx1ZYgBARI+CgpzdGFydF9kYXRlGBcgASgLMhouZ29vZ2xlLn'
    'Byb3RvYnVmLlRpbWVzdGFtcEgSUglzdGFydERhdGWIAQESXwobc3Vic3RhbnRpYWxfY29tcGxl'
    'dGlvbl9kYXRlGBggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgTUhlzdWJzdGFudG'
    'lhbENvbXBsZXRpb25EYXRliAEBEkQKDWRvY3VtZW50X2RhdGUYGSABKAsyGi5nb29nbGUucHJv'
    'dG9idWYuVGltZXN0YW1wSBRSDGRvY3VtZW50RGF0ZYgBARI6CghkdWVfZGF0ZRgaIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIFVIHZHVlRGF0ZYgBARJMChFpbnN0YWxsYXRpb25f'
    'ZGF0ZRgbIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIFlIQaW5zdGFsbGF0aW9uRG'
    'F0ZYgBARJCCgxpbnZvaWNlX2RhdGUYHCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1w'
    'SBdSC2ludm9pY2VEYXRliAEBEkQKDXB1cmNoYXNlX2RhdGUYHSABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wSBhSDHB1cmNoYXNlRGF0ZYgBARI9Chh3YXJyYW50eV9kdXJhdGlvbl9t'
    'b250aHMYHiABKAVIGVIWd2FycmFudHlEdXJhdGlvbk1vbnRoc4gBARJPChN3YXJyYW50eV9zdG'
    'FydF9kYXRlGB8gASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgaUhF3YXJyYW50eVN0'
    'YXJ0RGF0ZYgBARJLChF3YXJyYW50eV9lbmRfZGF0ZRggIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBIG1IPd2FycmFudHlFbmREYXRliAEBElQKFmFpX3dhcnJhbnR5X3N0YXJ0X2Rh'
    'dGUYISABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSBxSE2FpV2FycmFudHlTdGFydE'
    'RhdGWIAQESOwoaaWdub3JlX3dhcnJhbnR5X3N0YXJ0X2RhdGUYIiABKAhSF2lnbm9yZVdhcnJh'
    'bnR5U3RhcnREYXRlEk8KImFsbF9jb3ZlcmFnZXNfcmVzb2x2ZWRfYW5kX2V4cGlyZWQYIyABKA'
    'hIHVIeYWxsQ292ZXJhZ2VzUmVzb2x2ZWRBbmRFeHBpcmVkiAEBEjkKCmNyZWF0ZWRfYXQYJCAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdB'
    'glIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIdCgpmaWxlX2Nv'
    'dW50GCYgASgFUglmaWxlQ291bnQSIwoNbWVzc2FnZV9jb3VudBgnIAEoBVIMbWVzc2FnZUNvdW'
    '50EjYKF3dhcnJhbnR5X2NvdmVyYWdlX2NvdW50GCggASgFUhV3YXJyYW50eUNvdmVyYWdlQ291'
    'bnQSMAoUdmFsdWVfZXN0aW1hdGVfY291bnQYKSABKAVSEnZhbHVlRXN0aW1hdGVDb3VudEIRCg'
    '9fdGVjaG5pY2FsX25hbWVCCAoGX25vdGVzQhsKGV9kaXZpc2lvbl9vZl9jb25zdHJ1Y3Rpb25C'
    'DgoMX2ludGVybmFsX2lkQhEKD19wcm9jZXNzX3N0YXR1c0IOCgxfbG9jYXRpb25faWRCEAoOX2'
    'xvY2F0aW9uX25hbWVCEQoPX2Zsb29yX2xvY2F0aW9uQg8KDV9zZXJ2aWNlX2FyZWFCCwoJX3By'
    'b3ZpZGVyQg8KDV9tYW51ZmFjdHVyZXJCEAoOX3NlcmlhbF9udW1iZXJCDwoNX21vZGVsX251bW'
    'JlckITChFfYWlfc2VyaWFsX251bWJlckISChBfYWlfbW9kZWxfbnVtYmVyQg4KDF9wcmljZV92'
    'YWx1ZUIRCg9fcHVyY2hhc2VfcHJpY2VCEQoPX2FpX3ByaWNlX3ZhbHVlQg0KC19zdGFydF9kYX'
    'RlQh4KHF9zdWJzdGFudGlhbF9jb21wbGV0aW9uX2RhdGVCEAoOX2RvY3VtZW50X2RhdGVCCwoJ'
    'X2R1ZV9kYXRlQhQKEl9pbnN0YWxsYXRpb25fZGF0ZUIPCg1faW52b2ljZV9kYXRlQhAKDl9wdX'
    'JjaGFzZV9kYXRlQhsKGV93YXJyYW50eV9kdXJhdGlvbl9tb250aHNCFgoUX3dhcnJhbnR5X3N0'
    'YXJ0X2RhdGVCFAoSX3dhcnJhbnR5X2VuZF9kYXRlQhkKF19haV93YXJyYW50eV9zdGFydF9kYX'
    'RlQiUKI19hbGxfY292ZXJhZ2VzX3Jlc29sdmVkX2FuZF9leHBpcmVk');

@$core.Deprecated('Use createAssetRequestDescriptor instead')
const CreateAssetRequest$json = {
  '1': 'CreateAssetRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'technical_name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'technicalName', '17': true},
    {'1': 'notes', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
    {'1': 'division_of_construction', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'divisionOfConstruction', '17': true},
    {'1': 'internal_id', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'internalId', '17': true},
    {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.moat.v1.AssetStatus', '10': 'status'},
    {'1': 'location_id', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'locationId', '17': true},
    {'1': 'floor_location', '3': 8, '4': 1, '5': 9, '9': 5, '10': 'floorLocation', '17': true},
    {'1': 'service_area', '3': 9, '4': 1, '5': 9, '9': 6, '10': 'serviceArea', '17': true},
    {'1': 'provider', '3': 10, '4': 1, '5': 9, '9': 7, '10': 'provider', '17': true},
    {'1': 'manufacturer', '3': 11, '4': 1, '5': 9, '9': 8, '10': 'manufacturer', '17': true},
    {'1': 'serial_number', '3': 12, '4': 1, '5': 9, '9': 9, '10': 'serialNumber', '17': true},
    {'1': 'model_number', '3': 13, '4': 1, '5': 9, '9': 10, '10': 'modelNumber', '17': true},
    {'1': 'price_value', '3': 14, '4': 1, '5': 1, '9': 11, '10': 'priceValue', '17': true},
    {'1': 'purchase_price', '3': 15, '4': 1, '5': 1, '9': 12, '10': 'purchasePrice', '17': true},
    {'1': 'start_date', '3': 16, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 13, '10': 'startDate', '17': true},
    {'1': 'substantial_completion_date', '3': 17, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 14, '10': 'substantialCompletionDate', '17': true},
    {'1': 'document_date', '3': 18, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 15, '10': 'documentDate', '17': true},
    {'1': 'due_date', '3': 19, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 16, '10': 'dueDate', '17': true},
    {'1': 'installation_date', '3': 20, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 17, '10': 'installationDate', '17': true},
    {'1': 'invoice_date', '3': 21, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 18, '10': 'invoiceDate', '17': true},
    {'1': 'purchase_date', '3': 22, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 19, '10': 'purchaseDate', '17': true},
    {'1': 'warranty_duration_months', '3': 23, '4': 1, '5': 5, '9': 20, '10': 'warrantyDurationMonths', '17': true},
    {'1': 'warranty_start_date', '3': 24, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 21, '10': 'warrantyStartDate', '17': true},
    {'1': 'warranty_end_date', '3': 25, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 22, '10': 'warrantyEndDate', '17': true},
    {'1': 'ignore_warranty_start_date', '3': 26, '4': 1, '5': 8, '10': 'ignoreWarrantyStartDate'},
  ],
  '8': [
    {'1': '_technical_name'},
    {'1': '_notes'},
    {'1': '_division_of_construction'},
    {'1': '_internal_id'},
    {'1': '_location_id'},
    {'1': '_floor_location'},
    {'1': '_service_area'},
    {'1': '_provider'},
    {'1': '_manufacturer'},
    {'1': '_serial_number'},
    {'1': '_model_number'},
    {'1': '_price_value'},
    {'1': '_purchase_price'},
    {'1': '_start_date'},
    {'1': '_substantial_completion_date'},
    {'1': '_document_date'},
    {'1': '_due_date'},
    {'1': '_installation_date'},
    {'1': '_invoice_date'},
    {'1': '_purchase_date'},
    {'1': '_warranty_duration_months'},
    {'1': '_warranty_start_date'},
    {'1': '_warranty_end_date'},
  ],
};

/// Descriptor for `CreateAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAssetRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVBc3NldFJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIqCg50ZWNobmljYWxfbm'
    'FtZRgCIAEoCUgAUg10ZWNobmljYWxOYW1liAEBEhkKBW5vdGVzGAMgASgJSAFSBW5vdGVziAEB'
    'Ej0KGGRpdmlzaW9uX29mX2NvbnN0cnVjdGlvbhgEIAEoCUgCUhZkaXZpc2lvbk9mQ29uc3RydW'
    'N0aW9uiAEBEiQKC2ludGVybmFsX2lkGAUgASgJSANSCmludGVybmFsSWSIAQESLAoGc3RhdHVz'
    'GAYgASgOMhQubW9hdC52MS5Bc3NldFN0YXR1c1IGc3RhdHVzEiQKC2xvY2F0aW9uX2lkGAcgAS'
    'gJSARSCmxvY2F0aW9uSWSIAQESKgoOZmxvb3JfbG9jYXRpb24YCCABKAlIBVINZmxvb3JMb2Nh'
    'dGlvbogBARImCgxzZXJ2aWNlX2FyZWEYCSABKAlIBlILc2VydmljZUFyZWGIAQESHwoIcHJvdm'
    'lkZXIYCiABKAlIB1IIcHJvdmlkZXKIAQESJwoMbWFudWZhY3R1cmVyGAsgASgJSAhSDG1hbnVm'
    'YWN0dXJlcogBARIoCg1zZXJpYWxfbnVtYmVyGAwgASgJSAlSDHNlcmlhbE51bWJlcogBARImCg'
    'xtb2RlbF9udW1iZXIYDSABKAlIClILbW9kZWxOdW1iZXKIAQESJAoLcHJpY2VfdmFsdWUYDiAB'
    'KAFIC1IKcHJpY2VWYWx1ZYgBARIqCg5wdXJjaGFzZV9wcmljZRgPIAEoAUgMUg1wdXJjaGFzZV'
    'ByaWNliAEBEj4KCnN0YXJ0X2RhdGUYECABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1w'
    'SA1SCXN0YXJ0RGF0ZYgBARJfChtzdWJzdGFudGlhbF9jb21wbGV0aW9uX2RhdGUYESABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSA5SGXN1YnN0YW50aWFsQ29tcGxldGlvbkRhdGWI'
    'AQESRAoNZG9jdW1lbnRfZGF0ZRgSIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBID1'
    'IMZG9jdW1lbnREYXRliAEBEjoKCGR1ZV9kYXRlGBMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcEgQUgdkdWVEYXRliAEBEkwKEWluc3RhbGxhdGlvbl9kYXRlGBQgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcEgRUhBpbnN0YWxsYXRpb25EYXRliAEBEkIKDGludm9pY2Vf'
    'ZGF0ZRgVIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIElILaW52b2ljZURhdGWIAQ'
    'ESRAoNcHVyY2hhc2VfZGF0ZRgWIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIE1IM'
    'cHVyY2hhc2VEYXRliAEBEj0KGHdhcnJhbnR5X2R1cmF0aW9uX21vbnRocxgXIAEoBUgUUhZ3YX'
    'JyYW50eUR1cmF0aW9uTW9udGhziAEBEk8KE3dhcnJhbnR5X3N0YXJ0X2RhdGUYGCABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wSBVSEXdhcnJhbnR5U3RhcnREYXRliAEBEksKEXdhcn'
    'JhbnR5X2VuZF9kYXRlGBkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgWUg93YXJy'
    'YW50eUVuZERhdGWIAQESOwoaaWdub3JlX3dhcnJhbnR5X3N0YXJ0X2RhdGUYGiABKAhSF2lnbm'
    '9yZVdhcnJhbnR5U3RhcnREYXRlQhEKD190ZWNobmljYWxfbmFtZUIICgZfbm90ZXNCGwoZX2Rp'
    'dmlzaW9uX29mX2NvbnN0cnVjdGlvbkIOCgxfaW50ZXJuYWxfaWRCDgoMX2xvY2F0aW9uX2lkQh'
    'EKD19mbG9vcl9sb2NhdGlvbkIPCg1fc2VydmljZV9hcmVhQgsKCV9wcm92aWRlckIPCg1fbWFu'
    'dWZhY3R1cmVyQhAKDl9zZXJpYWxfbnVtYmVyQg8KDV9tb2RlbF9udW1iZXJCDgoMX3ByaWNlX3'
    'ZhbHVlQhEKD19wdXJjaGFzZV9wcmljZUINCgtfc3RhcnRfZGF0ZUIeChxfc3Vic3RhbnRpYWxf'
    'Y29tcGxldGlvbl9kYXRlQhAKDl9kb2N1bWVudF9kYXRlQgsKCV9kdWVfZGF0ZUIUChJfaW5zdG'
    'FsbGF0aW9uX2RhdGVCDwoNX2ludm9pY2VfZGF0ZUIQCg5fcHVyY2hhc2VfZGF0ZUIbChlfd2Fy'
    'cmFudHlfZHVyYXRpb25fbW9udGhzQhYKFF93YXJyYW50eV9zdGFydF9kYXRlQhQKEl93YXJyYW'
    '50eV9lbmRfZGF0ZQ==');

@$core.Deprecated('Use getAssetRequestDescriptor instead')
const GetAssetRequest$json = {
  '1': 'GetAssetRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRBc3NldFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use updateAssetRequestDescriptor instead')
const UpdateAssetRequest$json = {
  '1': 'UpdateAssetRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'technical_name', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'technicalName', '17': true},
    {'1': 'notes', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'notes', '17': true},
    {'1': 'division_of_construction', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'divisionOfConstruction', '17': true},
    {'1': 'internal_id', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'internalId', '17': true},
    {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.moat.v1.AssetStatus', '9': 5, '10': 'status', '17': true},
    {'1': 'location_id', '3': 8, '4': 1, '5': 9, '9': 6, '10': 'locationId', '17': true},
    {'1': 'floor_location', '3': 9, '4': 1, '5': 9, '9': 7, '10': 'floorLocation', '17': true},
    {'1': 'service_area', '3': 10, '4': 1, '5': 9, '9': 8, '10': 'serviceArea', '17': true},
    {'1': 'provider', '3': 11, '4': 1, '5': 9, '9': 9, '10': 'provider', '17': true},
    {'1': 'manufacturer', '3': 12, '4': 1, '5': 9, '9': 10, '10': 'manufacturer', '17': true},
    {'1': 'serial_number', '3': 13, '4': 1, '5': 9, '9': 11, '10': 'serialNumber', '17': true},
    {'1': 'model_number', '3': 14, '4': 1, '5': 9, '9': 12, '10': 'modelNumber', '17': true},
    {'1': 'price_value', '3': 15, '4': 1, '5': 1, '9': 13, '10': 'priceValue', '17': true},
    {'1': 'purchase_price', '3': 16, '4': 1, '5': 1, '9': 14, '10': 'purchasePrice', '17': true},
    {'1': 'start_date', '3': 17, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 15, '10': 'startDate', '17': true},
    {'1': 'substantial_completion_date', '3': 18, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 16, '10': 'substantialCompletionDate', '17': true},
    {'1': 'document_date', '3': 19, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 17, '10': 'documentDate', '17': true},
    {'1': 'due_date', '3': 20, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 18, '10': 'dueDate', '17': true},
    {'1': 'installation_date', '3': 21, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 19, '10': 'installationDate', '17': true},
    {'1': 'invoice_date', '3': 22, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 20, '10': 'invoiceDate', '17': true},
    {'1': 'purchase_date', '3': 23, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 21, '10': 'purchaseDate', '17': true},
    {'1': 'warranty_duration_months', '3': 24, '4': 1, '5': 5, '9': 22, '10': 'warrantyDurationMonths', '17': true},
    {'1': 'warranty_start_date', '3': 25, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 23, '10': 'warrantyStartDate', '17': true},
    {'1': 'warranty_end_date', '3': 26, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 24, '10': 'warrantyEndDate', '17': true},
    {'1': 'ignore_warranty_start_date', '3': 27, '4': 1, '5': 8, '9': 25, '10': 'ignoreWarrantyStartDate', '17': true},
  ],
  '8': [
    {'1': '_name'},
    {'1': '_technical_name'},
    {'1': '_notes'},
    {'1': '_division_of_construction'},
    {'1': '_internal_id'},
    {'1': '_status'},
    {'1': '_location_id'},
    {'1': '_floor_location'},
    {'1': '_service_area'},
    {'1': '_provider'},
    {'1': '_manufacturer'},
    {'1': '_serial_number'},
    {'1': '_model_number'},
    {'1': '_price_value'},
    {'1': '_purchase_price'},
    {'1': '_start_date'},
    {'1': '_substantial_completion_date'},
    {'1': '_document_date'},
    {'1': '_due_date'},
    {'1': '_installation_date'},
    {'1': '_invoice_date'},
    {'1': '_purchase_date'},
    {'1': '_warranty_duration_months'},
    {'1': '_warranty_start_date'},
    {'1': '_warranty_end_date'},
    {'1': '_ignore_warranty_start_date'},
  ],
};

/// Descriptor for `UpdateAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetRequestDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVBc3NldFJlcXVlc3QSDgoCaWQYASABKAlSAmlkEhcKBG5hbWUYAiABKAlIAFIEbm'
    'FtZYgBARIqCg50ZWNobmljYWxfbmFtZRgDIAEoCUgBUg10ZWNobmljYWxOYW1liAEBEhkKBW5v'
    'dGVzGAQgASgJSAJSBW5vdGVziAEBEj0KGGRpdmlzaW9uX29mX2NvbnN0cnVjdGlvbhgFIAEoCU'
    'gDUhZkaXZpc2lvbk9mQ29uc3RydWN0aW9uiAEBEiQKC2ludGVybmFsX2lkGAYgASgJSARSCmlu'
    'dGVybmFsSWSIAQESMQoGc3RhdHVzGAcgASgOMhQubW9hdC52MS5Bc3NldFN0YXR1c0gFUgZzdG'
    'F0dXOIAQESJAoLbG9jYXRpb25faWQYCCABKAlIBlIKbG9jYXRpb25JZIgBARIqCg5mbG9vcl9s'
    'b2NhdGlvbhgJIAEoCUgHUg1mbG9vckxvY2F0aW9uiAEBEiYKDHNlcnZpY2VfYXJlYRgKIAEoCU'
    'gIUgtzZXJ2aWNlQXJlYYgBARIfCghwcm92aWRlchgLIAEoCUgJUghwcm92aWRlcogBARInCgxt'
    'YW51ZmFjdHVyZXIYDCABKAlIClIMbWFudWZhY3R1cmVyiAEBEigKDXNlcmlhbF9udW1iZXIYDS'
    'ABKAlIC1IMc2VyaWFsTnVtYmVyiAEBEiYKDG1vZGVsX251bWJlchgOIAEoCUgMUgttb2RlbE51'
    'bWJlcogBARIkCgtwcmljZV92YWx1ZRgPIAEoAUgNUgpwcmljZVZhbHVliAEBEioKDnB1cmNoYX'
    'NlX3ByaWNlGBAgASgBSA5SDXB1cmNoYXNlUHJpY2WIAQESPgoKc3RhcnRfZGF0ZRgRIAEoCzIa'
    'Lmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBID1IJc3RhcnREYXRliAEBEl8KG3N1YnN0YW50aW'
    'FsX2NvbXBsZXRpb25fZGF0ZRgSIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIEFIZ'
    'c3Vic3RhbnRpYWxDb21wbGV0aW9uRGF0ZYgBARJECg1kb2N1bWVudF9kYXRlGBMgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgRUgxkb2N1bWVudERhdGWIAQESOgoIZHVlX2RhdGUY'
    'FCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSBJSB2R1ZURhdGWIAQESTAoRaW5zdG'
    'FsbGF0aW9uX2RhdGUYFSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSBNSEGluc3Rh'
    'bGxhdGlvbkRhdGWIAQESQgoMaW52b2ljZV9kYXRlGBYgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcEgUUgtpbnZvaWNlRGF0ZYgBARJECg1wdXJjaGFzZV9kYXRlGBcgASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcEgVUgxwdXJjaGFzZURhdGWIAQESPQoYd2FycmFudHlfZH'
    'VyYXRpb25fbW9udGhzGBggASgFSBZSFndhcnJhbnR5RHVyYXRpb25Nb250aHOIAQESTwoTd2Fy'
    'cmFudHlfc3RhcnRfZGF0ZRgZIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIF1IRd2'
    'FycmFudHlTdGFydERhdGWIAQESSwoRd2FycmFudHlfZW5kX2RhdGUYGiABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wSBhSD3dhcnJhbnR5RW5kRGF0ZYgBARJAChppZ25vcmVfd2Fycm'
    'FudHlfc3RhcnRfZGF0ZRgbIAEoCEgZUhdpZ25vcmVXYXJyYW50eVN0YXJ0RGF0ZYgBAUIHCgVf'
    'bmFtZUIRCg9fdGVjaG5pY2FsX25hbWVCCAoGX25vdGVzQhsKGV9kaXZpc2lvbl9vZl9jb25zdH'
    'J1Y3Rpb25CDgoMX2ludGVybmFsX2lkQgkKB19zdGF0dXNCDgoMX2xvY2F0aW9uX2lkQhEKD19m'
    'bG9vcl9sb2NhdGlvbkIPCg1fc2VydmljZV9hcmVhQgsKCV9wcm92aWRlckIPCg1fbWFudWZhY3'
    'R1cmVyQhAKDl9zZXJpYWxfbnVtYmVyQg8KDV9tb2RlbF9udW1iZXJCDgoMX3ByaWNlX3ZhbHVl'
    'QhEKD19wdXJjaGFzZV9wcmljZUINCgtfc3RhcnRfZGF0ZUIeChxfc3Vic3RhbnRpYWxfY29tcG'
    'xldGlvbl9kYXRlQhAKDl9kb2N1bWVudF9kYXRlQgsKCV9kdWVfZGF0ZUIUChJfaW5zdGFsbGF0'
    'aW9uX2RhdGVCDwoNX2ludm9pY2VfZGF0ZUIQCg5fcHVyY2hhc2VfZGF0ZUIbChlfd2FycmFudH'
    'lfZHVyYXRpb25fbW9udGhzQhYKFF93YXJyYW50eV9zdGFydF9kYXRlQhQKEl93YXJyYW50eV9l'
    'bmRfZGF0ZUIdChtfaWdub3JlX3dhcnJhbnR5X3N0YXJ0X2RhdGU=');

@$core.Deprecated('Use deleteAssetRequestDescriptor instead')
const DeleteAssetRequest$json = {
  '1': 'DeleteAssetRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAssetRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVBc3NldFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use deleteAssetResponseDescriptor instead')
const DeleteAssetResponse$json = {
  '1': 'DeleteAssetResponse',
};

/// Descriptor for `DeleteAssetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAssetResponseDescriptor = $convert.base64Decode(
    'ChNEZWxldGVBc3NldFJlc3BvbnNl');

@$core.Deprecated('Use listAssetsRequestDescriptor instead')
const ListAssetsRequest$json = {
  '1': 'ListAssetsRequest',
  '2': [
    {'1': 'location_ids', '3': 1, '4': 3, '5': 9, '10': 'locationIds'},
    {'1': 'statuses', '3': 2, '4': 3, '5': 14, '6': '.moat.v1.AssetStatus', '10': 'statuses'},
    {'1': 'division_codes', '3': 3, '4': 3, '5': 9, '10': 'divisionCodes'},
    {'1': 'search', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'search', '17': true},
    {'1': 'has_active_warranty', '3': 5, '4': 1, '5': 8, '9': 1, '10': 'hasActiveWarranty', '17': true},
    {'1': 'warranty_expiring_soon', '3': 6, '4': 1, '5': 8, '9': 2, '10': 'warrantyExpiringSoon', '17': true},
    {'1': 'created_after', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'createdAfter', '17': true},
    {'1': 'created_before', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 4, '10': 'createdBefore', '17': true},
    {'1': 'sort_by', '3': 9, '4': 1, '5': 9, '9': 5, '10': 'sortBy', '17': true},
    {'1': 'sort_order', '3': 10, '4': 1, '5': 9, '9': 6, '10': 'sortOrder', '17': true},
    {'1': 'limit', '3': 11, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 12, '4': 1, '5': 5, '10': 'offset'},
  ],
  '8': [
    {'1': '_search'},
    {'1': '_has_active_warranty'},
    {'1': '_warranty_expiring_soon'},
    {'1': '_created_after'},
    {'1': '_created_before'},
    {'1': '_sort_by'},
    {'1': '_sort_order'},
  ],
};

/// Descriptor for `ListAssetsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssetsRequestDescriptor = $convert.base64Decode(
    'ChFMaXN0QXNzZXRzUmVxdWVzdBIhCgxsb2NhdGlvbl9pZHMYASADKAlSC2xvY2F0aW9uSWRzEj'
    'AKCHN0YXR1c2VzGAIgAygOMhQubW9hdC52MS5Bc3NldFN0YXR1c1IIc3RhdHVzZXMSJQoOZGl2'
    'aXNpb25fY29kZXMYAyADKAlSDWRpdmlzaW9uQ29kZXMSGwoGc2VhcmNoGAQgASgJSABSBnNlYX'
    'JjaIgBARIzChNoYXNfYWN0aXZlX3dhcnJhbnR5GAUgASgISAFSEWhhc0FjdGl2ZVdhcnJhbnR5'
    'iAEBEjkKFndhcnJhbnR5X2V4cGlyaW5nX3Nvb24YBiABKAhIAlIUd2FycmFudHlFeHBpcmluZ1'
    'Nvb26IAQESRAoNY3JlYXRlZF9hZnRlchgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3Rh'
    'bXBIA1IMY3JlYXRlZEFmdGVyiAEBEkYKDmNyZWF0ZWRfYmVmb3JlGAggASgLMhouZ29vZ2xlLn'
    'Byb3RvYnVmLlRpbWVzdGFtcEgEUg1jcmVhdGVkQmVmb3JliAEBEhwKB3NvcnRfYnkYCSABKAlI'
    'BVIGc29ydEJ5iAEBEiIKCnNvcnRfb3JkZXIYCiABKAlIBlIJc29ydE9yZGVyiAEBEhQKBWxpbW'
    'l0GAsgASgFUgVsaW1pdBIWCgZvZmZzZXQYDCABKAVSBm9mZnNldEIJCgdfc2VhcmNoQhYKFF9o'
    'YXNfYWN0aXZlX3dhcnJhbnR5QhkKF193YXJyYW50eV9leHBpcmluZ19zb29uQhAKDl9jcmVhdG'
    'VkX2FmdGVyQhEKD19jcmVhdGVkX2JlZm9yZUIKCghfc29ydF9ieUINCgtfc29ydF9vcmRlcg==');

@$core.Deprecated('Use listAssetsResponseDescriptor instead')
const ListAssetsResponse$json = {
  '1': 'ListAssetsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssetWithDetails', '10': 'items'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
    {'1': 'page', '3': 3, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 4, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'total_pages', '3': 5, '4': 1, '5': 5, '10': 'totalPages'},
  ],
};

/// Descriptor for `ListAssetsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssetsResponseDescriptor = $convert.base64Decode(
    'ChJMaXN0QXNzZXRzUmVzcG9uc2USLwoFaXRlbXMYASADKAsyGS5tb2F0LnYxLkFzc2V0V2l0aE'
    'RldGFpbHNSBWl0ZW1zEhQKBXRvdGFsGAIgASgFUgV0b3RhbBISCgRwYWdlGAMgASgFUgRwYWdl'
    'EhsKCXBhZ2Vfc2l6ZRgEIAEoBVIIcGFnZVNpemUSHwoLdG90YWxfcGFnZXMYBSABKAVSCnRvdG'
    'FsUGFnZXM=');

@$core.Deprecated('Use bulkUpdateAssetsRequestDescriptor instead')
const BulkUpdateAssetsRequest$json = {
  '1': 'BulkUpdateAssetsRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.moat.v1.AssetStatus', '9': 0, '10': 'status', '17': true},
    {'1': 'location_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'locationId', '17': true},
    {'1': 'division_of_construction', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'divisionOfConstruction', '17': true},
  ],
  '8': [
    {'1': '_status'},
    {'1': '_location_id'},
    {'1': '_division_of_construction'},
  ],
};

/// Descriptor for `BulkUpdateAssetsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkUpdateAssetsRequestDescriptor = $convert.base64Decode(
    'ChdCdWxrVXBkYXRlQXNzZXRzUmVxdWVzdBIQCgNpZHMYASADKAlSA2lkcxIxCgZzdGF0dXMYAi'
    'ABKA4yFC5tb2F0LnYxLkFzc2V0U3RhdHVzSABSBnN0YXR1c4gBARIkCgtsb2NhdGlvbl9pZBgD'
    'IAEoCUgBUgpsb2NhdGlvbklkiAEBEj0KGGRpdmlzaW9uX29mX2NvbnN0cnVjdGlvbhgEIAEoCU'
    'gCUhZkaXZpc2lvbk9mQ29uc3RydWN0aW9uiAEBQgkKB19zdGF0dXNCDgoMX2xvY2F0aW9uX2lk'
    'QhsKGV9kaXZpc2lvbl9vZl9jb25zdHJ1Y3Rpb24=');

@$core.Deprecated('Use bulkUpdateAssetsResponseDescriptor instead')
const BulkUpdateAssetsResponse$json = {
  '1': 'BulkUpdateAssetsResponse',
  '2': [
    {'1': 'updated_count', '3': 1, '4': 1, '5': 5, '10': 'updatedCount'},
    {'1': 'failed_ids', '3': 2, '4': 3, '5': 9, '10': 'failedIds'},
  ],
};

/// Descriptor for `BulkUpdateAssetsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkUpdateAssetsResponseDescriptor = $convert.base64Decode(
    'ChhCdWxrVXBkYXRlQXNzZXRzUmVzcG9uc2USIwoNdXBkYXRlZF9jb3VudBgBIAEoBVIMdXBkYX'
    'RlZENvdW50Eh0KCmZhaWxlZF9pZHMYAiADKAlSCWZhaWxlZElkcw==');

@$core.Deprecated('Use bulkDeleteAssetsRequestDescriptor instead')
const BulkDeleteAssetsRequest$json = {
  '1': 'BulkDeleteAssetsRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `BulkDeleteAssetsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkDeleteAssetsRequestDescriptor = $convert.base64Decode(
    'ChdCdWxrRGVsZXRlQXNzZXRzUmVxdWVzdBIQCgNpZHMYASADKAlSA2lkcw==');

@$core.Deprecated('Use bulkDeleteAssetsResponseDescriptor instead')
const BulkDeleteAssetsResponse$json = {
  '1': 'BulkDeleteAssetsResponse',
  '2': [
    {'1': 'deleted_count', '3': 1, '4': 1, '5': 5, '10': 'deletedCount'},
    {'1': 'failed_ids', '3': 2, '4': 3, '5': 9, '10': 'failedIds'},
  ],
};

/// Descriptor for `BulkDeleteAssetsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bulkDeleteAssetsResponseDescriptor = $convert.base64Decode(
    'ChhCdWxrRGVsZXRlQXNzZXRzUmVzcG9uc2USIwoNZGVsZXRlZF9jb3VudBgBIAEoBVIMZGVsZX'
    'RlZENvdW50Eh0KCmZhaWxlZF9pZHMYAiADKAlSCWZhaWxlZElkcw==');

@$core.Deprecated('Use assetLocationDescriptor instead')
const AssetLocation$json = {
  '1': 'AssetLocation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'address', '17': true},
    {'1': 'asset_count', '3': 4, '4': 1, '5': 5, '10': 'assetCount'},
  ],
  '8': [
    {'1': '_address'},
  ],
};

/// Descriptor for `AssetLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetLocationDescriptor = $convert.base64Decode(
    'Cg1Bc3NldExvY2F0aW9uEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEh0KB2'
    'FkZHJlc3MYAyABKAlIAFIHYWRkcmVzc4gBARIfCgthc3NldF9jb3VudBgEIAEoBVIKYXNzZXRD'
    'b3VudEIKCghfYWRkcmVzcw==');

@$core.Deprecated('Use getAssetLocationsRequestDescriptor instead')
const GetAssetLocationsRequest$json = {
  '1': 'GetAssetLocationsRequest',
};

/// Descriptor for `GetAssetLocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetLocationsRequestDescriptor = $convert.base64Decode(
    'ChhHZXRBc3NldExvY2F0aW9uc1JlcXVlc3Q=');

@$core.Deprecated('Use getAssetLocationsResponseDescriptor instead')
const GetAssetLocationsResponse$json = {
  '1': 'GetAssetLocationsResponse',
  '2': [
    {'1': 'locations', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssetLocation', '10': 'locations'},
  ],
};

/// Descriptor for `GetAssetLocationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetLocationsResponseDescriptor = $convert.base64Decode(
    'ChlHZXRBc3NldExvY2F0aW9uc1Jlc3BvbnNlEjQKCWxvY2F0aW9ucxgBIAMoCzIWLm1vYXQudj'
    'EuQXNzZXRMb2NhdGlvblIJbG9jYXRpb25z');

@$core.Deprecated('Use assetDivisionDescriptor instead')
const AssetDivision$json = {
  '1': 'AssetDivision',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'parent_code', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'parentCode', '17': true},
    {'1': 'level', '3': 4, '4': 1, '5': 5, '10': 'level'},
    {'1': 'asset_count', '3': 5, '4': 1, '5': 5, '10': 'assetCount'},
  ],
  '8': [
    {'1': '_parent_code'},
  ],
};

/// Descriptor for `AssetDivision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDivisionDescriptor = $convert.base64Decode(
    'Cg1Bc3NldERpdmlzaW9uEhIKBGNvZGUYASABKAlSBGNvZGUSEgoEbmFtZRgCIAEoCVIEbmFtZR'
    'IkCgtwYXJlbnRfY29kZRgDIAEoCUgAUgpwYXJlbnRDb2RliAEBEhQKBWxldmVsGAQgASgFUgVs'
    'ZXZlbBIfCgthc3NldF9jb3VudBgFIAEoBVIKYXNzZXRDb3VudEIOCgxfcGFyZW50X2NvZGU=');

@$core.Deprecated('Use getAssetDivisionsRequestDescriptor instead')
const GetAssetDivisionsRequest$json = {
  '1': 'GetAssetDivisionsRequest',
  '2': [
    {'1': 'level', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'level', '17': true},
  ],
  '8': [
    {'1': '_level'},
  ],
};

/// Descriptor for `GetAssetDivisionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetDivisionsRequestDescriptor = $convert.base64Decode(
    'ChhHZXRBc3NldERpdmlzaW9uc1JlcXVlc3QSGQoFbGV2ZWwYASABKAVIAFIFbGV2ZWyIAQFCCA'
    'oGX2xldmVs');

@$core.Deprecated('Use getAssetDivisionsResponseDescriptor instead')
const GetAssetDivisionsResponse$json = {
  '1': 'GetAssetDivisionsResponse',
  '2': [
    {'1': 'divisions', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssetDivision', '10': 'divisions'},
  ],
};

/// Descriptor for `GetAssetDivisionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetDivisionsResponseDescriptor = $convert.base64Decode(
    'ChlHZXRBc3NldERpdmlzaW9uc1Jlc3BvbnNlEjQKCWRpdmlzaW9ucxgBIAMoCzIWLm1vYXQudj'
    'EuQXNzZXREaXZpc2lvblIJZGl2aXNpb25z');

@$core.Deprecated('Use getAssetStatisticsRequestDescriptor instead')
const GetAssetStatisticsRequest$json = {
  '1': 'GetAssetStatisticsRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetAssetStatisticsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetStatisticsRequestDescriptor = $convert.base64Decode(
    'ChlHZXRBc3NldFN0YXRpc3RpY3NSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use assetStatisticsDescriptor instead')
const AssetStatistics$json = {
  '1': 'AssetStatistics',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'total_tasks', '3': 2, '4': 1, '5': 5, '10': 'totalTasks'},
    {'1': 'open_tasks', '3': 3, '4': 1, '5': 5, '10': 'openTasks'},
    {'1': 'completed_tasks', '3': 4, '4': 1, '5': 5, '10': 'completedTasks'},
    {'1': 'file_count', '3': 5, '4': 1, '5': 5, '10': 'fileCount'},
    {'1': 'warranty_coverage_count', '3': 6, '4': 1, '5': 5, '10': 'warrantyCoverageCount'},
    {'1': 'total_value', '3': 7, '4': 1, '5': 1, '9': 0, '10': 'totalValue', '17': true},
    {'1': 'next_warranty_expiry', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'nextWarrantyExpiry', '17': true},
    {'1': 'last_task_completed_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'lastTaskCompletedAt', '17': true},
  ],
  '8': [
    {'1': '_total_value'},
    {'1': '_next_warranty_expiry'},
    {'1': '_last_task_completed_at'},
  ],
};

/// Descriptor for `AssetStatistics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetStatisticsDescriptor = $convert.base64Decode(
    'Cg9Bc3NldFN0YXRpc3RpY3MSGQoIYXNzZXRfaWQYASABKAlSB2Fzc2V0SWQSHwoLdG90YWxfdG'
    'Fza3MYAiABKAVSCnRvdGFsVGFza3MSHQoKb3Blbl90YXNrcxgDIAEoBVIJb3BlblRhc2tzEicK'
    'D2NvbXBsZXRlZF90YXNrcxgEIAEoBVIOY29tcGxldGVkVGFza3MSHQoKZmlsZV9jb3VudBgFIA'
    'EoBVIJZmlsZUNvdW50EjYKF3dhcnJhbnR5X2NvdmVyYWdlX2NvdW50GAYgASgFUhV3YXJyYW50'
    'eUNvdmVyYWdlQ291bnQSJAoLdG90YWxfdmFsdWUYByABKAFIAFIKdG90YWxWYWx1ZYgBARJRCh'
    'RuZXh0X3dhcnJhbnR5X2V4cGlyeRgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBI'
    'AVISbmV4dFdhcnJhbnR5RXhwaXJ5iAEBElQKFmxhc3RfdGFza19jb21wbGV0ZWRfYXQYCSABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAJSE2xhc3RUYXNrQ29tcGxldGVkQXSIAQFC'
    'DgoMX3RvdGFsX3ZhbHVlQhcKFV9uZXh0X3dhcnJhbnR5X2V4cGlyeUIZChdfbGFzdF90YXNrX2'
    'NvbXBsZXRlZF9hdA==');

@$core.Deprecated('Use assetFileDescriptor instead')
const AssetFile$json = {
  '1': 'AssetFile',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'asset_id', '3': 2, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'file_name', '3': 3, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 4, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'size_bytes', '3': 5, '4': 1, '5': 3, '10': 'sizeBytes'},
    {'1': 'url', '3': 6, '4': 1, '5': 9, '10': 'url'},
    {'1': 'caption', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'caption', '17': true},
    {'1': 'display_order', '3': 8, '4': 1, '5': 5, '10': 'displayOrder'},
    {'1': 'extracted_text', '3': 9, '4': 1, '5': 9, '9': 1, '10': 'extractedText', '17': true},
    {'1': 'ai_summary', '3': 10, '4': 1, '5': 9, '9': 2, '10': 'aiSummary', '17': true},
    {'1': 'created_at', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '8': [
    {'1': '_caption'},
    {'1': '_extracted_text'},
    {'1': '_ai_summary'},
  ],
};

/// Descriptor for `AssetFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetFileDescriptor = $convert.base64Decode(
    'CglBc3NldEZpbGUSDgoCaWQYASABKAlSAmlkEhkKCGFzc2V0X2lkGAIgASgJUgdhc3NldElkEh'
    'sKCWZpbGVfbmFtZRgDIAEoCVIIZmlsZU5hbWUSIQoMY29udGVudF90eXBlGAQgASgJUgtjb250'
    'ZW50VHlwZRIdCgpzaXplX2J5dGVzGAUgASgDUglzaXplQnl0ZXMSEAoDdXJsGAYgASgJUgN1cm'
    'wSHQoHY2FwdGlvbhgHIAEoCUgAUgdjYXB0aW9uiAEBEiMKDWRpc3BsYXlfb3JkZXIYCCABKAVS'
    'DGRpc3BsYXlPcmRlchIqCg5leHRyYWN0ZWRfdGV4dBgJIAEoCUgBUg1leHRyYWN0ZWRUZXh0iA'
    'EBEiIKCmFpX3N1bW1hcnkYCiABKAlIAlIJYWlTdW1tYXJ5iAEBEjkKCmNyZWF0ZWRfYXQYCyAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdB'
    'gMIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdEIKCghfY2FwdGlv'
    'bkIRCg9fZXh0cmFjdGVkX3RleHRCDQoLX2FpX3N1bW1hcnk=');

@$core.Deprecated('Use getAssetFileUploadUrlRequestDescriptor instead')
const GetAssetFileUploadUrlRequest$json = {
  '1': 'GetAssetFileUploadUrlRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 3, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'size_bytes', '3': 4, '4': 1, '5': 3, '10': 'sizeBytes'},
  ],
};

/// Descriptor for `GetAssetFileUploadUrlRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetFileUploadUrlRequestDescriptor = $convert.base64Decode(
    'ChxHZXRBc3NldEZpbGVVcGxvYWRVcmxSZXF1ZXN0EhkKCGFzc2V0X2lkGAEgASgJUgdhc3NldE'
    'lkEhsKCWZpbGVfbmFtZRgCIAEoCVIIZmlsZU5hbWUSIQoMY29udGVudF90eXBlGAMgASgJUgtj'
    'b250ZW50VHlwZRIdCgpzaXplX2J5dGVzGAQgASgDUglzaXplQnl0ZXM=');

@$core.Deprecated('Use getAssetFileUploadUrlResponseDescriptor instead')
const GetAssetFileUploadUrlResponse$json = {
  '1': 'GetAssetFileUploadUrlResponse',
  '2': [
    {'1': 'upload_url', '3': 1, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'file_id', '3': 2, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'expires_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
  ],
};

/// Descriptor for `GetAssetFileUploadUrlResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAssetFileUploadUrlResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRBc3NldEZpbGVVcGxvYWRVcmxSZXNwb25zZRIdCgp1cGxvYWRfdXJsGAEgASgJUgl1cG'
    'xvYWRVcmwSFwoHZmlsZV9pZBgCIAEoCVIGZmlsZUlkEjkKCmV4cGlyZXNfYXQYAyABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wUglleHBpcmVzQXQ=');

@$core.Deprecated('Use confirmAssetFileUploadRequestDescriptor instead')
const ConfirmAssetFileUploadRequest$json = {
  '1': 'ConfirmAssetFileUploadRequest',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'asset_id', '3': 2, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'caption', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'caption', '17': true},
  ],
  '8': [
    {'1': '_caption'},
  ],
};

/// Descriptor for `ConfirmAssetFileUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmAssetFileUploadRequestDescriptor = $convert.base64Decode(
    'Ch1Db25maXJtQXNzZXRGaWxlVXBsb2FkUmVxdWVzdBIXCgdmaWxlX2lkGAEgASgJUgZmaWxlSW'
    'QSGQoIYXNzZXRfaWQYAiABKAlSB2Fzc2V0SWQSHQoHY2FwdGlvbhgDIAEoCUgAUgdjYXB0aW9u'
    'iAEBQgoKCF9jYXB0aW9u');

@$core.Deprecated('Use listAssetFilesRequestDescriptor instead')
const ListAssetFilesRequest$json = {
  '1': 'ListAssetFilesRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ListAssetFilesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssetFilesRequestDescriptor = $convert.base64Decode(
    'ChVMaXN0QXNzZXRGaWxlc1JlcXVlc3QSGQoIYXNzZXRfaWQYASABKAlSB2Fzc2V0SWQSFAoFbG'
    'ltaXQYAiABKAVSBWxpbWl0EhYKBm9mZnNldBgDIAEoBVIGb2Zmc2V0');

@$core.Deprecated('Use listAssetFilesResponseDescriptor instead')
const ListAssetFilesResponse$json = {
  '1': 'ListAssetFilesResponse',
  '2': [
    {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssetFile', '10': 'files'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListAssetFilesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssetFilesResponseDescriptor = $convert.base64Decode(
    'ChZMaXN0QXNzZXRGaWxlc1Jlc3BvbnNlEigKBWZpbGVzGAEgAygLMhIubW9hdC52MS5Bc3NldE'
    'ZpbGVSBWZpbGVzEhQKBXRvdGFsGAIgASgFUgV0b3RhbA==');

@$core.Deprecated('Use deleteAssetFileRequestDescriptor instead')
const DeleteAssetFileRequest$json = {
  '1': 'DeleteAssetFileRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'asset_id', '3': 2, '4': 1, '5': 9, '10': 'assetId'},
  ],
};

/// Descriptor for `DeleteAssetFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAssetFileRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVBc3NldEZpbGVSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIZCghhc3NldF9pZBgCIA'
    'EoCVIHYXNzZXRJZA==');

@$core.Deprecated('Use deleteAssetFileResponseDescriptor instead')
const DeleteAssetFileResponse$json = {
  '1': 'DeleteAssetFileResponse',
};

/// Descriptor for `DeleteAssetFileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAssetFileResponseDescriptor = $convert.base64Decode(
    'ChdEZWxldGVBc3NldEZpbGVSZXNwb25zZQ==');

@$core.Deprecated('Use updateAssetFileRequestDescriptor instead')
const UpdateAssetFileRequest$json = {
  '1': 'UpdateAssetFileRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'asset_id', '3': 2, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'caption', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'caption', '17': true},
    {'1': 'display_order', '3': 4, '4': 1, '5': 5, '9': 1, '10': 'displayOrder', '17': true},
  ],
  '8': [
    {'1': '_caption'},
    {'1': '_display_order'},
  ],
};

/// Descriptor for `UpdateAssetFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetFileRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVBc3NldEZpbGVSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIZCghhc3NldF9pZBgCIA'
    'EoCVIHYXNzZXRJZBIdCgdjYXB0aW9uGAMgASgJSABSB2NhcHRpb26IAQESKAoNZGlzcGxheV9v'
    'cmRlchgEIAEoBUgBUgxkaXNwbGF5T3JkZXKIAQFCCgoIX2NhcHRpb25CEAoOX2Rpc3BsYXlfb3'
    'JkZXI=');

@$core.Deprecated('Use assetMessageDescriptor instead')
const AssetMessage$json = {
  '1': 'AssetMessage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'asset_id', '3': 2, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'prompt', '3': 3, '4': 1, '5': 9, '10': 'prompt'},
    {'1': 'response', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'response', '17': true},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
  '8': [
    {'1': '_response'},
  ],
};

/// Descriptor for `AssetMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetMessageDescriptor = $convert.base64Decode(
    'CgxBc3NldE1lc3NhZ2USDgoCaWQYASABKAlSAmlkEhkKCGFzc2V0X2lkGAIgASgJUgdhc3NldE'
    'lkEhYKBnByb21wdBgDIAEoCVIGcHJvbXB0Eh8KCHJlc3BvbnNlGAQgASgJSABSCHJlc3BvbnNl'
    'iAEBEjkKCmNyZWF0ZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcm'
    'VhdGVkQXRCCwoJX3Jlc3BvbnNl');

@$core.Deprecated('Use listAssetMessagesRequestDescriptor instead')
const ListAssetMessagesRequest$json = {
  '1': 'ListAssetMessagesRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ListAssetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssetMessagesRequestDescriptor = $convert.base64Decode(
    'ChhMaXN0QXNzZXRNZXNzYWdlc1JlcXVlc3QSGQoIYXNzZXRfaWQYASABKAlSB2Fzc2V0SWQSFA'
    'oFbGltaXQYAiABKAVSBWxpbWl0EhYKBm9mZnNldBgDIAEoBVIGb2Zmc2V0');

@$core.Deprecated('Use listAssetMessagesResponseDescriptor instead')
const ListAssetMessagesResponse$json = {
  '1': 'ListAssetMessagesResponse',
  '2': [
    {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.moat.v1.AssetMessage', '10': 'messages'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `ListAssetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAssetMessagesResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0QXNzZXRNZXNzYWdlc1Jlc3BvbnNlEjEKCG1lc3NhZ2VzGAEgAygLMhUubW9hdC52MS'
    '5Bc3NldE1lc3NhZ2VSCG1lc3NhZ2VzEhQKBXRvdGFsGAIgASgFUgV0b3RhbA==');

@$core.Deprecated('Use createAssetMessageRequestDescriptor instead')
const CreateAssetMessageRequest$json = {
  '1': 'CreateAssetMessageRequest',
  '2': [
    {'1': 'asset_id', '3': 1, '4': 1, '5': 9, '10': 'assetId'},
    {'1': 'prompt', '3': 2, '4': 1, '5': 9, '10': 'prompt'},
  ],
};

/// Descriptor for `CreateAssetMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAssetMessageRequestDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVBc3NldE1lc3NhZ2VSZXF1ZXN0EhkKCGFzc2V0X2lkGAEgASgJUgdhc3NldElkEh'
    'YKBnByb21wdBgCIAEoCVIGcHJvbXB0');

@$core.Deprecated('Use createAssetMessageResponseDescriptor instead')
const CreateAssetMessageResponse$json = {
  '1': 'CreateAssetMessageResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.moat.v1.AssetMessage', '10': 'message'},
  ],
};

/// Descriptor for `CreateAssetMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAssetMessageResponseDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVBc3NldE1lc3NhZ2VSZXNwb25zZRIvCgdtZXNzYWdlGAEgASgLMhUubW9hdC52MS'
    '5Bc3NldE1lc3NhZ2VSB21lc3NhZ2U=');

const $core.Map<$core.String, $core.dynamic> AssetServiceBase$json = {
  '1': 'AssetService',
  '2': [
    {'1': 'CreateAsset', '2': '.moat.v1.CreateAssetRequest', '3': '.moat.v1.Asset'},
    {'1': 'GetAsset', '2': '.moat.v1.GetAssetRequest', '3': '.moat.v1.AssetWithDetails'},
    {'1': 'UpdateAsset', '2': '.moat.v1.UpdateAssetRequest', '3': '.moat.v1.Asset'},
    {'1': 'DeleteAsset', '2': '.moat.v1.DeleteAssetRequest', '3': '.moat.v1.DeleteAssetResponse'},
    {'1': 'ListAssets', '2': '.moat.v1.ListAssetsRequest', '3': '.moat.v1.ListAssetsResponse'},
    {'1': 'BulkUpdateAssets', '2': '.moat.v1.BulkUpdateAssetsRequest', '3': '.moat.v1.BulkUpdateAssetsResponse'},
    {'1': 'BulkDeleteAssets', '2': '.moat.v1.BulkDeleteAssetsRequest', '3': '.moat.v1.BulkDeleteAssetsResponse'},
    {'1': 'GetAssetLocations', '2': '.moat.v1.GetAssetLocationsRequest', '3': '.moat.v1.GetAssetLocationsResponse'},
    {'1': 'GetAssetDivisions', '2': '.moat.v1.GetAssetDivisionsRequest', '3': '.moat.v1.GetAssetDivisionsResponse'},
    {'1': 'GetAssetStatistics', '2': '.moat.v1.GetAssetStatisticsRequest', '3': '.moat.v1.AssetStatistics'},
    {'1': 'GetAssetFileUploadUrl', '2': '.moat.v1.GetAssetFileUploadUrlRequest', '3': '.moat.v1.GetAssetFileUploadUrlResponse'},
    {'1': 'ConfirmAssetFileUpload', '2': '.moat.v1.ConfirmAssetFileUploadRequest', '3': '.moat.v1.AssetFile'},
    {'1': 'ListAssetFiles', '2': '.moat.v1.ListAssetFilesRequest', '3': '.moat.v1.ListAssetFilesResponse'},
    {'1': 'DeleteAssetFile', '2': '.moat.v1.DeleteAssetFileRequest', '3': '.moat.v1.DeleteAssetFileResponse'},
    {'1': 'UpdateAssetFile', '2': '.moat.v1.UpdateAssetFileRequest', '3': '.moat.v1.AssetFile'},
    {'1': 'ListAssetMessages', '2': '.moat.v1.ListAssetMessagesRequest', '3': '.moat.v1.ListAssetMessagesResponse'},
    {'1': 'CreateAssetMessage', '2': '.moat.v1.CreateAssetMessageRequest', '3': '.moat.v1.CreateAssetMessageResponse'},
  ],
};

@$core.Deprecated('Use assetServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> AssetServiceBase$messageJson = {
  '.moat.v1.CreateAssetRequest': CreateAssetRequest$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.moat.v1.Asset': Asset$json,
  '.moat.v1.GetAssetRequest': GetAssetRequest$json,
  '.moat.v1.AssetWithDetails': AssetWithDetails$json,
  '.moat.v1.UpdateAssetRequest': UpdateAssetRequest$json,
  '.moat.v1.DeleteAssetRequest': DeleteAssetRequest$json,
  '.moat.v1.DeleteAssetResponse': DeleteAssetResponse$json,
  '.moat.v1.ListAssetsRequest': ListAssetsRequest$json,
  '.moat.v1.ListAssetsResponse': ListAssetsResponse$json,
  '.moat.v1.BulkUpdateAssetsRequest': BulkUpdateAssetsRequest$json,
  '.moat.v1.BulkUpdateAssetsResponse': BulkUpdateAssetsResponse$json,
  '.moat.v1.BulkDeleteAssetsRequest': BulkDeleteAssetsRequest$json,
  '.moat.v1.BulkDeleteAssetsResponse': BulkDeleteAssetsResponse$json,
  '.moat.v1.GetAssetLocationsRequest': GetAssetLocationsRequest$json,
  '.moat.v1.GetAssetLocationsResponse': GetAssetLocationsResponse$json,
  '.moat.v1.AssetLocation': AssetLocation$json,
  '.moat.v1.GetAssetDivisionsRequest': GetAssetDivisionsRequest$json,
  '.moat.v1.GetAssetDivisionsResponse': GetAssetDivisionsResponse$json,
  '.moat.v1.AssetDivision': AssetDivision$json,
  '.moat.v1.GetAssetStatisticsRequest': GetAssetStatisticsRequest$json,
  '.moat.v1.AssetStatistics': AssetStatistics$json,
  '.moat.v1.GetAssetFileUploadUrlRequest': GetAssetFileUploadUrlRequest$json,
  '.moat.v1.GetAssetFileUploadUrlResponse': GetAssetFileUploadUrlResponse$json,
  '.moat.v1.ConfirmAssetFileUploadRequest': ConfirmAssetFileUploadRequest$json,
  '.moat.v1.AssetFile': AssetFile$json,
  '.moat.v1.ListAssetFilesRequest': ListAssetFilesRequest$json,
  '.moat.v1.ListAssetFilesResponse': ListAssetFilesResponse$json,
  '.moat.v1.DeleteAssetFileRequest': DeleteAssetFileRequest$json,
  '.moat.v1.DeleteAssetFileResponse': DeleteAssetFileResponse$json,
  '.moat.v1.UpdateAssetFileRequest': UpdateAssetFileRequest$json,
  '.moat.v1.ListAssetMessagesRequest': ListAssetMessagesRequest$json,
  '.moat.v1.ListAssetMessagesResponse': ListAssetMessagesResponse$json,
  '.moat.v1.AssetMessage': AssetMessage$json,
  '.moat.v1.CreateAssetMessageRequest': CreateAssetMessageRequest$json,
  '.moat.v1.CreateAssetMessageResponse': CreateAssetMessageResponse$json,
};

/// Descriptor for `AssetService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List assetServiceDescriptor = $convert.base64Decode(
    'CgxBc3NldFNlcnZpY2USOgoLQ3JlYXRlQXNzZXQSGy5tb2F0LnYxLkNyZWF0ZUFzc2V0UmVxdW'
    'VzdBoOLm1vYXQudjEuQXNzZXQSPwoIR2V0QXNzZXQSGC5tb2F0LnYxLkdldEFzc2V0UmVxdWVz'
    'dBoZLm1vYXQudjEuQXNzZXRXaXRoRGV0YWlscxI6CgtVcGRhdGVBc3NldBIbLm1vYXQudjEuVX'
    'BkYXRlQXNzZXRSZXF1ZXN0Gg4ubW9hdC52MS5Bc3NldBJICgtEZWxldGVBc3NldBIbLm1vYXQu'
    'djEuRGVsZXRlQXNzZXRSZXF1ZXN0GhwubW9hdC52MS5EZWxldGVBc3NldFJlc3BvbnNlEkUKCk'
    'xpc3RBc3NldHMSGi5tb2F0LnYxLkxpc3RBc3NldHNSZXF1ZXN0GhsubW9hdC52MS5MaXN0QXNz'
    'ZXRzUmVzcG9uc2USVwoQQnVsa1VwZGF0ZUFzc2V0cxIgLm1vYXQudjEuQnVsa1VwZGF0ZUFzc2'
    'V0c1JlcXVlc3QaIS5tb2F0LnYxLkJ1bGtVcGRhdGVBc3NldHNSZXNwb25zZRJXChBCdWxrRGVs'
    'ZXRlQXNzZXRzEiAubW9hdC52MS5CdWxrRGVsZXRlQXNzZXRzUmVxdWVzdBohLm1vYXQudjEuQn'
    'Vsa0RlbGV0ZUFzc2V0c1Jlc3BvbnNlEloKEUdldEFzc2V0TG9jYXRpb25zEiEubW9hdC52MS5H'
    'ZXRBc3NldExvY2F0aW9uc1JlcXVlc3QaIi5tb2F0LnYxLkdldEFzc2V0TG9jYXRpb25zUmVzcG'
    '9uc2USWgoRR2V0QXNzZXREaXZpc2lvbnMSIS5tb2F0LnYxLkdldEFzc2V0RGl2aXNpb25zUmVx'
    'dWVzdBoiLm1vYXQudjEuR2V0QXNzZXREaXZpc2lvbnNSZXNwb25zZRJSChJHZXRBc3NldFN0YX'
    'Rpc3RpY3MSIi5tb2F0LnYxLkdldEFzc2V0U3RhdGlzdGljc1JlcXVlc3QaGC5tb2F0LnYxLkFz'
    'c2V0U3RhdGlzdGljcxJmChVHZXRBc3NldEZpbGVVcGxvYWRVcmwSJS5tb2F0LnYxLkdldEFzc2'
    'V0RmlsZVVwbG9hZFVybFJlcXVlc3QaJi5tb2F0LnYxLkdldEFzc2V0RmlsZVVwbG9hZFVybFJl'
    'c3BvbnNlElQKFkNvbmZpcm1Bc3NldEZpbGVVcGxvYWQSJi5tb2F0LnYxLkNvbmZpcm1Bc3NldE'
    'ZpbGVVcGxvYWRSZXF1ZXN0GhIubW9hdC52MS5Bc3NldEZpbGUSUQoOTGlzdEFzc2V0RmlsZXMS'
    'Hi5tb2F0LnYxLkxpc3RBc3NldEZpbGVzUmVxdWVzdBofLm1vYXQudjEuTGlzdEFzc2V0RmlsZX'
    'NSZXNwb25zZRJUCg9EZWxldGVBc3NldEZpbGUSHy5tb2F0LnYxLkRlbGV0ZUFzc2V0RmlsZVJl'
    'cXVlc3QaIC5tb2F0LnYxLkRlbGV0ZUFzc2V0RmlsZVJlc3BvbnNlEkYKD1VwZGF0ZUFzc2V0Rm'
    'lsZRIfLm1vYXQudjEuVXBkYXRlQXNzZXRGaWxlUmVxdWVzdBoSLm1vYXQudjEuQXNzZXRGaWxl'
    'EloKEUxpc3RBc3NldE1lc3NhZ2VzEiEubW9hdC52MS5MaXN0QXNzZXRNZXNzYWdlc1JlcXVlc3'
    'QaIi5tb2F0LnYxLkxpc3RBc3NldE1lc3NhZ2VzUmVzcG9uc2USXQoSQ3JlYXRlQXNzZXRNZXNz'
    'YWdlEiIubW9hdC52MS5DcmVhdGVBc3NldE1lc3NhZ2VSZXF1ZXN0GiMubW9hdC52MS5DcmVhdG'
    'VBc3NldE1lc3NhZ2VSZXNwb25zZQ==');

