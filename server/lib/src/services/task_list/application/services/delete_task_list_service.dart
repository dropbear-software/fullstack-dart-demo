import '../../../../shared/service_locator.dart';
import '../../domain/task_list_repository.dart';

class DeleteTaskListService {
  final TaskListRepository _taskListRepository =
      serviceLocator<TaskListRepository>();

  Future<void> call(String taskListId) async {
    await _taskListRepository.deleteTaskList(taskListId);
  }
}
