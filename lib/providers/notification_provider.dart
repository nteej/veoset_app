import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/notification.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

final notificationProvider = StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier(
    ref.read(apiServiceProvider),
    ref.read(authProvider.notifier),
  );
});

final notificationListProvider = FutureProvider<List<AppNotification>>((ref) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final notificationNotifier = ref.read(notificationProvider.notifier);
  return notificationNotifier.getNotifications();
});

final notificationSummaryProvider = FutureProvider<NotificationSummary>((ref) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final notificationNotifier = ref.read(notificationProvider.notifier);
  return notificationNotifier.getNotificationsSummary();
});

final unreadNotificationsProvider = FutureProvider<List<AppNotification>>((ref) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final notificationNotifier = ref.read(notificationProvider.notifier);
  return notificationNotifier.getNotifications(unreadOnly: true);
});

class NotificationState {
  final List<AppNotification> notifications;
  final List<AppNotification> unreadNotifications;
  final NotificationSummary? summary;
  final bool isLoading;
  final String? error;

  const NotificationState({
    this.notifications = const [],
    this.unreadNotifications = const [],
    this.summary,
    this.isLoading = false,
    this.error,
  });

  NotificationState copyWith({
    List<AppNotification>? notifications,
    List<AppNotification>? unreadNotifications,
    NotificationSummary? summary,
    bool? isLoading,
    String? error,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      unreadNotifications: unreadNotifications ?? this.unreadNotifications,
      summary: summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class NotificationNotifier extends StateNotifier<NotificationState> {
  final ApiService _apiService;
  final AuthNotifier _authNotifier;

  NotificationNotifier(this._apiService, this._authNotifier) : super(const NotificationState());

  Future<List<AppNotification>> getNotifications({
    bool unreadOnly = false,
    int limit = 50,
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh &&
        (unreadOnly ? state.unreadNotifications.isNotEmpty : state.notifications.isNotEmpty)) {
      return unreadOnly ? state.unreadNotifications : state.notifications;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.getNotifications(
        token,
        unreadOnly: unreadOnly,
        limit: limit,
      );

      final notificationListResponse = NotificationListResponse.fromJson(response);
      final notifications = notificationListResponse.data;

      if (unreadOnly) {
        state = state.copyWith(
          unreadNotifications: notifications,
          isLoading: false,
          error: null,
        );
      } else {
        state = state.copyWith(
          notifications: notifications,
          isLoading: false,
          error: null,
        );
      }

      return notifications;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<NotificationSummary> getNotificationsSummary({bool forceRefresh = false}) async {
    if (!forceRefresh && state.summary != null) {
      return state.summary!;
    }

    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.getNotificationsSummary(token);
      final summary = NotificationSummary.fromJson(response);

      state = state.copyWith(summary: summary);

      return summary;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      await _apiService.markNotificationAsRead(token, notificationId);

      // Update local state to mark notification as read
      final updatedNotifications = state.notifications.map((notification) {
        if (notification.id == notificationId) {
          return notification.copyWith(
            isRead: true,
            readAt: DateTime.now(),
          );
        }
        return notification;
      }).toList();

      final updatedUnreadNotifications = state.unreadNotifications
          .where((notification) => notification.id != notificationId)
          .toList();

      state = state.copyWith(
        notifications: updatedNotifications,
        unreadNotifications: updatedUnreadNotifications,
      );

      // Refresh summary to update unread count
      await getNotificationsSummary(forceRefresh: true);

    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> markAllAsRead() async {
    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      await _apiService.markAllNotificationsAsRead(token);

      // Update local state to mark all notifications as read
      final updatedNotifications = state.notifications.map((notification) {
        return notification.copyWith(
          isRead: true,
          readAt: DateTime.now(),
        );
      }).toList();

      state = state.copyWith(
        notifications: updatedNotifications,
        unreadNotifications: [],
      );

      // Refresh summary to update unread count
      await getNotificationsSummary(forceRefresh: true);

    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      await _apiService.deleteNotification(token, notificationId);

      // Remove notification from local state
      final updatedNotifications = state.notifications
          .where((notification) => notification.id != notificationId)
          .toList();

      final updatedUnreadNotifications = state.unreadNotifications
          .where((notification) => notification.id != notificationId)
          .toList();

      state = state.copyWith(
        notifications: updatedNotifications,
        unreadNotifications: updatedUnreadNotifications,
      );

      // Refresh summary to update counts
      await getNotificationsSummary(forceRefresh: true);

    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearCache() {
    state = const NotificationState();
  }

  // Helper getters
  List<AppNotification> get emergencyNotifications =>
      state.notifications.where((notification) =>
          notification.notificationType == NotificationType.emergency).toList();

  List<AppNotification> get maintenanceNotifications =>
      state.notifications.where((notification) =>
          notification.notificationType == NotificationType.maintenance).toList();

  List<AppNotification> get systemNotifications =>
      state.notifications.where((notification) =>
          notification.notificationType == NotificationType.system).toList();

  List<AppNotification> get recentNotifications =>
      state.notifications.where((notification) => notification.isRecent).toList();

  List<AppNotification> get urgentNotifications =>
      state.notifications.where((notification) => notification.isUrgent).toList();

  int get unreadCount => state.summary?.unreadCount ?? state.unreadNotifications.length;

  int get totalCount => state.summary?.totalCount ?? state.notifications.length;

  bool get hasUnreadNotifications => unreadCount > 0;

  bool get hasUrgentNotifications => urgentNotifications.isNotEmpty;
}