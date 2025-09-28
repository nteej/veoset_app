import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  throw UnimplementedError();
});

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}

class ApiService {
  final String baseUrl;
  final http.Client _client;

  ApiService({
    required this.baseUrl,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Map<String, String> _headersWithAuth(String token) => {
    ..._headers,
    'Authorization': 'Bearer $token',
  };

  Future<Map<String, dynamic>> _handleResponse(http.Response response) async {
    final body = response.body.isNotEmpty
        ? json.decode(response.body) as Map<String, dynamic>
        : <String, dynamic>{};

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    }

    final errorMessage = body['message'] ?? body['error'] ?? 'Unknown error';
    throw ApiException(errorMessage, response.statusCode);
  }

  // Authentication endpoints
  Future<AuthResponse> login(String email, String password) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: _headers,
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    final data = await _handleResponse(response);
    return AuthResponse.fromJson(data);
  }

  Future<void> logout(String token) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/auth/logout'),
      headers: _headersWithAuth(token),
    );

    await _handleResponse(response);
  }

  Future<User> getCurrentUser(String token) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/auth/user'),
      headers: _headersWithAuth(token),
    );

    final data = await _handleResponse(response);
    return User.fromJson(data);
  }

  Future<AuthResponse> refreshToken(String token) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/auth/refresh'),
      headers: _headersWithAuth(token),
    );

    final data = await _handleResponse(response);
    return AuthResponse.fromJson(data);
  }

  // Dashboard endpoints
  Future<Map<String, dynamic>> getDashboardOverview(String token) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/dashboard/overview'),
      headers: _headersWithAuth(token),
    );

    return await _handleResponse(response);
  }

  Future<Map<String, dynamic>> getDashboardStatistics(
    String token, {
    String period = 'week',
  }) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/dashboard/statistics?period=$period'),
      headers: _headersWithAuth(token),
    );

    return await _handleResponse(response);
  }

  // Assets endpoints
  Future<List<Map<String, dynamic>>> getAssets(
    String token, {
    int? siteId,
    String? status,
  }) async {
    final queryParams = <String, String>{};
    if (siteId != null) queryParams['site_id'] = siteId.toString();
    if (status != null) queryParams['status'] = status;

    final uri = Uri.parse('$baseUrl/assets').replace(queryParameters: queryParams);
    final response = await _client.get(uri, headers: _headersWithAuth(token));

    final data = await _handleResponse(response);
    return List<Map<String, dynamic>>.from(data['data'] ?? []);
  }

  Future<Map<String, dynamic>> getAsset(String token, int id) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/assets/$id'),
      headers: _headersWithAuth(token),
    );

    return await _handleResponse(response);
  }

  Future<void> updateAssetStatus(
    String token,
    int id,
    String status, {
    String? notes,
  }) async {
    final response = await _client.put(
      Uri.parse('$baseUrl/assets/$id/status'),
      headers: _headersWithAuth(token),
      body: json.encode({
        'status': status,
        if (notes != null) 'notes': notes,
      }),
    );

    await _handleResponse(response);
  }

  Future<List<Map<String, dynamic>>> getAssetHealthHistory(
    String token,
    int id, {
    int days = 7,
  }) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/assets/$id/health-history?days=$days'),
      headers: _headersWithAuth(token),
    );

    final data = await _handleResponse(response);
    return List<Map<String, dynamic>>.from(data['data'] ?? []);
  }

  // Maintenance endpoints
  Future<List<Map<String, dynamic>>> getMaintenanceTasks(
    String token, {
    String? status,
    String? priority,
  }) async {
    final queryParams = <String, String>{};
    if (status != null) queryParams['status'] = status;
    if (priority != null) queryParams['priority'] = priority;

    final uri = Uri.parse('$baseUrl/maintenance/tasks')
        .replace(queryParameters: queryParams);
    final response = await _client.get(uri, headers: _headersWithAuth(token));

    final data = await _handleResponse(response);
    return List<Map<String, dynamic>>.from(data['data'] ?? []);
  }

  Future<Map<String, dynamic>> getMaintenanceTask(String token, int id) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/maintenance/tasks/$id'),
      headers: _headersWithAuth(token),
    );

    return await _handleResponse(response);
  }

  Future<void> updateTaskStatus(
    String token,
    int id,
    String status, {
    String? notes,
    String? completionNotes,
  }) async {
    final response = await _client.put(
      Uri.parse('$baseUrl/maintenance/tasks/$id/status'),
      headers: _headersWithAuth(token),
      body: json.encode({
        'status': status,
        if (notes != null) 'notes': notes,
        if (completionNotes != null) 'completion_notes': completionNotes,
      }),
    );

    await _handleResponse(response);
  }

  Future<Map<String, dynamic>> createMaintenanceTask(
    String token, {
    required int assetId,
    required String title,
    String? description,
    required String priority,
    DateTime? dueDate,
  }) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/maintenance/tasks'),
      headers: _headersWithAuth(token),
      body: json.encode({
        'asset_id': assetId,
        'title': title,
        if (description != null) 'description': description,
        'priority': priority,
        if (dueDate != null) 'due_date': dueDate.toIso8601String().split('T')[0],
      }),
    );

    return await _handleResponse(response);
  }

  Future<Map<String, dynamic>> getMaintenanceSchedule(
    String token, {
    DateTime? date,
  }) async {
    final dateStr = date?.toIso8601String().split('T')[0] ??
        DateTime.now().toIso8601String().split('T')[0];

    final response = await _client.get(
      Uri.parse('$baseUrl/maintenance/schedule?date=$dateStr'),
      headers: _headersWithAuth(token),
    );

    return await _handleResponse(response);
  }

  // Notifications endpoints
  Future<Map<String, dynamic>> getNotifications(
    String token, {
    bool unreadOnly = false,
    int limit = 50,
  }) async {
    final queryParams = <String, String>{
      'unread_only': unreadOnly.toString(),
      'limit': limit.toString(),
    };

    final uri = Uri.parse('$baseUrl/notifications')
        .replace(queryParameters: queryParams);
    final response = await _client.get(uri, headers: _headersWithAuth(token));

    return await _handleResponse(response);
  }

  Future<Map<String, dynamic>> getNotificationsSummary(String token) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/notifications/summary'),
      headers: _headersWithAuth(token),
    );

    return await _handleResponse(response);
  }

  Future<void> markNotificationAsRead(String token, String id) async {
    final response = await _client.put(
      Uri.parse('$baseUrl/notifications/$id/read'),
      headers: _headersWithAuth(token),
    );

    await _handleResponse(response);
  }

  Future<void> markAllNotificationsAsRead(String token) async {
    final response = await _client.put(
      Uri.parse('$baseUrl/notifications/read-all'),
      headers: _headersWithAuth(token),
    );

    await _handleResponse(response);
  }

  Future<void> deleteNotification(String token, String id) async {
    final response = await _client.delete(
      Uri.parse('$baseUrl/notifications/$id'),
      headers: _headersWithAuth(token),
    );

    await _handleResponse(response);
  }

  // Health check
  Future<Map<String, dynamic>> healthCheck(String token) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/health'),
      headers: _headersWithAuth(token),
    );

    return await _handleResponse(response);
  }

  void dispose() {
    _client.close();
  }
}