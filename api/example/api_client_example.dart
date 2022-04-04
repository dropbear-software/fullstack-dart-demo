import 'package:todart_api/api_client.dart';
import 'package:grpc/grpc.dart';

final channel = ClientChannel('127.0.0.1',
    port: 50002,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
final TaskListServiceClient client = TaskListServiceClient(channel);

Future<void> main() async {
  try {
    print('Lets start by creating a new Task List');
    final createResponse = await _createTaskListDemo('Demo List');

    print('Now lets fetch that same task list by its id');
    await _getTaskListDemo(createResponse.id);

    print('Now lets delete that same task list');
    await _deleteTaskListDemo(createResponse.id);
  } catch (error) {
    print('An error occured \n $error');
  } finally {
    channel.shutdown();
  }
}

Future<TaskList> _createTaskListDemo(
    [String? listTitle = 'Default List']) async {
  final request = CreateTaskListRequest(tasklist: TaskList(title: listTitle));
  var response = await client.createTaskList(request);
  print(
      'Task list created with title: ${response.title} and id: ${response.id} \n');
  return response;
}

Future<TaskList> _getTaskListDemo(String taskListId) async {
  final request = GetTaskListRequest(name: taskListId);
  final response = await client.getTaskList(request);
  print('Fetched task list with id: ${response.id} \n');
  return response;
}

Future<Empty> _deleteTaskListDemo(String taskListId) async {
  final request = DeleteTaskListRequest(name: taskListId);
  final response = await client.deleteTaskList(request);
  print('Deleted task list with id: $taskListId \n');
  return response;
}
