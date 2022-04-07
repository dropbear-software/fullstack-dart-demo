///
//  Generated code. Do not modify.
//  source: todart/v1alpha/services/task_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listTasksRequestDescriptor instead')
const ListTasksRequest$json = {
  '1': 'ListTasksRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListTasksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VGFza3NSZXF1ZXN0EjwKBnBhcmVudBgBIAEoCUIk4EEC+kEeChx0b2RhcnQuZHJvcGJlYXIuZGV2L1Rhc2tMaXN0UgZwYXJlbnQSGwoJcGFnZV9zaXplGAIgASgFUghwYWdlU2l6ZRIdCgpwYWdlX3Rva2VuGAMgASgJUglwYWdlVG9rZW4=');
@$core.Deprecated('Use listTasksResponseDescriptor instead')
const ListTasksResponse$json = {
  '1': 'ListTasksResponse',
  '2': [
    {
      '1': 'tasks',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.todart.v1alpha.resources.Task',
      '10': 'tasks'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListTasksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0VGFza3NSZXNwb25zZRI0CgV0YXNrcxgBIAMoCzIeLnRvZGFydC52MWFscGhhLnJlc291cmNlcy5UYXNrUgV0YXNrcxImCg9uZXh0X3BhZ2VfdG9rZW4YAiABKAlSDW5leHRQYWdlVG9rZW4=');
@$core.Deprecated('Use getTaskRequestDescriptor instead')
const GetTaskRequest$json = {
  '1': 'GetTaskRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskRequestDescriptor =
    $convert.base64Decode('Cg5HZXRUYXNrUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');
@$core.Deprecated('Use createTaskRequestDescriptor instead')
const CreateTaskRequest$json = {
  '1': 'CreateTaskRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'task',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.todart.v1alpha.resources.Task',
      '10': 'task'
    },
  ],
};

/// Descriptor for `CreateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVUYXNrUmVxdWVzdBI8CgZwYXJlbnQYASABKAlCJOBBAvpBHgocdG9kYXJ0LmRyb3BiZWFyLmRldi9UYXNrTGlzdFIGcGFyZW50EjIKBHRhc2sYAyABKAsyHi50b2RhcnQudjFhbHBoYS5yZXNvdXJjZXMuVGFza1IEdGFzaw==');
@$core.Deprecated('Use updateTaskRequestDescriptor instead')
const UpdateTaskRequest$json = {
  '1': 'UpdateTaskRequest',
  '2': [
    {
      '1': 'task',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.todart.v1alpha.resources.Task',
      '10': 'task'
    },
    {
      '1': 'update_mask',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.FieldMask',
      '10': 'updateMask'
    },
  ],
};

/// Descriptor for `UpdateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTaskRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVUYXNrUmVxdWVzdBIyCgR0YXNrGAEgASgLMh4udG9kYXJ0LnYxYWxwaGEucmVzb3VyY2VzLlRhc2tSBHRhc2sSOwoLdXBkYXRlX21hc2sYAiABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUgp1cGRhdGVNYXNr');
@$core.Deprecated('Use deleteTaskRequestDescriptor instead')
const DeleteTaskRequest$json = {
  '1': 'DeleteTaskRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `DeleteTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskRequestDescriptor = $convert
    .base64Decode('ChFEZWxldGVUYXNrUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');
