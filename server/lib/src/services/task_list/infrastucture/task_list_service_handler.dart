import 'dart:convert';

import 'package:grpc/service_api.dart';
import 'package:todart_api/api_server.dart';
import 'package:todart_server/src/shared/logger.dart';
import 'package:todart_server/src/services/task_list/application/services.dart';
import 'package:todart_server/src/services/task_list/application/validators.dart';

class TaskListServiceHandler extends TaskListServiceBase {
  final _createTaskListService = CreateTaskListService();
  final _getTaskListService = GetTaskListService();
  final _deleteTaskListService = DeleteTaskListService();
  final _listTaskListsService = ListTaskListService();

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

  /// See https://google.aip.dev/158 for guidance on Pagination
  @override
  Future<ListTaskListsResponse> listTaskLists(
      ServiceCall call, ListTaskListsRequest request) {
    request.validate();

    final taskLists = _listTaskListsService(request);
    log.info('Fetched all task lists');

    // Tell it the record it should start searching from next time
    final nextPageToken = ListTaskListsRequest(
        pageSize: request.pageSize, pageToken: taskLists.last.id);
    // Encode it in a Base64 encoded binary representation so clients
    // can't easily reverse engineer it. Longer term we should sign
    // the nextPageToken to get some cryptographically valid guarantees
    final result = ListTaskListsResponse(
        tasklists: taskLists,
        nextPageToken: base64.encode(nextPageToken.writeToBuffer()));
    return Future.value(result);
  }

  @override
  Future<TaskList> updateTaskList(
      ServiceCall call, UpdateTaskListRequest request) {
    // TODO: implement updateTaskList
    throw UnimplementedError();
  }
}
