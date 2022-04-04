import 'package:grpc/service_api.dart';
import 'package:todart_api/api_server.dart';
import 'package:todart_server/src/services/task_list/application/services/create_task_list_service.dart';
import 'package:todart_server/src/services/task_list/application/services/get_task_list_service.dart';
import 'package:todart_server/src/shared/logger.dart';

import '../application/services/delete_task_list_service.dart';

class TaskListServiceHandler extends TaskListServiceBase {
  final _createTaskListService = CreateTaskListService();
  final _getTaskListService = GetTaskListService();
  final _deleteTaskListService = DeleteTaskListService();

  @override
  Future<TaskList> createTaskList(
      ServiceCall call, CreateTaskListRequest request) {
    final result = _createTaskListService(request.tasklist);
    log.info('Task List created with id ${result.id}');
    return Future.value(result.taskList);
  }

  @override
  Future<Empty> deleteTaskList(
      ServiceCall call, DeleteTaskListRequest request) {
    _deleteTaskListService(request.name);
    log.info('Task List deleted with id ${request.name}');
    return Future.value(Empty());
  }

  @override
  Future<TaskList> getTaskList(ServiceCall call, GetTaskListRequest request) {
    final result = _getTaskListService(request.name);
    log.info('Task List fetched with id ${result.id}');
    return Future.value(result);
  }

  @override
  Future<ListTaskListsResponse> listTaskLists(
      ServiceCall call, ListTaskListsRequest request) {
    // TODO: implement listTaskLists
    throw UnimplementedError();
  }

  @override
  Future<TaskList> updateTaskList(
      ServiceCall call, UpdateTaskListRequest request) {
    // TODO: implement updateTaskList
    throw UnimplementedError();
  }
}
