import 'dart:convert';

import 'package:grpc/service_api.dart';
import 'package:todart_api/api_server.dart';

import '../../../shared/logger.dart';
import '../application/services.dart';
import '../application/validators.dart';

class TaskListServiceHandler extends TaskListServiceBase {
  final _createTaskListService = CreateTaskListService();
  final _getTaskListService = GetTaskListService();
  final _deleteTaskListService = DeleteTaskListService();
  final _listTaskListsService = ListTaskListService();
  final _updateTaskListService = UpdateTaskListService();

  @override
  Future<TaskList> createTaskList(
      ServiceCall call, CreateTaskListRequest request) async {
    request.validate();
    final result = await _createTaskListService(request.tasklist);
    log.info('Task List created with id ${result.id}');
    return result.taskList;
  }

  @override
  Future<Empty> deleteTaskList(
      ServiceCall call, DeleteTaskListRequest request) async {
    request.validate();
    await _deleteTaskListService(request.name);
    log.info('Task List deleted with id ${request.name}');
    return Empty();
  }

  @override
  Future<TaskList> getTaskList(
      ServiceCall call, GetTaskListRequest request) async {
    request.validate();
    final result = await _getTaskListService(request.name);
    log.info('Task List fetched with id ${result.id}');
    return result;
  }

  /// See https://google.aip.dev/158 for guidance on Pagination
  @override
  Future<ListTaskListsResponse> listTaskLists(
      ServiceCall call, ListTaskListsRequest request) async {
    request.validate();

    final taskLists = await _listTaskListsService(request);
    log.info('Fetched ${taskLists.length} task lists');

    // Tell it the record it should start searching from next time
    final nextPageToken = ListTaskListsRequest(
        pageSize: request.pageSize, pageToken: taskLists.last.id);
    // Encode it in a Base64 encoded binary representation so clients
    // can't easily reverse engineer it. Longer term we should sign
    // the nextPageToken to get some cryptographically valid guarantees
    final result = ListTaskListsResponse(
        tasklists: taskLists,
        nextPageToken: base64.encode(nextPageToken.writeToBuffer()));
    return result;
  }

  @override
  Future<TaskList> updateTaskList(
      ServiceCall call, UpdateTaskListRequest request) async {
    request.validate();
    final result = await _updateTaskListService(request);
    log.info('Updated TaskList with id ${result.id}');
    return result;
  }
}
