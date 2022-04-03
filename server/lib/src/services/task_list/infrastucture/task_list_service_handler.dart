import 'package:grpc/service_api.dart';
import 'package:todart_api/api_server.dart';

class TaskListServiceHandler extends TaskListServiceBase {
  @override
  Future<TaskList> createTaskList(
      ServiceCall call, CreateTaskListRequest request) {
    // TODO: implement createTaskList
    throw UnimplementedError();
  }

  @override
  Future<Empty> deleteTaskList(
      ServiceCall call, DeleteTaskListRequest request) {
    // TODO: implement deleteTaskList
    throw UnimplementedError();
  }

  @override
  Future<TaskList> getTaskList(ServiceCall call, GetTaskListRequest request) {
    // TODO: implement getTaskList
    throw UnimplementedError();
  }

  @override
  Future<ListTaskListsResponse> listTaskLists(
      ServiceCall call, ListTaskListsRequest request) {
    // TODO: implement listTaskLists
    throw UnimplementedError();
  }

  @override
  Future<TaskList> updateTaskList(
      ServiceCall call, UpdateTaskListRequest request) {
    // TODO: implement updateTaskList
    throw UnimplementedError();
  }
}
