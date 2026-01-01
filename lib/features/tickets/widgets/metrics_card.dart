import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class MetricsCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color? iconColor;
  final double? changePercent;
  final bool isPositiveGood;

  const MetricsCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    required this.icon,
    this.iconColor,
    this.changePercent,
    this.isPositiveGood = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (iconColor ?? theme.colorScheme.primary)
                        .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: iconColor ?? theme.colorScheme.primary,
                  ),
                ),
                const Spacer(),
                if (changePercent != null) _buildChangeIndicator(theme),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              value,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(
                subtitle!,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildChangeIndicator(ThemeData theme) {
    final isPositive = changePercent! > 0;
    final isNeutral = changePercent == 0;

    Color getColor() {
      if (isNeutral) return theme.colorScheme.onSurfaceVariant;
      if (isPositiveGood) {
        return isPositive ? Colors.green : Colors.red;
      } else {
        return isPositive ? Colors.red : Colors.green;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: getColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isNeutral)
            Icon(
              isPositive ? Icons.arrow_upward : Icons.arrow_downward,
              size: 12,
              color: getColor(),
            ),
          Text(
            '${changePercent!.abs().toStringAsFixed(1)}%',
            style: theme.textTheme.labelSmall?.copyWith(
              color: getColor(),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MetricsRow extends StatelessWidget {
  final int totalTickets;
  final double avgTimeToClose;
  final double avgResponseTime;
  final double? timeToCloseChange;
  final double? responseTimeChange;

  const MetricsRow({
    super.key,
    required this.totalTickets,
    required this.avgTimeToClose,
    required this.avgResponseTime,
    this.timeToCloseChange,
    this.responseTimeChange,
  });

  String _formatHours(double hours) {
    if (hours < 1) {
      return '${(hours * 60).round()} min';
    } else if (hours < 24) {
      return '${hours.toStringAsFixed(1)} hrs';
    } else {
      final days = hours / 24;
      return '${days.toStringAsFixed(1)} days';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MetricsCard(
            title: 'Total Tickets',
            value: totalTickets.toString(),
            subtitle: 'Last 30 days',
            icon: Icons.confirmation_number_outlined,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: MetricsCard(
            title: 'Avg Time to Close',
            value: _formatHours(avgTimeToClose),
            icon: Icons.timer_outlined,
            iconColor: Colors.orange,
            changePercent: timeToCloseChange,
            isPositiveGood: false,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: MetricsCard(
            title: 'Avg Response Time',
            value: _formatHours(avgResponseTime),
            icon: Icons.speed_outlined,
            iconColor: Colors.blue,
            changePercent: responseTimeChange,
            isPositiveGood: false,
          ),
        ),
      ],
    );
  }
}
