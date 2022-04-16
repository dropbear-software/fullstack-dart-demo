import 'package:todart_api/api_server.dart' show UpdateTaskListRequest;

import 'shared_validators.dart';

extension UpdateTaskListRequestValidator on UpdateTaskListRequest {
  void validate() {
    validateResourceIdentityString(tasklist.id);
  }
}
