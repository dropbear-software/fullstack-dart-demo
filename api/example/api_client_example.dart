import 'package:todart_api/api_client.dart';
import 'package:grpc/grpc.dart';

final channel = ClientChannel('127.0.0.1',
    port: 50002,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
final TaskListServiceClient client = TaskListServiceClient(channel);

Future<void> main() async {
  try {
    print('Lets start by creating 3 new Task Lists');
    final createResponse = await _createTaskListDemo();

    print('Now lets fetch that same task list by its id');
    await _getTaskListDemo(createResponse.first.id);

    print('Now lets delete that same task list');
    await _deleteTaskListDemo(createResponse.first.id);

    print('Now lets fetch all of the task lists');
    await _listTaskListsDemo();

    print('Now lets make use of pagination to fetch task lists');
    await _paginateTaskListsDemo();
  } catch (error) {
    print('An error occured \n $error');
  } finally {
    channel.shutdown();
  }
}

Future<List<TaskList>> _createTaskListDemo() async {
  const taskListTitles = ['Work', 'Personal', 'Default'];
  final List<TaskList> taskLists = [];

  for (var listTitle in taskListTitles) {
    final request = CreateTaskListRequest(tasklist: TaskList(title: listTitle));
    var response = await client.createTaskList(request);
    print(
        'Task list created with title: ${response.title} and id: ${response.id}');
    taskLists.add(response);
  }
  print('\n');

  return taskLists;
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

Future<Iterable<TaskList>> _listTaskListsDemo() async {
  final request = ListTaskListsRequest();
  final response = await client.listTaskLists(request);
  print('Fetched a total of ${response.tasklists.length} task lists');
  for (var taskList in response.tasklists) {
    print('Task List id: ${taskList.id} title: ${taskList.title}');
  }
  print('\n');
  return response.tasklists;
}

_paginateTaskListsDemo() async {
  final request = ListTaskListsRequest(pageSize: 1);
  final response = await client.listTaskLists(request);
  print('Fetched a total of ${response.tasklists.length} task lists');
  for (var taskList in response.tasklists) {
    print('Task List id: ${taskList.id} title: ${taskList.title}');
  }

  print('Now lets fetch the next set of results using our page token');
  final newRequest =
      ListTaskListsRequest(pageSize: 1, pageToken: response.nextPageToken);

  final newResponse = await client.listTaskLists(newRequest);
  print('Fetched a total of ${newResponse.tasklists.length} task lists');
  for (var taskList in newResponse.tasklists) {
    print('Task List id: ${taskList.id} title: ${taskList.title}');
  }
}
