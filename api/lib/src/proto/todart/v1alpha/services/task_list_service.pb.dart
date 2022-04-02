///
//  Generated code. Do not modify.
//  source: todart/v1alpha/services/task_list_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../resources/task_list.pb.dart' as $1;
import '../../../google/protobuf/field_mask.pb.dart' as $3;

class ListTaskListsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTaskListsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'todart.v1alpha.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parent')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  ListTaskListsRequest._() : super();
  factory ListTaskListsRequest({
    $core.String? parent,
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final _result = create();
    if (parent != null) {
      _result.parent = parent;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (pageToken != null) {
      _result.pageToken = pageToken;
    }
    return _result;
  }
  factory ListTaskListsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTaskListsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTaskListsRequest clone() => ListTaskListsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTaskListsRequest copyWith(void Function(ListTaskListsRequest) updates) => super.copyWith((message) => updates(message as ListTaskListsRequest)) as ListTaskListsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTaskListsRequest create() => ListTaskListsRequest._();
  ListTaskListsRequest createEmptyInstance() => create();
  static $pb.PbList<ListTaskListsRequest> createRepeated() => $pb.PbList<ListTaskListsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTaskListsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTaskListsRequest>(create);
  static ListTaskListsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => clearField(3);
}

class ListTaskListsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTaskListsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'todart.v1alpha.services'), createEmptyInstance: create)
    ..pc<$1.TaskList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasklists', $pb.PbFieldType.PM, subBuilder: $1.TaskList.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  ListTaskListsResponse._() : super();
  factory ListTaskListsResponse({
    $core.Iterable<$1.TaskList>? tasklists,
    $core.String? nextPageToken,
  }) {
    final _result = create();
    if (tasklists != null) {
      _result.tasklists.addAll(tasklists);
    }
    if (nextPageToken != null) {
      _result.nextPageToken = nextPageToken;
    }
    return _result;
  }
  factory ListTaskListsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTaskListsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTaskListsResponse clone() => ListTaskListsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTaskListsResponse copyWith(void Function(ListTaskListsResponse) updates) => super.copyWith((message) => updates(message as ListTaskListsResponse)) as ListTaskListsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTaskListsResponse create() => ListTaskListsResponse._();
  ListTaskListsResponse createEmptyInstance() => create();
  static $pb.PbList<ListTaskListsResponse> createRepeated() => $pb.PbList<ListTaskListsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTaskListsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTaskListsResponse>(create);
  static ListTaskListsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.TaskList> get tasklists => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);
}

class GetTaskListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTaskListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'todart.v1alpha.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  GetTaskListRequest._() : super();
  factory GetTaskListRequest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory GetTaskListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskListRequest clone() => GetTaskListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskListRequest copyWith(void Function(GetTaskListRequest) updates) => super.copyWith((message) => updates(message as GetTaskListRequest)) as GetTaskListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTaskListRequest create() => GetTaskListRequest._();
  GetTaskListRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskListRequest> createRepeated() => $pb.PbList<GetTaskListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskListRequest>(create);
  static GetTaskListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class CreateTaskListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateTaskListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'todart.v1alpha.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parent')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasklistId')
    ..aOM<$1.TaskList>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasklist', subBuilder: $1.TaskList.create)
    ..hasRequiredFields = false
  ;

  CreateTaskListRequest._() : super();
  factory CreateTaskListRequest({
    $core.String? parent,
    $core.String? tasklistId,
    $1.TaskList? tasklist,
  }) {
    final _result = create();
    if (parent != null) {
      _result.parent = parent;
    }
    if (tasklistId != null) {
      _result.tasklistId = tasklistId;
    }
    if (tasklist != null) {
      _result.tasklist = tasklist;
    }
    return _result;
  }
  factory CreateTaskListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTaskListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTaskListRequest clone() => CreateTaskListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTaskListRequest copyWith(void Function(CreateTaskListRequest) updates) => super.copyWith((message) => updates(message as CreateTaskListRequest)) as CreateTaskListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateTaskListRequest create() => CreateTaskListRequest._();
  CreateTaskListRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTaskListRequest> createRepeated() => $pb.PbList<CreateTaskListRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTaskListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTaskListRequest>(create);
  static CreateTaskListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tasklistId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tasklistId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTasklistId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTasklistId() => clearField(2);

  @$pb.TagNumber(3)
  $1.TaskList get tasklist => $_getN(2);
  @$pb.TagNumber(3)
  set tasklist($1.TaskList v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTasklist() => $_has(2);
  @$pb.TagNumber(3)
  void clearTasklist() => clearField(3);
  @$pb.TagNumber(3)
  $1.TaskList ensureTasklist() => $_ensure(2);
}

class UpdateTaskListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateTaskListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'todart.v1alpha.services'), createEmptyInstance: create)
    ..aOM<$1.TaskList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasklist', subBuilder: $1.TaskList.create)
    ..aOM<$3.FieldMask>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateMask', subBuilder: $3.FieldMask.create)
    ..hasRequiredFields = false
  ;

  UpdateTaskListRequest._() : super();
  factory UpdateTaskListRequest({
    $1.TaskList? tasklist,
    $3.FieldMask? updateMask,
  }) {
    final _result = create();
    if (tasklist != null) {
      _result.tasklist = tasklist;
    }
    if (updateMask != null) {
      _result.updateMask = updateMask;
    }
    return _result;
  }
  factory UpdateTaskListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTaskListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTaskListRequest clone() => UpdateTaskListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTaskListRequest copyWith(void Function(UpdateTaskListRequest) updates) => super.copyWith((message) => updates(message as UpdateTaskListRequest)) as UpdateTaskListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateTaskListRequest create() => UpdateTaskListRequest._();
  UpdateTaskListRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTaskListRequest> createRepeated() => $pb.PbList<UpdateTaskListRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTaskListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTaskListRequest>(create);
  static UpdateTaskListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.TaskList get tasklist => $_getN(0);
  @$pb.TagNumber(1)
  set tasklist($1.TaskList v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTasklist() => $_has(0);
  @$pb.TagNumber(1)
  void clearTasklist() => clearField(1);
  @$pb.TagNumber(1)
  $1.TaskList ensureTasklist() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.FieldMask get updateMask => $_getN(1);
  @$pb.TagNumber(2)
  set updateMask($3.FieldMask v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdateMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateMask() => clearField(2);
  @$pb.TagNumber(2)
  $3.FieldMask ensureUpdateMask() => $_ensure(1);
}

class DeleteTaskListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteTaskListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'todart.v1alpha.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  DeleteTaskListRequest._() : super();
  factory DeleteTaskListRequest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory DeleteTaskListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTaskListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTaskListRequest clone() => DeleteTaskListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTaskListRequest copyWith(void Function(DeleteTaskListRequest) updates) => super.copyWith((message) => updates(message as DeleteTaskListRequest)) as DeleteTaskListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteTaskListRequest create() => DeleteTaskListRequest._();
  DeleteTaskListRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskListRequest> createRepeated() => $pb.PbList<DeleteTaskListRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTaskListRequest>(create);
  static DeleteTaskListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

