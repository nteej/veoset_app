import 'package:flutter/material.dart';

class NotificationFilterBar extends StatelessWidget {
  final String? selectedType;
  final Function(String?) onTypeChanged;

  const NotificationFilterBar({
    super.key,
    this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
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
                    label: 'All Types',
                    isSelected: selectedType == null,
                    onTap: () => onTypeChanged(null),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Emergency',
                    isSelected: selectedType == 'emergency',
                    onTap: () => onTypeChanged('emergency'),
                    color: Colors.red,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Maintenance',
                    isSelected: selectedType == 'maintenance',
                    onTap: () => onTypeChanged('maintenance'),
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'System',
                    isSelected: selectedType == 'system',
                    onTap: () => onTypeChanged('system'),
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Alert',
                    isSelected: selectedType == 'alert',
                    onTap: () => onTypeChanged('alert'),
                    color: Colors.purple,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    context,
                    label: 'Info',
                    isSelected: selectedType == 'info',
                    onTap: () => onTypeChanged('info'),
                    color: Colors.green,
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