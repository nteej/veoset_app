import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/notification.dart';
import '../../providers/notification_provider.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/notifications/notification_card.dart';
import '../../widgets/notifications/notification_filter_bar.dart';
import '../../widgets/notifications/notification_summary_card.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedType;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final notificationListAsync = ref.watch(notificationListProvider);
    final notificationSummaryAsync = ref.watch(notificationSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read),
            onPressed: () => _markAllAsRead(),
            tooltip: 'Mark All as Read',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(notificationListProvider);
              ref.invalidate(notificationSummaryProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Unread'),
            Tab(text: 'Important'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Summary Card
          notificationSummaryAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
            data: (summary) => NotificationSummaryCard(summary: summary),
          ),

          // Filter Bar
          NotificationFilterBar(
            selectedType: _selectedType,
            onTypeChanged: (type) {
              setState(() {
                _selectedType = type;
              });
            },
          ),

          // Notifications Content
          Expanded(
            child: notificationListAsync.when(
              loading: () => const LoadingWidget(message: 'Loading notifications...'),
              error: (error, stackTrace) => ErrorRetryWidget(
                message: 'Failed to load notifications',
                onRetry: () => ref.invalidate(notificationListProvider),
              ),
              data: (notifications) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildNotificationsList(notifications, null),
                    _buildNotificationsList(notifications, 'unread'),
                    _buildNotificationsList(notifications, 'important'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(List<AppNotification> allNotifications, String? filter) {
    final filteredNotifications = _filterNotifications(allNotifications, filter);

    if (filteredNotifications.isEmpty) {
      return _buildEmptyState(context, filter);
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(notificationListProvider);
        ref.invalidate(notificationSummaryProvider);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredNotifications.length,
        itemBuilder: (context, index) {
          final notification = filteredNotifications[index];
          return NotificationCard(
            notification: notification,
            onTap: () => _handleNotificationTap(notification),
            onMarkAsRead: () => _markAsRead(notification.id),
            onDelete: () => _deleteNotification(notification.id),
          );
        },
      ),
    );
  }

  List<AppNotification> _filterNotifications(List<AppNotification> notifications, String? filter) {
    var filtered = notifications.where((notification) {
      final matchesType = _selectedType == null || notification.type == _selectedType;
      return matchesType;
    });

    switch (filter) {
      case 'unread':
        filtered = filtered.where((n) => !n.isRead);
        break;
      case 'important':
        filtered = filtered.where((n) => n.isUrgent);
        break;
      default:
        break;
    }

    return filtered.toList()
      ..sort((a, b) {
        // Sort unread first, then by creation date
        if (a.isRead != b.isRead) {
          return a.isRead ? 1 : -1;
        }

        if (a.createdAt != null && b.createdAt != null) {
          return b.createdAt!.compareTo(a.createdAt!);
        }

        return 0;
      });
  }

  Widget _buildEmptyState(BuildContext context, String? filter) {
    final theme = Theme.of(context);

    String title;
    String message;
    IconData icon;

    switch (filter) {
      case 'unread':
        title = 'No Unread Notifications';
        message = 'You\'re all caught up! No unread notifications at the moment.';
        icon = Icons.mark_email_read;
        break;
      case 'important':
        title = 'No Important Notifications';
        message = 'No urgent or emergency notifications requiring immediate attention.';
        icon = Icons.notification_important;
        break;
      default:
        title = 'No Notifications';
        message = _selectedType != null
            ? 'No notifications of this type found'
            : 'You don\'t have any notifications yet';
        icon = Icons.notifications_none;
        break;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _handleNotificationTap(AppNotification notification) {
    // Mark as read if unread
    if (!notification.isRead) {
      _markAsRead(notification.id);
    }

    // Handle navigation based on action URL or related type
    if (notification.actionUrl != null) {
      // TODO: Navigate to specific URL or screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Navigation to ${notification.actionUrl} - Coming soon')),
      );
    } else {
      // Show notification details
      _showNotificationDetails(notification);
    }
  }

  void _showNotificationDetails(AppNotification notification) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notification.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.message),
            const SizedBox(height: 8),
            Text(
              'Type: ${notification.notificationType.displayName}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (notification.createdAt != null)
              Text(
                'Time: ${notification.timeAgo}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _markAsRead(String notificationId) async {
    try {
      await ref.read(notificationProvider.notifier).markAsRead(notificationId);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to mark as read: $e')),
        );
      }
    }
  }

  void _markAllAsRead() async {
    try {
      await ref.read(notificationProvider.notifier).markAllAsRead();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All notifications marked as read')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to mark all as read: $e')),
        );
      }
    }
  }

  void _deleteNotification(String notificationId) async {
    try {
      await ref.read(notificationProvider.notifier).deleteNotification(notificationId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notification deleted')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete notification: $e')),
        );
      }
    }
  }
}