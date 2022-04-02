///
//  Generated code. Do not modify.
//  source: todart/v1alpha/services/task_list_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listTaskListsRequestDescriptor instead')
const ListTaskListsRequest$json = {
  '1': 'ListTaskListsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListTaskListsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTaskListsRequestDescriptor = $convert.base64Decode(
    'ChRMaXN0VGFza0xpc3RzUmVxdWVzdBIWCgZwYXJlbnQYASABKAlSBnBhcmVudBIbCglwYWdlX3NpemUYAiABKAVSCHBhZ2VTaXplEh0KCnBhZ2VfdG9rZW4YAyABKAlSCXBhZ2VUb2tlbg==');
@$core.Deprecated('Use listTaskListsResponseDescriptor instead')
const ListTaskListsResponse$json = {
  '1': 'ListTaskListsResponse',
  '2': [
    {
      '1': 'tasklists',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.todart.v1alpha.resources.TaskList',
      '10': 'tasklists'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListTaskListsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTaskListsResponseDescriptor = $convert.base64Decode(
    'ChVMaXN0VGFza0xpc3RzUmVzcG9uc2USQAoJdGFza2xpc3RzGAEgAygLMiIudG9kYXJ0LnYxYWxwaGEucmVzb3VyY2VzLlRhc2tMaXN0Ugl0YXNrbGlzdHMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2Vu');
@$core.Deprecated('Use getTaskListRequestDescriptor instead')
const GetTaskListRequest$json = {
  '1': 'GetTaskListRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetTaskListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskListRequestDescriptor = $convert
    .base64Decode('ChJHZXRUYXNrTGlzdFJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use createTaskListRequestDescriptor instead')
const CreateTaskListRequest$json = {
  '1': 'CreateTaskListRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '10': 'parent'},
    {'1': 'tasklist_id', '3': 2, '4': 1, '5': 9, '10': 'tasklistId'},
    {
      '1': 'tasklist',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.todart.v1alpha.resources.TaskList',
      '10': 'tasklist'
    },
  ],
};

/// Descriptor for `CreateTaskListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskListRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVUYXNrTGlzdFJlcXVlc3QSFgoGcGFyZW50GAEgASgJUgZwYXJlbnQSHwoLdGFza2xpc3RfaWQYAiABKAlSCnRhc2tsaXN0SWQSPgoIdGFza2xpc3QYAyABKAsyIi50b2RhcnQudjFhbHBoYS5yZXNvdXJjZXMuVGFza0xpc3RSCHRhc2tsaXN0');
@$core.Deprecated('Use updateTaskListRequestDescriptor instead')
const UpdateTaskListRequest$json = {
  '1': 'UpdateTaskListRequest',
  '2': [
    {
      '1': 'tasklist',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.todart.v1alpha.resources.TaskList',
      '10': 'tasklist'
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

/// Descriptor for `UpdateTaskListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTaskListRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVUYXNrTGlzdFJlcXVlc3QSPgoIdGFza2xpc3QYASABKAsyIi50b2RhcnQudjFhbHBoYS5yZXNvdXJjZXMuVGFza0xpc3RSCHRhc2tsaXN0EjsKC3VwZGF0ZV9tYXNrGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLkZpZWxkTWFza1IKdXBkYXRlTWFzaw==');
@$core.Deprecated('Use deleteTaskListRequestDescriptor instead')
const DeleteTaskListRequest$json = {
  '1': 'DeleteTaskListRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `DeleteTaskListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskListRequestDescriptor =
    $convert.base64Decode(
        'ChVEZWxldGVUYXNrTGlzdFJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
