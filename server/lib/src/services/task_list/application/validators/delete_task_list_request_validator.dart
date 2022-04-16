import 'package:todart_api/api_server.dart' show DeleteTaskListRequest;

import 'shared_validators.dart';

extension DeleteTaskListRequestValidator on DeleteTaskListRequest {
  void validate() {
    validateResourceIdentityString(name);
  }
}
