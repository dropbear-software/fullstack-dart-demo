import 'package:built_value/built_value.dart';
import 'package:todart_api/api_server.dart';

part 'task_list_entity.g.dart';

abstract class TaskListEntity
    implements Built<TaskListEntity, TaskListEntityBuilder> {
  TaskListEntity._();

  factory TaskListEntity([void Function(TaskListEntityBuilder b) updates]) =
      _$TaskListEntity;

  String get id;

  TaskList get taskList;
}
