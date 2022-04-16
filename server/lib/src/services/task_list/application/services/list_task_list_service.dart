import 'package:todart_api/api_server.dart';
import 'package:todart_server/src/shared/service_locator.dart';

import '../../domain/task_list_repository.dart';

class ListTaskListService {
  final TaskListRepository _taskListRepository =
      serviceLocator<TaskListRepository>();

  Future<Iterable<TaskList>> call(ListTaskListsRequest request) async {
    return await _taskListRepository.listTaskLists(request);
  }
}
