import 'package:dropbear/dropbear.dart' show ResourceIdentifier;
import 'package:get_it/get_it.dart';
import 'package:todart_api/api_server.dart';
import 'package:grpc/grpc.dart' show GrpcError;

extension ResourceIdentityValidator on GetTaskListRequest {
  void validate() {
    throwIf(
        !ResourceIdentifier.isValid(name),
        GrpcError.invalidArgument(
            'TaskList name contains an invalid resource identity'));
  }
}
