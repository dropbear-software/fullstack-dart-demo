import 'dart:io';
import 'package:api_server/src/counter_entity.dart';
import 'package:grpc/grpc.dart' as grpc;

import './src/counter_service.dart';

class Server {
  static final int defaultPort = 50002;
  static final counter = CounterEntity();

  Future<void> start(List<String> args) async {
    // Tell the server which services it should serve
    final server = grpc.Server([CounterService(counter)]);
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
