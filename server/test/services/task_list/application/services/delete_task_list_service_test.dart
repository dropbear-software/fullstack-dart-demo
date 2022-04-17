import 'package:get_it/get_it.dart';
import 'package:todart_api/api_server.dart';
import 'package:todart_server/src/infrastucture_layer.dart';
import 'package:todart_server/src/services/task_list/application/services/create_task_list_service.dart';
import 'package:todart_server/src/services/task_list/application/services/delete_task_list_service.dart';
import 'package:todart_server/src/services/task_list/application/services/get_task_list_service.dart';
import 'package:todart_server/src/services/task_list/domain/task_list_repository.dart';
import 'package:test/test.dart';
import 'package:grpc/grpc.dart' show GrpcError;

GetIt serviceLocator = GetIt.instance;
void main() {
  group('Deleting a TaskList', () {
    serviceLocator
        .registerSingleton<TaskListRepository>(TaskListMemoryRepository());
    final DeleteTaskListService deleteTaskListService = DeleteTaskListService();

    group('with invalid data', () {
      test('will not work without a TaskList title', () async {
        await expectLater(() => deleteTaskListService('invalidTaskId'),
            throwsA(isA<GrpcError>()));
      });
    });

    group('with valid data', () {
      late final TaskList taskList;
      final GetTaskListService getTaskListService = GetTaskListService();

      // Any code that should run before each test
      setUp(() async {
        final CreateTaskListService createTaskListService =
            CreateTaskListService();
        final serviceResult =
            await createTaskListService(TaskList(title: 'Example Task List'));
        taskList = serviceResult.taskList;
      });

      test('deletes the task list correctly', () async {
        final fetchTaskListResult = await getTaskListService(taskList.id);

        expect((fetchTaskListResult), equals(taskList));

        await deleteTaskListService(taskList.id);

        await expectLater(
            () => getTaskListService(taskList.id), throwsA(isA<GrpcError>()));
      });
    });
  });
}
