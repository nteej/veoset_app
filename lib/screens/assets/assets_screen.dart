import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/asset.dart';
import '../../providers/asset_provider.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/assets/asset_card.dart';
import '../../widgets/assets/asset_filter_bar.dart';
import '../../widgets/assets/asset_stats_bar.dart';
import '../scanner/qr_scanner_screen.dart';

class AssetsScreen extends ConsumerStatefulWidget {
  const AssetsScreen({super.key});

  @override
  ConsumerState<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends ConsumerState<AssetsScreen> {
  String _searchQuery = '';
  String? _selectedStatus;
  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final assetListAsync = ref.watch(assetListProvider);
    final assetNotifier = ref.read(assetProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () => _openQRScanner(context),
            tooltip: 'Scan Asset QR Code',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(assetListProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search assets...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHighest,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Filter Bar
          AssetFilterBar(
            selectedStatus: _selectedStatus,
            selectedType: _selectedType,
            onStatusChanged: (status) {
              setState(() {
                _selectedStatus = status;
              });
            },
            onTypeChanged: (type) {
              setState(() {
                _selectedType = type;
              });
            },
          ),

          // Assets List
          Expanded(
            child: assetListAsync.when(
              loading: () => const LoadingWidget(message: 'Loading assets...'),
              error: (error, stackTrace) => ErrorRetryWidget(
                message: 'Failed to load assets',
                onRetry: () => ref.invalidate(assetListProvider),
              ),
              data: (assets) {
                final filteredAssets = _filterAssets(assets);

                if (filteredAssets.isEmpty) {
                  return _buildEmptyState(context);
                }

                return Column(
                  children: [
                    // Stats Bar
                    AssetStatsBar(
                      totalAssets: filteredAssets.length,
                      operationalAssets: filteredAssets.where((a) => a.status == 'operational').length,
                      maintenanceAssets: filteredAssets.where((a) => a.status == 'maintenance').length,
                      emergencyAssets: filteredAssets.where((a) => a.status == 'emergency').length,
                    ),

                    // Assets List
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          ref.invalidate(assetListProvider);
                        },
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: filteredAssets.length,
                          itemBuilder: (context, index) {
                            final asset = filteredAssets[index];
                            return AssetCard(
                              asset: asset,
                              onTap: () => _navigateToAssetDetails(context, asset),
                              onStatusUpdate: (newStatus) => _updateAssetStatus(asset.id, newStatus),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to add asset screen
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Asset'),
      ),
    );
  }

  List<Asset> _filterAssets(List<Asset> assets) {
    return assets.where((asset) {
      final matchesSearch = _searchQuery.isEmpty ||
          asset.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          asset.type.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (asset.location?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false);

      final matchesStatus = _selectedStatus == null || asset.status == _selectedStatus;
      final matchesType = _selectedType == null || asset.type == _selectedType;

      return matchesSearch && matchesStatus && matchesType;
    }).toList();
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No Assets Found',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchQuery.isNotEmpty || _selectedStatus != null || _selectedType != null
                ? 'Try adjusting your filters to see more results'
                : 'Start by adding your first asset',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          if (_searchQuery.isEmpty && _selectedStatus == null && _selectedType == null)
            FilledButton.icon(
              onPressed: () {
                // TODO: Navigate to add asset screen
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Your First Asset'),
            ),
        ],
      ),
    );
  }

  void _navigateToAssetDetails(BuildContext context, Asset asset) {
    // TODO: Navigate to asset details screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Asset details for ${asset.name} - Coming soon')),
    );
  }

  void _updateAssetStatus(int assetId, String newStatus) async {
    try {
      await ref.read(assetProvider.notifier).updateAssetStatus(assetId, newStatus);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Asset status updated successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update status: $e')),
        );
      }
    }
  }

  void _openQRScanner(BuildContext context) async {
    try {
      final result = await Navigator.of(context).push<String>(
        MaterialPageRoute(
          builder: (context) => const QRScannerScreen(),
        ),
      );

      if (result != null && mounted) {
        _handleQRScanResult(result);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR Scanner error: $e')),
        );
      }
    }
  }

  void _handleQRScanResult(String qrCode) {
    // Try to extract asset ID from QR code
    String? assetId;

    if (qrCode.startsWith('ASSET-')) {
      assetId = qrCode.substring(6);
    } else if (qrCode.startsWith('AST-')) {
      assetId = qrCode.substring(4);
    } else if (RegExp(r'^\d+$').hasMatch(qrCode)) {
      assetId = qrCode;
    }

    if (assetId != null) {
      // Try to find asset in current list
      final assetListAsync = ref.read(assetListProvider);
      assetListAsync.whenData((assets) {
        final asset = assets.where((a) => a.id.toString() == assetId).firstOrNull;
        if (asset != null) {
          _navigateToAssetDetails(context, asset);
        } else {
          _showAssetNotFoundDialog(qrCode, assetId!);
        }
      });
    } else {
      _showInvalidQRCodeDialog(qrCode);
    }
  }

  void _showAssetNotFoundDialog(String qrCode, String assetId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Asset Not Found'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('The scanned QR code corresponds to an asset that is not in your current asset list.'),
            const SizedBox(height: 8),
            Text('Asset ID: $assetId'),
            Text('QR Code: $qrCode'),
            const SizedBox(height: 8),
            const Text('This could happen if:'),
            const Text('• The asset is not assigned to your account'),
            const Text('• The asset ID is invalid'),
            const Text('• The asset has been removed'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.invalidate(assetListProvider);
            },
            child: const Text('Refresh Assets'),
          ),
        ],
      ),
    );
  }

  void _showInvalidQRCodeDialog(String qrCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invalid Asset QR Code'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('The scanned QR code does not appear to be a valid asset QR code.'),
            const SizedBox(height: 8),
            Text('Scanned: $qrCode'),
            const SizedBox(height: 8),
            const Text('Valid asset QR codes should:'),
            const Text('• Start with "ASSET-" or "AST-"'),
            const Text('• Contain only numeric Asset ID'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              _openQRScanner(context);
            },
            child: const Text('Scan Again'),
          ),
        ],
      ),
    );
  }
}