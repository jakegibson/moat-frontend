import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/error_view.dart';
import '../../tickets/data/task_client.dart';
import '../../tickets/data/task_models.dart';
import '../data/assets_client.dart';
import '../data/assets_models.dart';
import '../data/maintenance_cadence.dart';
import '../data/warranty_coverage_client.dart';
import '../data/warranty_models.dart';
import '../state/assets_state.dart';
import '../widgets/complete_maintenance_drawer.dart';
import '../widgets/document_viewer.dart';
import '../widgets/edit_asset_drawer.dart';
import '../widgets/edit_warranty_drawer.dart';
import '../widgets/maintenance_task_drawer.dart';
import '../widgets/resolve_warranty_drawer.dart';
import '../widgets/warranty_coverage_tile.dart';

class AssetDetailScreen extends StatefulWidget {
  final String assetId;
  final String? screen;

  const AssetDetailScreen({
    required this.assetId,
    this.screen,
    super.key,
  });

  @override
  State<AssetDetailScreen> createState() => _AssetDetailScreenState();
}

class _AssetDetailScreenState extends State<AssetDetailScreen> {
  final _assetsState = getIt<AssetsState>();
  bool _showEditDrawer = false;

  @override
  void initState() {
    super.initState();
    _assetsState.fetchAsset(widget.assetId);
  }

  void _openEditDrawer() {
    setState(() => _showEditDrawer = true);
  }

  void _closeEditDrawer() {
    setState(() => _showEditDrawer = false);
  }

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final isLoading = _assetsState.isLoading.value;
      final error = _assetsState.error.value;
      final asset = _assetsState.selectedAsset.value;

      if (isLoading && asset == null) {
        return Scaffold(
          backgroundColor: AppColors.bgSecondary,
          body: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentButton),
            ),
          ),
        );
      }

      if (error != null && asset == null) {
        return Scaffold(
          backgroundColor: AppColors.bgSecondary,
          body: ErrorView(
            error: error,
            onRetry: () => _assetsState.fetchAsset(widget.assetId),
          ),
        );
      }

      if (asset == null) {
        return const Scaffold(
          body: Center(child: Text('No Asset Selected')),
        );
      }

      return SelectionArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            toolbarHeight: 80.0,
            centerTitle: false,
            leadingWidth: 70.0,
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
                size: 20,
              ),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/assets/list');
                }
              },
              style: IconButton.styleFrom(
                side: const BorderSide(
                  color: AppColors.borderPrimary,
                  width: 1.0,
                ),
              ),
            ),
            backgroundColor: AppColors.bgSecondary,
            title: Text(
              asset.isProcessing
                  ? '${asset.name} (Processing...)'
                  : asset.name,
              style: AppTextStyles.textXLSemibold,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: ElevatedButton(
                  onPressed: _openEditDrawer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    ),
                  ),
                  child: Text(
                    'Edit Asset',
                    style: AppTextStyles.textSMSemibold
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                color: AppColors.white,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < AppSizes.mobileScreenWidth) {
                      return _MobileSwitcher(
                        assetId: widget.assetId,
                        screen: widget.screen,
                        asset: asset,
                      );
                    }
                    return Row(
                      children: [
                        // Document Viewer (left pane)
                        Expanded(
                          child: DocumentViewer(assetId: widget.assetId),
                        ),
                        // Asset Overview (right pane)
                        Expanded(
                          child: _AssetOverviewScreen(
                            assetId: widget.assetId,
                            screen: widget.screen,
                            asset: asset,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Edit Drawer overlay
              if (_showEditDrawer) ...[
                // Backdrop
                Positioned.fill(
                  child: GestureDetector(
                    onTap: _closeEditDrawer,
                    child: Container(
                      color: AppColors.black.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                // Drawer
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: EditAssetDrawer(
                    asset: asset,
                    onClose: _closeEditDrawer,
                    onSaved: () {
                      // Refresh asset data
                      _assetsState.fetchAsset(widget.assetId);
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}

/// Mobile switcher for toggling between document view and asset overview
class _MobileSwitcher extends StatefulWidget {
  final String assetId;
  final String? screen;
  final Asset asset;

  const _MobileSwitcher({
    required this.assetId,
    required this.screen,
    required this.asset,
  });

  @override
  State<_MobileSwitcher> createState() => _MobileSwitcherState();
}

class _MobileSwitcherState extends State<_MobileSwitcher> {
  bool _isDocumentView = false;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true, initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            DocumentViewer(assetId: widget.assetId),
            _AssetOverviewScreen(
              assetId: widget.assetId,
              screen: widget.screen,
              asset: widget.asset,
            ),
          ],
        ),
        Positioned(
          bottom: 56.0,
          right: 36.0,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _isDocumentView = !_isDocumentView;
                _pageController.animateToPage(
                  _isDocumentView ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
            backgroundColor: AppColors.white,
            child: Icon(
              _isDocumentView ? Icons.list : Icons.text_snippet_outlined,
            ),
          ),
        ),
      ],
    );
  }
}

/// Tabbed overview screen (right pane)
class _AssetOverviewScreen extends StatefulWidget {
  final String assetId;
  final String? screen;
  final Asset asset;

  const _AssetOverviewScreen({
    required this.assetId,
    required this.screen,
    required this.asset,
  });

  @override
  State<_AssetOverviewScreen> createState() => _AssetOverviewScreenState();
}

class _AssetOverviewScreenState extends State<_AssetOverviewScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isMobile =
        MediaQuery.sizeOf(context).width <= AppSizes.mobileScreenWidth;
    final tabPadding = isMobile ? 12.0 : 24.0;

    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: DefaultTabController(
        initialIndex: widget.screen == 'maintenance' ? 1 : 0,
        length: 4,
        child: Column(
          children: [
            Container(
              height: AppSizes.appBarHeight,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.gray, width: 1.0),
                ),
              ),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.label,
                padding: EdgeInsets.symmetric(horizontal: tabPadding),
                dividerColor: AppColors.white,
                labelPadding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: tabPadding,
                ),
                indicatorColor: AppColors.accentButton,
                labelColor: AppColors.black,
                labelStyle: AppTextStyles.label,
                tabs: const [
                  Tab(child: Text('Details')),
                  Tab(child: Text('Maintenance')),
                  Tab(child: Text('Warranty')),
                  Tab(child: Text('Document Chat')),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: AppColors.gray, width: 1.0),
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _DetailsTab(asset: widget.asset),
                    _MaintenanceTab(asset: widget.asset),
                    _WarrantyTab(asset: widget.asset),
                    _DocumentChatTab(assetId: widget.assetId),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Details Tab
class _DetailsTab extends StatelessWidget {
  final Asset asset;

  const _DetailsTab({required this.asset});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Asset name/title
          Text(
            asset.technicalName ?? asset.name,
            style: AppTextStyles.semi24,
          ),
          const SizedBox(height: 20),

          // Warranty card
          Card.outlined(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: AppColors.gray),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoRow(
                    label: 'Warranty Start Date',
                    value: asset.warrantyStartDate != null
                        ? DateFormatter.formatFriendlyDate(
                            dateTime: asset.warrantyStartDate!,
                          )
                        : 'unknown',
                  ),
                  const SizedBox(height: 8),
                  _InfoRow(
                    label: 'Asset Value',
                    value: _getAssetValueDisplay(asset),
                  ),
                  // Show AI estimate tooltip if using AI value
                  if (asset.priceValue == null &&
                      asset.purchasePrice == null &&
                      asset.aiPriceValue != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            size: 14,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'AI Estimated',
                            style: AppTextStyles.textXS.copyWith(
                              color: AppColors.textTertiary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Dates section
          _buildSection(
            title: 'Dates',
            children: [
              if (asset.purchaseDate != null)
                _InfoRow(
                  label: 'Purchase Date',
                  value: DateFormatter.formatFriendlyDate(
                    dateTime: asset.purchaseDate!,
                  ),
                ),
              // Show Invoice Date only if it's different from Purchase Date
              if (asset.invoiceDate != null &&
                  (asset.purchaseDate == null ||
                      asset.invoiceDate!.difference(asset.purchaseDate!).inDays.abs() > 1))
                _InfoRow(
                  label: 'Invoice Date',
                  value: DateFormatter.formatFriendlyDate(
                    dateTime: asset.invoiceDate!,
                  ),
                ),
              if (asset.installationDate != null)
                _InfoRow(
                  label: 'Installation Date',
                  value: DateFormatter.formatFriendlyDate(
                    dateTime: asset.installationDate!,
                  ),
                ),
              if (asset.substantialCompletionDate != null)
                _InfoRow(
                  label: 'Substantial Completion Date',
                  value: DateFormatter.formatFriendlyDate(
                    dateTime: asset.substantialCompletionDate!,
                  ),
                ),
            ],
          ),

          const SizedBox(height: 24),

          // Details section
          _buildSection(
            title: 'Details',
            children: [
              if (asset.manufacturer != null)
                _InfoRow(label: 'Manufacturer', value: asset.manufacturer!),
              if (asset.locationName != null)
                _InfoRow(label: 'Site Location', value: asset.locationName!),
              if (asset.floorLocation != null)
                _InfoRow(label: 'Floor Location', value: asset.floorLocation!),
              if (asset.serviceArea != null)
                _InfoRow(label: 'Service Area', value: asset.serviceArea!),
              if (asset.modelNumber != null)
                _InfoRow(label: 'Model #', value: asset.modelNumber!),
              if (asset.serialNumber != null)
                _InfoRow(label: 'Serial #', value: asset.serialNumber!),
              if (asset.internalId != null)
                _InfoRow(label: 'Internal ID', value: asset.internalId!),
              if (asset.notes != null && asset.notes!.isNotEmpty)
                _InfoRow(label: 'Notes', value: asset.notes!),
            ],
          ),

          // Division of Construction section
          if (asset.divisionOfConstruction != null) ...[
            const SizedBox(height: 24),
            _buildSection(
              title: 'Division of Construction',
              children: [
                if (asset.docDivisionNumber != null)
                  _InfoRow(
                    label: asset.docDivisionNumber!,
                    value: asset.docDivisionName ?? '',
                  ),
                if (asset.docSectionNumber != null)
                  _InfoRow(
                    label: asset.docSectionNumber!,
                    value: asset.docSectionName ?? '',
                  ),
                // Show subsection if different from section
                if (asset.hasDocSubsectionNumber)
                  _InfoRow(
                    label: asset.docSubsectionNumber!,
                    value: asset.docSubsectionName ?? '',
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    if (children.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.textLGSemibold),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  /// Returns the asset value display string, prioritizing:
  /// 1. priceValue (user-set)
  /// 2. purchasePrice
  /// 3. aiPriceValue (AI-estimated)
  String _getAssetValueDisplay(Asset asset) {
    final value = asset.priceValue ?? asset.purchasePrice ?? asset.aiPriceValue;
    if (value == null) return 'unknown';
    return '\$${value.toStringAsFixed(2)}';
  }
}

/// Maintenance Tab - shows maintenance task definitions for this asset
class _MaintenanceTab extends StatefulWidget {
  final Asset asset;

  const _MaintenanceTab({required this.asset});

  @override
  State<_MaintenanceTab> createState() => _MaintenanceTabState();
}

class _MaintenanceTabState extends State<_MaintenanceTab> {
  final _taskClient = getIt<TaskClient>();
  List<TaskDef>? _taskDefs;
  bool _isLoading = true;
  String? _error;

  // Drawer state
  bool _showCreateDrawer = false;
  bool _showEditDrawer = false;
  bool _showCompleteDrawer = false;
  TaskDef? _selectedTaskDef;

  @override
  void initState() {
    super.initState();
    _loadTaskDefs();
  }

  Future<void> _loadTaskDefs() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final taskDefs = await _taskClient.listTaskDefs(
        assetId: widget.asset.id,
        taskType: TaskType.maintenance,
        isEnabled: true,
      );
      if (mounted) {
        setState(() {
          _taskDefs = _sortByCadence(taskDefs);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  /// Sort tasks by cadence priority (matching v0 ordering)
  List<TaskDef> _sortByCadence(List<TaskDef> taskDefs) {
    final cadenceOrder = [
      MaintenanceCadence.daily,
      MaintenanceCadence.weekly,
      MaintenanceCadence.monthly,
      MaintenanceCadence.bimonthly,
      MaintenanceCadence.quarterly,
      MaintenanceCadence.semiannually,
      MaintenanceCadence.annually,
      MaintenanceCadence.biannually,
      MaintenanceCadence.triennially,
      MaintenanceCadence.quinquennially,
      MaintenanceCadence.decennially,
      MaintenanceCadence.frequently,
      MaintenanceCadence.periodically,
      MaintenanceCadence.occasionally,
      MaintenanceCadence.regularly,
      MaintenanceCadence.asNeeded,
      MaintenanceCadence.noCadence,
      MaintenanceCadence.afterEachUse,
    ];

    return List.from(taskDefs)..sort((a, b) {
      final cadenceA = RRuleUtils.rruleToCadence(a.recurrenceRule);
      final cadenceB = RRuleUtils.rruleToCadence(b.recurrenceRule);
      final indexA = cadenceOrder.indexOf(cadenceA);
      final indexB = cadenceOrder.indexOf(cadenceB);
      return indexA.compareTo(indexB);
    });
  }

  void _openCreateDrawer() {
    setState(() {
      _showCreateDrawer = true;
      _showEditDrawer = false;
      _showCompleteDrawer = false;
      _selectedTaskDef = null;
    });
  }

  void _openEditDrawer(TaskDef taskDef) {
    setState(() {
      _showEditDrawer = true;
      _showCreateDrawer = false;
      _showCompleteDrawer = false;
      _selectedTaskDef = taskDef;
    });
  }

  void _openCompleteDrawer(TaskDef taskDef) {
    setState(() {
      _showCompleteDrawer = true;
      _showCreateDrawer = false;
      _showEditDrawer = false;
      _selectedTaskDef = taskDef;
    });
  }

  void _closeDrawer() {
    setState(() {
      _showCreateDrawer = false;
      _showEditDrawer = false;
      _showCompleteDrawer = false;
      _selectedTaskDef = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text('Tasks', style: AppTextStyles.heading3),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (widget.asset.locationId == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Cannot create task: Asset location is not set',
                            ),
                            backgroundColor: AppColors.error,
                          ),
                        );
                        return;
                      }
                      _openCreateDrawer();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      side: const BorderSide(color: AppColors.borderPrimary),
                    ),
                    child: const Text('Create Task'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (_isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.accentButton),
                    ),
                  ),
                )
              else if (_error != null)
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: AppColors.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error loading tasks',
                        style: AppTextStyles.textLGSemibold,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _error!,
                        style: AppTextStyles.textSMSecondary,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadTaskDefs,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              else if (_taskDefs == null || _taskDefs!.isEmpty)
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 64,
                        color: AppColors.success,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No Maintenance? No Problem!',
                        style: AppTextStyles.textLGSemibold,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Preventative maintenance tasks will appear here once configured for this asset.',
                        style: AppTextStyles.textSMSecondary,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              else
                Column(
                  children: _taskDefs!.map((taskDef) {
                    return _MaintenanceTile(
                      taskDef: taskDef,
                      onComplete: () => _openCompleteDrawer(taskDef),
                      onEdit: () => _openEditDrawer(taskDef),
                      onTap: () {
                        // Navigate to task if there's an active task
                        if (taskDef.taskId != null) {
                          context.push('${Routes.tickets}/${taskDef.taskId}');
                        }
                      },
                    );
                  }).toList(),
                ),
            ],
          ),
        ),

        // Drawer overlays
        if (_showCreateDrawer || _showEditDrawer || _showCompleteDrawer) ...[
          // Backdrop
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeDrawer,
              child: Container(
                color: AppColors.black.withValues(alpha: 0.3),
              ),
            ),
          ),
          // Drawer
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: _showCreateDrawer
                ? MaintenanceTaskDrawer(
                    assetId: widget.asset.id,
                    locationId: widget.asset.locationId ?? '',
                    onSaved: _loadTaskDefs,
                    onClose: _closeDrawer,
                  )
                : _showEditDrawer && _selectedTaskDef != null
                    ? MaintenanceTaskDrawer(
                        assetId: widget.asset.id,
                        locationId: widget.asset.locationId ?? '',
                        existingTask: _selectedTaskDef,
                        onSaved: _loadTaskDefs,
                        onClose: _closeDrawer,
                      )
                    : _showCompleteDrawer && _selectedTaskDef != null
                        ? CompleteMaintenanceDrawer(
                            taskDef: _selectedTaskDef!,
                            onCompleted: _loadTaskDefs,
                            onClose: _closeDrawer,
                          )
                        : const SizedBox.shrink(),
          ),
        ],
      ],
    );
  }
}

/// Maintenance task tile widget
class _MaintenanceTile extends StatelessWidget {
  final TaskDef taskDef;
  final VoidCallback? onTap;
  final VoidCallback? onComplete;
  final VoidCallback? onEdit;

  const _MaintenanceTile({
    required this.taskDef,
    this.onTap,
    this.onComplete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final cadence = RRuleUtils.rruleToCadence(taskDef.recurrenceRule);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderPrimary),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row with cadence
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  taskDef.title,
                  style: AppTextStyles.textMDMedium,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                cadence.displayName,
                style: AppTextStyles.textSMMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          // Description
          if (taskDef.description != null &&
              taskDef.description!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              taskDef.description!,
              style: AppTextStyles.textSMSecondary,
            ),
          ],

          const SizedBox(height: 12),

          // Bottom row with next date and actions
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (taskDef.isRecurring && taskDef.nextRunAt != null)
                      Text(
                        'Next: ${DateFormatter.formatFriendlyDate(dateTime: taskDef.nextRunAt!)}',
                        style: AppTextStyles.textXS.copyWith(
                          fontStyle: FontStyle.italic,
                          color: AppColors.textTertiary,
                        ),
                      )
                    else
                      Text(
                        'No history',
                        style: AppTextStyles.textXS.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                  ],
                ),
              ),

              // Complete Task button
              if (onComplete != null)
                OutlinedButton(
                  onPressed: onComplete,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    minimumSize: Size.zero,
                    side: BorderSide(color: AppColors.borderPrimary),
                  ),
                  child: Text(
                    'Complete Task',
                    style: AppTextStyles.textSMMedium,
                  ),
                ),

              // Edit button
              if (onEdit != null) ...[
                const SizedBox(width: 8),
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  style: IconButton.styleFrom(
                    side: BorderSide(color: AppColors.borderPrimary),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Warranty Tab - displays warranty coverage information
class _WarrantyTab extends StatefulWidget {
  final Asset asset;

  const _WarrantyTab({required this.asset});

  @override
  State<_WarrantyTab> createState() => _WarrantyTabState();
}

class _WarrantyTabState extends State<_WarrantyTab> {
  final _warrantyClient = getIt<WarrantyCoverageClient>();

  // Data state
  List<WarrantyCoverage> _warrantyCoverages = [];
  List<WarrantyCoverageHistory> _coverageHistory = [];
  bool _isLoading = true;

  // Drawer state
  bool _showEditDrawer = false;
  bool _showResolveDrawer = false;
  WarrantyCoverage? _selectedCoverage;

  @override
  void initState() {
    super.initState();
    _loadWarrantyData();
  }

  Future<void> _loadWarrantyData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Load coverages from API
      final coverages = await _warrantyClient.listWarrantyCoverages(
        widget.asset.id,
        status: 'active',
      );

      // Load history for all coverages
      final List<WarrantyCoverageHistory> allHistory = [];
      for (final coverage in coverages) {
        try {
          final history = await _warrantyClient.getCoverageHistory(coverage.id);
          allHistory.addAll(history);
        } catch (_) {
          // Ignore history loading errors for individual coverages
        }
      }

      if (mounted) {
        setState(() {
          _warrantyCoverages = coverages;
          _coverageHistory = allHistory;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          // Fallback to asset warranty fields if API fails
          _warrantyCoverages = _getFallbackCoverages();
        });
      }
    }
  }

  /// Fallback coverages from asset warranty fields if API fails
  List<WarrantyCoverage> _getFallbackCoverages() {
    final asset = widget.asset;
    if (asset.warrantyEndDate == null &&
        asset.warrantyDurationMonths == null &&
        asset.warrantyStartDate == null) {
      return [];
    }

    return [
      WarrantyCoverage(
        id: '${asset.id}_warranty',
        assetId: asset.id,
        name: asset.manufacturer ?? 'Warranty Coverage',
        description: null,
        expirationInMonths: asset.warrantyDurationMonths,
        startDate: asset.warrantyStartDate,
        endDate: asset.warrantyEndDate,
        providerName: asset.provider,
      ),
    ];
  }

  void _openEditDrawer(WarrantyCoverage coverage) {
    setState(() {
      _selectedCoverage = coverage;
      _showEditDrawer = true;
    });
  }

  void _closeEditDrawer() {
    setState(() {
      _showEditDrawer = false;
      _selectedCoverage = null;
    });
  }

  void _openResolveDrawer(WarrantyCoverage coverage) {
    setState(() {
      _selectedCoverage = coverage;
      _showResolveDrawer = true;
    });
  }

  void _closeResolveDrawer() {
    setState(() {
      _showResolveDrawer = false;
      _selectedCoverage = null;
    });
  }

  void _onWarrantySaved() {
    // Refresh warranty data from API
    _loadWarrantyData();
  }

  @override
  Widget build(BuildContext context) {
    final coverages = _warrantyCoverages;
    final hasCoverages = coverages.isNotEmpty;

    return Stack(
      children: [
        // Main content
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Coverage', style: AppTextStyles.heading3),
              const SizedBox(height: 16),

              if (_isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.accentButton),
                    ),
                  ),
                )
              else if (hasCoverages) ...[
                // Warranty coverage tiles
                ...coverages.map((coverage) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: WarrantyCoverageTile(
                        coverage: coverage,
                        warrantyStartDate: widget.asset.warrantyStartDate,
                        assetCreatedDate: widget.asset.createdAt,
                        coverageHistory: _coverageHistory
                            .where((h) => h.coverageId == coverage.id)
                            .toList(),
                        onEdit: () => _openEditDrawer(coverage),
                        onResolve: () => _openResolveDrawer(coverage),
                      ),
                    )),

                // Contact section
                if (_hasContactInfo(coverages)) ...[
                  const SizedBox(height: 24),
                  Divider(color: AppColors.borderPrimary),
                  const SizedBox(height: 24),
                  const Text('Contact', style: AppTextStyles.heading3),
                  const SizedBox(height: 12),
                  ..._buildContactWidgets(coverages),
                ],

                // Details section
                const SizedBox(height: 24),
                Divider(color: AppColors.borderPrimary),
                const SizedBox(height: 24),
                const Text('Details', style: AppTextStyles.textLGSemibold),
                const SizedBox(height: 12),
                _buildDetailRow(
                  'Duration',
                  _getWarrantyDurationText(widget.asset),
                ),
                if (widget.asset.warrantyStartDate != null)
                  _buildDetailRow(
                    'Start Date',
                    DateFormatter.formatFriendlyDate(
                        dateTime: widget.asset.warrantyStartDate!),
                  ),
                if (widget.asset.warrantyEndDate != null)
                  _buildDetailRow(
                    'End Date',
                    DateFormatter.formatFriendlyDate(
                        dateTime: widget.asset.warrantyEndDate!),
                  ),
                if (widget.asset.manufacturer != null)
                  _buildDetailRow('Manufacturer', widget.asset.manufacturer!),
                if (widget.asset.provider != null)
                  _buildDetailRow('Provider', widget.asset.provider!),
              ] else
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Icon(
                        Icons.shield_outlined,
                        size: 64,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No Warranty Details Found',
                        style: AppTextStyles.textLGSemibold,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "We weren't able to find warranty coverage terms in the documents provided. "
                        "If you have a warranty, you can add it in the edit menu and we'll process it!",
                        style: AppTextStyles.textSMSecondary,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        // Edit Warranty Drawer
        if (_showEditDrawer && _selectedCoverage != null)
          Positioned.fill(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _closeEditDrawer,
                    child: Container(color: AppColors.black.withAlpha(138)),
                  ),
                ),
                EditWarrantyDrawer(
                  coverage: _selectedCoverage!,
                  assetId: widget.asset.id,
                  onSaved: _onWarrantySaved,
                  onClose: _closeEditDrawer,
                  onDeleted: _onWarrantySaved,
                ),
              ],
            ),
          ),

        // Resolve Warranty Drawer
        if (_showResolveDrawer && _selectedCoverage != null)
          Positioned.fill(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _closeResolveDrawer,
                    child: Container(color: AppColors.black.withAlpha(138)),
                  ),
                ),
                ResolveWarrantyDrawer(
                  coverage: _selectedCoverage!,
                  assetId: widget.asset.id,
                  existingHistory: _coverageHistory,
                  onSaved: _onWarrantySaved,
                  onClose: _closeResolveDrawer,
                ),
              ],
            ),
          ),
      ],
    );
  }

  bool _hasContactInfo(List<WarrantyCoverage> coverages) {
    return coverages.any((c) =>
        c.effectiveProviderPhone != null ||
        c.effectiveProviderEmail != null ||
        c.effectiveProviderWebsite != null);
  }

  List<Widget> _buildContactWidgets(List<WarrantyCoverage> coverages) {
    final widgets = <Widget>[];
    final addedPhones = <String>{};
    final addedEmails = <String>{};
    final addedWebsites = <String>{};

    for (final coverage in coverages) {
      final providerName =
          coverage.effectiveProviderName ?? coverage.effectiveProviderContact ?? 'Warranty Provider';
      final phone = coverage.effectiveProviderPhone;
      final email = coverage.effectiveProviderEmail;
      final website = coverage.effectiveProviderWebsite;

      // Phone
      if (phone != null && !addedPhones.contains(phone)) {
        addedPhones.add(phone);
        widgets.add(_buildContactRow(
          Icons.phone,
          phone,
          providerName,
        ));
      }

      // Email
      if (email != null && !addedEmails.contains(email)) {
        addedEmails.add(email);
        widgets.add(_buildContactRow(
          Icons.email,
          email,
          providerName,
        ));
      }

      // Website
      if (website != null && !addedWebsites.contains(website)) {
        addedWebsites.add(website);
        widgets.add(_buildContactRow(
          Icons.language,
          website,
          providerName,
          isLink: true,
        ));
      }
    }

    return widgets;
  }

  Widget _buildContactRow(
    IconData icon,
    String value,
    String label, {
    bool isLink = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.textSM),
                Text(
                  value,
                  style: AppTextStyles.textMD.copyWith(
                    color: isLink ? AppColors.primary : null,
                    decoration: isLink ? TextDecoration.underline : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: AppTextStyles.textMDSecondary,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: AppTextStyles.textMDMedium,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  String _getWarrantyDurationText(Asset asset) {
    if (asset.hasLifetimeWarranty) return 'Lifetime';
    if (asset.warrantyDurationMonths == null) return 'Unknown';

    final months = asset.warrantyDurationMonths!;
    if (months >= 12 && months % 12 == 0) {
      final years = months ~/ 12;
      return '$years year${years > 1 ? 's' : ''}';
    }
    return '$months month${months > 1 ? 's' : ''}';
  }
}

/// Document Chat Tab - AI-powered Q&A about asset documents
class _DocumentChatTab extends StatefulWidget {
  final String assetId;

  const _DocumentChatTab({required this.assetId});

  @override
  State<_DocumentChatTab> createState() => _DocumentChatTabState();
}

class _DocumentChatTabState extends State<_DocumentChatTab> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final _assetsClient = getIt<AssetsClient>();

  List<AssetMessage> _messages = [];
  bool _isLoading = true;
  bool _isSending = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMessages() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final messages = await _assetsClient.listAssetMessages(widget.assetId);
      if (mounted) {
        setState(() {
          _messages = messages.reversed.toList(); // Oldest first for display
          _isLoading = false;
        });
        _scrollToBottom();
        // Poll for any pending responses
        _pollForResponses();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _pollForResponses() async {
    // Check if any messages are awaiting responses
    final pendingMessages = _messages.where((m) => m.isLoading).toList();
    if (pendingMessages.isEmpty) return;

    // Wait and reload
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      _loadMessages();
    }
  }

  Future<void> _sendMessage(String prompt) async {
    if (prompt.trim().isEmpty) return;

    setState(() {
      _isSending = true;
    });
    _textController.clear();

    try {
      final message = await _assetsClient.createAssetMessage(widget.assetId, prompt.trim());
      if (mounted) {
        setState(() {
          _messages.add(message);
          _isSending = false;
        });
        _scrollToBottom();
        // Poll for the AI response
        _pollForResponses();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message: $e')),
        );
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _askSuggestedQuestion(String question) {
    _textController.text = question;
    _sendMessage(question);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AI warning banner
        Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.utilityBlue50,
            border: Border.all(color: AppColors.utilityBlue200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.auto_awesome, color: AppColors.primary, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('AI-Powered Document Chat', style: AppTextStyles.textSMMedium),
                    const SizedBox(height: 4),
                    Text(
                      'Ask questions about this asset\'s warranty, maintenance, and specifications. AI responses are generated from uploaded documents and may not be completely accurate.',
                      style: AppTextStyles.textXS.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Messages list or empty state
        Expanded(
          child: _buildContent(),
        ),

        // Input bar
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(top: BorderSide(color: AppColors.borderPrimary)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  enabled: !_isSending,
                  decoration: InputDecoration(
                    hintText: _isSending
                        ? 'Sending...'
                        : 'Ask a question about this asset...',
                    hintStyle: AppTextStyles.textSMSecondary,
                    filled: true,
                    fillColor: AppColors.bgSecondary,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: _isSending ? null : _sendMessage,
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: _isSending
                    ? null
                    : () => _sendMessage(_textController.text),
                icon: _isSending
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.white,
                        ),
                      )
                    : const Icon(Icons.send),
                style: IconButton.styleFrom(
                  backgroundColor:
                      _isSending ? AppColors.textTertiary : AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: AppColors.error),
            const SizedBox(height: 16),
            Text('Failed to load messages', style: AppTextStyles.textLGSemibold),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _loadMessages,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_messages.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return _ChatMessageBubble(message: message);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: 16),
            Text(
              'Ask a question about this asset',
              style: AppTextStyles.textLGSemibold,
            ),
            const SizedBox(height: 8),
            Text(
              'Get instant answers from your warranty documents, maintenance manuals, and specifications.',
              style: AppTextStyles.textSMSecondary,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              'Try asking:',
              style: AppTextStyles.textSMMedium,
            ),
            const SizedBox(height: 12),
            _SuggestedQuestion(
              question: 'What is the warranty coverage for this asset?',
              onTap: () => _askSuggestedQuestion('What is the warranty coverage for this asset?'),
            ),
            _SuggestedQuestion(
              question: 'What maintenance is required?',
              onTap: () => _askSuggestedQuestion('What maintenance is required?'),
            ),
            _SuggestedQuestion(
              question: 'What are the specifications?',
              onTap: () => _askSuggestedQuestion('What are the specifications?'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Chat message bubble widget showing user prompt and AI response
class _ChatMessageBubble extends StatelessWidget {
  final AssetMessage message;

  const _ChatMessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // User prompt (right-aligned)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    message.prompt,
                    style: AppTextStyles.textSM.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // AI response (left-aligned)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.utilityBlue200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.auto_awesome,
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.bgSecondary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderPrimary),
                  ),
                  child: message.isLoading
                      ? Row(
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Analyzing documents...',
                              style: AppTextStyles.textSM.copyWith(
                                color: AppColors.textSecondary,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        )
                      : SelectableText(
                          message.response ?? '',
                          style: AppTextStyles.textSM,
                        ),
                ),
              ),
            ],
          ),
          // Timestamp
          Padding(
            padding: const EdgeInsets.only(left: 44, top: 4),
            child: Text(
              DateFormatter.formatFriendlyDate(dateTime: message.createdAt),
              style: AppTextStyles.textXS.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Suggested question chip widget
class _SuggestedQuestion extends StatelessWidget {
  final String question;
  final VoidCallback onTap;

  const _SuggestedQuestion({
    required this.question,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderPrimary),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward, size: 16, color: AppColors.primary),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  question,
                  style: AppTextStyles.textSM.copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Helper widget for info rows
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: AppTextStyles.textMDSecondary,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: AppTextStyles.textMDMedium,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
