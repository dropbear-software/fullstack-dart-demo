import 'package:logging/logging.dart';

final log = Logger('ApplicationLogger');

void configureLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
