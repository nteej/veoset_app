class AppConstants {
  // API Configuration
  static const String apiBaseUrl = 'https://smartforce.fi/api';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';

  // User Roles
  static const String roleVeoAdmin = 'veo_admin';
  static const String roleSiteManager = 'site_manager';
  static const String roleMaintenanceStaff = 'maintenance_staff';
  static const String roleCustomer = 'customer';

  // Asset Status
  static const String statusOperational = 'operational';
  static const String statusMaintenance = 'maintenance';
  static const String statusEmergency = 'emergency';
  static const String statusOffline = 'offline';

  // Task Status
  static const String taskPending = 'pending';
  static const String taskInProgress = 'in_progress';
  static const String taskCompleted = 'completed';
  static const String taskCancelled = 'cancelled';

  // Task Priority
  static const String priorityLow = 'low';
  static const String priorityMedium = 'medium';
  static const String priorityHigh = 'high';
  static const String priorityEmergency = 'emergency';

  // Health Status
  static const String healthExcellent = 'excellent';
  static const String healthGood = 'good';
  static const String healthFair = 'fair';
  static const String healthPoor = 'poor';
  static const String healthCritical = 'critical';

  // Colors
  static const Map<String, int> statusColors = {
    statusOperational: 0xFF4CAF50, // Green
    statusMaintenance: 0xFFFF9800, // Orange
    statusEmergency: 0xFFF44336, // Red
    statusOffline: 0xFF9E9E9E, // Grey
  };

  static const Map<String, int> priorityColors = {
    priorityLow: 0xFF2196F3, // Blue
    priorityMedium: 0xFFFF9800, // Orange
    priorityHigh: 0xFFF44336, // Red
    priorityEmergency: 0xFF9C27B0, // Purple
  };

  static const Map<String, int> healthColors = {
    healthExcellent: 0xFF4CAF50, // Green
    healthGood: 0xFF8BC34A, // Light Green
    healthFair: 0xFFFF9800, // Orange
    healthPoor: 0xFFFF5722, // Deep Orange
    healthCritical: 0xFFF44336, // Red
  };

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Refresh intervals (in seconds)
  static const int dashboardRefreshInterval = 30;
  static const int assetRefreshInterval = 60;
  static const int notificationRefreshInterval = 15;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 8.0;

  // Chart colors
  static const List<int> chartColors = [
    0xFF2196F3, // Blue
    0xFF4CAF50, // Green
    0xFFFF9800, // Orange
    0xFFF44336, // Red
    0xFF9C27B0, // Purple
    0xFF00BCD4, // Cyan
    0xFFFFEB3B, // Yellow
    0xFF795548, // Brown
  ];
}