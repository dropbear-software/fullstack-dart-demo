import 'package:todart_api/api_server.dart';

import 'task_list_entity.dart';

abstract class TaskListRepository {
  String nextIdentity();

  TaskListEntity createTaskList(TaskList list);

  Iterable<TaskList> listTaskLists(ListTaskListsRequest request);

  TaskList getTaskList(String taskListId);

  void deleteTaskList(String taskListId);
}
