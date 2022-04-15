import 'dart:async';
import 'dart:io';
import 'package:grpc/grpc.dart' as grpc;
import 'src/shared/application_interceptors.dart';
import 'src/infrastucture_layer.dart';
import 'src/shared/logger.dart';

final List<grpc.Service> _services = [
  TaskListServiceHandler(),
  TaskServiceHandler()
];

class Server {
  late final RuntimeEnvironment environment;
  late final int _portnumber;
  late final grpc.Server _server;

  Server({required int port, required String env}) {
    _portnumber = port;
    environment = _getEnvFromString(env);
    _server = grpc.Server(
        _services, ApplicationInterceptors(env: environment).interceptors);
  }

  Future<void> start() async {
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

RuntimeEnvironment _getEnvFromString(String env) {
  switch (env.toLowerCase().trim()) {
    case 'local-dev':
      return RuntimeEnvironment.localDevelopment;
    case 'cloud-dev':
      return RuntimeEnvironment.cloudDevelopment;
    case 'non-prod':
      return RuntimeEnvironment.notProduction;
    case 'prod':
      return RuntimeEnvironment.production;
    default:
      throw ArgumentError.value(env, 'env', 'Invalid environment specified');
  }
}
