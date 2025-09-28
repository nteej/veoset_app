// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaintenanceTask _$MaintenanceTaskFromJson(Map<String, dynamic> json) {
  return _MaintenanceTask.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceTask {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_notes')
  String? get completionNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_to')
  int? get assignedTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_user_name')
  String? get assignedUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_duration')
  int? get estimatedDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_duration')
  int? get actualDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  DateTime? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  DateTime? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String>? get requiredTools => throw _privateConstructorUsedError;
  List<String>? get materials => throw _privateConstructorUsedError;
  List<String>? get attachments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaintenanceTaskCopyWith<MaintenanceTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceTaskCopyWith<$Res> {
  factory $MaintenanceTaskCopyWith(
          MaintenanceTask value, $Res Function(MaintenanceTask) then) =
      _$MaintenanceTaskCopyWithImpl<$Res, MaintenanceTask>;
  @useResult
  $Res call(
      {int id,
      String title,
      String status,
      String priority,
      int assetId,
      String assetName,
      String? description,
      String? notes,
      @JsonKey(name: 'completion_notes') String? completionNotes,
      @JsonKey(name: 'assigned_to') int? assignedTo,
      @JsonKey(name: 'assigned_user_name') String? assignedUserName,
      @JsonKey(name: 'estimated_duration') int? estimatedDuration,
      @JsonKey(name: 'actual_duration') int? actualDuration,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'started_at') DateTime? startedAt,
      @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      List<String>? requiredTools,
      List<String>? materials,
      List<String>? attachments});
}

/// @nodoc
class _$MaintenanceTaskCopyWithImpl<$Res, $Val extends MaintenanceTask>
    implements $MaintenanceTaskCopyWith<$Res> {
  _$MaintenanceTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? status = null,
    Object? priority = null,
    Object? assetId = null,
    Object? assetName = null,
    Object? description = freezed,
    Object? notes = freezed,
    Object? completionNotes = freezed,
    Object? assignedTo = freezed,
    Object? assignedUserName = freezed,
    Object? estimatedDuration = freezed,
    Object? actualDuration = freezed,
    Object? dueDate = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? requiredTools = freezed,
    Object? materials = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedUserName: freezed == assignedUserName
          ? _value.assignedUserName
          : assignedUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDuration: freezed == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      actualDuration: freezed == actualDuration
          ? _value.actualDuration
          : actualDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requiredTools: freezed == requiredTools
          ? _value.requiredTools
          : requiredTools // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      materials: freezed == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceTaskImplCopyWith<$Res>
    implements $MaintenanceTaskCopyWith<$Res> {
  factory _$$MaintenanceTaskImplCopyWith(_$MaintenanceTaskImpl value,
          $Res Function(_$MaintenanceTaskImpl) then) =
      __$$MaintenanceTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String status,
      String priority,
      int assetId,
      String assetName,
      String? description,
      String? notes,
      @JsonKey(name: 'completion_notes') String? completionNotes,
      @JsonKey(name: 'assigned_to') int? assignedTo,
      @JsonKey(name: 'assigned_user_name') String? assignedUserName,
      @JsonKey(name: 'estimated_duration') int? estimatedDuration,
      @JsonKey(name: 'actual_duration') int? actualDuration,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'started_at') DateTime? startedAt,
      @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      List<String>? requiredTools,
      List<String>? materials,
      List<String>? attachments});
}

/// @nodoc
class __$$MaintenanceTaskImplCopyWithImpl<$Res>
    extends _$MaintenanceTaskCopyWithImpl<$Res, _$MaintenanceTaskImpl>
    implements _$$MaintenanceTaskImplCopyWith<$Res> {
  __$$MaintenanceTaskImplCopyWithImpl(
      _$MaintenanceTaskImpl _value, $Res Function(_$MaintenanceTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? status = null,
    Object? priority = null,
    Object? assetId = null,
    Object? assetName = null,
    Object? description = freezed,
    Object? notes = freezed,
    Object? completionNotes = freezed,
    Object? assignedTo = freezed,
    Object? assignedUserName = freezed,
    Object? estimatedDuration = freezed,
    Object? actualDuration = freezed,
    Object? dueDate = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? requiredTools = freezed,
    Object? materials = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_$MaintenanceTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedUserName: freezed == assignedUserName
          ? _value.assignedUserName
          : assignedUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDuration: freezed == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      actualDuration: freezed == actualDuration
          ? _value.actualDuration
          : actualDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requiredTools: freezed == requiredTools
          ? _value._requiredTools
          : requiredTools // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      materials: freezed == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceTaskImpl implements _MaintenanceTask {
  const _$MaintenanceTaskImpl(
      {required this.id,
      required this.title,
      required this.status,
      required this.priority,
      required this.assetId,
      required this.assetName,
      this.description,
      this.notes,
      @JsonKey(name: 'completion_notes') this.completionNotes,
      @JsonKey(name: 'assigned_to') this.assignedTo,
      @JsonKey(name: 'assigned_user_name') this.assignedUserName,
      @JsonKey(name: 'estimated_duration') this.estimatedDuration,
      @JsonKey(name: 'actual_duration') this.actualDuration,
      @JsonKey(name: 'due_date') this.dueDate,
      @JsonKey(name: 'started_at') this.startedAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      final List<String>? requiredTools,
      final List<String>? materials,
      final List<String>? attachments})
      : _requiredTools = requiredTools,
        _materials = materials,
        _attachments = attachments;

  factory _$MaintenanceTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceTaskImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String status;
  @override
  final String priority;
  @override
  final int assetId;
  @override
  final String assetName;
  @override
  final String? description;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'completion_notes')
  final String? completionNotes;
  @override
  @JsonKey(name: 'assigned_to')
  final int? assignedTo;
  @override
  @JsonKey(name: 'assigned_user_name')
  final String? assignedUserName;
  @override
  @JsonKey(name: 'estimated_duration')
  final int? estimatedDuration;
  @override
  @JsonKey(name: 'actual_duration')
  final int? actualDuration;
  @override
  @JsonKey(name: 'due_date')
  final DateTime? dueDate;
  @override
  @JsonKey(name: 'started_at')
  final DateTime? startedAt;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<String>? _requiredTools;
  @override
  List<String>? get requiredTools {
    final value = _requiredTools;
    if (value == null) return null;
    if (_requiredTools is EqualUnmodifiableListView) return _requiredTools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _materials;
  @override
  List<String>? get materials {
    final value = _materials;
    if (value == null) return null;
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _attachments;
  @override
  List<String>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MaintenanceTask(id: $id, title: $title, status: $status, priority: $priority, assetId: $assetId, assetName: $assetName, description: $description, notes: $notes, completionNotes: $completionNotes, assignedTo: $assignedTo, assignedUserName: $assignedUserName, estimatedDuration: $estimatedDuration, actualDuration: $actualDuration, dueDate: $dueDate, startedAt: $startedAt, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, requiredTools: $requiredTools, materials: $materials, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.assignedUserName, assignedUserName) ||
                other.assignedUserName == assignedUserName) &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            (identical(other.actualDuration, actualDuration) ||
                other.actualDuration == actualDuration) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._requiredTools, _requiredTools) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        status,
        priority,
        assetId,
        assetName,
        description,
        notes,
        completionNotes,
        assignedTo,
        assignedUserName,
        estimatedDuration,
        actualDuration,
        dueDate,
        startedAt,
        completedAt,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_requiredTools),
        const DeepCollectionEquality().hash(_materials),
        const DeepCollectionEquality().hash(_attachments)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceTaskImplCopyWith<_$MaintenanceTaskImpl> get copyWith =>
      __$$MaintenanceTaskImplCopyWithImpl<_$MaintenanceTaskImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceTaskImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceTask implements MaintenanceTask {
  const factory _MaintenanceTask(
      {required final int id,
      required final String title,
      required final String status,
      required final String priority,
      required final int assetId,
      required final String assetName,
      final String? description,
      final String? notes,
      @JsonKey(name: 'completion_notes') final String? completionNotes,
      @JsonKey(name: 'assigned_to') final int? assignedTo,
      @JsonKey(name: 'assigned_user_name') final String? assignedUserName,
      @JsonKey(name: 'estimated_duration') final int? estimatedDuration,
      @JsonKey(name: 'actual_duration') final int? actualDuration,
      @JsonKey(name: 'due_date') final DateTime? dueDate,
      @JsonKey(name: 'started_at') final DateTime? startedAt,
      @JsonKey(name: 'completed_at') final DateTime? completedAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final List<String>? requiredTools,
      final List<String>? materials,
      final List<String>? attachments}) = _$MaintenanceTaskImpl;

  factory _MaintenanceTask.fromJson(Map<String, dynamic> json) =
      _$MaintenanceTaskImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get status;
  @override
  String get priority;
  @override
  int get assetId;
  @override
  String get assetName;
  @override
  String? get description;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'completion_notes')
  String? get completionNotes;
  @override
  @JsonKey(name: 'assigned_to')
  int? get assignedTo;
  @override
  @JsonKey(name: 'assigned_user_name')
  String? get assignedUserName;
  @override
  @JsonKey(name: 'estimated_duration')
  int? get estimatedDuration;
  @override
  @JsonKey(name: 'actual_duration')
  int? get actualDuration;
  @override
  @JsonKey(name: 'due_date')
  DateTime? get dueDate;
  @override
  @JsonKey(name: 'started_at')
  DateTime? get startedAt;
  @override
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  List<String>? get requiredTools;
  @override
  List<String>? get materials;
  @override
  List<String>? get attachments;
  @override
  @JsonKey(ignore: true)
  _$$MaintenanceTaskImplCopyWith<_$MaintenanceTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaintenanceTaskListResponse _$MaintenanceTaskListResponseFromJson(
    Map<String, dynamic> json) {
  return _MaintenanceTaskListResponse.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceTaskListResponse {
  List<MaintenanceTask> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaintenanceTaskListResponseCopyWith<MaintenanceTaskListResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceTaskListResponseCopyWith<$Res> {
  factory $MaintenanceTaskListResponseCopyWith(
          MaintenanceTaskListResponse value,
          $Res Function(MaintenanceTaskListResponse) then) =
      _$MaintenanceTaskListResponseCopyWithImpl<$Res,
          MaintenanceTaskListResponse>;
  @useResult
  $Res call(
      {List<MaintenanceTask> data,
      @JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage,
      int? total});
}

/// @nodoc
class _$MaintenanceTaskListResponseCopyWithImpl<$Res,
        $Val extends MaintenanceTaskListResponse>
    implements $MaintenanceTaskListResponseCopyWith<$Res> {
  _$MaintenanceTaskListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceTask>,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceTaskListResponseImplCopyWith<$Res>
    implements $MaintenanceTaskListResponseCopyWith<$Res> {
  factory _$$MaintenanceTaskListResponseImplCopyWith(
          _$MaintenanceTaskListResponseImpl value,
          $Res Function(_$MaintenanceTaskListResponseImpl) then) =
      __$$MaintenanceTaskListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MaintenanceTask> data,
      @JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage,
      int? total});
}

/// @nodoc
class __$$MaintenanceTaskListResponseImplCopyWithImpl<$Res>
    extends _$MaintenanceTaskListResponseCopyWithImpl<$Res,
        _$MaintenanceTaskListResponseImpl>
    implements _$$MaintenanceTaskListResponseImplCopyWith<$Res> {
  __$$MaintenanceTaskListResponseImplCopyWithImpl(
      _$MaintenanceTaskListResponseImpl _value,
      $Res Function(_$MaintenanceTaskListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_$MaintenanceTaskListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceTask>,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceTaskListResponseImpl
    implements _MaintenanceTaskListResponse {
  const _$MaintenanceTaskListResponseImpl(
      {required final List<MaintenanceTask> data,
      @JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      this.total})
      : _data = data;

  factory _$MaintenanceTaskListResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MaintenanceTaskListResponseImplFromJson(json);

  final List<MaintenanceTask> _data;
  @override
  List<MaintenanceTask> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  final int? total;

  @override
  String toString() {
    return 'MaintenanceTaskListResponse(data: $data, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceTaskListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      currentPage,
      lastPage,
      perPage,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceTaskListResponseImplCopyWith<_$MaintenanceTaskListResponseImpl>
      get copyWith => __$$MaintenanceTaskListResponseImplCopyWithImpl<
          _$MaintenanceTaskListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceTaskListResponseImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceTaskListResponse
    implements MaintenanceTaskListResponse {
  const factory _MaintenanceTaskListResponse(
      {required final List<MaintenanceTask> data,
      @JsonKey(name: 'current_page') final int? currentPage,
      @JsonKey(name: 'last_page') final int? lastPage,
      @JsonKey(name: 'per_page') final int? perPage,
      final int? total}) = _$MaintenanceTaskListResponseImpl;

  factory _MaintenanceTaskListResponse.fromJson(Map<String, dynamic> json) =
      _$MaintenanceTaskListResponseImpl.fromJson;

  @override
  List<MaintenanceTask> get data;
  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$MaintenanceTaskListResponseImplCopyWith<_$MaintenanceTaskListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MaintenanceSchedule _$MaintenanceScheduleFromJson(Map<String, dynamic> json) {
  return _MaintenanceSchedule.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceSchedule {
  String get date => throw _privateConstructorUsedError;
  List<MaintenanceTask> get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tasks')
  int? get totalTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_tasks')
  int? get completedTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_tasks')
  int? get pendingTasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaintenanceScheduleCopyWith<MaintenanceSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceScheduleCopyWith<$Res> {
  factory $MaintenanceScheduleCopyWith(
          MaintenanceSchedule value, $Res Function(MaintenanceSchedule) then) =
      _$MaintenanceScheduleCopyWithImpl<$Res, MaintenanceSchedule>;
  @useResult
  $Res call(
      {String date,
      List<MaintenanceTask> tasks,
      @JsonKey(name: 'total_tasks') int? totalTasks,
      @JsonKey(name: 'completed_tasks') int? completedTasks,
      @JsonKey(name: 'pending_tasks') int? pendingTasks});
}

/// @nodoc
class _$MaintenanceScheduleCopyWithImpl<$Res, $Val extends MaintenanceSchedule>
    implements $MaintenanceScheduleCopyWith<$Res> {
  _$MaintenanceScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tasks = null,
    Object? totalTasks = freezed,
    Object? completedTasks = freezed,
    Object? pendingTasks = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceTask>,
      totalTasks: freezed == totalTasks
          ? _value.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      completedTasks: freezed == completedTasks
          ? _value.completedTasks
          : completedTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      pendingTasks: freezed == pendingTasks
          ? _value.pendingTasks
          : pendingTasks // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceScheduleImplCopyWith<$Res>
    implements $MaintenanceScheduleCopyWith<$Res> {
  factory _$$MaintenanceScheduleImplCopyWith(_$MaintenanceScheduleImpl value,
          $Res Function(_$MaintenanceScheduleImpl) then) =
      __$$MaintenanceScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      List<MaintenanceTask> tasks,
      @JsonKey(name: 'total_tasks') int? totalTasks,
      @JsonKey(name: 'completed_tasks') int? completedTasks,
      @JsonKey(name: 'pending_tasks') int? pendingTasks});
}

/// @nodoc
class __$$MaintenanceScheduleImplCopyWithImpl<$Res>
    extends _$MaintenanceScheduleCopyWithImpl<$Res, _$MaintenanceScheduleImpl>
    implements _$$MaintenanceScheduleImplCopyWith<$Res> {
  __$$MaintenanceScheduleImplCopyWithImpl(_$MaintenanceScheduleImpl _value,
      $Res Function(_$MaintenanceScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tasks = null,
    Object? totalTasks = freezed,
    Object? completedTasks = freezed,
    Object? pendingTasks = freezed,
  }) {
    return _then(_$MaintenanceScheduleImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceTask>,
      totalTasks: freezed == totalTasks
          ? _value.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      completedTasks: freezed == completedTasks
          ? _value.completedTasks
          : completedTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      pendingTasks: freezed == pendingTasks
          ? _value.pendingTasks
          : pendingTasks // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceScheduleImpl implements _MaintenanceSchedule {
  const _$MaintenanceScheduleImpl(
      {required this.date,
      required final List<MaintenanceTask> tasks,
      @JsonKey(name: 'total_tasks') this.totalTasks,
      @JsonKey(name: 'completed_tasks') this.completedTasks,
      @JsonKey(name: 'pending_tasks') this.pendingTasks})
      : _tasks = tasks;

  factory _$MaintenanceScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceScheduleImplFromJson(json);

  @override
  final String date;
  final List<MaintenanceTask> _tasks;
  @override
  List<MaintenanceTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey(name: 'total_tasks')
  final int? totalTasks;
  @override
  @JsonKey(name: 'completed_tasks')
  final int? completedTasks;
  @override
  @JsonKey(name: 'pending_tasks')
  final int? pendingTasks;

  @override
  String toString() {
    return 'MaintenanceSchedule(date: $date, tasks: $tasks, totalTasks: $totalTasks, completedTasks: $completedTasks, pendingTasks: $pendingTasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceScheduleImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            (identical(other.completedTasks, completedTasks) ||
                other.completedTasks == completedTasks) &&
            (identical(other.pendingTasks, pendingTasks) ||
                other.pendingTasks == pendingTasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_tasks),
      totalTasks,
      completedTasks,
      pendingTasks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceScheduleImplCopyWith<_$MaintenanceScheduleImpl> get copyWith =>
      __$$MaintenanceScheduleImplCopyWithImpl<_$MaintenanceScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceScheduleImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceSchedule implements MaintenanceSchedule {
  const factory _MaintenanceSchedule(
          {required final String date,
          required final List<MaintenanceTask> tasks,
          @JsonKey(name: 'total_tasks') final int? totalTasks,
          @JsonKey(name: 'completed_tasks') final int? completedTasks,
          @JsonKey(name: 'pending_tasks') final int? pendingTasks}) =
      _$MaintenanceScheduleImpl;

  factory _MaintenanceSchedule.fromJson(Map<String, dynamic> json) =
      _$MaintenanceScheduleImpl.fromJson;

  @override
  String get date;
  @override
  List<MaintenanceTask> get tasks;
  @override
  @JsonKey(name: 'total_tasks')
  int? get totalTasks;
  @override
  @JsonKey(name: 'completed_tasks')
  int? get completedTasks;
  @override
  @JsonKey(name: 'pending_tasks')
  int? get pendingTasks;
  @override
  @JsonKey(ignore: true)
  _$$MaintenanceScheduleImplCopyWith<_$MaintenanceScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
