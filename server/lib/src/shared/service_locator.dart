import 'package:get_it/get_it.dart';
import 'package:todart_server/src/services/task_list/domain/task_list_repository.dart';
import 'package:todart_server/src/services/task_list/infrastucture/task_list_memory_repository.dart';
import 'package:todart_server/src/shared/environment_parser.dart';
import 'package:todart_server/src/shared/logger.dart';

GetIt serviceLocator = GetIt.instance;
void setup(String env) {
  final environment = RuntimeEnvParser.getEnvFromString(env);
  configureLogging();
  log.info('Configuring services to run in ${environment.name} mode');
  serviceLocator
      .registerSingleton<TaskListRepository>(TaskListMemoryRepository());
}
