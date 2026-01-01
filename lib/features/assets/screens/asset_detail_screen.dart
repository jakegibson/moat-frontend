import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../state/assets_state.dart';

class AssetDetailScreen extends StatefulWidget {
  final String assetId;

  const AssetDetailScreen({required this.assetId, super.key});

  @override
  State<AssetDetailScreen> createState() => _AssetDetailScreenState();
}

class _AssetDetailScreenState extends State<AssetDetailScreen> {
  final _assetsState = getIt<AssetsState>();

  @override
  void initState() {
    super.initState();
    _assetsState.fetchAsset(widget.assetId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _showEditDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showDeleteConfirmation(context),
          ),
        ],
      ),
      body: Watch((context) {
        final isLoading = _assetsState.isLoading.value;
        final error = _assetsState.error.value;
        final asset = _assetsState.selectedAsset.value;

        if (error != null && asset == null) {
          return ErrorView(
            error: error,
            onRetry: () => _assetsState.fetchAsset(widget.assetId),
          );
        }

        if (isLoading && asset == null) {
          return const LoadingView(message: 'Loading asset...');
        }

        if (asset == null) {
          return const Center(child: Text('Asset not found'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              asset.name,
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                          _StatusChip(status: asset.status),
                        ],
                      ),
                      if (asset.locationName != null) ...[
                        const SizedBox(height: Spacing.sm),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: Spacing.xs),
                            Text(
                              asset.locationName!,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: Spacing.lg),

              // Details section
              Text(
                'Details',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: Spacing.sm),
              Card(
                child: Column(
                  children: [
                    _DetailRow(
                      label: 'ID',
                      value: asset.id,
                    ),
                    const Divider(height: 1),
                    _DetailRow(
                      label: 'Created',
                      value: _formatDate(asset.createdAt),
                    ),
                    const Divider(height: 1),
                    _DetailRow(
                      label: 'Updated',
                      value: _formatDate(asset.updatedAt),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showEditDialog(BuildContext context) {
    // TODO: Implement edit dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit coming soon')),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Asset'),
        content: const Text('Are you sure you want to delete this asset?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              final result = await _assetsState.deleteAsset(widget.assetId);
              if (result.isOk && context.mounted) {
                Navigator.pop(context);
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (status) {
      'active' => (Colors.green, 'Active'),
      'inactive' => (Colors.grey, 'Inactive'),
      'draft' => (Colors.orange, 'Draft'),
      'retired' => (Colors.red, 'Retired'),
      _ => (Colors.grey, status),
    };

    return Chip(
      label: Text(label),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide(color: color),
      labelStyle: TextStyle(color: color),
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(Spacing.md),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
