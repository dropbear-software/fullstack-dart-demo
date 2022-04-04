import 'package:todart_server/api_server.dart' as api_server;
import 'package:todart_server/src/service_locator.dart';

Future<void> main(List<String> args) async {
  setup();
  await api_server.Server().start(args);
}
