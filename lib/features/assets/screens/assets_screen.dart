import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../state/assets_state.dart';
import '../widgets/asset_tile.dart';

class AssetsScreen extends StatefulWidget {
  final AssetsState state;

  const AssetsScreen({required this.state, super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Fetch assets on mount if empty
    if (widget.state.assets.value.isEmpty) {
      widget.state.fetchAssets(refresh: true);
    }

    // Listen for scroll to load more
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      widget.state.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assets'),
        actions: [
          // Search button
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context),
          ),
          // Filter button
          Watch((context) {
            final hasFilters = widget.state.hasFilters.value;
            return IconButton(
              icon: Badge(
                isLabelVisible: hasFilters,
                child: const Icon(Icons.filter_list),
              ),
              onPressed: () => _showFilterSheet(context),
            );
          }),
        ],
      ),
      body: Watch((context) {
        final isLoading = widget.state.isLoading.value;
        final assets = widget.state.assets.value;
        final error = widget.state.error.value;

        // Error state
        if (error != null && assets.isEmpty) {
          return ErrorView(
            error: error,
            onRetry: () => widget.state.fetchAssets(refresh: true),
          );
        }

        // Loading state (initial)
        if (isLoading && assets.isEmpty) {
          return const LoadingView(message: 'Loading assets...');
        }

        // Empty state
        if (assets.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 64,
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(height: Spacing.md),
                Text(
                  'No assets found',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: Spacing.sm),
                Text(
                  widget.state.hasFilters.value
                      ? 'Try adjusting your filters'
                      : 'Create your first asset',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                if (widget.state.hasFilters.value) ...[
                  const SizedBox(height: Spacing.md),
                  TextButton(
                    onPressed: widget.state.clearFilters,
                    child: const Text('Clear filters'),
                  ),
                ],
              ],
            ),
          );
        }

        // List state
        return RefreshIndicator(
          onRefresh: () => widget.state.fetchAssets(refresh: true),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(Spacing.md),
            itemCount: assets.length + (widget.state.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              // Loading indicator at bottom
              if (index == assets.length) {
                return const Padding(
                  padding: EdgeInsets.all(Spacing.md),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final asset = assets[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: AssetTile(
                  asset: asset,
                  onTap: () => context.pushAssetDetail(asset.id),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _SearchDialog(
        initialValue: widget.state.searchQuery.value,
        onSearch: (query) {
          widget.state.applyFilters(search: query);
        },
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _FilterSheet(
        selectedStatuses: widget.state.statusFilter.value,
        onApply: (statuses) {
          widget.state.applyFilters(statuses: statuses);
          Navigator.pop(context);
        },
        onClear: () {
          widget.state.clearFilters();
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    // TODO: Implement create asset dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Create asset coming soon')),
    );
  }
}

class _SearchDialog extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String> onSearch;

  const _SearchDialog({
    required this.initialValue,
    required this.onSearch,
  });

  @override
  State<_SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<_SearchDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Search Assets'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Enter search query',
          prefixIcon: Icon(Icons.search),
        ),
        onSubmitted: (value) {
          widget.onSearch(value);
          Navigator.pop(context);
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            widget.onSearch(_controller.text);
            Navigator.pop(context);
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}

class _FilterSheet extends StatefulWidget {
  final List<String> selectedStatuses;
  final ValueChanged<List<String>> onApply;
  final VoidCallback onClear;

  const _FilterSheet({
    required this.selectedStatuses,
    required this.onApply,
    required this.onClear,
  });

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late Set<String> _selected;

  static const _allStatuses = ['active', 'inactive', 'draft', 'retired'];

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedStatuses.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Filter by Status',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Spacing.md),
          Wrap(
            spacing: Spacing.sm,
            children: _allStatuses.map((status) {
              final isSelected = _selected.contains(status);
              return FilterChip(
                label: Text(status),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selected.add(status);
                    } else {
                      _selected.remove(status);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: Spacing.lg),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: widget.onClear,
                  child: const Text('Clear'),
                ),
              ),
              const SizedBox(width: Spacing.md),
              Expanded(
                child: FilledButton(
                  onPressed: () => widget.onApply(_selected.toList()),
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
