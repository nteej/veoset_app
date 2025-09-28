// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get healthScore => throw _privateConstructorUsedError;
  int get siteId => throw _privateConstructorUsedError;
  String get siteName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get serialNumber => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get manufacturer => throw _privateConstructorUsedError;
  @JsonKey(name: 'installation_date')
  DateTime? get installationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_maintenance')
  DateTime? get lastMaintenance => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_maintenance')
  DateTime? get nextMaintenance => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  Map<String, dynamic>? get specifications =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      String status,
      String healthScore,
      int siteId,
      String siteName,
      String? description,
      String? location,
      String? serialNumber,
      String? model,
      String? manufacturer,
      @JsonKey(name: 'installation_date') DateTime? installationDate,
      @JsonKey(name: 'last_maintenance') DateTime? lastMaintenance,
      @JsonKey(name: 'next_maintenance') DateTime? nextMaintenance,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      List<String>? tags,
      Map<String, dynamic>? specifications});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? healthScore = null,
    Object? siteId = null,
    Object? siteName = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? serialNumber = freezed,
    Object? model = freezed,
    Object? manufacturer = freezed,
    Object? installationDate = freezed,
    Object? lastMaintenance = freezed,
    Object? nextMaintenance = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? tags = freezed,
    Object? specifications = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      healthScore: null == healthScore
          ? _value.healthScore
          : healthScore // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      siteName: null == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      installationDate: freezed == installationDate
          ? _value.installationDate
          : installationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMaintenance: freezed == lastMaintenance
          ? _value.lastMaintenance
          : lastMaintenance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextMaintenance: freezed == nextMaintenance
          ? _value.nextMaintenance
          : nextMaintenance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
          _$AssetImpl value, $Res Function(_$AssetImpl) then) =
      __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      String status,
      String healthScore,
      int siteId,
      String siteName,
      String? description,
      String? location,
      String? serialNumber,
      String? model,
      String? manufacturer,
      @JsonKey(name: 'installation_date') DateTime? installationDate,
      @JsonKey(name: 'last_maintenance') DateTime? lastMaintenance,
      @JsonKey(name: 'next_maintenance') DateTime? nextMaintenance,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      List<String>? tags,
      Map<String, dynamic>? specifications});
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$AssetCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
      _$AssetImpl _value, $Res Function(_$AssetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? healthScore = null,
    Object? siteId = null,
    Object? siteName = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? serialNumber = freezed,
    Object? model = freezed,
    Object? manufacturer = freezed,
    Object? installationDate = freezed,
    Object? lastMaintenance = freezed,
    Object? nextMaintenance = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? tags = freezed,
    Object? specifications = freezed,
  }) {
    return _then(_$AssetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      healthScore: null == healthScore
          ? _value.healthScore
          : healthScore // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      siteName: null == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      installationDate: freezed == installationDate
          ? _value.installationDate
          : installationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMaintenance: freezed == lastMaintenance
          ? _value.lastMaintenance
          : lastMaintenance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextMaintenance: freezed == nextMaintenance
          ? _value.nextMaintenance
          : nextMaintenance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      specifications: freezed == specifications
          ? _value._specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.status,
      required this.healthScore,
      required this.siteId,
      required this.siteName,
      this.description,
      this.location,
      this.serialNumber,
      this.model,
      this.manufacturer,
      @JsonKey(name: 'installation_date') this.installationDate,
      @JsonKey(name: 'last_maintenance') this.lastMaintenance,
      @JsonKey(name: 'next_maintenance') this.nextMaintenance,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      final List<String>? tags,
      final Map<String, dynamic>? specifications})
      : _tags = tags,
        _specifications = specifications;

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String status;
  @override
  final String healthScore;
  @override
  final int siteId;
  @override
  final String siteName;
  @override
  final String? description;
  @override
  final String? location;
  @override
  final String? serialNumber;
  @override
  final String? model;
  @override
  final String? manufacturer;
  @override
  @JsonKey(name: 'installation_date')
  final DateTime? installationDate;
  @override
  @JsonKey(name: 'last_maintenance')
  final DateTime? lastMaintenance;
  @override
  @JsonKey(name: 'next_maintenance')
  final DateTime? nextMaintenance;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _specifications;
  @override
  Map<String, dynamic>? get specifications {
    final value = _specifications;
    if (value == null) return null;
    if (_specifications is EqualUnmodifiableMapView) return _specifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Asset(id: $id, name: $name, type: $type, status: $status, healthScore: $healthScore, siteId: $siteId, siteName: $siteName, description: $description, location: $location, serialNumber: $serialNumber, model: $model, manufacturer: $manufacturer, installationDate: $installationDate, lastMaintenance: $lastMaintenance, nextMaintenance: $nextMaintenance, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, specifications: $specifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.healthScore, healthScore) ||
                other.healthScore == healthScore) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.installationDate, installationDate) ||
                other.installationDate == installationDate) &&
            (identical(other.lastMaintenance, lastMaintenance) ||
                other.lastMaintenance == lastMaintenance) &&
            (identical(other.nextMaintenance, nextMaintenance) ||
                other.nextMaintenance == nextMaintenance) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._specifications, _specifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        type,
        status,
        healthScore,
        siteId,
        siteName,
        description,
        location,
        serialNumber,
        model,
        manufacturer,
        installationDate,
        lastMaintenance,
        nextMaintenance,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_specifications)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetImplToJson(
      this,
    );
  }
}

abstract class _Asset implements Asset {
  const factory _Asset(
      {required final int id,
      required final String name,
      required final String type,
      required final String status,
      required final String healthScore,
      required final int siteId,
      required final String siteName,
      final String? description,
      final String? location,
      final String? serialNumber,
      final String? model,
      final String? manufacturer,
      @JsonKey(name: 'installation_date') final DateTime? installationDate,
      @JsonKey(name: 'last_maintenance') final DateTime? lastMaintenance,
      @JsonKey(name: 'next_maintenance') final DateTime? nextMaintenance,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final List<String>? tags,
      final Map<String, dynamic>? specifications}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get status;
  @override
  String get healthScore;
  @override
  int get siteId;
  @override
  String get siteName;
  @override
  String? get description;
  @override
  String? get location;
  @override
  String? get serialNumber;
  @override
  String? get model;
  @override
  String? get manufacturer;
  @override
  @JsonKey(name: 'installation_date')
  DateTime? get installationDate;
  @override
  @JsonKey(name: 'last_maintenance')
  DateTime? get lastMaintenance;
  @override
  @JsonKey(name: 'next_maintenance')
  DateTime? get nextMaintenance;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  List<String>? get tags;
  @override
  Map<String, dynamic>? get specifications;
  @override
  @JsonKey(ignore: true)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssetHealthData _$AssetHealthDataFromJson(Map<String, dynamic> json) {
  return _AssetHealthData.fromJson(json);
}

/// @nodoc
mixin _$AssetHealthData {
  String get date => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetHealthDataCopyWith<AssetHealthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetHealthDataCopyWith<$Res> {
  factory $AssetHealthDataCopyWith(
          AssetHealthData value, $Res Function(AssetHealthData) then) =
      _$AssetHealthDataCopyWithImpl<$Res, AssetHealthData>;
  @useResult
  $Res call({String date, double score, String? status, String? notes});
}

/// @nodoc
class _$AssetHealthDataCopyWithImpl<$Res, $Val extends AssetHealthData>
    implements $AssetHealthDataCopyWith<$Res> {
  _$AssetHealthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? score = null,
    Object? status = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetHealthDataImplCopyWith<$Res>
    implements $AssetHealthDataCopyWith<$Res> {
  factory _$$AssetHealthDataImplCopyWith(_$AssetHealthDataImpl value,
          $Res Function(_$AssetHealthDataImpl) then) =
      __$$AssetHealthDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, double score, String? status, String? notes});
}

/// @nodoc
class __$$AssetHealthDataImplCopyWithImpl<$Res>
    extends _$AssetHealthDataCopyWithImpl<$Res, _$AssetHealthDataImpl>
    implements _$$AssetHealthDataImplCopyWith<$Res> {
  __$$AssetHealthDataImplCopyWithImpl(
      _$AssetHealthDataImpl _value, $Res Function(_$AssetHealthDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? score = null,
    Object? status = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$AssetHealthDataImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetHealthDataImpl implements _AssetHealthData {
  const _$AssetHealthDataImpl(
      {required this.date, required this.score, this.status, this.notes});

  factory _$AssetHealthDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetHealthDataImplFromJson(json);

  @override
  final String date;
  @override
  final double score;
  @override
  final String? status;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AssetHealthData(date: $date, score: $score, status: $status, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetHealthDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, score, status, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetHealthDataImplCopyWith<_$AssetHealthDataImpl> get copyWith =>
      __$$AssetHealthDataImplCopyWithImpl<_$AssetHealthDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetHealthDataImplToJson(
      this,
    );
  }
}

abstract class _AssetHealthData implements AssetHealthData {
  const factory _AssetHealthData(
      {required final String date,
      required final double score,
      final String? status,
      final String? notes}) = _$AssetHealthDataImpl;

  factory _AssetHealthData.fromJson(Map<String, dynamic> json) =
      _$AssetHealthDataImpl.fromJson;

  @override
  String get date;
  @override
  double get score;
  @override
  String? get status;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$AssetHealthDataImplCopyWith<_$AssetHealthDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssetListResponse _$AssetListResponseFromJson(Map<String, dynamic> json) {
  return _AssetListResponse.fromJson(json);
}

/// @nodoc
mixin _$AssetListResponse {
  List<Asset> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetListResponseCopyWith<AssetListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetListResponseCopyWith<$Res> {
  factory $AssetListResponseCopyWith(
          AssetListResponse value, $Res Function(AssetListResponse) then) =
      _$AssetListResponseCopyWithImpl<$Res, AssetListResponse>;
  @useResult
  $Res call(
      {List<Asset> data,
      @JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage,
      int? total});
}

/// @nodoc
class _$AssetListResponseCopyWithImpl<$Res, $Val extends AssetListResponse>
    implements $AssetListResponseCopyWith<$Res> {
  _$AssetListResponseCopyWithImpl(this._value, this._then);

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
              as List<Asset>,
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
abstract class _$$AssetListResponseImplCopyWith<$Res>
    implements $AssetListResponseCopyWith<$Res> {
  factory _$$AssetListResponseImplCopyWith(_$AssetListResponseImpl value,
          $Res Function(_$AssetListResponseImpl) then) =
      __$$AssetListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Asset> data,
      @JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage,
      int? total});
}

/// @nodoc
class __$$AssetListResponseImplCopyWithImpl<$Res>
    extends _$AssetListResponseCopyWithImpl<$Res, _$AssetListResponseImpl>
    implements _$$AssetListResponseImplCopyWith<$Res> {
  __$$AssetListResponseImplCopyWithImpl(_$AssetListResponseImpl _value,
      $Res Function(_$AssetListResponseImpl) _then)
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
    return _then(_$AssetListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
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
class _$AssetListResponseImpl implements _AssetListResponse {
  const _$AssetListResponseImpl(
      {required final List<Asset> data,
      @JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      this.total})
      : _data = data;

  factory _$AssetListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetListResponseImplFromJson(json);

  final List<Asset> _data;
  @override
  List<Asset> get data {
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
    return 'AssetListResponse(data: $data, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetListResponseImpl &&
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
  _$$AssetListResponseImplCopyWith<_$AssetListResponseImpl> get copyWith =>
      __$$AssetListResponseImplCopyWithImpl<_$AssetListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetListResponseImplToJson(
      this,
    );
  }
}

abstract class _AssetListResponse implements AssetListResponse {
  const factory _AssetListResponse(
      {required final List<Asset> data,
      @JsonKey(name: 'current_page') final int? currentPage,
      @JsonKey(name: 'last_page') final int? lastPage,
      @JsonKey(name: 'per_page') final int? perPage,
      final int? total}) = _$AssetListResponseImpl;

  factory _AssetListResponse.fromJson(Map<String, dynamic> json) =
      _$AssetListResponseImpl.fromJson;

  @override
  List<Asset> get data;
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
  _$$AssetListResponseImplCopyWith<_$AssetListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
