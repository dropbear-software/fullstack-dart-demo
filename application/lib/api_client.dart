import 'package:todart_api/api_client.dart';
import 'package:grpc/grpc_web.dart';

class ApiClient {
  static final GrpcWebClientChannel _endpoint =
      GrpcWebClientChannel.xhr(Uri.parse('http://localhost:8080'));

  static final client = TaskServiceClient(_endpoint);
}
