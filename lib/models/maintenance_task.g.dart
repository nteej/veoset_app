// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenanceTaskImpl _$$MaintenanceTaskImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceTaskImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      assetId: (json['assetId'] as num).toInt(),
      assetName: json['assetName'] as String,
      description: json['description'] as String?,
      notes: json['notes'] as String?,
      completionNotes: json['completion_notes'] as String?,
      assignedTo: (json['assigned_to'] as num?)?.toInt(),
      assignedUserName: json['assigned_user_name'] as String?,
      estimatedDuration: (json['estimated_duration'] as num?)?.toInt(),
      actualDuration: (json['actual_duration'] as num?)?.toInt(),
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      requiredTools: (json['requiredTools'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$MaintenanceTaskImplToJson(
        _$MaintenanceTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'priority': instance.priority,
      'assetId': instance.assetId,
      'assetName': instance.assetName,
      'description': instance.description,
      'notes': instance.notes,
      'completion_notes': instance.completionNotes,
      'assigned_to': instance.assignedTo,
      'assigned_user_name': instance.assignedUserName,
      'estimated_duration': instance.estimatedDuration,
      'actual_duration': instance.actualDuration,
      'due_date': instance.dueDate?.toIso8601String(),
      'started_at': instance.startedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'requiredTools': instance.requiredTools,
      'materials': instance.materials,
      'attachments': instance.attachments,
    };

_$MaintenanceTaskListResponseImpl _$$MaintenanceTaskListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceTaskListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => MaintenanceTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MaintenanceTaskListResponseImplToJson(
        _$MaintenanceTaskListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_$MaintenanceScheduleImpl _$$MaintenanceScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceScheduleImpl(
      date: json['date'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => MaintenanceTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalTasks: (json['total_tasks'] as num?)?.toInt(),
      completedTasks: (json['completed_tasks'] as num?)?.toInt(),
      pendingTasks: (json['pending_tasks'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MaintenanceScheduleImplToJson(
        _$MaintenanceScheduleImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'tasks': instance.tasks,
      'total_tasks': instance.totalTasks,
      'completed_tasks': instance.completedTasks,
      'pending_tasks': instance.pendingTasks,
    };
