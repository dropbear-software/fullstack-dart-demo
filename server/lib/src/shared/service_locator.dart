import 'package:get_it/get_it.dart';
import 'package:todart_server/src/services/task_list/domain/task_list_repository.dart';
import 'package:todart_server/src/services/task_list/infrastucture/task_list_memory_repository.dart';
import 'package:todart_server/src/shared/logger.dart';

GetIt serviceLocator = GetIt.instance;
void setup() {
  configureLogging();
  serviceLocator
      .registerSingleton<TaskListRepository>(TaskListMemoryRepository());
}
