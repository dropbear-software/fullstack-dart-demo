import 'package:todart_api/api_server.dart';

import '../../domain/task_list_repository.dart';

class GetTaskListService {
  late final TaskListRepository _taskListRepository;

  GetTaskListService(this._taskListRepository);

  TaskList execute(String taskListId) {
    return _taskListRepository.getTaskList(taskListId);
  }
}
