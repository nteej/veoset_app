import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
class Asset with _$Asset {
  const factory Asset({
    required int id,
    required String name,
    required String type,
    required String status,
    required String healthScore,
    required int siteId,
    required String siteName,
    String? description,
    String? location,
    String? serialNumber,
    String? model,
    String? manufacturer,
    @JsonKey(name: 'installation_date') DateTime? installationDate,
    @JsonKey(name: 'last_maintenance') DateTime? lastMaintenance,
    @JsonKey(name: 'next_maintenance') DateTime? nextMaintenance,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    List<String>? tags,
    Map<String, dynamic>? specifications,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class AssetHealthData with _$AssetHealthData {
  const factory AssetHealthData({
    required String date,
    required double score,
    String? status,
    String? notes,
  }) = _AssetHealthData;

  factory AssetHealthData.fromJson(Map<String, dynamic> json) =>
      _$AssetHealthDataFromJson(json);
}

@freezed
class AssetListResponse with _$AssetListResponse {
  const factory AssetListResponse({
    required List<Asset> data,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'last_page') int? lastPage,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
  }) = _AssetListResponse;

  factory AssetListResponse.fromJson(Map<String, dynamic> json) =>
      _$AssetListResponseFromJson(json);
}

enum AssetStatus {
  @JsonValue('operational')
  operational,
  @JsonValue('maintenance')
  maintenance,
  @JsonValue('emergency')
  emergency,
  @JsonValue('offline')
  offline,
}

extension AssetStatusExtension on AssetStatus {
  String get displayName {
    switch (this) {
      case AssetStatus.operational:
        return 'Operational';
      case AssetStatus.maintenance:
        return 'Under Maintenance';
      case AssetStatus.emergency:
        return 'Emergency';
      case AssetStatus.offline:
        return 'Offline';
    }
  }

  String get color {
    switch (this) {
      case AssetStatus.operational:
        return '#4CAF50';
      case AssetStatus.maintenance:
        return '#FF9800';
      case AssetStatus.emergency:
        return '#F44336';
      case AssetStatus.offline:
        return '#9E9E9E';
    }
  }
}

extension AssetExtension on Asset {
  AssetStatus get assetStatus {
    switch (status.toLowerCase()) {
      case 'operational':
        return AssetStatus.operational;
      case 'maintenance':
        return AssetStatus.maintenance;
      case 'emergency':
        return AssetStatus.emergency;
      case 'offline':
        return AssetStatus.offline;
      default:
        return AssetStatus.offline;
    }
  }

  double get healthScoreValue {
    try {
      if (healthScore.contains('%')) {
        return double.parse(healthScore.replaceAll('%', ''));
      }
      final value = double.parse(healthScore);
      return value > 1 ? value / 100 : value;
    } catch (e) {
      return 0.0;
    }
  }

  String get healthScoreDisplay {
    final score = (healthScoreValue * 100).toInt();
    return '$score%';
  }

  bool get isHealthy => healthScoreValue >= 0.8;
  bool get needsAttention => healthScoreValue < 0.6;
  bool get isCritical => healthScoreValue < 0.3;

  String get statusDisplayName => assetStatus.displayName;

  Color get statusColor {
    switch (assetStatus) {
      case AssetStatus.operational:
        return const Color(0xFF4CAF50);
      case AssetStatus.maintenance:
        return const Color(0xFFFF9800);
      case AssetStatus.emergency:
        return const Color(0xFFF44336);
      case AssetStatus.offline:
        return const Color(0xFF9E9E9E);
    }
  }

  IconData get statusIcon {
    switch (assetStatus) {
      case AssetStatus.operational:
        return Icons.check_circle;
      case AssetStatus.maintenance:
        return Icons.build;
      case AssetStatus.emergency:
        return Icons.warning;
      case AssetStatus.offline:
        return Icons.power_off;
    }
  }

  Color get healthScoreColor {
    if (healthScoreValue >= 0.8) return const Color(0xFF4CAF50);
    if (healthScoreValue >= 0.6) return const Color(0xFFFF9800);
    return const Color(0xFFF44336);
  }

  DateTime? get lastMaintenanceDate => lastMaintenance;

  String get lastMaintenanceDateFormatted {
    if (lastMaintenance == null) return 'Never';
    final now = DateTime.now();
    final difference = now.difference(lastMaintenance!);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return 'Today';
    }
  }
}