import 'dart:collection';
import 'package:dropbear/dropbear.dart';
import 'package:grpc/grpc.dart' show GrpcError;

import 'package:todart_api/api_server.dart';

import '../domain/task_list_entity.dart';
import '../domain/task_list_repository.dart';

class TaskListMemoryRepository implements TaskListRepository {
  static final _database = _Database();

  @override
  Future<TaskListEntity> createTaskList(TaskList list) {
    list.id = nextIdentity();
    _database.taskLists.putIfAbsent(list.id, () => list);
    final entity = TaskListEntity((b) => b
      ..id = list.id
      ..taskList = list);
    return Future.value(entity);
  }

  @override
  Future<void> deleteTaskList(String taskListId) async {
    final result =
        await Future.sync(() => _database.taskLists.remove(taskListId));
    if (result == null) {
      throw GrpcError.notFound();
    }
  }

  @override
  Future<TaskList> getTaskList(String taskListId) {
    final result = _database.taskLists[taskListId];

    if (result == null) {
      throw GrpcError.notFound();
    }

    return Future.value(result);
  }

  @override
  Future<Iterable<TaskList>> listTaskLists(ListTaskListsRequest request) {
    if (request.pageToken.isNotEmpty) {
      // TODO: Consider checking if the pageToken matches any values at all
      // before attempting to return anything

      // Get the taskLists from the "database" and don't start counting until
      // you find one where the id matches the pageToken then only
      // take as many as specified by the `request.pageSize`
      final taskLists = _database.taskLists.values
          .skipWhile((value) => value.id == request.pageToken)
          .take(request.pageSize);
      return Future.value(taskLists);
    } else {
      // Start from the start but only return as many as requested
      return Future.value(_database.taskLists.values.take(request.pageSize));
    }
  }

  @override
  Future<TaskList> updateTaskList(TaskList taskList) {
    _database.taskLists[taskList.id] = taskList;
    return Future.value(taskList);
  }

  @override
  String nextIdentity() {
    final id = ResourceIdentifier();
    return id.toString();
  }
}

class _Database {
  final LinkedHashMap<String, TaskList> taskLists =
      LinkedHashMap<String, TaskList>();
  final LinkedHashMap<String, Task> tasks = LinkedHashMap<String, Task>();
}
