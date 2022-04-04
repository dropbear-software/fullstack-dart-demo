import 'package:todart_api/api_server.dart';

import '../../domain/task_list_entity.dart';
import '../../domain/task_list_repository.dart';
import '../../../../shared/service_locator.dart';

class CreateTaskListService {
  final TaskListRepository _taskListRepository =
      serviceLocator<TaskListRepository>();

  TaskListEntity call(TaskList taskList) {
    return _taskListRepository.createTaskList(taskList);
  }
}
