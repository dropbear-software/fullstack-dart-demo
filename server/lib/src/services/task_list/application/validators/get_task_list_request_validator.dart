import 'package:todart_api/api_server.dart' show GetTaskListRequest;

import 'shared_validators.dart';

extension GetTaskListRequestValidator on GetTaskListRequest {
  void validate() {
    validateResourceIdentityString(name);
  }
}
