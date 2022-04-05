import 'dart:collection';
import 'package:grpc/grpc.dart' show GrpcError;

import 'package:todart_api/api_server.dart';

import '../../../extractable/uuid.dart';
import '../domain/task_list_entity.dart';
import '../domain/task_list_repository.dart';

class TaskListMemoryRepository implements TaskListRepository {
  static final _taskLists = HashMap<String, _TaskListInfo>();

  @override
  String nextIdentity() {
    return Uuid().generateV4();
  }

  @override
  TaskListEntity createTaskList(TaskList list) {
    list.id = nextIdentity();
    _taskLists.putIfAbsent(list.id, () => _TaskListInfo(list));
    return TaskListEntity((b) => b
      ..id = list.id
      ..taskList = list);
  }

  @override
  void deleteTaskList(String taskListId) {
    final result = _taskLists.remove(taskListId);
    if (result == null) {
      throw GrpcError.notFound();
    }
  }

  @override
  TaskList getTaskList(String taskListId) {
    final result = _taskLists[taskListId];

    if (result == null) {
      throw GrpcError.notFound();
    }

    return result.taskList;
  }

  @override
  Iterable<TaskList> listTaskLists(ListTaskListsRequest request) {
    int startSearchingFromPosition = 0;

    // First convert the HashMap into something ordered (Potential Bug here)
    // How would we ever consistently get the same order in this variable?
    final result = List<_TaskListInfo>.unmodifiable(_taskLists.values);

    // TODO: Figure out how to know which position to start searching from

    final taskLists = result
        .sublist(startSearchingFromPosition)
        .map((element) => element.taskList);

    return taskLists.take(request.pageSize);
  }
}

class _TaskListInfo {
  late final TaskList taskList;
  final _tasks = HashMap<String, Task>();

  _TaskListInfo(this.taskList);
}
