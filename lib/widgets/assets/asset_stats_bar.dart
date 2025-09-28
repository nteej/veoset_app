import 'package:flutter/material.dart';

class AssetStatsBar extends StatelessWidget {
  final int totalAssets;
  final int operationalAssets;
  final int maintenanceAssets;
  final int emergencyAssets;

  const AssetStatsBar({
    super.key,
    required this.totalAssets,
    required this.operationalAssets,
    required this.maintenanceAssets,
    required this.emergencyAssets,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
              context,
              'Total',
              totalAssets.toString(),
              Icons.inventory_2_outlined,
              theme.colorScheme.primary,
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
          Expanded(
            child: _buildStatItem(
              context,
              'Operational',
              operationalAssets.toString(),
              Icons.check_circle_outline,
              Colors.green,
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
          Expanded(
            child: _buildStatItem(
              context,
              'Maintenance',
              maintenanceAssets.toString(),
              Icons.build_outlined,
              Colors.orange,
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
          Expanded(
            child: _buildStatItem(
              context,
              'Emergency',
              emergencyAssets.toString(),
              Icons.warning_amber_outlined,
              Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}