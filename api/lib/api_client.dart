library todart.api.client;

// TaskLists
export 'src/proto/todart/v1alpha/services/task_list_service.pbgrpc.dart'
    hide TaskListServiceBase;
export 'src/proto/todart/v1alpha/resources/task_list.pb.dart';

// Tasks
export 'src/proto/todart/v1alpha/services/task_service.pbgrpc.dart'
    hide TaskServiceBase;
export 'src/proto/todart/v1alpha/resources/task.pb.dart';
