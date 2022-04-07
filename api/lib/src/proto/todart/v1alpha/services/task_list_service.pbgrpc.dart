///
//  Generated code. Do not modify.
//  source: todart/v1alpha/services/task_list_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'task_list_service.pb.dart' as $0;
import '../resources/task_list.pb.dart' as $1;
import '../../../google/protobuf/empty.pb.dart' as $2;
export 'task_list_service.pb.dart';

class TaskListServiceClient extends $grpc.Client {
  static final _$listTaskLists =
      $grpc.ClientMethod<$0.ListTaskListsRequest, $0.ListTaskListsResponse>(
          '/todart.v1alpha.services.TaskListService/ListTaskLists',
          ($0.ListTaskListsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListTaskListsResponse.fromBuffer(value));
  static final _$getTaskList =
      $grpc.ClientMethod<$0.GetTaskListRequest, $1.TaskList>(
          '/todart.v1alpha.services.TaskListService/GetTaskList',
          ($0.GetTaskListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.TaskList.fromBuffer(value));
  static final _$createTaskList =
      $grpc.ClientMethod<$0.CreateTaskListRequest, $1.TaskList>(
          '/todart.v1alpha.services.TaskListService/CreateTaskList',
          ($0.CreateTaskListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.TaskList.fromBuffer(value));
  static final _$updateTaskList =
      $grpc.ClientMethod<$0.UpdateTaskListRequest, $1.TaskList>(
          '/todart.v1alpha.services.TaskListService/UpdateTaskList',
          ($0.UpdateTaskListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.TaskList.fromBuffer(value));
  static final _$deleteTaskList =
      $grpc.ClientMethod<$0.DeleteTaskListRequest, $2.Empty>(
          '/todart.v1alpha.services.TaskListService/DeleteTaskList',
          ($0.DeleteTaskListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));

  TaskListServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListTaskListsResponse> listTaskLists(
      $0.ListTaskListsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTaskLists, request, options: options);
  }

  $grpc.ResponseFuture<$1.TaskList> getTaskList($0.GetTaskListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTaskList, request, options: options);
  }

  $grpc.ResponseFuture<$1.TaskList> createTaskList(
      $0.CreateTaskListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTaskList, request, options: options);
  }

  $grpc.ResponseFuture<$1.TaskList> updateTaskList(
      $0.UpdateTaskListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTaskList, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> deleteTaskList(
      $0.DeleteTaskListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTaskList, request, options: options);
  }
}

abstract class TaskListServiceBase extends $grpc.Service {
  $core.String get $name => 'todart.v1alpha.services.TaskListService';

  TaskListServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.ListTaskListsRequest, $0.ListTaskListsResponse>(
            'ListTaskLists',
            listTaskLists_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListTaskListsRequest.fromBuffer(value),
            ($0.ListTaskListsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTaskListRequest, $1.TaskList>(
        'GetTaskList',
        getTaskList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTaskListRequest.fromBuffer(value),
        ($1.TaskList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTaskListRequest, $1.TaskList>(
        'CreateTaskList',
        createTaskList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateTaskListRequest.fromBuffer(value),
        ($1.TaskList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTaskListRequest, $1.TaskList>(
        'UpdateTaskList',
        updateTaskList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateTaskListRequest.fromBuffer(value),
        ($1.TaskList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTaskListRequest, $2.Empty>(
        'DeleteTaskList',
        deleteTaskList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteTaskListRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListTaskListsResponse> listTaskLists_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListTaskListsRequest> request) async {
    return listTaskLists(call, await request);
  }

  $async.Future<$1.TaskList> getTaskList_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetTaskListRequest> request) async {
    return getTaskList(call, await request);
  }

  $async.Future<$1.TaskList> createTaskList_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateTaskListRequest> request) async {
    return createTaskList(call, await request);
  }

  $async.Future<$1.TaskList> updateTaskList_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateTaskListRequest> request) async {
    return updateTaskList(call, await request);
  }

  $async.Future<$2.Empty> deleteTaskList_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteTaskListRequest> request) async {
    return deleteTaskList(call, await request);
  }

  $async.Future<$0.ListTaskListsResponse> listTaskLists(
      $grpc.ServiceCall call, $0.ListTaskListsRequest request);
  $async.Future<$1.TaskList> getTaskList(
      $grpc.ServiceCall call, $0.GetTaskListRequest request);
  $async.Future<$1.TaskList> createTaskList(
      $grpc.ServiceCall call, $0.CreateTaskListRequest request);
  $async.Future<$1.TaskList> updateTaskList(
      $grpc.ServiceCall call, $0.UpdateTaskListRequest request);
  $async.Future<$2.Empty> deleteTaskList(
      $grpc.ServiceCall call, $0.DeleteTaskListRequest request);
}
