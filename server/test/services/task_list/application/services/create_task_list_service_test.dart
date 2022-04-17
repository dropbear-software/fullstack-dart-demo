import 'package:dropbear/dropbear.dart';
import 'package:get_it/get_it.dart';
import 'package:todart_api/api_server.dart';
import 'package:todart_server/src/infrastucture_layer.dart';
import 'package:todart_server/src/services/task_list/application/services/create_task_list_service.dart';
import 'package:todart_server/src/services/task_list/domain/task_list_entity.dart';
import 'package:todart_server/src/services/task_list/domain/task_list_repository.dart';
import 'package:test/test.dart';

GetIt serviceLocator = GetIt.instance;
void main() {
  group('Creating a TaskList', () {
    serviceLocator
        .registerSingleton<TaskListRepository>(TaskListMemoryRepository());
    final CreateTaskListService createTaskListService = CreateTaskListService();

    // Any code that should run before each test
    setUp(() {});

    group('with invalid data', () {
      test('will not work without a TaskList title', () async {
        await expectLater(() => createTaskListService(TaskList()),
            throwsA(isA<ArgumentError>()));
      });
    });

    group('with valid data', () {
      const taskListTitle = 'Default List';
      test('returns a TaskListEntity', () async {
        final serviceResult =
            await createTaskListService(TaskList(title: taskListTitle));

        expect(serviceResult, isA<TaskListEntity>());
      });

      test('correctly sets the specified properties', () async {
        final serviceResult =
            await createTaskListService(TaskList(title: taskListTitle));

        expect((serviceResult.taskList.title), equals(taskListTitle));
      });

      test('assigns a valid identifier ', () async {
        final serviceResult =
            await createTaskListService(TaskList(title: taskListTitle));

        expect((serviceResult.taskList.id), isNotNull);
        expect((ResourceIdentifier.isValid(serviceResult.taskList.id)), isTrue);
      });

      test('assigns a valid name ', () async {
        final serviceResult =
            await createTaskListService(TaskList(title: taskListTitle));

        expect((serviceResult.taskList.name), isNotNull);
        expect((serviceResult.taskList.name),
            equals('tasklists/${serviceResult.taskList.id}'));
      });

      test('returns an immutable TaskList', () async {
        final serviceResult =
            await createTaskListService(TaskList(title: taskListTitle));

        expect(() => serviceResult.taskList.title = 'New List',
            throwsA(isA<UnsupportedError>()));
      });
    });
  });
}
