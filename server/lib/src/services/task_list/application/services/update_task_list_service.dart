import 'package:todart_api/api_server.dart';
import 'package:todart_server/src/shared/service_locator.dart';

import '../../domain/task_list_repository.dart';

// See https://google.aip.dev/134
class UpdateTaskListService {
  final TaskListRepository _taskListRepository =
      serviceLocator<TaskListRepository>();

  Future<TaskList> call(UpdateTaskListRequest request) async {
    final mask = request.updateMask;
    final updatedTaskList = request.tasklist;

    // Fetch the item we want to update as it currently exists
    final originalTaskList =
        await _taskListRepository.getTaskList(request.tasklist.id);

    // Take the updatedTaskList and filter it for only the allowed values
    final filteredTaskList = _filterIncomingUpdate(mask, updatedTaskList);

    // Merge the filtered version with the original
    originalTaskList.mergeFromMessage(filteredTaskList);

    return _taskListRepository.updateTaskList(originalTaskList);
  }

  // Takes a TaskList and a FieldMask and returns a new TaskList that
  // ONLY contains the values that it is allowed to update according
  // to the field mask see: https://google.aip.dev/161
  TaskList _filterIncomingUpdate(FieldMask mask, TaskList updatedTaskList) {
    // TODO: Think about security here in the form of an allowlist or something
    // also need to think about how to handle nested FieldMask messages

    // Create a new TaskList that we can build upon
    final filteredTaskList = TaskList();

    // Loop through all the field mask paths and see if they match the
    // fields on the TaskList. If so add them to the TaskList we created
    // using the values from the updatedTaskList we passed in
    for (var path in mask.paths) {
      final tagNumber = filteredTaskList.getTagNumber(path);
      if (tagNumber != null) {
        filteredTaskList.setField(
            tagNumber, updatedTaskList.getField(tagNumber));
      }
    }

    return filteredTaskList;
  }
}
