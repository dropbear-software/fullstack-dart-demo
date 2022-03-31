import 'package:counter_api/counter_api.dart';
import 'package:grpc/grpc.dart';

Future<void> main() async {
  final channel = ClientChannel('127.0.0.1',
      port: 50002,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final CounterServiceClient client = CounterServiceClient(channel);

  var result = await client.increaseCount(Empty());
  print('The counter is now ${result.total}');

  result = await client.increaseCount(Empty());
  print('The counter is now ${result.total}');

  result = await client.decreaseCount(Empty());
  print('The counter is now ${result.total}');
}
