import 'dart:io';
import 'package:grpc/grpc.dart' as grpc;
import 'src/infrastucture_layer.dart';

class Server {
  static final int defaultPort = 50002;

  Future<void> start(List<String> args) async {
    // Tell the server which services it should serve
    final server =
        grpc.Server([TaskListServiceHandler(), TaskServiceHandler()]);
    await server.serve(port: defaultPort, address: '127.0.0.1');
    print('Server listening on port ${server.port}...');

    // Watch for Ctrl+C and shut down the server if needed
    ProcessSignal.sigint.watch().listen((signal) {
      if (signal == ProcessSignal.sigint) {
        print("Shutting down");
        server.shutdown();
        exit(0);
      }
    });
  }
}
