import 'dart:async';
import 'dart:io';
import 'package:grpc/grpc.dart' as grpc;
import 'src/infrastucture_layer.dart';
import 'src/shared/logger.dart';

final List<grpc.Service> _services = [
  TaskListServiceHandler(),
  TaskServiceHandler()
];

List<grpc.Interceptor> _interceptors = [
  _ApplicationInterceptors.loggerOne,
  _ApplicationInterceptors.loggerTwo
];

class Server {
  late final int _portnumber;
  late final grpc.Server _server;

  Server() {
    _server = grpc.Server(_services, _interceptors);
    _portnumber = 50002;
  }

  Future<void> start(List<String> args) async {
    await _server.serve(port: _portnumber, address: '127.0.0.1');
    log.info('Server listening on port ${_server.port}...');

    // Watch for Ctrl+C and shut down the server if needed
    ProcessSignal.sigint.watch().listen((signal) {
      if (signal == ProcessSignal.sigint) {
        stop();
      }
    });
  }

  Future<void> stop() async {
    log.info("Interupt signal received, shutting down");
    await _server.shutdown();
    exit(0);
  }
}

class _ApplicationInterceptors {
  static FutureOr<grpc.GrpcError?> loggerOne(
      grpc.ServiceCall call, grpc.ServiceMethod method) {
    log.info('Incoming request for ${method.name}');
    return null;
  }

  static FutureOr<grpc.GrpcError?> loggerTwo(
      grpc.ServiceCall call, grpc.ServiceMethod method) {
    log.info('Call info: ${call.clientMetadata}');
    return null;
  }
}
