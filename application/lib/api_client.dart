import 'package:counter_api/counter_api.dart';
import 'package:grpc/grpc_web.dart';

class ApiClient {
  static final GrpcWebClientChannel _endpoint =
      GrpcWebClientChannel.xhr(Uri.parse('http://localhost:8080'));

  static final client = CounterServiceClient(_endpoint);
}
