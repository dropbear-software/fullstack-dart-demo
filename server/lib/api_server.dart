import 'dart:async';
import 'dart:io';
import 'package:grpc/grpc.dart' as grpc;
import 'package:todart_server/src/shared/application_interceptors.dart';
import 'src/infrastucture_layer.dart';
import 'src/shared/logger.dart';

final List<grpc.Service> _services = [
  TaskListServiceHandler(),
  TaskServiceHandler()
];

class Server {
  late final int _portnumber;
  late final grpc.Server _server;

  Server() {
    _server = grpc.Server(
        _services,
        ApplicationInterceptors(env: RuntimeEnvironment.localDevelopment)
            .interceptors);
    _portnumber = 8080;
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
