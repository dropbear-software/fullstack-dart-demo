import 'package:counter_api/api_client.dart';
import 'package:grpc/grpc.dart';

Future<void> main() async {
  final channel = ClientChannel('127.0.0.1',
      port: 50002,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final TaskListServiceClient client = TaskListServiceClient(channel);

  final request =
      CreateTaskListRequest(tasklist: TaskList(title: 'Default List'));

  try {
    var result = await client.createTaskList(request);
    print('Task list created with title: ${result.title}');
  } catch (error) {
    print('An error occured');
    print(error);
  }
}
