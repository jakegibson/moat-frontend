import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/error_view.dart';
import '../../settings/state/locations_state.dart';
import '../state/assets_state.dart';
import '../widgets/asset_dialog.dart';
import '../widgets/assets_pagination.dart';

class AssetsScreen extends StatefulWidget {
  final AssetsState state;

  const AssetsScreen({required this.state, super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch assets on mount if empty
    if (widget.state.assets.value.isEmpty) {
      widget.state.fetchAssets(refresh: true);
    }
    _searchController.text = widget.state.searchQuery.value;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final isLoading = widget.state.isLoading.value;
      final assets = widget.state.assets.value;
      final error = widget.state.error.value;

      if (error != null && assets.isEmpty) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: ErrorView(
            error: error,
            onRetry: () => widget.state.fetchAssets(refresh: true),
          ),
        );
      }

      if (isLoading && assets.isEmpty) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentButton),
            ),
          ),
        );
      }

      return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Column(
                children: [
                  Flexible(
                    child: assets.isEmpty
                        ? const Center(child: Text('No current Assets'))
                        : _buildDataTable(context, assets),
                  ),
                  _buildPagination(context),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacingXL,
        vertical: AppSizes.spacingLG,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Managed Assets',
                      style: AppTextStyles.textXLSemibold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Manage all your building assets, view details, update maintenance, track warranties and more.',
                      style: AppTextStyles.textSMSecondary,
                    ),
                  ],
                ),
              ),
              _buildAddButton(context),
            ],
          ),
          const SizedBox(height: AppSizes.spacingLG),
          _buildSearchFilterBar(context),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _showCreateDialog(context),
      icon: const Icon(Icons.add, size: 20, color: AppColors.white),
      label: Text(
        'Add Asset',
        style: AppTextStyles.textSMSemibold.copyWith(color: AppColors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }

  Widget _buildSearchFilterBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Filters button
        Watch((context) {
          final hasFilters = widget.state.hasFilters.value;
          return TextButton.icon(
            onPressed: () => _showFilterSheet(context),
            icon: Badge(
              isLabelVisible: hasFilters,
              child: const Icon(Icons.filter_list, size: 18),
            ),
            label: const Text('Filters'),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textSecondary,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        }),
        const SizedBox(width: AppSizes.spacingMD),
        // Search field
        SizedBox(
          width: 250,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: AppTextStyles.textSMSecondary,
              prefixIcon: const Icon(Icons.search, size: 20),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                borderSide: BorderSide(color: AppColors.borderSecondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                borderSide: BorderSide(color: AppColors.borderSecondary),
              ),
            ),
            onSubmitted: (value) => widget.state.applySearch(value),
          ),
        ),
      ],
    );
  }

  Widget _buildDataTable(BuildContext context, List<Asset> assets) {
    final hasAssetTypes = widget.state.hasAssetTypes.value;
    final sortColumnIndex = widget.state.sortColumnIndex.value;
    final sortAscending = !widget.state.sortDesc.value;
    final now = DateTime.now();

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: AppColors.borderSecondary,
        dividerTheme: const DividerThemeData(color: AppColors.borderSecondary),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final headerHeight = AppSizes.tableHeaderHeight;
          final rowHeight = AppSizes.tableRowHeight;
          final totalHeight =
              headerHeight + (rowHeight * (assets.isNotEmpty ? assets.length : 1));

          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: min(constraints.maxHeight, totalHeight + AppSizes.spacingXS),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radiusLG),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.radiusLG),
                    border: Border.all(
                      color: AppColors.borderSecondary,
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: 1.5,
                    ),
                  ),
                  child: DataTable2(
                    sortArrowBuilder: (asc, sorted) => sorted
                        ? Icon(
                            asc ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            color: AppColors.black,
                          )
                        : Icon(
                            asc ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            color: AppColors.gray,
                          ),
                    sortColumnIndex: sortColumnIndex,
                    sortAscending: sortAscending,
                    sortArrowIcon: Icons.keyboard_arrow_up,
                    sortArrowAnimationDuration: const Duration(milliseconds: 200),
                    dataTextStyle: AppTextStyles.textSM,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radiusLG),
                    ),
                    border: TableBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusLG - 2.0),
                      horizontalInside: BorderSide(
                        color: AppColors.borderSecondary,
                        width: 1.0,
                      ),
                      verticalInside: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    columnSpacing: AppSizes.tableColumnSpacing,
                    horizontalMargin: AppSizes.tableColumnSpacing,
                    headingTextStyle: AppTextStyles.textXSSemibold,
                    headingRowColor: WidgetStateProperty.all(AppColors.bgSecondary),
                    headingRowHeight: headerHeight,
                    minWidth: 600,
                    columns: [
                      DataColumn(
                        label: const Text('Asset'),
                        onSort: (columnIndex, ascending) async {
                          await widget.state.sortOnField(
                            fieldName: 'name',
                            columnIndex: columnIndex,
                            ascending: ascending,
                          );
                        },
                      ),
                      if (hasAssetTypes)
                        DataColumn(
                          label: const Text('Division'),
                          onSort: (columnIndex, ascending) async {
                            await widget.state.sortOnField(
                              fieldName: 'division_of_construction',
                              columnIndex: columnIndex,
                              ascending: ascending,
                            );
                          },
                        ),
                      DataColumn(
                        label: const Text('Site Location'),
                        onSort: (columnIndex, ascending) async {
                          await widget.state.sortOnField(
                            fieldName: 'location_name',
                            columnIndex: columnIndex,
                            ascending: ascending,
                          );
                        },
                      ),
                      DataColumn(
                        label: const Text('Start Date'),
                        onSort: (columnIndex, ascending) async {
                          await widget.state.sortOnField(
                            fieldName: 'warranty_start_date',
                            columnIndex: columnIndex,
                            ascending: ascending,
                          );
                        },
                      ),
                      DataColumn(
                        label: const Text('Warranty Expiration'),
                        onSort: (columnIndex, ascending) async {
                          await widget.state.sortOnField(
                            fieldName: 'warranty_end_date',
                            columnIndex: columnIndex,
                            ascending: ascending,
                          );
                        },
                      ),
                      const DataColumn2(
                        label: Text(''),
                        size: ColumnSize.S,
                        fixedWidth: 48,
                      ),
                    ],
                    rows: assets.map((asset) {
                      // Division display
                      final docFilterName = asset.docFilterName ?? 'unknown';
                      final docParts = docFilterName.split(' ');

                      // Warranty display
                      String warrantyDisplay = 'unknown';
                      Color warrantyColor = AppColors.black;

                      if (asset.hasLifetimeWarranty) {
                        warrantyDisplay = 'Lifetime';
                      } else if (asset.warrantyEndDate != null) {
                        final daysUntilExpiration =
                            asset.warrantyEndDate!.difference(now).inDays;

                        if (daysUntilExpiration > 0) {
                          warrantyDisplay = DateFormatter.formatFriendlyDate(
                            dateTime: asset.warrantyEndDate!,
                            short: true,
                          );
                          if (daysUntilExpiration <= 60) {
                            warrantyDisplay += ' $daysUntilExpiration days';
                            warrantyColor = Colors.red;
                          }
                        } else {
                          warrantyDisplay = 'Expired';
                          warrantyColor = Colors.grey;
                        }
                      }

                      return DataRow2(
                        specificRowHeight: rowHeight,
                        onTap: () => context.pushAssetDetail(asset.id),
                        cells: [
                          // Asset name
                          DataCell(
                            Text(
                              asset.isProcessing
                                  ? '${asset.name} (Processing...)'
                                  : asset.name,
                              style: AppTextStyles.textSM.copyWith(
                                color: asset.isProcessing
                                    ? AppColors.textTertiary
                                    : AppColors.black,
                              ),
                            ),
                          ),
                          // Division
                          if (hasAssetTypes)
                            DataCell(
                              docParts.length > 1
                                  ? Row(
                                      spacing: AppSizes.spacingLG,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            color: AppColors.bgSecondary,
                                            borderRadius: BorderRadius.circular(
                                              AppSizes.radiusSM,
                                            ),
                                            border: Border.all(
                                              color: AppColors.borderPrimary,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              docParts[0],
                                              style: AppTextStyles.textXSSecondary,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            docParts.sublist(1).join(' '),
                                            style: AppTextStyles.textSM,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(docFilterName, style: AppTextStyles.textSM),
                            ),
                          // Site Location
                          DataCell(
                            Text(
                              asset.locationName ?? '',
                              style: AppTextStyles.textSM,
                            ),
                          ),
                          // Start Date
                          DataCell(
                            Text(
                              asset.warrantyStartDate != null
                                  ? DateFormatter.formatFriendlyDate(
                                      dateTime: asset.warrantyStartDate!,
                                      short: true,
                                    )
                                  : 'unknown',
                              style: AppTextStyles.textSM,
                            ),
                          ),
                          // Warranty Expiration
                          DataCell(
                            Text(
                              warrantyDisplay,
                              style: AppTextStyles.body.copyWith(color: warrantyColor),
                            ),
                          ),
                          // Action menu
                          DataCell(
                            PopupMenuButton<String>(
                              icon: Icon(Icons.more_vert, color: AppColors.gray),
                              onSelected: (value) => _handleAssetAction(value, asset),
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'view',
                                  child: Text('View Details'),
                                ),
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPagination(BuildContext context) {
    return Watch((context) {
      final currentPage = widget.state.currentPage.value;
      final totalPages = widget.state.totalPages.value;
      final total = widget.state.total.value;
      final limit = widget.state.limit.value;
      final isLoading = widget.state.isLoading.value;

      return AssetsPagination(
        currentPage: currentPage,
        totalPages: totalPages,
        totalItems: total,
        itemsPerPage: limit,
        onPageChanged: (page) => widget.state.changePage(page),
        isLoading: isLoading,
      );
    });
  }

  void _handleAssetAction(String action, Asset asset) {
    switch (action) {
      case 'view':
        context.pushAssetDetail(asset.id);
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit coming soon')),
        );
        break;
      case 'delete':
        _confirmDelete(asset);
        break;
    }
  }

  Future<void> _confirmDelete(Asset asset) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Asset'),
        content: Text('Are you sure you want to delete "${asset.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final result = await widget.state.deleteAsset(asset.id);
    if (!mounted) return;

    result.when(
      ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Asset deleted')),
      ),
      error: (e) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed: ${e.message}'),
          backgroundColor: AppColors.error,
        ),
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

  Future<void> _showCreateDialog(BuildContext context) async {
    final locationsState = getIt<LocationsState>();
    if (locationsState.locations.value.isEmpty) {
      locationsState.fetchLocations();
    }

    final result = await showDialog<Asset>(
      context: context,
      builder: (context) => AssetDialog(locationsState: locationsState),
    );

    if (result == null || !mounted) return;

    final createResult = await widget.state.createAsset(
      name: result.name,
      locationId: result.locationId ?? '',
    );

    if (!mounted) return;
    createResult.when(
      ok: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Asset created')),
      ),
      error: (e) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed: ${e.message}'),
          backgroundColor: AppColors.error,
        ),
      ),
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

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedStatuses.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Filter by Status', style: AppTextStyles.textLGSemibold),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: AssetStatus.all.map((status) {
              final isSelected = _selected.contains(status);
              return FilterChip(
                label: Text(AssetStatus.displayName(status)),
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
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: widget.onClear,
                  child: const Text('Clear'),
                ),
              ),
              const SizedBox(width: 16),
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
