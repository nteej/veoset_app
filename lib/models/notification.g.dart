// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppNotificationImpl _$$AppNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$AppNotificationImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      isRead: json['isRead'] as bool,
      relatedId: (json['related_id'] as num?)?.toInt(),
      relatedType: json['related_type'] as String?,
      actionUrl: json['action_url'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
    );

Map<String, dynamic> _$$AppNotificationImplToJson(
        _$AppNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'type': instance.type,
      'isRead': instance.isRead,
      'related_id': instance.relatedId,
      'related_type': instance.relatedType,
      'action_url': instance.actionUrl,
      'data': instance.data,
      'created_at': instance.createdAt?.toIso8601String(),
      'read_at': instance.readAt?.toIso8601String(),
    };

_$NotificationListResponseImpl _$$NotificationListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
      unreadCount: (json['unread_count'] as num?)?.toInt(),
      totalCount: (json['total_count'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NotificationListResponseImplToJson(
        _$NotificationListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'unread_count': instance.unreadCount,
      'total_count': instance.totalCount,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
    };

_$NotificationSummaryImpl _$$NotificationSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSummaryImpl(
      totalCount: (json['total_count'] as num).toInt(),
      unreadCount: (json['unread_count'] as num).toInt(),
      emergencyCount: (json['emergency_count'] as num?)?.toInt(),
      maintenanceCount: (json['maintenance_count'] as num?)?.toInt(),
      systemCount: (json['system_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NotificationSummaryImplToJson(
        _$NotificationSummaryImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'unread_count': instance.unreadCount,
      'emergency_count': instance.emergencyCount,
      'maintenance_count': instance.maintenanceCount,
      'system_count': instance.systemCount,
    };
