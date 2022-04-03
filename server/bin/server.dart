import 'package:todart_server/api_server.dart' as api_server;

Future<void> main(List<String> args) async {
  await api_server.Server().start(args);
}
