import 'dart:async';
import 'package:grpc/grpc.dart' as grpc;

import 'logger.dart';

enum runtimeEnvironment {
  localDevelopment,
  cloudDevelopment,
  notProduction,
  production
}

/// This class aims to make it easy to just specify an runtime environment
/// and it will take care of adding the correct interceptors and in the
/// correct order.
class ApplicationInterceptors {
  final List<grpc.Interceptor> _interceptors = [];

  ApplicationInterceptors({required runtimeEnvironment env}) {
    switch (env) {
      case runtimeEnvironment.localDevelopment:
        _addLocalDevInterceptors();
        _addCommonInterceptors();
        break;
      case runtimeEnvironment.cloudDevelopment:
        _addCloudDevInterceptors();
        _addCommonInterceptors();
        break;
      default:
    }
  }

  /// Return an unmodifiable list of [Interceptors] for the environment
  List<grpc.Interceptor> get interceptors =>
      List<grpc.Interceptor>.unmodifiable(_interceptors);

  void _addCommonInterceptors() {
    _interceptors.addAll([logIncomingRequest]);
  }

  void _addLocalDevInterceptors() {
    _interceptors.addAll([addRequestId]);
  }

  void _addCloudDevInterceptors() {}
}

FutureOr<grpc.GrpcError?> addRequestId(
    grpc.ServiceCall call, grpc.ServiceMethod method) {
  call.headers?.putIfAbsent('requestID', () => 'abc123');
  return null;
}

FutureOr<grpc.GrpcError?> logIncomingRequest(
    grpc.ServiceCall call, grpc.ServiceMethod method) {
  log.info(
      'Request Metadata: ${call.clientMetadata} Request Headers: ${call.headers}');
  return null;
}
