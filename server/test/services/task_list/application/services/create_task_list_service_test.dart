import 'package:get_it/get_it.dart';
import 'package:todart_api/api_server.dart';
import 'package:todart_server/src/infrastucture_layer.dart';
import 'package:todart_server/src/services/task_list/application/services/create_task_list_service.dart';
import 'package:test/test.dart';
import 'package:todart_server/src/services/task_list/domain/task_list_entity.dart';
import 'package:todart_server/src/services/task_list/domain/task_list_repository.dart';

GetIt serviceLocator = GetIt.instance;
void main() {
  group('Creating a TaskList', () {
    late final CreateTaskListService createTaskListService;

    setUp(() {
      serviceLocator
          .registerSingleton<TaskListRepository>(TaskListMemoryRepository());
      createTaskListService = CreateTaskListService();
    });

    test('calculate', () {
      const taskListTitle = 'Default List';
      final serviceResult =
          createTaskListService(TaskList(title: taskListTitle));

      expect((serviceResult), isA<TaskListEntity>());
      expect((serviceResult.taskList.title), equals(taskListTitle));
    });
  });
}
