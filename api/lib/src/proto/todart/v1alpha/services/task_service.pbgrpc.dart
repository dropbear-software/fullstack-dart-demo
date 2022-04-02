///
//  Generated code. Do not modify.
//  source: todart/v1alpha/services/task_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'task_service.pb.dart' as $0;
import '../resources/task.pb.dart' as $1;
import '../../../google/protobuf/empty.pb.dart' as $2;
export 'task_service.pb.dart';

class TaskServiceClient extends $grpc.Client {
  static final _$listTasks =
      $grpc.ClientMethod<$0.ListTasksRequest, $0.ListTasksResponse>(
          '/todart.v1alpha.services.TaskService/ListTasks',
          ($0.ListTasksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListTasksResponse.fromBuffer(value));
  static final _$getTask = $grpc.ClientMethod<$0.GetTaskRequest, $1.Task>(
      '/todart.v1alpha.services.TaskService/GetTask',
      ($0.GetTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Task.fromBuffer(value));
  static final _$createTask = $grpc.ClientMethod<$0.CreateTaskRequest, $1.Task>(
      '/todart.v1alpha.services.TaskService/CreateTask',
      ($0.CreateTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Task.fromBuffer(value));
  static final _$updateTask = $grpc.ClientMethod<$0.UpdateTaskRequest, $1.Task>(
      '/todart.v1alpha.services.TaskService/UpdateTask',
      ($0.UpdateTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Task.fromBuffer(value));
  static final _$deleteTask =
      $grpc.ClientMethod<$0.DeleteTaskRequest, $2.Empty>(
          '/todart.v1alpha.services.TaskService/DeleteTask',
          ($0.DeleteTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));

  TaskServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListTasksResponse> listTasks(
      $0.ListTasksRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTasks, request, options: options);
  }

  $grpc.ResponseFuture<$1.Task> getTask($0.GetTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTask, request, options: options);
  }

  $grpc.ResponseFuture<$1.Task> createTask($0.CreateTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTask, request, options: options);
  }

  $grpc.ResponseFuture<$1.Task> updateTask($0.UpdateTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTask, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> deleteTask($0.DeleteTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTask, request, options: options);
  }
}

abstract class TaskServiceBase extends $grpc.Service {
  $core.String get $name => 'todart.v1alpha.services.TaskService';

  TaskServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListTasksRequest, $0.ListTasksResponse>(
        'ListTasks',
        listTasks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTasksRequest.fromBuffer(value),
        ($0.ListTasksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTaskRequest, $1.Task>(
        'GetTask',
        getTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTaskRequest.fromBuffer(value),
        ($1.Task value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTaskRequest, $1.Task>(
        'CreateTask',
        createTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTaskRequest.fromBuffer(value),
        ($1.Task value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTaskRequest, $1.Task>(
        'UpdateTask',
        updateTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTaskRequest.fromBuffer(value),
        ($1.Task value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTaskRequest, $2.Empty>(
        'DeleteTask',
        deleteTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteTaskRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListTasksResponse> listTasks_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListTasksRequest> request) async {
    return listTasks(call, await request);
  }

  $async.Future<$1.Task> getTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetTaskRequest> request) async {
    return getTask(call, await request);
  }

  $async.Future<$1.Task> createTask_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateTaskRequest> request) async {
    return createTask(call, await request);
  }

  $async.Future<$1.Task> updateTask_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateTaskRequest> request) async {
    return updateTask(call, await request);
  }

  $async.Future<$2.Empty> deleteTask_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteTaskRequest> request) async {
    return deleteTask(call, await request);
  }

  $async.Future<$0.ListTasksResponse> listTasks(
      $grpc.ServiceCall call, $0.ListTasksRequest request);
  $async.Future<$1.Task> getTask(
      $grpc.ServiceCall call, $0.GetTaskRequest request);
  $async.Future<$1.Task> createTask(
      $grpc.ServiceCall call, $0.CreateTaskRequest request);
  $async.Future<$1.Task> updateTask(
      $grpc.ServiceCall call, $0.UpdateTaskRequest request);
  $async.Future<$2.Empty> deleteTask(
      $grpc.ServiceCall call, $0.DeleteTaskRequest request);
}
