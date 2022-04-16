import 'package:todart_api/api_server.dart';
import 'package:todart_server/src/shared/service_locator.dart';

import '../../domain/task_list_repository.dart';

class GetTaskListService {
  final TaskListRepository _taskListRepository =
      serviceLocator<TaskListRepository>();

  Future<TaskList> call(String taskListId) async {
    return await _taskListRepository.getTaskList(taskListId);
  }
}
