import '../domain/task_list_entity.dart';
import '../domain/task_list_repository.dart';

class TaskListMemoryRepository implements TaskListRepository {
  @override
  TaskListEntity getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  String nextIdentity() {
    // TODO: implement nextIdentity
    throw UnimplementedError();
  }

  @override
  void save(TaskListEntity tasklist) {
    // TODO: implement save
  }
}
