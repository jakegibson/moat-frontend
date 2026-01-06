import 'package:flutter/material.dart';

import '../../../core/styles/app_sizes.dart';
import '../../../core/theme/app_theme.dart';
import '../state/assets_state.dart';

/// A card displaying asset summary information
class AssetTile extends StatelessWidget {
  final Asset asset;
  final VoidCallback? onTap;

  const AssetTile({
    required this.asset,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Row(
            children: [
              // Status indicator
              _StatusIndicator(status: asset.status),
              const SizedBox(width: Spacing.md),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asset.name,
                      style: theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (asset.locationName != null) ...[
                      const SizedBox(height: Spacing.xs),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: Spacing.xs),
                          Expanded(
                            child: Text(
                              asset.locationName!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              // Chevron
              Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final String status;

  const _StatusIndicator({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      'active' => Colors.green,
      'inactive' => Colors.grey,
      'draft' => Colors.orange,
      'retired' => Colors.red,
      _ => Colors.grey,
    };

    return Container(
      width: 8,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSizes.radiusXS),
      ),
    );
  }
}
