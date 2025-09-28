// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      healthScore: json['healthScore'] as String,
      siteId: (json['siteId'] as num).toInt(),
      siteName: json['siteName'] as String,
      description: json['description'] as String?,
      location: json['location'] as String?,
      serialNumber: json['serialNumber'] as String?,
      model: json['model'] as String?,
      manufacturer: json['manufacturer'] as String?,
      installationDate: json['installation_date'] == null
          ? null
          : DateTime.parse(json['installation_date'] as String),
      lastMaintenance: json['last_maintenance'] == null
          ? null
          : DateTime.parse(json['last_maintenance'] as String),
      nextMaintenance: json['next_maintenance'] == null
          ? null
          : DateTime.parse(json['next_maintenance'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      specifications: json['specifications'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'status': instance.status,
      'healthScore': instance.healthScore,
      'siteId': instance.siteId,
      'siteName': instance.siteName,
      'description': instance.description,
      'location': instance.location,
      'serialNumber': instance.serialNumber,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'installation_date': instance.installationDate?.toIso8601String(),
      'last_maintenance': instance.lastMaintenance?.toIso8601String(),
      'next_maintenance': instance.nextMaintenance?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'tags': instance.tags,
      'specifications': instance.specifications,
    };

_$AssetHealthDataImpl _$$AssetHealthDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AssetHealthDataImpl(
      date: json['date'] as String,
      score: (json['score'] as num).toDouble(),
      status: json['status'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$AssetHealthDataImplToJson(
        _$AssetHealthDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'score': instance.score,
      'status': instance.status,
      'notes': instance.notes,
    };

_$AssetListResponseImpl _$$AssetListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AssetListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AssetListResponseImplToJson(
        _$AssetListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
