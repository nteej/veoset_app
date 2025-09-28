import 'package:flutter/material.dart';

import '../../models/notification.dart';

class NotificationSummaryCard extends StatelessWidget {
  final NotificationSummary summary;

  const NotificationSummaryCard({
    super.key,
    required this.summary,
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Total',
                  summary.totalCount.toString(),
                  Icons.notifications_outlined,
                  theme.colorScheme.primary,
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: theme.colorScheme.outline.withValues(alpha: 0.3),
              ),
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Unread',
                  summary.unreadCount.toString(),
                  Icons.mark_email_unread,
                  summary.unreadCount > 0 ? Colors.orange : Colors.grey,
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: theme.colorScheme.outline.withValues(alpha: 0.3),
              ),
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Emergency',
                  (summary.emergencyCount ?? 0).toString(),
                  Icons.warning_amber,
                  (summary.emergencyCount ?? 0) > 0 ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
          if (summary.maintenanceCount != null || summary.systemCount != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                if (summary.maintenanceCount != null) ...[
                  Expanded(
                    child: _buildSummaryItem(
                      context,
                      'Maintenance',
                      summary.maintenanceCount.toString(),
                      Icons.build_outlined,
                      summary.maintenanceCount! > 0 ? Colors.orange : Colors.grey,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ],
                if (summary.systemCount != null) ...[
                  Expanded(
                    child: _buildSummaryItem(
                      context,
                      'System',
                      summary.systemCount.toString(),
                      Icons.settings_outlined,
                      summary.systemCount! > 0 ? Colors.blue : Colors.grey,
                    ),
                  ),
                  if (summary.maintenanceCount != null && summary.systemCount != null)
                    Expanded(child: Container()), // Empty space for alignment
                ],
                if (summary.maintenanceCount == null || summary.systemCount == null)
                  Expanded(child: Container()), // Empty space for alignment
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
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
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}