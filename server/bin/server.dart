import 'dart:io';

import 'package:args/args.dart';
import 'package:todart_server/api_server.dart' as api_server;
import 'package:todart_server/src/shared/service_locator.dart';

Future<void> main(List<String> args) async {
  var parser = ArgParser();
  parser.addOption('port', abbr: 'p', defaultsTo: '8080');
  parser.addOption('env',
      abbr: 'e',
      defaultsTo: 'local-dev',
      help: 'The runtime environment',
      allowed: ['local-dev', 'cloud-dev', 'non-prod', 'prod']);

  try {
    final results = parser.parse(args);
    setup();
    final server = api_server.Server(
        env: results['env'], port: int.parse(results['port']));
    await server.start();
  } catch (e) {
    print(e);
    print(parser.usage);
    // Exit code 64 indicates a usage error.
    exit(64);
  }

  // print(results['env']);
  // print(parser.usage);
}
