import 'package:grpc/grpc.dart' show GrpcError;
import 'package:todart_api/api_server.dart' show CreateTaskListRequest;

extension CreateTaskListRequestValidator on CreateTaskListRequest {
  void validate() {
    _ensureBlankId();
  }

  void _ensureBlankId() {
    if (tasklist.id.isNotEmpty) {
      throw GrpcError.invalidArgument('TaskList must have an empty id');
    }
  }
}
