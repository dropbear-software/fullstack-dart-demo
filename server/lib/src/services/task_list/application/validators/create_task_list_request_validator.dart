import 'package:grpc/grpc.dart' show GrpcError;
import 'package:todart_api/api_server.dart' show CreateTaskListRequest;
import './task_list_validator.dart';

extension CreateTaskListRequestValidator on CreateTaskListRequest {
  void validate() {
    _ensureBlankId();
    _ensureValidTaskList();
  }

  void _ensureBlankId() {
    if (tasklist.id.isNotEmpty) {
      throw GrpcError.invalidArgument('TaskList must have an empty id');
    }
  }

  void _ensureValidTaskList() {
    try {
      tasklist.validate();
    } catch (e) {
      throw GrpcError.invalidArgument('Invalid TaskList specified');
    }
  }
}
