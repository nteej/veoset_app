import 'package:flutter/material.dart';

class AssetFilterBar extends StatelessWidget {
  final String? selectedStatus;
  final String? selectedType;
  final Function(String?) onStatusChanged;
  final Function(String?) onTypeChanged;

  const AssetFilterBar({
    super.key,
    this.selectedStatus,
    this.selectedType,
    required this.onStatusChanged,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(
                    context,
                    label: 'All Status',
                    isSelected: selectedStatus == null,
                    onTap: () => onStatusChanged(null),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Operational',
                    isSelected: selectedStatus == 'operational',
                    onTap: () => onStatusChanged('operational'),
                    color: Colors.green,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Maintenance',
                    isSelected: selectedStatus == 'maintenance',
                    onTap: () => onStatusChanged('maintenance'),
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Emergency',
                    isSelected: selectedStatus == 'emergency',
                    onTap: () => onStatusChanged('emergency'),
                    color: Colors.red,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Offline',
                    isSelected: selectedStatus == 'offline',
                    onTap: () => onStatusChanged('offline'),
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    height: 30,
                    width: 1,
                    color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  ),
                  const SizedBox(width: 16),
                  _buildFilterChip(
                    context,
                    label: 'All Types',
                    isSelected: selectedType == null,
                    onTap: () => onTypeChanged(null),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Pump',
                    isSelected: selectedType == 'pump',
                    onTap: () => onTypeChanged('pump'),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Generator',
                    isSelected: selectedType == 'generator',
                    onTap: () => onTypeChanged('generator'),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Compressor',
                    isSelected: selectedType == 'compressor',
                    onTap: () => onTypeChanged('compressor'),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Motor',
                    isSelected: selectedType == 'motor',
                    onTap: () => onTypeChanged('motor'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    Color? color,
  }) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? (color ?? theme.colorScheme.primary)
              : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? null
              : Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: isSelected
                ? (color != null ? Colors.white : theme.colorScheme.onPrimary)
                : theme.colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}