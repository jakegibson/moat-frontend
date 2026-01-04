import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../reports/data/cube_models.dart';
import '../state/explore_state.dart';
import '../widgets/cube_selector.dart';
import '../widgets/member_picker.dart';
import '../widgets/chart_type_picker.dart';
import '../widgets/time_config_panel.dart';
import '../widgets/explorer_chart_view.dart';
import '../widgets/explorer_table_view.dart';

/// Data Explorer screen - self-service analytics builder.
class DataExplorerScreen extends StatefulWidget {
  const DataExplorerScreen({super.key});

  @override
  State<DataExplorerScreen> createState() => _DataExplorerScreenState();
}

class _DataExplorerScreenState extends State<DataExplorerScreen> {
  late final ExploreState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<ExploreState>();
    _state.loadMeta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      body: Watch((context) {
        final isLoading = _state.isLoadingMeta.value;
        final error = _state.error.value;
        final meta = _state.meta.value;

        if (isLoading && meta == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error != null && meta == null) {
          return _buildErrorState(error);
        }

        return Row(
          children: [
            // Left panel: Query builder
            SizedBox(
              width: 320,
              child: _buildQueryPanel(),
            ),
            // Divider
            Container(
              width: 1,
              color: AppColors.borderSecondary,
            ),
            // Right panel: Results
            Expanded(
              child: _buildResultsPanel(),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline,
              size: 48, color: AppColors.utilityError500),
          const SizedBox(height: AppSizes.spacingMD),
          Text('Failed to load metadata', style: AppTextStyles.textMD),
          const SizedBox(height: AppSizes.spacingSM),
          Text(error, style: AppTextStyles.textSMSecondary),
          const SizedBox(height: AppSizes.spacingXL),
          ElevatedButton(
            onPressed: () => _state.loadMeta(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildQueryPanel() {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          _buildPanelHeader(),
          const Divider(height: 1),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spacingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cube selector
                  const Text('Data Source', style: AppTextStyles.textSMSemibold),
                  const SizedBox(height: AppSizes.spacingSM),
                  CubeSelector(state: _state),
                  const SizedBox(height: AppSizes.spacingXL),

                  // Measures
                  const Text('Measures', style: AppTextStyles.textSMSemibold),
                  const SizedBox(height: AppSizes.spacingXS),
                  Text('What do you want to calculate?',
                      style: AppTextStyles.textXS
                          .copyWith(color: AppColors.textTertiary)),
                  const SizedBox(height: AppSizes.spacingSM),
                  MemberPicker(
                    state: _state,
                    memberType: MemberType.measure,
                  ),
                  const SizedBox(height: AppSizes.spacingXL),

                  // Dimensions
                  const Text('Dimensions', style: AppTextStyles.textSMSemibold),
                  const SizedBox(height: AppSizes.spacingXS),
                  Text('How do you want to group?',
                      style: AppTextStyles.textXS
                          .copyWith(color: AppColors.textTertiary)),
                  const SizedBox(height: AppSizes.spacingSM),
                  MemberPicker(
                    state: _state,
                    memberType: MemberType.dimension,
                  ),
                  const SizedBox(height: AppSizes.spacingXL),

                  // Time configuration
                  Watch((context) {
                    final timeDim = _state.selectedTimeDimension.value;
                    if (timeDim == null) return const SizedBox.shrink();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Time Settings',
                            style: AppTextStyles.textSMSemibold),
                        const SizedBox(height: AppSizes.spacingSM),
                        TimeConfigPanel(state: _state),
                        const SizedBox(height: AppSizes.spacingXL),
                      ],
                    );
                  }),

                  // Chart type
                  const Text('Visualization', style: AppTextStyles.textSMSemibold),
                  const SizedBox(height: AppSizes.spacingSM),
                  ChartTypePicker(state: _state),
                ],
              ),
            ),
          ),
          // Run button
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(AppSizes.spacingLG),
            child: Watch((context) {
              final isLoading = _state.isLoadingData.value;
              final hasMeasures = _state.selectedMeasures.value.isNotEmpty;

              return ElevatedButton(
                onPressed: hasMeasures && !isLoading
                    ? () => _state.executeQuery()
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueLight700,
                  foregroundColor: AppColors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: AppSizes.spacingMD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.white),
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow, size: 20),
                          SizedBox(width: AppSizes.spacingSM),
                          Text('Run Query'),
                        ],
                      ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildPanelHeader() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.spacingLG),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF06B6D4), Color(0xFF14B8A6)],
              ),
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            ),
            child: const Icon(Icons.explore, color: Colors.white, size: 20),
          ),
          const SizedBox(width: AppSizes.spacingMD),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Data Explorer', style: AppTextStyles.textLGSemibold),
              Text('Build custom queries',
                  style: AppTextStyles.textXS
                      .copyWith(color: AppColors.textTertiary)),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.refresh, size: 20),
            onPressed: () => _state.clearSelections(),
            tooltip: 'Clear all',
          ),
        ],
      ),
    );
  }

  Widget _buildResultsPanel() {
    return Watch((context) {
      final result = _state.queryResult.value;
      final chartType = _state.chartType.value;
      final error = _state.error.value;
      final isLoading = _state.isLoadingData.value;

      return Container(
        color: AppColors.bgSecondary,
        child: Column(
          children: [
            // Results header
            _buildResultsHeader(),
            const Divider(height: 1),
            // Results content
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : error != null
                      ? _buildQueryError(error)
                      : result == null
                          ? _buildEmptyState()
                          : _buildResultsContent(result, chartType),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildResultsHeader() {
    return Watch((context) {
      final result = _state.queryResult.value;
      return Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(AppSizes.spacingLG),
        child: Row(
          children: [
            const Text('Results', style: AppTextStyles.textLGSemibold),
            const Spacer(),
            if (result != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spacingSM,
                  vertical: AppSizes.spacingXS,
                ),
                decoration: BoxDecoration(
                  color: AppColors.utilityBlue50,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                ),
                child: Text(
                  '${result.data.length} rows',
                  style: AppTextStyles.textXS.copyWith(
                    color: AppColors.utilityBlue700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      );
    });
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart_outlined,
              size: 64, color: AppColors.textTertiary.withValues(alpha: 0.5)),
          const SizedBox(height: AppSizes.spacingLG),
          Text(
            'Select measures and run query',
            style: AppTextStyles.textMD.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSizes.spacingSM),
          Text(
            'Your results will appear here',
            style: AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
          ),
        ],
      ),
    );
  }

  Widget _buildQueryError(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacing2XL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning_amber_outlined,
                size: 48, color: AppColors.utilityWarning500),
            const SizedBox(height: AppSizes.spacingMD),
            Text('Query Error', style: AppTextStyles.textMDSemiBold),
            const SizedBox(height: AppSizes.spacingSM),
            Text(
              error,
              style: AppTextStyles.textSM.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsContent(CubeResponse result, ExplorerChartType chartType) {
    if (result.data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined,
                size: 64, color: AppColors.textTertiary.withValues(alpha: 0.5)),
            const SizedBox(height: AppSizes.spacingLG),
            Text(
              'No data found',
              style: AppTextStyles.textMD.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSizes.spacingSM),
            Text(
              'Try adjusting your filters or date range',
              style: AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(AppSizes.spacingXL),
      child: chartType == ExplorerChartType.table
          ? ExplorerTableView(
              result: result,
              measures: _state.selectedMeasures.value,
              dimensions: _state.selectedDimensions.value,
              timeDimension: _state.selectedTimeDimension.value,
            )
          : ExplorerChartView(
              result: result,
              chartType: chartType,
              measures: _state.selectedMeasures.value,
              dimensions: _state.selectedDimensions.value,
              timeDimension: _state.selectedTimeDimension.value,
            ),
    );
  }
}
