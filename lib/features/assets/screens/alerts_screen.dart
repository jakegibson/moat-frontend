import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/page_header.dart';
import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/semantic_tokens.dart';
import '../data/alerts_models.dart';
import '../state/alerts_state.dart';

/// Alerts screen displaying asset alerts for warranty and maintenance.
class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  late final AlertsState _state;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _state = getIt<AlertsState>();
    _state.fetchAlerts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    _state.setSearch(query);
  }

  void _onSort(String field) {
    _state.setSort(field);
  }

  Future<void> _onResolve(AssetAlert alert) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${alert.action} Alert'),
        content: Text(
          'Mark "${alert.name}" as ${alert.action.toLowerCase()}d?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(alert.action),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final result = await _state.resolveAlert(alert.id);
    if (!mounted) return;

    result.when(
      ok: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Alert ${alert.action.toLowerCase()}d')),
        );
      },
      error: (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed: ${e.message}'),
            backgroundColor: SemanticColors.error,
          ),
        );
      },
    );
  }

  void _navigateToAsset(AssetAlert alert) {
    context.push('${Routes.assets}/${alert.assetId}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing2XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Alerts',
            subtitle:
                'View alerts for warranty expirations and maintenance schedules.',
            actions: [
              AppButton(
                label: 'Refresh',
                onPressed: () => _state.fetchAlerts(refresh: true),
                isFullWidth: false,
                variant: AppButtonVariant.secondary,
                icon: const Icon(Icons.refresh, size: 18),
              ),
            ],
          ),
          _buildFilters(),
          const SizedBox(height: SemanticSpacing.section),
          Expanded(
            child: Watch((context) {
              if (_state.isLoading.value && _state.alerts.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_state.error.value != null && _state.alerts.value.isEmpty) {
                return _buildErrorView();
              }

              if (_state.filteredAlerts.value.isEmpty) {
                return _buildEmptyState();
              }

              return _buildAlertsTable();
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Watch((context) {
      return Row(
        children: [
          // Search field
          SizedBox(
            width: 300,
            child: TextField(
              controller: _searchController,
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: 'Search alerts...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _state.searchQuery.value.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _onSearch('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SemanticRadius.normal),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: SemanticSpacing.relaxed,
                  vertical: SemanticSpacing.normal,
                ),
              ),
            ),
          ),
          const SizedBox(width: SemanticSpacing.relaxed),

          // Type filter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: SemanticColors.border),
              borderRadius: BorderRadius.circular(SemanticRadius.normal),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<AlertType?>(
                value: _state.selectedType.value,
                hint: const Text('All Types'),
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('All Types'),
                  ),
                  ...AlertType.values.map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Text(type.displayName),
                    ),
                  ),
                ],
                onChanged: (value) => _state.setTypeFilter(value),
              ),
            ),
          ),
          const SizedBox(width: SemanticSpacing.relaxed),

          // Clear filters button
          if (_state.searchQuery.value.isNotEmpty ||
              _state.selectedType.value != null ||
              _state.selectedLocationId.value != null)
            TextButton.icon(
              onPressed: () {
                _searchController.clear();
                _state.clearFilters();
              },
              icon: const Icon(Icons.filter_alt_off, size: 18),
              label: const Text('Clear Filters'),
            ),

          const Spacer(),

          // Alert counts
          _buildAlertCount(
            'Overdue',
            _state.overdueCount.value,
            SemanticColors.error,
          ),
          const SizedBox(width: SemanticSpacing.section),
          _buildAlertCount(
            'Total',
            _state.alertCount.value,
            SemanticColors.info,
          ),
        ],
      );
    });
  }

  Widget _buildAlertCount(String label, int count, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$count',
            style: Semantic.badge.copyWith(color: color),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: Semantic.caption),
      ],
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: SemanticColors.error),
          const SizedBox(height: SemanticSpacing.normal),
          Text('Failed to load alerts', style: Semantic.cardTitle),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            _state.error.value?.message ?? 'Unknown error',
            style: Semantic.bodySecondary,
          ),
          const SizedBox(height: SemanticSpacing.section),
          AppButton(
            label: 'Retry',
            onPressed: () => _state.fetchAlerts(refresh: true),
            isFullWidth: false,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    final hasFilters = _state.searchQuery.value.isNotEmpty ||
        _state.selectedType.value != null ||
        _state.selectedLocationId.value != null;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            hasFilters ? Icons.search_off : Icons.check_circle_outline,
            size: 64,
            color: hasFilters ? AppColors.textTertiary : SemanticColors.success,
          ),
          const SizedBox(height: SemanticSpacing.section),
          Text(
            hasFilters ? 'No matching alerts' : 'No current alerts',
            style: Semantic.cardTitle,
          ),
          const SizedBox(height: SemanticSpacing.tight),
          Text(
            hasFilters
                ? 'Try adjusting your filters.'
                : 'All warranties and maintenance schedules are up to date.',
            style: Semantic.bodySecondary,
          ),
          if (hasFilters) ...[
            const SizedBox(height: SemanticSpacing.section),
            AppButton(
              label: 'Clear Filters',
              onPressed: () {
                _searchController.clear();
                _state.clearFilters();
              },
              isFullWidth: false,
              variant: AppButtonVariant.secondary,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAlertsTable() {
    return Watch((context) {
      final alerts = _state.filteredAlerts.value;
      final sortField = _state.sortField.value;
      final sortAsc = _state.sortAscending.value;

      return Container(
        decoration: BoxDecoration(
          color: SemanticColors.bgCard,
          border: Border.all(color: SemanticColors.border),
          borderRadius: BorderRadius.circular(SemanticRadius.card),
        ),
        child: Column(
          children: [
            // Table header
            _buildTableHeader(sortField, sortAsc),
            const Divider(height: 1),
            // Table body
            Expanded(
              child: ListView.separated(
                itemCount: alerts.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return _buildAlertRow(alerts[index]);
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTableHeader(String sortField, bool sortAsc) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SemanticSpacing.cardPadding,
        vertical: SemanticSpacing.relaxed,
      ),
      color: SemanticColors.bgSecondary,
      child: Row(
        children: [
          _buildSortableHeader('Asset', 'assetName', sortField, sortAsc, flex: 2),
          _buildSortableHeader('Location', 'locationName', sortField, sortAsc, flex: 1),
          _buildSortableHeader('Reason', 'reason', sortField, sortAsc, flex: 2),
          _buildSortableHeader('Due Date', 'alertDueDate', sortField, sortAsc, flex: 1),
          const SizedBox(width: 100, child: Text('Action', style: TextStyle(fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  Widget _buildSortableHeader(
    String label,
    String field,
    String currentField,
    bool ascending, {
    required int flex,
  }) {
    final isActive = currentField == field;
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: () => _onSort(field),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isActive ? SemanticColors.info : null,
              ),
            ),
            if (isActive)
              Icon(
                ascending ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: SemanticColors.info,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertRow(AssetAlert alert) {
    final isOverdue = alert.isOverdue;
    final dateFormat = DateFormat('MMM d, yyyy');

    return InkWell(
      onTap: () => _navigateToAsset(alert),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SemanticSpacing.cardPadding,
          vertical: SemanticSpacing.relaxed,
        ),
        child: Row(
          children: [
            // Asset name
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alert.assetName,
                    style: Semantic.formLabel,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (alert.division != null)
                    Text(
                      alert.division!,
                      style: Semantic.caption,
                    ),
                ],
              ),
            ),

            // Location
            Expanded(
              flex: 1,
              child: Text(
                alert.locationName ?? '-',
                style: Semantic.body,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Reason
            Expanded(
              flex: 2,
              child: Text(
                alert.reason,
                style: Semantic.body,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Due date
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  if (isOverdue)
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: SemanticColors.error,
                        shape: BoxShape.circle,
                      ),
                    ),
                  Text(
                    dateFormat.format(alert.alertDueDate),
                    style: Semantic.body.copyWith(
                      color: isOverdue ? SemanticColors.error : null,
                    ),
                  ),
                ],
              ),
            ),

            // Action button
            SizedBox(
              width: 100,
              child: _buildActionButton(alert),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(AssetAlert alert) {
    final isResolve = alert.action == 'Resolve';
    return GestureDetector(
      onTap: () => _onResolve(alert),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isResolve ? SemanticColors.error : SemanticColors.info,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          alert.action,
          textAlign: TextAlign.center,
          style: Semantic.badge.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
