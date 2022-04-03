// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskListEntity extends TaskListEntity {
  @override
  final String id;
  @override
  final TaskList taskList;

  factory _$TaskListEntity([void Function(TaskListEntityBuilder)? updates]) =>
      (new TaskListEntityBuilder()..update(updates)).build();

  _$TaskListEntity._({required this.id, required this.taskList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'TaskListEntity', 'id');
    BuiltValueNullFieldError.checkNotNull(
        taskList, 'TaskListEntity', 'taskList');
  }

  @override
  TaskListEntity rebuild(void Function(TaskListEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskListEntityBuilder toBuilder() =>
      new TaskListEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskListEntity &&
        id == other.id &&
        taskList == other.taskList;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), taskList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaskListEntity')
          ..add('id', id)
          ..add('taskList', taskList))
        .toString();
  }
}

class TaskListEntityBuilder
    implements Builder<TaskListEntity, TaskListEntityBuilder> {
  _$TaskListEntity? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  TaskList? _taskList;
  TaskList? get taskList => _$this._taskList;
  set taskList(TaskList? taskList) => _$this._taskList = taskList;

  TaskListEntityBuilder();

  TaskListEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _taskList = $v.taskList;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskListEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskListEntity;
  }

  @override
  void update(void Function(TaskListEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TaskListEntity build() {
    final _$result = _$v ??
        new _$TaskListEntity._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'TaskListEntity', 'id'),
            taskList: BuiltValueNullFieldError.checkNotNull(
                taskList, 'TaskListEntity', 'taskList'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
