import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../models/user.dart';
import '../../models/asset.dart';
import '../../models/maintenance_task.dart';
import '../../providers/auth_provider.dart';
import '../../providers/asset_provider.dart';
import '../../providers/maintenance_provider.dart';
import '../../providers/notification_provider.dart';
import '../../utils/constants.dart';
import '../../utils/app_theme.dart';
import '../scanner/qr_scanner_screen.dart';
import '../assets/assets_screen.dart';
import '../maintenance/maintenance_screen.dart';
import '../notifications/notifications_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _currentIndex = 0;

  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      icon: Icons.dashboard,
      label: 'Dashboard',
      route: '/dashboard',
    ),
    NavigationItem(
      icon: Icons.inventory_2,
      label: 'Assets',
      route: '/assets',
    ),
    NavigationItem(
      icon: Icons.build,
      label: 'Maintenance',
      route: '/maintenance',
    ),
    NavigationItem(
      icon: Icons.notifications,
      label: 'Notifications',
      route: '/notifications',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final theme = Theme.of(context);

    if (!authState.isAuthenticated || authState.user == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('VEO Dashboard'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              switch (value) {
                case 'profile':
                  // TODO: Navigate to profile
                  break;
                case 'settings':
                  // TODO: Navigate to settings
                  break;
                case 'logout':
                  await ref.read(authProvider.notifier).logout();
                  if (context.mounted) {
                    context.go('/login');
                  }
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text('Profile'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: theme.colorScheme.error),
                    SizedBox(width: 8),
                    Text(
                      'Logout',
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ],
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      authState.user!.name.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _DashboardHomeView(
            onNavigateToTab: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          AssetsScreen(),
          MaintenanceScreen(),
          NotificationsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navigationItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }
}

class _DashboardHomeView extends ConsumerWidget {
  final Function(int) onNavigateToTab;

  const _DashboardHomeView({required this.onNavigateToTab});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final theme = Theme.of(context);
    final user = authState.user!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, ${user.name}!',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          user.userRole.displayName,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.verified_user,
                        color: AppTheme.successColor,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Active',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppTheme.successColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Quick Stats
          Text(
            'Quick Overview',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          _DashboardStats(),

          const SizedBox(height: 24),

          // Recent Activity
          Text(
            'Recent Activity',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          Card(
            child: Column(
              children: [
                _ActivityItem(
                  icon: Icons.build,
                  title: 'Maintenance Task Completed',
                  subtitle: 'Generator A1 - Routine inspection',
                  time: '2 hours ago',
                  color: AppTheme.successColor,
                ),
                Divider(height: 1),
                _ActivityItem(
                  icon: Icons.warning,
                  title: 'Alert Generated',
                  subtitle: 'Pump B2 - Temperature threshold exceeded',
                  time: '4 hours ago',
                  color: AppTheme.warningColor,
                ),
                Divider(height: 1),
                _ActivityItem(
                  icon: Icons.check_circle,
                  title: 'Asset Status Updated',
                  subtitle: 'Compressor C3 - Returned to operational',
                  time: '6 hours ago',
                  color: AppTheme.successColor,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Quick Actions
          if (user.canExecuteTasks || user.canManageAssets) ...[
            Text(
              'Quick Actions',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                if (user.canExecuteTasks)
                  _ActionChip(
                    label: 'Create Task',
                    icon: Icons.add_task,
                    onPressed: () {
                      onNavigateToTab(2); // Navigate to Maintenance tab
                    },
                  ),
                if (user.canManageAssets)
                  _ActionChip(
                    label: 'Add Asset',
                    icon: Icons.add_box,
                    onPressed: () {
                      onNavigateToTab(1); // Navigate to Assets tab
                    },
                  ),
                _ActionChip(
                  label: 'View Reports',
                  icon: Icons.analytics,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Reports feature - Coming soon'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                _ActionChip(
                  label: 'Scan QR Code',
                  icon: Icons.qr_code_scanner,
                  onPressed: () => _openQRScanner(context),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _openQRScanner(BuildContext context) async {
    try {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const QRScannerScreen(),
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR Scanner error: $e')),
        );
      }
    }
  }
}

class _DashboardStats extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    // Use the dashboard-specific provider that ensures fresh API data
    final assetListAsync = ref.watch(dashboardAssetProvider);
    final maintenanceTasksAsync = ref.watch(maintenanceTasksProvider);
    final notificationSummaryAsync = ref.watch(notificationSummaryProvider);

    return Column(
      children: [
        // Stats Grid
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            // Assets Stats
            assetListAsync.when(
              loading: () => _StatCard(
                title: 'Total Assets',
                value: '...',
                icon: Icons.inventory_2,
                color: theme.colorScheme.primary,
                isLoading: true,
              ),
              error: (_, __) => _StatCard(
                title: 'Total Assets',
                value: '0',
                icon: Icons.inventory_2,
                color: theme.colorScheme.error,
              ),
              data: (assets) => _StatCard(
                title: 'Total Assets',
                value: assets.length.toString(),
                icon: Icons.inventory_2,
                color: theme.colorScheme.primary,
                subtitle: '${assets.where((a) => a.status == 'operational').length} operational',
                onTap: () => context.go('/assets'),
              ),
            ),

            // Maintenance Tasks Stats
            maintenanceTasksAsync.when(
              loading: () => _StatCard(
                title: 'Active Tasks',
                value: '...',
                icon: Icons.assignment,
                color: AppTheme.warningColor,
                isLoading: true,
              ),
              error: (_, __) => _StatCard(
                title: 'Active Tasks',
                value: '0',
                icon: Icons.assignment,
                color: theme.colorScheme.error,
              ),
              data: (tasks) {
                final activeTasks = tasks.where((t) => t.status != 'completed').length;
                final overdueTasks = tasks.where((t) => t.isOverdue).length;
                return _StatCard(
                  title: 'Active Tasks',
                  value: activeTasks.toString(),
                  icon: Icons.assignment,
                  color: overdueTasks > 0 ? AppTheme.errorColor : AppTheme.warningColor,
                  subtitle: overdueTasks > 0 ? '$overdueTasks overdue' : 'On track',
                  onTap: () => context.go('/maintenance'),
                );
              },
            ),

            // Notifications Stats
            notificationSummaryAsync.when(
              loading: () => _StatCard(
                title: 'Notifications',
                value: '...',
                icon: Icons.notifications_active,
                color: AppTheme.infoColor,
                isLoading: true,
              ),
              error: (_, __) => _StatCard(
                title: 'Notifications',
                value: '0',
                icon: Icons.notifications_active,
                color: theme.colorScheme.error,
              ),
              data: (summary) => _StatCard(
                title: 'Notifications',
                value: summary.unreadCount.toString(),
                icon: Icons.notifications_active,
                color: summary.unreadCount > 0 ? AppTheme.infoColor : AppTheme.successColor,
                subtitle: summary.unreadCount > 0 ? 'Unread' : 'All caught up',
                onTap: () => context.go('/notifications'),
              ),
            ),

            // System Health Stats
            assetListAsync.when(
              loading: () => _StatCard(
                title: 'System Health',
                value: '...',
                icon: Icons.health_and_safety,
                color: AppTheme.successColor,
                isLoading: true,
              ),
              error: (_, __) => _StatCard(
                title: 'System Health',
                value: '0',
                icon: Icons.health_and_safety,
                color: theme.colorScheme.error,
              ),
              data: (assets) {
                if (assets.isEmpty) {
                  return _StatCard(
                    title: 'System Health',
                    value: 'N/A',
                    icon: Icons.health_and_safety,
                    color: AppTheme.warningColor,
                    subtitle: 'No assets',
                  );
                }
                final averageHealth = assets.isNotEmpty 
                    ? assets
                        .map((a) => a.healthScoreValue)
                        .reduce((a, b) => a + b) / assets.length
                    : 0.0;
                final healthPercentage = (averageHealth * 100).round();

                Color healthColor;
                if (healthPercentage >= 80) {
                  healthColor = AppTheme.successColor;
                } else if (healthPercentage >= 60) {
                  healthColor = AppTheme.warningColor;
                } else {
                  healthColor = AppTheme.errorColor;
                }

                return _StatCard(
                  title: 'System Health',
                  value: '$healthPercentage%',
                  icon: Icons.health_and_safety,
                  color: healthColor,
                  subtitle: 'Average health',
                );
              },
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Charts Section
        assetListAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (assets) => assets.isNotEmpty ? _buildCharts(context, assets) : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildCharts(BuildContext context, List<dynamic> assets) {
    final theme = Theme.of(context);

    // Calculate asset status distribution
    final statusCounts = <String, int>{};
    for (final asset in assets) {
      statusCounts[asset.status] = (statusCounts[asset.status] ?? 0) + 1;
    }

    if (statusCounts.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Asset Status Distribution',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: statusCounts.entries.map((entry) {
                    final percentage = (entry.value / assets.length * 100).round();
                    return PieChartSectionData(
                      value: entry.value.toDouble(),
                      title: '$percentage%',
                      color: _getStatusColor(entry.key),
                      radius: 50,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Legend
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: statusCounts.entries.map((entry) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getStatusColor(entry.key),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${entry.key.substring(0, 1).toUpperCase()}${entry.key.substring(1)} (${entry.value})',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'operational':
        return AppTheme.successColor;
      case 'maintenance':
        return AppTheme.warningColor;
      case 'emergency':
        return AppTheme.errorColor;
      case 'offline':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final String? subtitle;
  final bool isLoading;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
    this.subtitle,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  if (onTap != null)
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                ],
              ),
              const Spacer(),
              isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: color,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      value,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
              const SizedBox(height: 4),
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: color,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Text(
        time,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const _ActionChip({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionChip(
      avatar: Icon(
        icon,
        size: 18,
        color: theme.colorScheme.primary,
      ),
      label: Text(label),
      onPressed: onPressed,
      backgroundColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
      side: BorderSide(
        color: theme.colorScheme.primary.withValues(alpha: 0.2),
      ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;
  final String route;

  NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}