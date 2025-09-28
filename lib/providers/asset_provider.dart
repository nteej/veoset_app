import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/asset.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

final assetProvider = StateNotifierProvider<AssetNotifier, AssetState>((ref) {
  return AssetNotifier(
    ref.read(apiServiceProvider),
    ref.read(authProvider.notifier),
  );
});

final assetListProvider = FutureProvider<List<Asset>>((ref) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final assetNotifier = ref.read(assetProvider.notifier);
  return assetNotifier.getAssets();
});

final assetDetailsProvider = FutureProvider.family<Asset, int>((ref, assetId) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final assetNotifier = ref.read(assetProvider.notifier);
  return assetNotifier.getAssetDetails(assetId);
});

final assetHealthHistoryProvider = FutureProvider.family<List<AssetHealthData>, int>((ref, assetId) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final assetNotifier = ref.read(assetProvider.notifier);
  return assetNotifier.getAssetHealthHistory(assetId);
});

class AssetState {
  final List<Asset> assets;
  final bool isLoading;
  final String? error;
  final Map<int, Asset> assetCache;
  final Map<int, List<AssetHealthData>> healthHistoryCache;

  const AssetState({
    this.assets = const [],
    this.isLoading = false,
    this.error,
    this.assetCache = const {},
    this.healthHistoryCache = const {},
  });

  AssetState copyWith({
    List<Asset>? assets,
    bool? isLoading,
    String? error,
    Map<int, Asset>? assetCache,
    Map<int, List<AssetHealthData>>? healthHistoryCache,
  }) {
    return AssetState(
      assets: assets ?? this.assets,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      assetCache: assetCache ?? this.assetCache,
      healthHistoryCache: healthHistoryCache ?? this.healthHistoryCache,
    );
  }
}

class AssetNotifier extends StateNotifier<AssetState> {
  final ApiService _apiService;
  final AuthNotifier _authNotifier;

  AssetNotifier(this._apiService, this._authNotifier) : super(const AssetState());

  Future<List<Asset>> getAssets({
    int? siteId,
    String? status,
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh && state.assets.isNotEmpty) {
      return state.assets;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.getAssets(
        token,
        siteId: siteId,
        status: status,
      );

      final assets = response.map((json) => Asset.fromJson(json)).toList();

      state = state.copyWith(
        assets: assets,
        isLoading: false,
        error: null,
      );

      return assets;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<Asset> getAssetDetails(int assetId, {bool forceRefresh = false}) async {
    if (!forceRefresh && state.assetCache.containsKey(assetId)) {
      return state.assetCache[assetId]!;
    }

    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.getAsset(token, assetId);
      final asset = Asset.fromJson(response);

      state = state.copyWith(
        assetCache: {...state.assetCache, assetId: asset},
      );

      return asset;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<List<AssetHealthData>> getAssetHealthHistory(
    int assetId, {
    int days = 7,
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh && state.healthHistoryCache.containsKey(assetId)) {
      return state.healthHistoryCache[assetId]!;
    }

    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.getAssetHealthHistory(
        token,
        assetId,
        days: days,
      );

      final healthData = response
          .map((json) => AssetHealthData.fromJson(json))
          .toList();

      state = state.copyWith(
        healthHistoryCache: {...state.healthHistoryCache, assetId: healthData},
      );

      return healthData;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> updateAssetStatus(
    int assetId,
    String status, {
    String? notes,
  }) async {
    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      await _apiService.updateAssetStatus(
        token,
        assetId,
        status,
        notes: notes,
      );

      // Refresh asset details after status update
      await getAssetDetails(assetId, forceRefresh: true);

      // Refresh assets list to update overview
      await getAssets(forceRefresh: true);

    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearCache() {
    state = const AssetState();
  }

  // Helper getters
  List<Asset> get operationalAssets =>
      state.assets.where((asset) => asset.status == 'operational').toList();

  List<Asset> get maintenanceAssets =>
      state.assets.where((asset) => asset.status == 'maintenance').toList();

  List<Asset> get emergencyAssets =>
      state.assets.where((asset) => asset.status == 'emergency').toList();

  List<Asset> get offlineAssets =>
      state.assets.where((asset) => asset.status == 'offline').toList();

  List<Asset> get criticalAssets =>
      state.assets.where((asset) => asset.isCritical).toList();

  List<Asset> get assetsNeedingAttention =>
      state.assets.where((asset) => asset.needsAttention).toList();

  int get totalAssets => state.assets.length;

  double get averageHealthScore {
    if (state.assets.isEmpty) return 0.0;
    return state.assets
        .map((asset) => asset.healthScoreValue)
        .reduce((a, b) => a + b) / state.assets.length;
  }
}