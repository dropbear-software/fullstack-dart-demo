import 'dart:async';
import 'dart:io';
import 'package:grpc/grpc.dart' as grpc;
import 'src/shared/application_interceptors.dart';
import 'src/infrastucture_layer.dart';
import 'src/shared/environment_parser.dart';
import 'src/shared/logger.dart';

final List<grpc.Service> _services = [
  TaskListServiceHandler(),
  TaskServiceHandler()
];

class Server {
  late final RuntimeEnvironment _environment;
  late final int _portnumber;
  late final grpc.Server _server;

  Server({required int port, required String env}) {
    _portnumber = port;
    _environment = RuntimeEnvParser.getEnvFromString(env);
    _server = grpc.Server(
        _services, ApplicationInterceptors.forEnvironment(_environment));
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
