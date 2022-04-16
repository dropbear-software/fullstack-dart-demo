import 'package:grpc/grpc.dart' show GrpcError;
import 'package:dropbear/dropbear.dart' show ResourceIdentifier;

void validateResourceIdentityString(String id) {
  if (!ResourceIdentifier.isValid(id)) {
    throw GrpcError.invalidArgument(
        'TaskList name contains an invalid resource identity');
  }
}
