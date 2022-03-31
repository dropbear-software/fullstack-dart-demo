///
//  Generated code. Do not modify.
//  source: counter_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'counter_service.pb.dart' as $1;
export 'counter_service.pb.dart';

class CounterServiceClient extends $grpc.Client {
  static final _$increaseCount = $grpc.ClientMethod<$0.Empty, $1.Counter>(
      '/demo.counter_service.CounterService/IncreaseCount',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Counter.fromBuffer(value));
  static final _$decreaseCount = $grpc.ClientMethod<$0.Empty, $1.Counter>(
      '/demo.counter_service.CounterService/DecreaseCount',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Counter.fromBuffer(value));

  CounterServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Counter> increaseCount($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$increaseCount, request, options: options);
  }

  $grpc.ResponseFuture<$1.Counter> decreaseCount($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$decreaseCount, request, options: options);
  }
}

abstract class CounterServiceBase extends $grpc.Service {
  $core.String get $name => 'demo.counter_service.CounterService';

  CounterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Counter>(
        'IncreaseCount',
        increaseCount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Counter value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Counter>(
        'DecreaseCount',
        decreaseCount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Counter value) => value.writeToBuffer()));
  }

  $async.Future<$1.Counter> increaseCount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return increaseCount(call, await request);
  }

  $async.Future<$1.Counter> decreaseCount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return decreaseCount(call, await request);
  }

  $async.Future<$1.Counter> increaseCount(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Counter> decreaseCount(
      $grpc.ServiceCall call, $0.Empty request);
}
