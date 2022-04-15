import 'dart:async';
import 'package:grpc/grpc.dart' as grpc;
import 'package:todart_server/src/extractable/uuid.dart';

import 'environment_parser.dart';
import 'logger.dart';

/// This class aims to make it easy to just specify an runtime environment
/// and it will take care of adding the correct interceptors and in the
/// correct order.
class ApplicationInterceptors {
  static List<grpc.Interceptor> forEnvironment(RuntimeEnvironment env) {
    final List<grpc.Interceptor> interceptors = [];

    switch (env) {
      case RuntimeEnvironment.localDevelopment:
        interceptors.addAll(_getLocalDevInterceptors());
        break;
      case RuntimeEnvironment.cloudDevelopment:
        break;
      case RuntimeEnvironment.notProduction:
        break;
      case RuntimeEnvironment.production:
        break;
      default:
    }

    interceptors.addAll(_getCommonInterceptors());

    return List<grpc.Interceptor>.unmodifiable(interceptors);
  }

  static Iterable<grpc.Interceptor> _getLocalDevInterceptors() {
    return [addRequestId];
  }

  static Iterable<grpc.Interceptor> _getCommonInterceptors() {
    return [logIncomingRequest];
  }
}

FutureOr<grpc.GrpcError?> addRequestId(
    grpc.ServiceCall call, grpc.ServiceMethod method) {
  call.headers?.putIfAbsent('requestID', () => Uuid().generateV4());
  return null;
}

FutureOr<grpc.GrpcError?> logIncomingRequest(
    grpc.ServiceCall call, grpc.ServiceMethod method) {
  log.info(
      'Request Metadata: ${call.clientMetadata} Request Headers: ${call.headers}');
  return null;
}
