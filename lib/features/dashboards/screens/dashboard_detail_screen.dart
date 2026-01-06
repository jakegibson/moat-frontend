import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/transport/dashboard_service_client.dart';
import '../../../gen/moat/v1/analytics.pb.dart' as pb;
import '../../explore/state/explore_state.dart';
import '../../reports/data/analytics_client.dart';
import '../../reports/data/cube_models.dart';
import '../widgets/dashboard_item_card.dart';

/// Screen showing a single dashboard with its visualizations.
class DashboardDetailScreen extends StatefulWidget {
  final String dashboardId;

  const DashboardDetailScreen({
    super.key,
    required this.dashboardId,
  });

  @override
  State<DashboardDetailScreen> createState() => _DashboardDetailScreenState();
}

class _DashboardDetailScreenState extends State<DashboardDetailScreen> {
  late final DashboardServiceClient _dashboardClient;
  late final AnalyticsClient _analyticsClient;
  late final ExploreState _exploreState;

  final _dashboard = signal<pb.Dashboard?>(null);
  final _isLoading = signal<bool>(true);
  final _error = signal<String?>(null);
  final _itemResults = signal<Map<String, CubeResponse>>({});
  final _loadingItems = signal<Set<String>>({});

  @override
  void initState() {
    super.initState();
    _dashboardClient = getIt<DashboardServiceClient>();
    _analyticsClient = getIt<AnalyticsClient>();
    _exploreState = getIt<ExploreState>();
    _loadDashboard();
  }

  Future<void> _loadDashboard() async {
    _isLoading.value = true;
    _error.value = null;

    try {
      final dashboard = await _dashboardClient.getDashboard(
        pb.GetDashboardRequest(id: widget.dashboardId),
      );
      _dashboard.value = dashboard;

      // Load data for all items
      _loadAllItemData(dashboard.items);
    } catch (e) {
      _error.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _loadAllItemData(List<pb.DashboardItem> items) async {
    for (final item in items) {
      _loadItemData(item);
    }
  }

  Future<void> _loadItemData(pb.DashboardItem item) async {
    // item.query is a SavedQuery which contains the CubeQuery
    final savedQuery = item.query;
    if (!savedQuery.hasQuery()) return;

    _loadingItems.value = {..._loadingItems.value, item.id};

    try {
      final cubeQueryProto = savedQuery.query;

      // Build CubeQuery for analytics client
      final cubeQuery = CubeQuery(
        measures: cubeQueryProto.measures.toList(),
        dimensions: cubeQueryProto.dimensions.toList(),
        timeDimensions: cubeQueryProto.timeDimensions
            .map((td) => CubeTimeDimension(
                  dimension: td.dimension,
                  dateRange: td.dateRange.isNotEmpty ? td.dateRange.first : 'Last 30 days',
                  granularity: td.granularity.isNotEmpty ? td.granularity : null,
                ))
            .toList(),
      );

      final result = await _analyticsClient.query(cubeQuery);

      _itemResults.value = {
        ..._itemResults.value,
        item.id: result,
      };
    } catch (e) {
      debugPrint('Failed to load item ${item.id}: $e');
    } finally {
      _loadingItems.value = _loadingItems.value.where((id) => id != item.id).toSet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      body: Watch((context) {
        final isLoading = _isLoading.value;
        final error = _error.value;
        final dashboard = _dashboard.value;

        if (isLoading && dashboard == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error != null && dashboard == null) {
          return _buildErrorState(error);
        }

        if (dashboard == null) {
          return _buildNotFoundState();
        }

        return Column(
          children: [
            _buildHeader(dashboard),
            Expanded(
              child: dashboard.items.isEmpty
                  ? _buildEmptyState()
                  : _buildItemsGrid(dashboard.items),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHeader(pb.Dashboard dashboard) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.spacingXL),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go(Routes.dashboards),
            tooltip: 'Back to dashboards',
          ),
          const SizedBox(width: AppSizes.spacingSM),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.utilityBlue50,
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            ),
            child: const Icon(Icons.dashboard_outlined, color: AppColors.blueLight700, size: 24),
          ),
          const SizedBox(width: AppSizes.spacingMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(dashboard.name, style: AppTextStyles.textXLSemibold),
                    if (dashboard.isDefault) ...[
                      const SizedBox(width: AppSizes.spacingSM),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spacingSM,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.utilityBlue50,
                          borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                        ),
                        child: Text(
                          'Default',
                          style: AppTextStyles.textXS.copyWith(
                            color: AppColors.utilityBlue700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if (dashboard.description.isNotEmpty)
                  Text(
                    dashboard.description,
                    style: AppTextStyles.textSM.copyWith(color: AppColors.textSecondary),
                  ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: _loadDashboard,
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Refresh'),
          ),
          const SizedBox(width: AppSizes.spacingSM),
          ElevatedButton.icon(
            onPressed: () => context.goToExplore(),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Add Visualization'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueLight700,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spacingLG,
                vertical: AppSizes.spacingMD,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: AppColors.utilityError500),
          const SizedBox(height: AppSizes.spacingMD),
          Text('Failed to load dashboard', style: AppTextStyles.textMD),
          const SizedBox(height: AppSizes.spacingSM),
          Text(error, style: AppTextStyles.textSMSecondary),
          const SizedBox(height: AppSizes.spacingXL),
          ElevatedButton(
            onPressed: _loadDashboard,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotFoundState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off, size: 48, color: AppColors.textTertiary),
          const SizedBox(height: AppSizes.spacingMD),
          Text('Dashboard not found', style: AppTextStyles.textMD),
          const SizedBox(height: AppSizes.spacingXL),
          ElevatedButton(
            onPressed: () => context.go(Routes.dashboards),
            child: const Text('Go to Dashboards'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.widgets_outlined,
            size: 64,
            color: AppColors.textTertiary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: AppSizes.spacingLG),
          Text(
            'No visualizations yet',
            style: AppTextStyles.textMD.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSizes.spacingSM),
          Text(
            'Go to the Data Explorer to create and save queries',
            style: AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
          ),
          const SizedBox(height: AppSizes.spacingXL),
          ElevatedButton.icon(
            onPressed: () => context.goToExplore(),
            icon: const Icon(Icons.explore, size: 18),
            label: const Text('Open Data Explorer'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueLight700,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spacingXL,
                vertical: AppSizes.spacingMD,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsGrid(List<pb.DashboardItem> items) {
    return Watch((context) {
      final results = _itemResults.value;
      final loadingSet = _loadingItems.value;

      return Padding(
        padding: const EdgeInsets.all(AppSizes.spacingXL),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 600,
            childAspectRatio: 1.2,
            crossAxisSpacing: AppSizes.spacingLG,
            mainAxisSpacing: AppSizes.spacingLG,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final result = results[item.id];
            final isLoading = loadingSet.contains(item.id);

            return DashboardItemCard(
              item: item,
              result: result,
              isLoading: isLoading,
              onRefresh: () => _loadItemData(item),
              onRemove: () => _removeItem(item),
              onOpenInExplorer: () => _openInExplorer(item),
            );
          },
        ),
      );
    });
  }

  Future<void> _removeItem(pb.DashboardItem item) async {
    final dashboard = _dashboard.value;
    if (dashboard == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Visualization'),
        content: Text('Remove "${item.query.name}" from this dashboard?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.utilityError500,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _exploreState.removeQueryFromDashboard(
        dashboardId: dashboard.id,
        savedQueryId: item.query.id,
      );
      _loadDashboard();
    }
  }

  void _openInExplorer(pb.DashboardItem item) {
    _exploreState.applySavedQuery(item.query);
    context.goToExplore();
  }
}
