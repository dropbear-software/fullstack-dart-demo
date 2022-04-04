import 'package:get_it/get_it.dart';
import 'package:todart_server/src/services/task_list/domain/task_list_repository.dart';
import 'package:todart_server/src/services/task_list/infrastucture/task_list_memory_repository.dart';

GetIt serviceLocator = GetIt.instance;

void setup() {
  serviceLocator
      .registerSingleton<TaskListRepository>(TaskListMemoryRepository());
}
