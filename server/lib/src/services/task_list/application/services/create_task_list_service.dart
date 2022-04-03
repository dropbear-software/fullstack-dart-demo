import 'package:todart_api/api_server.dart';

import '../../domain/task_list_entity.dart';
import '../../domain/task_list_repository.dart';

class CreateTaskListService {
  late final TaskListRepository _taskListRepository;

  CreateTaskListService(this._taskListRepository);

  TaskListEntity execute(TaskList taskList) {
    final identity = _taskListRepository.nextIdentity();
    final result = taskList.freeze();
    result.toProto3Json();
    throw UnimplementedError();
  }
}
