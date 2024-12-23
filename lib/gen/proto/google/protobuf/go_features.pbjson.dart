//
//  Generated code. Do not modify.
//  source: google/protobuf/go_features.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use goFeaturesDescriptor instead')
const GoFeatures$json = {
  '1': 'GoFeatures',
  '2': [
    {'1': 'legacy_unmarshal_json_enum', '3': 1, '4': 1, '5': 8, '8': {}, '10': 'legacyUnmarshalJsonEnum'},
    {'1': 'api_level', '3': 2, '4': 1, '5': 14, '6': '.pb.GoFeatures.APILevel', '8': {}, '10': 'apiLevel'},
  ],
  '4': [GoFeatures_APILevel$json],
};

@$core.Deprecated('Use goFeaturesDescriptor instead')
const GoFeatures_APILevel$json = {
  '1': 'APILevel',
  '2': [
    {'1': 'API_LEVEL_UNSPECIFIED', '2': 0},
    {'1': 'API_OPEN', '2': 1},
    {'1': 'API_HYBRID', '2': 2},
    {'1': 'API_OPAQUE', '2': 3},
  ],
};

/// Descriptor for `GoFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List goFeaturesDescriptor = $convert.base64Decode(
    'CgpHb0ZlYXR1cmVzEr4BChpsZWdhY3lfdW5tYXJzaGFsX2pzb25fZW51bRgBIAEoCEKAAYgBAZ'
    'gBBpgBAaIBCRIEdHJ1ZRiEB6IBChIFZmFsc2UY5weyAVsI6AcQ6AcaU1RoZSBsZWdhY3kgVW5t'
    'YXJzaGFsSlNPTiBBUEkgaXMgZGVwcmVjYXRlZCBhbmQgd2lsbCBiZSByZW1vdmVkIGluIGEgZn'
    'V0dXJlIGVkaXRpb24uUhdsZWdhY3lVbm1hcnNoYWxKc29uRW51bRJ0CglhcGlfbGV2ZWwYAiAB'
    'KA4yFy5wYi5Hb0ZlYXR1cmVzLkFQSUxldmVsQj6IAQGYAQOYAQGiARoSFUFQSV9MRVZFTF9VTl'
    'NQRUNJRklFRBiEB6IBDxIKQVBJX09QQVFVRRjpB7IBAwjoB1IIYXBpTGV2ZWwiUwoIQVBJTGV2'
    'ZWwSGQoVQVBJX0xFVkVMX1VOU1BFQ0lGSUVEEAASDAoIQVBJX09QRU4QARIOCgpBUElfSFlCUk'
    'lEEAISDgoKQVBJX09QQVFVRRAD');

