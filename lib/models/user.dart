import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String role,
    required List<String> permissions,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'expires_in') required int expiresIn,
    required User user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

enum UserRole {
  @JsonValue('veo_admin')
  veoAdmin,
  @JsonValue('site_manager')
  siteManager,
  @JsonValue('maintenance_staff')
  maintenanceStaff,
  @JsonValue('customer')
  customer,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.veoAdmin:
        return 'VEO Administrator';
      case UserRole.siteManager:
        return 'Site Manager';
      case UserRole.maintenanceStaff:
        return 'Maintenance Staff';
      case UserRole.customer:
        return 'Customer';
    }
  }

  bool get canManageAssets {
    return this == UserRole.veoAdmin || this == UserRole.siteManager;
  }

  bool get canExecuteTasks {
    return this == UserRole.veoAdmin ||
           this == UserRole.siteManager ||
           this == UserRole.maintenanceStaff;
  }

  bool get canViewReports {
    return true; // All roles can view reports with role-based filtering
  }

  bool get hasAdminAccess {
    return this == UserRole.veoAdmin;
  }
}

extension UserExtension on User {
  UserRole get userRole {
    switch (role) {
      case 'veo_admin':
        return UserRole.veoAdmin;
      case 'site_manager':
        return UserRole.siteManager;
      case 'maintenance_staff':
        return UserRole.maintenanceStaff;
      case 'customer':
        return UserRole.customer;
      default:
        return UserRole.customer;
    }
  }

  bool hasPermission(String permission) {
    return permissions.contains(permission);
  }

  bool get canManageAssets => userRole.canManageAssets;
  bool get canExecuteTasks => userRole.canExecuteTasks;
  bool get canViewReports => userRole.canViewReports;
  bool get hasAdminAccess => userRole.hasAdminAccess;
}