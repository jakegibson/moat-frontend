import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../state/reports_state.dart';
import '../widgets/summary_card.dart';
import '../widgets/fl_donut_chart_card.dart';
import '../widgets/sunburst_chart_card.dart';
import '../widgets/gauge_chart_card.dart';
import '../widgets/fl_bar_chart_card.dart';
import '../widgets/heatmap_calendar_card.dart';
import '../widgets/time_range_selector.dart';

/// Facility Insights Dashboard screen (V2 - using fl_chart).
class ReportsDashboardV2Screen extends StatefulWidget {
  const ReportsDashboardV2Screen({super.key});

  @override
  State<ReportsDashboardV2Screen> createState() =>
      _ReportsDashboardV2ScreenState();
}

class _ReportsDashboardV2ScreenState extends State<ReportsDashboardV2Screen> {
  late final ReportsState _state;
  TimeRange _selectedRange = TimeRange.twelveMonths;

  @override
  void initState() {
    super.initState();
    _state = getIt<ReportsState>();
    _state.loadDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgSecondary,
      child: Watch((context) {
        final isLoading = _state.isLoading.value;
        final error = _state.error.value;

        if (isLoading && _state.facilityMetrics.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error != null && _state.facilityMetrics.value == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,
                    size: 48, color: AppColors.utilityError500),
                const SizedBox(height: AppSizes.spacingMD),
                Text('Failed to load analytics', style: AppTextStyles.textMD),
                const SizedBox(height: AppSizes.spacingSM),
                Text(error, style: AppTextStyles.textSMSecondary),
                const SizedBox(height: AppSizes.spacingXL),
                ElevatedButton(
                  onPressed: _state.refresh,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: _state.refresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSizes.spacing3XL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: AppSizes.spacing3XL),
                _buildSummarySection(),
                const SizedBox(height: AppSizes.spacing3XL),
                _buildOperationsSection(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Facility Insights',
                      style: AppTextStyles.text2XLSemibold),
                  const SizedBox(width: AppSizes.spacingMD),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spacingSM,
                      vertical: AppSizes.spacingXS,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.utilityPurple50,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSM),
                    ),
                    child: Text(
                      'fl_chart',
                      style: AppTextStyles.textXS.copyWith(
                        color: AppColors.utilityPurple700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spacingXS),
              Text(
                'Discover trends, track progress, take action.',
                style: AppTextStyles.textSMSecondary,
              ),
              const SizedBox(height: AppSizes.spacingLG),
              TimeRangeSelector(
                selectedRange: _selectedRange,
                onChanged: (range) {
                  setState(() {
                    _selectedRange = range;
                  });
                  _state.refresh();
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            _buildLabeledButton(Icons.filter_list, 'Filters'),
            const SizedBox(width: AppSizes.spacingMD),
            _buildLabeledButton(Icons.download_outlined, 'Download'),
          ],
        ),
      ],
    );
  }

  Widget _buildLabeledButton(IconData icon, String label) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.spacingLG,
            vertical: AppSizes.spacingMD,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            border: Border.all(color: AppColors.borderSecondary),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: AppColors.textSecondary),
              const SizedBox(width: AppSizes.spacingSM),
              Text(label, style: AppTextStyles.textSM),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Watch((context) {
      final metrics = _state.facilityMetrics.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.utilityError500,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSizes.spacingMD),
              const Text('Summary', style: AppTextStyles.textLGSemibold),
            ],
          ),
          const SizedBox(height: AppSizes.spacingXS),
          Text(
            'Overview of key performance metrics.',
            style: AppTextStyles.textSMSecondary,
          ),
          const SizedBox(height: AppSizes.spacingXL),
          Row(
            children: [
              Expanded(
                child: SummaryCard(
                  title: 'Active Facilities',
                  value: ReportsState.formatNumber(
                      metrics?.activeFacilities ?? 0),
                  changePercent: 0,
                  sparklineData: _generatePlaceholderSparkline(trending: true),
                ),
              ),
              const SizedBox(width: AppSizes.spacingXL),
              Expanded(
                child: SummaryCard(
                  title: 'Assets Managed',
                  value:
                      ReportsState.formatNumber(metrics?.assetsManaged ?? 0),
                  changePercent: 0,
                  sparklineData: _generatePlaceholderSparkline(trending: true),
                ),
              ),
              const SizedBox(width: AppSizes.spacingXL),
              Expanded(
                child: SummaryCard(
                  title: 'Open Tickets',
                  value: ReportsState.formatNumber(metrics?.openTickets ?? 0),
                  changePercent: 0,
                  sparklineData: _generatePlaceholderSparkline(trending: false),
                ),
              ),
              const SizedBox(width: AppSizes.spacingXL),
              Expanded(
                child: SummaryCard(
                  title: 'Maintenance Score',
                  value: '${metrics?.maintenanceScore ?? 0}/100',
                  changePercent: 0,
                  sparklineData: _generatePlaceholderSparkline(trending: true),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildOperationsSection() {
    return Watch((context) {
      final assetsByDivision = _state.assetsByDivision.value;
      final assetsByLocation = _state.assetsByLocation.value;
      final assetsByAge = _state.assetsByAge.value;
      final maintenanceScore = _state.maintenanceScoreMetrics.value;
      final warrantyCalendar = _state.warrantyExpirationCalendar.value;
      final maintenanceCalendar = _state.maintenanceCalendar.value;

      // Build sunburst segments for divisions (reusing same widget)
      final sunburstSegments = assetsByDivision.map((division) {
        return SunburstSegment(
          code: division.division,
          label: division.divisionName,
          value: division.count,
        );
      }).toList();

      // Build location donut segments with colors (using fl_chart version)
      final locationSegments = assetsByLocation.asMap().entries.map((entry) {
        return FlDonutSegment(
          entry.value.locationName,
          entry.value.count,
          _getLocationColor(entry.key),
        );
      }).toList();

      // Build age data for bar chart (using fl_chart version)
      final ageData = assetsByAge.map((item) {
        return FlBarData(item.yearsOld, item.count);
      }).toList();

      final totalDivisionAssets =
          sunburstSegments.fold<int>(0, (sum, s) => sum + s.value);
      final totalLocationAssets =
          locationSegments.fold<int>(0, (sum, s) => sum + s.value);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Operations Performance',
              style: AppTextStyles.textLGSemibold),
          const SizedBox(height: AppSizes.spacingXS),
          Text(
            'Visualize efficiency and workload balance.',
            style: AppTextStyles.textSMSecondary,
          ),
          const SizedBox(height: AppSizes.spacingXL),

          // First row: Sunburst chart (Assets by Division) and Donut (Assets by Location)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SunburstChartCard(
                  title: 'Assets by Division',
                  totalLabel: 'Total Assets',
                  totalValue: totalDivisionAssets,
                  data: sunburstSegments.isNotEmpty
                      ? sunburstSegments
                      : _getPlaceholderSunburstSegments(),
                  legendTitle: 'Top 10 Divisions',
                  dropdownValue: 'Top 10',
                  dropdownItems: const ['Top 10', 'Top 20', 'All'],
                  onDropdownChanged: (value) {},
                  showExpandIcon: true,
                ),
              ),
              const SizedBox(width: AppSizes.spacingXL),
              Expanded(
                child: FlDonutChartCard(
                  title: 'Assets by Location',
                  totalLabel: 'Total',
                  totalValue: totalLocationAssets,
                  data: locationSegments.isNotEmpty
                      ? locationSegments
                      : _getPlaceholderLocationSegments(),
                  showTotalsDropdown: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spacingXL),

          // Second row: Gauge (Maintenance Score) and Bar chart (Age of Assets)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GaugeChartCard(
                  title: 'Maintenance Score',
                  score: maintenanceScore?.score ?? 0,
                  changePercent: 2,
                  description: 'Percentage of on-time maintenance',
                  secondaryDescription:
                      'The higher this score, the longer your assets will last, saving valuable money in replacement costs.',
                ),
              ),
              const SizedBox(width: AppSizes.spacingXL),
              Expanded(
                child: FlBarChartCard(
                  title: 'Age of Assets',
                  xAxisLabel: 'Years Old',
                  yAxisLabel: 'Total Assets',
                  data:
                      ageData.isNotEmpty ? ageData : _generatePlaceholderAgeData(),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spacingXL),

          // Third row: Heatmap calendars (Warranty Expiration, Maintenance)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: HeatmapCalendarCard(
                  title: 'Warranty Expiration Calendar',
                  totalCount:
                      warrantyCalendar.values.fold<int>(0, (sum, v) => sum + v),
                  data: warrantyCalendar.isNotEmpty
                      ? warrantyCalendar
                      : _generateCalendarData(),
                  colorScheme: HeatmapColorScheme.purple,
                ),
              ),
              const SizedBox(width: AppSizes.spacingXL),
              Expanded(
                child: HeatmapCalendarCard(
                  title: 'Maintenance Calendar',
                  totalCount: maintenanceCalendar.values
                      .fold<int>(0, (sum, v) => sum + v),
                  data: maintenanceCalendar.isNotEmpty
                      ? maintenanceCalendar
                      : _generateCalendarData(),
                  colorScheme: HeatmapColorScheme.blue,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  List<double> _generatePlaceholderSparkline({required bool trending}) {
    if (trending) {
      return [20, 25, 22, 28, 30, 27, 35, 32, 38, 42, 40, 45];
    } else {
      return [45, 42, 40, 38, 35, 32, 30, 28, 25, 22, 20, 18];
    }
  }

  List<SunburstSegment> _getPlaceholderSunburstSegments() {
    return [
      SunburstSegment(code: '030000', label: '03 Concrete', value: 0),
      SunburstSegment(code: '040000', label: '04 Masonry', value: 0),
      SunburstSegment(code: '050000', label: '05 Metals', value: 0),
      SunburstSegment(code: '230000', label: '23 HVAC', value: 0),
      SunburstSegment(code: '260000', label: '26 Electrical', value: 0),
    ];
  }

  List<FlDonutSegment> _getPlaceholderLocationSegments() {
    return [
      FlDonutSegment('Location 1', 0, _getLocationColor(0)),
      FlDonutSegment('Location 2', 0, _getLocationColor(1)),
      FlDonutSegment('Location 3', 0, _getLocationColor(2)),
    ];
  }

  Color _getLocationColor(int index) {
    final colors = [
      AppColors.utilityBlue500,
      AppColors.utilityGreen500,
      AppColors.utilityPurple500,
      AppColors.utilityOrange500,
    ];
    return colors[index % colors.length];
  }

  List<FlBarData> _generatePlaceholderAgeData() {
    return List.generate(12, (i) => FlBarData(i + 1, 0));
  }

  Map<DateTime, int> _generateCalendarData() {
    return {};
  }
}
