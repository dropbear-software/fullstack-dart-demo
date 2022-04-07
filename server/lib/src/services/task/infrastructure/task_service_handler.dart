import 'package:grpc/service_api.dart';
import 'package:todart_api/api_server.dart';

class TaskServiceHandler extends TaskServiceBase {
  @override
  Future<Task> createTask(ServiceCall call, CreateTaskRequest request) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Empty> deleteTask(ServiceCall call, DeleteTaskRequest request) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Task> getTask(ServiceCall call, GetTaskRequest request) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<ListTasksResponse> listTasks(
      ServiceCall call, ListTasksRequest request) {
    // TODO: implement listTasks
    throw UnimplementedError();
  }

  @override
  Future<Task> updateTask(ServiceCall call, UpdateTaskRequest request) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
