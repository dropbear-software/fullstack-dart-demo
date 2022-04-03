import 'task_list_entity.dart';

abstract class TaskListRepository {
  String nextIdentity();
  void save(TaskListEntity tasklist);

  TaskListEntity getById(String id);
}
