import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.read(apiServiceProvider),
    ref.read(storageServiceProvider),
  );
});

class AuthState {
  final bool isAuthenticated;
  final User? user;
  final String? token;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.isAuthenticated = false,
    this.user,
    this.token,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    User? user,
    String? token,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiService _apiService;
  final StorageService _storageService;

  AuthNotifier(this._apiService, this._storageService) : super(const AuthState()) {
    _initializeAuth();
  }

  Future<void> _initializeAuth() async {
    state = state.copyWith(isLoading: true);

    try {
      final token = await _storageService.getAuthToken();
      final userData = _storageService.getUserData();

      if (token != null && userData != null) {
        // Verify token is still valid by getting current user
        try {
          final currentUser = await _apiService.getCurrentUser(token);
          state = state.copyWith(
            isAuthenticated: true,
            user: currentUser,
            token: token,
            isLoading: false,
            error: null,
          );
        } catch (e) {
          // Token is invalid, clear stored data
          await _clearAuthData();
          state = state.copyWith(
            isAuthenticated: false,
            user: null,
            token: null,
            isLoading: false,
            error: null,
          );
        }
      } else {
        state = state.copyWith(
          isAuthenticated: false,
          user: null,
          token: null,
          isLoading: false,
          error: null,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        user: null,
        token: null,
        isLoading: false,
        error: 'Failed to initialize authentication: ${e.toString()}',
      );
    }
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final authResponse = await _apiService.login(email, password);

      // Store auth data
      await _storageService.setAuthToken(authResponse.accessToken);
      await _storageService.setUserData(authResponse.user);

      state = state.copyWith(
        isAuthenticated: true,
        user: authResponse.user,
        token: authResponse.accessToken,
        isLoading: false,
        error: null,
      );

      return true;
    } catch (e) {
      String errorMessage = 'Login failed';
      if (e is ApiException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }

      state = state.copyWith(
        isAuthenticated: false,
        user: null,
        token: null,
        isLoading: false,
        error: errorMessage,
      );

      return false;
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    try {
      // Call logout API if we have a token
      if (state.token != null) {
        try {
          await _apiService.logout(state.token!);
        } catch (e) {
          // Continue with logout even if API call fails
        }
      }

      await _clearAuthData();

      state = const AuthState(
        isAuthenticated: false,
        user: null,
        token: null,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      // Even if logout fails, clear local state
      await _clearAuthData();
      state = const AuthState(
        isAuthenticated: false,
        user: null,
        token: null,
        isLoading: false,
        error: null,
      );
    }
  }

  Future<bool> refreshToken() async {
    if (state.token == null) return false;

    try {
      final authResponse = await _apiService.refreshToken(state.token!);

      await _storageService.setAuthToken(authResponse.accessToken);
      await _storageService.setUserData(authResponse.user);

      state = state.copyWith(
        user: authResponse.user,
        token: authResponse.accessToken,
        error: null,
      );

      return true;
    } catch (e) {
      // If refresh fails, logout user
      await logout();
      return false;
    }
  }

  Future<void> updateUserData() async {
    if (state.token == null) return;

    try {
      final currentUser = await _apiService.getCurrentUser(state.token!);
      await _storageService.setUserData(currentUser);

      state = state.copyWith(
        user: currentUser,
        error: null,
      );
    } catch (e) {
      // If getting user data fails, might need to refresh token
      final refreshSuccess = await refreshToken();
      if (!refreshSuccess) {
        state = state.copyWith(
          error: 'Failed to update user data: ${e.toString()}',
        );
      }
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> _clearAuthData() async {
    await _storageService.clearAllData();
  }

  // Helper getters
  bool get isLoggedIn => state.isAuthenticated && state.user != null;
  bool get isLoading => state.isLoading;
  String? get errorMessage => state.error;
  User? get currentUser => state.user;
  String? get currentToken => state.token;

  // Role-based helpers
  bool get canManageAssets => state.user?.canManageAssets ?? false;
  bool get canExecuteTasks => state.user?.canExecuteTasks ?? false;
  bool get canViewReports => state.user?.canViewReports ?? false;
  bool get hasAdminAccess => state.user?.hasAdminAccess ?? false;

  String get userRoleDisplayName => state.user?.userRole.displayName ?? 'Unknown';
}