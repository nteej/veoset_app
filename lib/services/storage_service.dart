import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../utils/constants.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError();
});

class StorageService {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  StorageService(
    this._prefs, {
    FlutterSecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  // Auth token management (secure storage)
  Future<void> setAuthToken(String token) async {
    await _secureStorage.write(
      key: AppConstants.authTokenKey,
      value: token,
    );
  }

  Future<String?> getAuthToken() async {
    return await _secureStorage.read(key: AppConstants.authTokenKey);
  }

  Future<void> clearAuthToken() async {
    await _secureStorage.delete(key: AppConstants.authTokenKey);
  }

  // User data management
  Future<void> setUserData(User user) async {
    final userJson = json.encode(user.toJson());
    await _prefs.setString(AppConstants.userDataKey, userJson);
  }

  User? getUserData() {
    final userJson = _prefs.getString(AppConstants.userDataKey);
    if (userJson == null) return null;

    try {
      final userMap = json.decode(userJson) as Map<String, dynamic>;
      return User.fromJson(userMap);
    } catch (e) {
      return null;
    }
  }

  Future<void> clearUserData() async {
    await _prefs.remove(AppConstants.userDataKey);
  }

  // Theme management
  Future<void> setThemeMode(String themeMode) async {
    await _prefs.setString(AppConstants.themeKey, themeMode);
  }

  String getThemeMode() {
    return _prefs.getString(AppConstants.themeKey) ?? 'system';
  }

  // First launch tracking
  Future<void> setFirstLaunch(bool isFirstLaunch) async {
    await _prefs.setBool('first_launch', isFirstLaunch);
  }

  bool isFirstLaunch() {
    return _prefs.getBool('first_launch') ?? true;
  }

  // Dashboard cache
  Future<void> setCachedDashboardData(Map<String, dynamic> data) async {
    final dataJson = json.encode(data);
    await _prefs.setString('cached_dashboard', dataJson);
    await _prefs.setInt('dashboard_cache_time', DateTime.now().millisecondsSinceEpoch);
  }

  Map<String, dynamic>? getCachedDashboardData() {
    final dataJson = _prefs.getString('cached_dashboard');
    final cacheTime = _prefs.getInt('dashboard_cache_time');

    if (dataJson == null || cacheTime == null) return null;

    // Check if cache is expired (5 minutes)
    final now = DateTime.now().millisecondsSinceEpoch;
    final cacheAge = now - cacheTime;
    if (cacheAge > 300000) { // 5 minutes in milliseconds
      clearCachedDashboardData();
      return null;
    }

    try {
      return json.decode(dataJson) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  Future<void> clearCachedDashboardData() async {
    await _prefs.remove('cached_dashboard');
    await _prefs.remove('dashboard_cache_time');
  }

  // Notification settings
  Future<void> setNotificationsEnabled(bool enabled) async {
    await _prefs.setBool('notifications_enabled', enabled);
  }

  bool getNotificationsEnabled() {
    return _prefs.getBool('notifications_enabled') ?? true;
  }

  Future<void> setNotificationToken(String token) async {
    await _secureStorage.write(key: 'fcm_token', value: token);
  }

  Future<String?> getNotificationToken() async {
    return await _secureStorage.read(key: 'fcm_token');
  }

  // Last sync timestamps
  Future<void> setLastSyncTime(String key, DateTime time) async {
    await _prefs.setInt('last_sync_$key', time.millisecondsSinceEpoch);
  }

  DateTime? getLastSyncTime(String key) {
    final timestamp = _prefs.getInt('last_sync_$key');
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  // Clear all data (logout)
  Future<void> clearAllData() async {
    await clearAuthToken();
    await clearUserData();
    await clearCachedDashboardData();
    await _secureStorage.delete(key: 'fcm_token');

    // Keep theme and first launch settings
    final themeMode = getThemeMode();
    final firstLaunch = isFirstLaunch();

    await _prefs.clear();

    // Restore preserved settings
    await setThemeMode(themeMode);
    await setFirstLaunch(firstLaunch);
  }

  // Development/debugging helpers
  Future<void> clearAllCache() async {
    await clearCachedDashboardData();
    // Add other cache clearing as needed
  }

  Map<String, dynamic> getDebugInfo() {
    return {
      'has_auth_token': _prefs.containsKey(AppConstants.authTokenKey),
      'has_user_data': _prefs.containsKey(AppConstants.userDataKey),
      'theme_mode': getThemeMode(),
      'notifications_enabled': getNotificationsEnabled(),
      'is_first_launch': isFirstLaunch(),
      'last_dashboard_cache': _prefs.getInt('dashboard_cache_time'),
    };
  }
}