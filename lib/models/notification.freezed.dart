// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) {
  return _AppNotification.fromJson(json);
}

/// @nodoc
mixin _$AppNotification {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'related_id')
  int? get relatedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'related_type')
  String? get relatedType => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_url')
  String? get actionUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'read_at')
  DateTime? get readAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppNotificationCopyWith<AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
          AppNotification value, $Res Function(AppNotification) then) =
      _$AppNotificationCopyWithImpl<$Res, AppNotification>;
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      String type,
      bool isRead,
      @JsonKey(name: 'related_id') int? relatedId,
      @JsonKey(name: 'related_type') String? relatedType,
      @JsonKey(name: 'action_url') String? actionUrl,
      Map<String, dynamic>? data,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'read_at') DateTime? readAt});
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res, $Val extends AppNotification>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? isRead = null,
    Object? relatedId = freezed,
    Object? relatedType = freezed,
    Object? actionUrl = freezed,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? readAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedId: freezed == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as int?,
      relatedType: freezed == relatedType
          ? _value.relatedType
          : relatedType // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppNotificationImplCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$$AppNotificationImplCopyWith(_$AppNotificationImpl value,
          $Res Function(_$AppNotificationImpl) then) =
      __$$AppNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      String type,
      bool isRead,
      @JsonKey(name: 'related_id') int? relatedId,
      @JsonKey(name: 'related_type') String? relatedType,
      @JsonKey(name: 'action_url') String? actionUrl,
      Map<String, dynamic>? data,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'read_at') DateTime? readAt});
}

/// @nodoc
class __$$AppNotificationImplCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res, _$AppNotificationImpl>
    implements _$$AppNotificationImplCopyWith<$Res> {
  __$$AppNotificationImplCopyWithImpl(
      _$AppNotificationImpl _value, $Res Function(_$AppNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? isRead = null,
    Object? relatedId = freezed,
    Object? relatedType = freezed,
    Object? actionUrl = freezed,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? readAt = freezed,
  }) {
    return _then(_$AppNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedId: freezed == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as int?,
      relatedType: freezed == relatedType
          ? _value.relatedType
          : relatedType // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppNotificationImpl implements _AppNotification {
  const _$AppNotificationImpl(
      {required this.id,
      required this.title,
      required this.message,
      required this.type,
      required this.isRead,
      @JsonKey(name: 'related_id') this.relatedId,
      @JsonKey(name: 'related_type') this.relatedType,
      @JsonKey(name: 'action_url') this.actionUrl,
      final Map<String, dynamic>? data,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'read_at') this.readAt})
      : _data = data;

  factory _$AppNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppNotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String message;
  @override
  final String type;
  @override
  final bool isRead;
  @override
  @JsonKey(name: 'related_id')
  final int? relatedId;
  @override
  @JsonKey(name: 'related_type')
  final String? relatedType;
  @override
  @JsonKey(name: 'action_url')
  final String? actionUrl;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'read_at')
  final DateTime? readAt;

  @override
  String toString() {
    return 'AppNotification(id: $id, title: $title, message: $message, type: $type, isRead: $isRead, relatedId: $relatedId, relatedType: $relatedType, actionUrl: $actionUrl, data: $data, createdAt: $createdAt, readAt: $readAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.relatedId, relatedId) ||
                other.relatedId == relatedId) &&
            (identical(other.relatedType, relatedType) ||
                other.relatedType == relatedType) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      message,
      type,
      isRead,
      relatedId,
      relatedType,
      actionUrl,
      const DeepCollectionEquality().hash(_data),
      createdAt,
      readAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      __$$AppNotificationImplCopyWithImpl<_$AppNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppNotificationImplToJson(
      this,
    );
  }
}

abstract class _AppNotification implements AppNotification {
  const factory _AppNotification(
          {required final String id,
          required final String title,
          required final String message,
          required final String type,
          required final bool isRead,
          @JsonKey(name: 'related_id') final int? relatedId,
          @JsonKey(name: 'related_type') final String? relatedType,
          @JsonKey(name: 'action_url') final String? actionUrl,
          final Map<String, dynamic>? data,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'read_at') final DateTime? readAt}) =
      _$AppNotificationImpl;

  factory _AppNotification.fromJson(Map<String, dynamic> json) =
      _$AppNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get message;
  @override
  String get type;
  @override
  bool get isRead;
  @override
  @JsonKey(name: 'related_id')
  int? get relatedId;
  @override
  @JsonKey(name: 'related_type')
  String? get relatedType;
  @override
  @JsonKey(name: 'action_url')
  String? get actionUrl;
  @override
  Map<String, dynamic>? get data;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'read_at')
  DateTime? get readAt;
  @override
  @JsonKey(ignore: true)
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationListResponse _$NotificationListResponseFromJson(
    Map<String, dynamic> json) {
  return _NotificationListResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationListResponse {
  List<AppNotification> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_count')
  int? get unreadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationListResponseCopyWith<NotificationListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListResponseCopyWith<$Res> {
  factory $NotificationListResponseCopyWith(NotificationListResponse value,
          $Res Function(NotificationListResponse) then) =
      _$NotificationListResponseCopyWithImpl<$Res, NotificationListResponse>;
  @useResult
  $Res call(
      {List<AppNotification> data,
      @JsonKey(name: 'unread_count') int? unreadCount,
      @JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage});
}

/// @nodoc
class _$NotificationListResponseCopyWithImpl<$Res,
        $Val extends NotificationListResponse>
    implements $NotificationListResponseCopyWith<$Res> {
  _$NotificationListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? unreadCount = freezed,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AppNotification>,
      unreadCount: freezed == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationListResponseImplCopyWith<$Res>
    implements $NotificationListResponseCopyWith<$Res> {
  factory _$$NotificationListResponseImplCopyWith(
          _$NotificationListResponseImpl value,
          $Res Function(_$NotificationListResponseImpl) then) =
      __$$NotificationListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AppNotification> data,
      @JsonKey(name: 'unread_count') int? unreadCount,
      @JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage});
}

/// @nodoc
class __$$NotificationListResponseImplCopyWithImpl<$Res>
    extends _$NotificationListResponseCopyWithImpl<$Res,
        _$NotificationListResponseImpl>
    implements _$$NotificationListResponseImplCopyWith<$Res> {
  __$$NotificationListResponseImplCopyWithImpl(
      _$NotificationListResponseImpl _value,
      $Res Function(_$NotificationListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? unreadCount = freezed,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
  }) {
    return _then(_$NotificationListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AppNotification>,
      unreadCount: freezed == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationListResponseImpl implements _NotificationListResponse {
  const _$NotificationListResponseImpl(
      {required final List<AppNotification> data,
      @JsonKey(name: 'unread_count') this.unreadCount,
      @JsonKey(name: 'total_count') this.totalCount,
      @JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage})
      : _data = data;

  factory _$NotificationListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationListResponseImplFromJson(json);

  final List<AppNotification> _data;
  @override
  List<AppNotification> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'unread_count')
  final int? unreadCount;
  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
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
  String toString() {
    return 'NotificationListResponse(data: $data, unreadCount: $unreadCount, totalCount: $totalCount, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      unreadCount,
      totalCount,
      currentPage,
      lastPage,
      perPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationListResponseImplCopyWith<_$NotificationListResponseImpl>
      get copyWith => __$$NotificationListResponseImplCopyWithImpl<
          _$NotificationListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationListResponseImplToJson(
      this,
    );
  }
}

abstract class _NotificationListResponse implements NotificationListResponse {
  const factory _NotificationListResponse(
          {required final List<AppNotification> data,
          @JsonKey(name: 'unread_count') final int? unreadCount,
          @JsonKey(name: 'total_count') final int? totalCount,
          @JsonKey(name: 'current_page') final int? currentPage,
          @JsonKey(name: 'last_page') final int? lastPage,
          @JsonKey(name: 'per_page') final int? perPage}) =
      _$NotificationListResponseImpl;

  factory _NotificationListResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationListResponseImpl.fromJson;

  @override
  List<AppNotification> get data;
  @override
  @JsonKey(name: 'unread_count')
  int? get unreadCount;
  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
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
  @JsonKey(ignore: true)
  _$$NotificationListResponseImplCopyWith<_$NotificationListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationSummary _$NotificationSummaryFromJson(Map<String, dynamic> json) {
  return _NotificationSummary.fromJson(json);
}

/// @nodoc
mixin _$NotificationSummary {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_count')
  int get unreadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_count')
  int? get emergencyCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'maintenance_count')
  int? get maintenanceCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'system_count')
  int? get systemCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationSummaryCopyWith<NotificationSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSummaryCopyWith<$Res> {
  factory $NotificationSummaryCopyWith(
          NotificationSummary value, $Res Function(NotificationSummary) then) =
      _$NotificationSummaryCopyWithImpl<$Res, NotificationSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'unread_count') int unreadCount,
      @JsonKey(name: 'emergency_count') int? emergencyCount,
      @JsonKey(name: 'maintenance_count') int? maintenanceCount,
      @JsonKey(name: 'system_count') int? systemCount});
}

/// @nodoc
class _$NotificationSummaryCopyWithImpl<$Res, $Val extends NotificationSummary>
    implements $NotificationSummaryCopyWith<$Res> {
  _$NotificationSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? unreadCount = null,
    Object? emergencyCount = freezed,
    Object? maintenanceCount = freezed,
    Object? systemCount = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      emergencyCount: freezed == emergencyCount
          ? _value.emergencyCount
          : emergencyCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maintenanceCount: freezed == maintenanceCount
          ? _value.maintenanceCount
          : maintenanceCount // ignore: cast_nullable_to_non_nullable
              as int?,
      systemCount: freezed == systemCount
          ? _value.systemCount
          : systemCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSummaryImplCopyWith<$Res>
    implements $NotificationSummaryCopyWith<$Res> {
  factory _$$NotificationSummaryImplCopyWith(_$NotificationSummaryImpl value,
          $Res Function(_$NotificationSummaryImpl) then) =
      __$$NotificationSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'unread_count') int unreadCount,
      @JsonKey(name: 'emergency_count') int? emergencyCount,
      @JsonKey(name: 'maintenance_count') int? maintenanceCount,
      @JsonKey(name: 'system_count') int? systemCount});
}

/// @nodoc
class __$$NotificationSummaryImplCopyWithImpl<$Res>
    extends _$NotificationSummaryCopyWithImpl<$Res, _$NotificationSummaryImpl>
    implements _$$NotificationSummaryImplCopyWith<$Res> {
  __$$NotificationSummaryImplCopyWithImpl(_$NotificationSummaryImpl _value,
      $Res Function(_$NotificationSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? unreadCount = null,
    Object? emergencyCount = freezed,
    Object? maintenanceCount = freezed,
    Object? systemCount = freezed,
  }) {
    return _then(_$NotificationSummaryImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      emergencyCount: freezed == emergencyCount
          ? _value.emergencyCount
          : emergencyCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maintenanceCount: freezed == maintenanceCount
          ? _value.maintenanceCount
          : maintenanceCount // ignore: cast_nullable_to_non_nullable
              as int?,
      systemCount: freezed == systemCount
          ? _value.systemCount
          : systemCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSummaryImpl implements _NotificationSummary {
  const _$NotificationSummaryImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'unread_count') required this.unreadCount,
      @JsonKey(name: 'emergency_count') this.emergencyCount,
      @JsonKey(name: 'maintenance_count') this.maintenanceCount,
      @JsonKey(name: 'system_count') this.systemCount});

  factory _$NotificationSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'unread_count')
  final int unreadCount;
  @override
  @JsonKey(name: 'emergency_count')
  final int? emergencyCount;
  @override
  @JsonKey(name: 'maintenance_count')
  final int? maintenanceCount;
  @override
  @JsonKey(name: 'system_count')
  final int? systemCount;

  @override
  String toString() {
    return 'NotificationSummary(totalCount: $totalCount, unreadCount: $unreadCount, emergencyCount: $emergencyCount, maintenanceCount: $maintenanceCount, systemCount: $systemCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSummaryImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.emergencyCount, emergencyCount) ||
                other.emergencyCount == emergencyCount) &&
            (identical(other.maintenanceCount, maintenanceCount) ||
                other.maintenanceCount == maintenanceCount) &&
            (identical(other.systemCount, systemCount) ||
                other.systemCount == systemCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, unreadCount,
      emergencyCount, maintenanceCount, systemCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSummaryImplCopyWith<_$NotificationSummaryImpl> get copyWith =>
      __$$NotificationSummaryImplCopyWithImpl<_$NotificationSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSummaryImplToJson(
      this,
    );
  }
}

abstract class _NotificationSummary implements NotificationSummary {
  const factory _NotificationSummary(
          {@JsonKey(name: 'total_count') required final int totalCount,
          @JsonKey(name: 'unread_count') required final int unreadCount,
          @JsonKey(name: 'emergency_count') final int? emergencyCount,
          @JsonKey(name: 'maintenance_count') final int? maintenanceCount,
          @JsonKey(name: 'system_count') final int? systemCount}) =
      _$NotificationSummaryImpl;

  factory _NotificationSummary.fromJson(Map<String, dynamic> json) =
      _$NotificationSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'unread_count')
  int get unreadCount;
  @override
  @JsonKey(name: 'emergency_count')
  int? get emergencyCount;
  @override
  @JsonKey(name: 'maintenance_count')
  int? get maintenanceCount;
  @override
  @JsonKey(name: 'system_count')
  int? get systemCount;
  @override
  @JsonKey(ignore: true)
  _$$NotificationSummaryImplCopyWith<_$NotificationSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
