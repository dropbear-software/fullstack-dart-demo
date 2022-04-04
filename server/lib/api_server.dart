import 'dart:io';
import 'package:grpc/grpc.dart' as grpc;
import 'src/infrastucture_layer.dart';
import 'src/shared/logger.dart';

class Server {
  static final int defaultPort = 50002;

  Future<void> start(List<String> args) async {
    // Tell the server which services it should serve
    final server =
        grpc.Server([TaskListServiceHandler(), TaskServiceHandler()]);
    await server.serve(port: defaultPort, address: '127.0.0.1');
    log.info('Server listening on port ${server.port}...');

    // Watch for Ctrl+C and shut down the server if needed
    ProcessSignal.sigint.watch().listen((signal) {
      if (signal == ProcessSignal.sigint) {
        log.info("Interupt signal received, shutting down");
        server.shutdown();
        exit(0);
      }
    });
  }
}
