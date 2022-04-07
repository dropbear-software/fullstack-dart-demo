import '../../../../shared/service_locator.dart';
import '../../domain/task_list_repository.dart';

class DeleteTaskListService {
  final TaskListRepository _taskListRepository =
      serviceLocator<TaskListRepository>();

  void call(String taskListId) {
    _taskListRepository.deleteTaskList(taskListId);
  }
}
