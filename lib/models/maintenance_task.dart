import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_task.freezed.dart';
part 'maintenance_task.g.dart';

@freezed
class MaintenanceTask with _$MaintenanceTask {
  const factory MaintenanceTask({
    required int id,
    required String title,
    required String status,
    required String priority,
    required int assetId,
    required String assetName,
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
    List<String>? attachments,
  }) = _MaintenanceTask;

  factory MaintenanceTask.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceTaskFromJson(json);
}

@freezed
class MaintenanceTaskListResponse with _$MaintenanceTaskListResponse {
  const factory MaintenanceTaskListResponse({
    required List<MaintenanceTask> data,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'last_page') int? lastPage,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
  }) = _MaintenanceTaskListResponse;

  factory MaintenanceTaskListResponse.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceTaskListResponseFromJson(json);
}

@freezed
class MaintenanceSchedule with _$MaintenanceSchedule {
  const factory MaintenanceSchedule({
    required String date,
    required List<MaintenanceTask> tasks,
    @JsonKey(name: 'total_tasks') int? totalTasks,
    @JsonKey(name: 'completed_tasks') int? completedTasks,
    @JsonKey(name: 'pending_tasks') int? pendingTasks,
  }) = _MaintenanceSchedule;

  factory MaintenanceSchedule.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceScheduleFromJson(json);
}

enum TaskStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

enum TaskPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('emergency')
  emergency,
}

extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get color {
    switch (this) {
      case TaskStatus.pending:
        return '#FF9800';
      case TaskStatus.inProgress:
        return '#2196F3';
      case TaskStatus.completed:
        return '#4CAF50';
      case TaskStatus.cancelled:
        return '#9E9E9E';
    }
  }
}

extension TaskPriorityExtension on TaskPriority {
  String get displayName {
    switch (this) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
      case TaskPriority.emergency:
        return 'Emergency';
    }
  }

  String get color {
    switch (this) {
      case TaskPriority.low:
        return '#2196F3';
      case TaskPriority.medium:
        return '#FF9800';
      case TaskPriority.high:
        return '#F44336';
      case TaskPriority.emergency:
        return '#9C27B0';
    }
  }
}

extension MaintenanceTaskExtension on MaintenanceTask {
  TaskStatus get taskStatus {
    switch (status.toLowerCase()) {
      case 'pending':
        return TaskStatus.pending;
      case 'in_progress':
        return TaskStatus.inProgress;
      case 'completed':
        return TaskStatus.completed;
      case 'cancelled':
        return TaskStatus.cancelled;
      default:
        return TaskStatus.pending;
    }
  }

  TaskPriority get taskPriority {
    switch (priority.toLowerCase()) {
      case 'low':
        return TaskPriority.low;
      case 'medium':
        return TaskPriority.medium;
      case 'high':
        return TaskPriority.high;
      case 'emergency':
        return TaskPriority.emergency;
      default:
        return TaskPriority.medium;
    }
  }

  bool get isOverdue {
    if (dueDate == null) return false;
    return DateTime.now().isAfter(dueDate!) &&
           taskStatus != TaskStatus.completed;
  }

  bool get isDueToday {
    if (dueDate == null) return false;
    final today = DateTime.now();
    return dueDate!.year == today.year &&
           dueDate!.month == today.month &&
           dueDate!.day == today.day;
  }

  bool get isDueSoon {
    if (dueDate == null) return false;
    final now = DateTime.now();
    final difference = dueDate!.difference(now).inDays;
    return difference <= 3 && difference >= 0;
  }

  String get statusDisplayText {
    if (isOverdue && taskStatus != TaskStatus.completed) {
      return 'Overdue';
    }
    if (isDueToday && taskStatus != TaskStatus.completed) {
      return 'Due Today';
    }
    if (isDueSoon && taskStatus != TaskStatus.completed) {
      return 'Due Soon';
    }
    return taskStatus.displayName;
  }

  String get statusDisplayName => taskStatus.displayName;

  Color get statusColor {
    if (isOverdue && taskStatus != TaskStatus.completed) {
      return Colors.red;
    }
    switch (taskStatus) {
      case TaskStatus.pending:
        return const Color(0xFFFF9800);
      case TaskStatus.inProgress:
        return const Color(0xFF2196F3);
      case TaskStatus.completed:
        return const Color(0xFF4CAF50);
      case TaskStatus.cancelled:
        return const Color(0xFF9E9E9E);
    }
  }

  String get priorityDisplayName => taskPriority.displayName;

  Color get priorityColor {
    switch (taskPriority) {
      case TaskPriority.low:
        return const Color(0xFF4CAF50);
      case TaskPriority.medium:
        return const Color(0xFF2196F3);
      case TaskPriority.high:
        return const Color(0xFFFF9800);
      case TaskPriority.emergency:
        return const Color(0xFFF44336);
    }
  }

  IconData get priorityIcon {
    switch (taskPriority) {
      case TaskPriority.low:
        return Icons.keyboard_arrow_down;
      case TaskPriority.medium:
        return Icons.remove;
      case TaskPriority.high:
        return Icons.keyboard_arrow_up;
      case TaskPriority.emergency:
        return Icons.warning;
    }
  }

  String get dueDateFormatted {
    if (dueDate == null) return 'No due date';

    final now = DateTime.now();
    final difference = dueDate!.difference(now);

    if (isOverdue) {
      final daysPast = -difference.inDays;
      return '$daysPast day${daysPast == 1 ? '' : 's'} overdue';
    }

    if (isDueToday) {
      return 'Due today';
    }

    if (difference.inDays <= 7) {
      return 'Due in ${difference.inDays} day${difference.inDays == 1 ? '' : 's'}';
    }

    return 'Due ${dueDate!.day}/${dueDate!.month}/${dueDate!.year}';
  }

  String get createdAtFormatted {
    if (createdAt == null) return 'Unknown';

    final now = DateTime.now();
    final difference = now.difference(createdAt!);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }
}