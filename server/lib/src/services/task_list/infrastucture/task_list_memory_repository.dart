import 'dart:collection';
import 'package:grpc/grpc.dart' show GrpcError;

import 'package:todart_api/api_server.dart';

import '../../../extractable/uuid.dart';
import '../domain/task_list_entity.dart';
import '../domain/task_list_repository.dart';

class TaskListMemoryRepository implements TaskListRepository {
  static final _database = _Database();

  @override
  TaskListEntity createTaskList(TaskList list) {
    list.id = nextIdentity();
    _database.taskLists.putIfAbsent(list.id, () => list);
    return TaskListEntity((b) => b
      ..id = list.id
      ..taskList = list);
  }

  @override
  void deleteTaskList(String taskListId) {
    final result = _database.taskLists.remove(taskListId);
    if (result == null) {
      throw GrpcError.notFound();
    }
  }

  @override
  TaskList getTaskList(String taskListId) {
    final result = _database.taskLists[taskListId];

    if (result == null) {
      throw GrpcError.notFound();
    }

    return result;
  }

  @override
  Iterable<TaskList> listTaskLists(ListTaskListsRequest request) {
    if (request.pageToken.isNotEmpty) {
      // TODO: Consider checking if the pageToken matches any values at all
      // before attempting to return anything

      // Get the taskLists from the "database" and don't start counting until
      // you find one where the id matches the pageToken then only
      // take as many as specified by the `request.pageSize`
      return _database.taskLists.values
          .skipWhile((value) => value.id == request.pageToken)
          .take(request.pageSize);
    } else {
      // Start from the start but only return as many as requested
      return _database.taskLists.values.take(request.pageSize);
    }
  }

  @override
  String nextIdentity() {
    return Uuid().generateV4();
  }
}

class _Database {
  final LinkedHashMap<String, TaskList> taskLists =
      LinkedHashMap<String, TaskList>();
  final LinkedHashMap<String, Task> tasks = LinkedHashMap<String, Task>();
}
