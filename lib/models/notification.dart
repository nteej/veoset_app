import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String title,
    required String message,
    required String type,
    required bool isRead,
    @JsonKey(name: 'related_id') int? relatedId,
    @JsonKey(name: 'related_type') String? relatedType,
    @JsonKey(name: 'action_url') String? actionUrl,
    Map<String, dynamic>? data,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'read_at') DateTime? readAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}

@freezed
class NotificationListResponse with _$NotificationListResponse {
  const factory NotificationListResponse({
    required List<AppNotification> data,
    @JsonKey(name: 'unread_count') int? unreadCount,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'last_page') int? lastPage,
    @JsonKey(name: 'per_page') int? perPage,
  }) = _NotificationListResponse;

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);
}

@freezed
class NotificationSummary with _$NotificationSummary {
  const factory NotificationSummary({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'unread_count') required int unreadCount,
    @JsonKey(name: 'emergency_count') int? emergencyCount,
    @JsonKey(name: 'maintenance_count') int? maintenanceCount,
    @JsonKey(name: 'system_count') int? systemCount,
  }) = _NotificationSummary;

  factory NotificationSummary.fromJson(Map<String, dynamic> json) =>
      _$NotificationSummaryFromJson(json);
}

enum NotificationType {
  @JsonValue('emergency')
  emergency,
  @JsonValue('maintenance')
  maintenance,
  @JsonValue('system')
  system,
  @JsonValue('alert')
  alert,
  @JsonValue('info')
  info,
}

extension NotificationTypeExtension on NotificationType {
  String get displayName {
    switch (this) {
      case NotificationType.emergency:
        return 'Emergency';
      case NotificationType.maintenance:
        return 'Maintenance';
      case NotificationType.system:
        return 'System';
      case NotificationType.alert:
        return 'Alert';
      case NotificationType.info:
        return 'Information';
    }
  }

  String get color {
    switch (this) {
      case NotificationType.emergency:
        return '#F44336';
      case NotificationType.maintenance:
        return '#FF9800';
      case NotificationType.system:
        return '#2196F3';
      case NotificationType.alert:
        return '#9C27B0';
      case NotificationType.info:
        return '#4CAF50';
    }
  }

  String get icon {
    switch (this) {
      case NotificationType.emergency:
        return 'warning';
      case NotificationType.maintenance:
        return 'build';
      case NotificationType.system:
        return 'settings';
      case NotificationType.alert:
        return 'error';
      case NotificationType.info:
        return 'info';
    }
  }
}

extension AppNotificationExtension on AppNotification {
  NotificationType get notificationType {
    switch (type.toLowerCase()) {
      case 'emergency':
        return NotificationType.emergency;
      case 'maintenance':
        return NotificationType.maintenance;
      case 'system':
        return NotificationType.system;
      case 'alert':
        return NotificationType.alert;
      case 'info':
        return NotificationType.info;
      default:
        return NotificationType.info;
    }
  }

  bool get isRecent {
    if (createdAt == null) return false;
    final now = DateTime.now();
    final difference = now.difference(createdAt!);
    return difference.inHours < 24;
  }

  bool get isUrgent {
    return notificationType == NotificationType.emergency ||
           notificationType == NotificationType.alert;
  }

  String get timeAgo {
    if (createdAt == null) return 'Unknown';

    final now = DateTime.now();
    final difference = now.difference(createdAt!);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}