import 'package:todart_api/api_client.dart';
import 'package:grpc/grpc.dart';

Future<void> main() async {
  final channel = ClientChannel('127.0.0.1',
      port: 50002,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final TaskListServiceClient client = TaskListServiceClient(channel);

  try {
    print('Lets start by creating a new Task List');
    final createResponse = await createTaskListDemo(client, 'Demo List');

    print('Now lets fetch that same taskList by its id: ${createResponse.id}');
    final getResponse = await getTaskListDemo(client, createResponse.id);
  } catch (error) {
    print('An error occured');
    print(error);
  } finally {
    channel.shutdown();
  }
}

Future<TaskList> createTaskListDemo(TaskListServiceClient client,
    [String? listTitle = 'Default List']) async {
  final request = CreateTaskListRequest(tasklist: TaskList(title: listTitle));
  var response = await client.createTaskList(request);
  print(
      'Task list created with title: ${response.title} and id: ${response.id}');
  return response;
}

Future<TaskList> getTaskListDemo(
    TaskListServiceClient client, String taskListId) async {
  final request = GetTaskListRequest(name: taskListId);
  final response = await client.getTaskList(request);
  print('Fetched task list with id: ${response.id}');
  return response;
}
