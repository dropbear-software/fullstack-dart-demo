import 'package:todart_api/api_server.dart';

import 'task_list_entity.dart';

abstract class TaskListRepository {
  String nextIdentity();

  Future<TaskListEntity> createTaskList(TaskList list);

  Future<Iterable<TaskList>> listTaskLists(ListTaskListsRequest request);

  Future<TaskList> getTaskList(String taskListId);

  Future<void> deleteTaskList(String taskListId);

  Future<TaskList> updateTaskList(TaskList taskList);
}
