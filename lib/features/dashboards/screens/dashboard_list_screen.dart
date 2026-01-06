import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../gen/moat/v1/analytics.pb.dart' as pb;
import '../../explore/state/explore_state.dart';

/// Screen showing list of user's dashboards.
class DashboardListScreen extends StatefulWidget {
  const DashboardListScreen({super.key});

  @override
  State<DashboardListScreen> createState() => _DashboardListScreenState();
}

class _DashboardListScreenState extends State<DashboardListScreen> {
  late final ExploreState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<ExploreState>();
    _state.loadDashboards();
    _state.loadSavedQueries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Watch((context) {
              final isLoading = _state.isLoadingDashboards.value;
              final dashboards = _state.dashboards.value;
              final error = _state.error.value;

              if (isLoading && dashboards.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (error != null && dashboards.isEmpty) {
                return _buildErrorState(error.toString());
              }

              if (dashboards.isEmpty) {
                return _buildEmptyState();
              }

              return _buildDashboardGrid(dashboards);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.spacingXL),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.blueLight, AppColors.blueLight700],
              ),
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            ),
            child: const Icon(Icons.dashboard_outlined, color: AppColors.white, size: 24),
          ),
          const SizedBox(width: AppSizes.spacingMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dashboards', style: AppTextStyles.textXLSemibold),
                Text(
                  'View and manage your saved analytics dashboards',
                  style: AppTextStyles.textSM.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: _showCreateDashboardDialog,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('New Dashboard'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueLight700,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spacingLG,
                vertical: AppSizes.spacingMD,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
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
          Text('Failed to load dashboards', style: AppTextStyles.textMD),
          const SizedBox(height: AppSizes.spacingSM),
          Text(error, style: AppTextStyles.textSMSecondary),
          const SizedBox(height: AppSizes.spacingXL),
          ElevatedButton(
            onPressed: () => _state.loadDashboards(),
            child: const Text('Retry'),
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
            Icons.dashboard_outlined,
            size: 64,
            color: AppColors.textTertiary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: AppSizes.spacingLG),
          Text(
            'No dashboards yet',
            style: AppTextStyles.textMD.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSizes.spacingSM),
          Text(
            'Create a dashboard to organize your saved queries',
            style: AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
          ),
          const SizedBox(height: AppSizes.spacingXL),
          ElevatedButton.icon(
            onPressed: _showCreateDashboardDialog,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create Dashboard'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueLight700,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spacingXL,
                vertical: AppSizes.spacingMD,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spacingMD),
          TextButton(
            onPressed: () => context.goToExplore(),
            child: Text(
              'Or explore data first',
              style: AppTextStyles.textSM.copyWith(color: AppColors.blueLight700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardGrid(List<pb.Dashboard> dashboards) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.spacingXL),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 1.4,
          crossAxisSpacing: AppSizes.spacingLG,
          mainAxisSpacing: AppSizes.spacingLG,
        ),
        itemCount: dashboards.length,
        itemBuilder: (context, index) => _buildDashboardCard(dashboards[index]),
      ),
    );
  }

  Widget _buildDashboardCard(pb.Dashboard dashboard) {
    final itemCount = dashboard.items.length;

    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusLG),
      child: InkWell(
        onTap: () => context.go('${Routes.dashboards}/${dashboard.id}'),
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.spacingLG),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusLG),
            border: Border.all(color: AppColors.borderSecondary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.utilityBlue50,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                    ),
                    child: const Icon(
                      Icons.dashboard_outlined,
                      size: 20,
                      color: AppColors.blueLight700,
                    ),
                  ),
                  const SizedBox(width: AppSizes.spacingMD),
                  Expanded(
                    child: Text(
                      dashboard.name,
                      style: AppTextStyles.textMDSemiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (dashboard.isDefault)
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
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, size: 20),
                    onSelected: (value) => _handleDashboardAction(value, dashboard),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit_outlined, size: 18),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete_outline, size: 18, color: AppColors.utilityError500),
                            SizedBox(width: 8),
                            Text('Delete', style: TextStyle(color: AppColors.utilityError500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (dashboard.description.isNotEmpty) ...[
                const SizedBox(height: AppSizes.spacingSM),
                Text(
                  dashboard.description,
                  style: AppTextStyles.textSM.copyWith(color: AppColors.textSecondary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const Spacer(),
              const Divider(),
              const SizedBox(height: AppSizes.spacingSM),
              Row(
                children: [
                  Icon(Icons.widgets_outlined, size: 16, color: AppColors.textTertiary),
                  const SizedBox(width: AppSizes.spacingXS),
                  Text(
                    '$itemCount ${itemCount == 1 ? 'visualization' : 'visualizations'}',
                    style: AppTextStyles.textXS.copyWith(color: AppColors.textTertiary),
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward, size: 16, color: AppColors.blueLight700),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateDashboardDialog() {
    final nameController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Dashboard'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'e.g., Asset Analytics',
              ),
            ),
            const SizedBox(height: AppSizes.spacingMD),
            TextField(
              controller: descController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Description (optional)',
                hintText: 'What is this dashboard for?',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              if (name.isEmpty) return;

              final dashboard = await _state.createDashboard(
                name: name,
                description: descController.text.trim(),
              );

              if (context.mounted) {
                Navigator.pop(context);
                if (dashboard != null) {
                  context.go('${Routes.dashboards}/${dashboard.id}');
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueLight700,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _handleDashboardAction(String action, pb.Dashboard dashboard) {
    switch (action) {
      case 'edit':
        _showEditDashboardDialog(dashboard);
        break;
      case 'delete':
        _showDeleteConfirmation(dashboard);
        break;
    }
  }

  void _showEditDashboardDialog(pb.Dashboard dashboard) {
    final nameController = TextEditingController(text: dashboard.name);
    final descController = TextEditingController(text: dashboard.description);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Dashboard'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: AppSizes.spacingMD),
            TextField(
              controller: descController,
              maxLines: 2,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              // TODO: Implement update dashboard
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueLight700,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(pb.Dashboard dashboard) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Dashboard'),
        content: Text('Are you sure you want to delete "${dashboard.name}"? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _state.deleteDashboard(dashboard.id);
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.utilityError500,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
