import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../gen/moat/v1/analytics.pb.dart' as pb;
import '../../reports/data/cube_models.dart';

/// Card widget that displays a saved query visualization on a dashboard.
class DashboardItemCard extends StatelessWidget {
  final pb.DashboardItem item;
  final CubeResponse? result;
  final bool isLoading;
  final VoidCallback onRefresh;
  final VoidCallback onRemove;
  final VoidCallback onOpenInExplorer;

  const DashboardItemCard({
    super.key,
    required this.item,
    required this.result,
    required this.isLoading,
    required this.onRefresh,
    required this.onRemove,
    required this.onOpenInExplorer,
  });

  @override
  Widget build(BuildContext context) {
    // item.query is the SavedQuery
    final savedQuery = item.query;
    final title = item.customTitle.isNotEmpty ? item.customTitle : savedQuery.name;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(AppSizes.spacingMD),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderSecondary),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _getChartIcon(savedQuery.chartType),
                  size: 18,
                  color: AppColors.blueLight700,
                ),
                const SizedBox(width: AppSizes.spacingSM),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.textSMSemibold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, size: 18),
                  onPressed: onRefresh,
                  tooltip: 'Refresh data',
                  iconSize: 18,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, size: 18),
                  iconSize: 18,
                  padding: EdgeInsets.zero,
                  onSelected: (value) {
                    switch (value) {
                      case 'explore':
                        onOpenInExplorer();
                        break;
                      case 'remove':
                        onRemove();
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'explore',
                      child: Row(
                        children: [
                          Icon(Icons.explore, size: 18),
                          SizedBox(width: 8),
                          Text('Open in Explorer'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'remove',
                      child: Row(
                        children: [
                          Icon(Icons.remove_circle_outline, size: 18, color: AppColors.utilityError500),
                          SizedBox(width: 8),
                          Text('Remove', style: TextStyle(color: AppColors.utilityError500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Chart content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.spacingMD),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    if (result == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 32, color: AppColors.textTertiary),
            const SizedBox(height: AppSizes.spacingSM),
            Text(
              'Failed to load data',
              style: AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
            ),
          ],
        ),
      );
    }

    if (result!.data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.inbox_outlined, size: 32, color: AppColors.textTertiary),
            const SizedBox(height: AppSizes.spacingSM),
            Text(
              'No data',
              style: AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
            ),
          ],
        ),
      );
    }

    final savedQuery = item.query;
    final chartType = _parseChartType(savedQuery.chartType);
    final cubeQuery = savedQuery.query;

    // Build CubeMember lists for chart rendering
    final measures = cubeQuery.measures
        .map((name) => CubeMember(
              name: name,
              title: _formatMemberTitle(name),
              type: 'number',
            ))
        .toList();

    final dimensions = cubeQuery.dimensions
        .map((name) => CubeMember(
              name: name,
              title: _formatMemberTitle(name),
              type: 'string',
            ))
        .toList();

    CubeMember? timeDimension;
    if (cubeQuery.timeDimensions.isNotEmpty) {
      final td = cubeQuery.timeDimensions.first;
      timeDimension = CubeMember(
        name: td.dimension,
        title: _formatMemberTitle(td.dimension),
        type: 'time',
      );
    }

    return _buildChart(chartType, measures, dimensions, timeDimension);
  }

  Widget _buildChart(
    ExplorerChartType chartType,
    List<CubeMember> measures,
    List<CubeMember> dimensions,
    CubeMember? timeDimension,
  ) {
    // Single number display
    if (chartType == ExplorerChartType.number) {
      return _buildNumberView(measures);
    }

    // Determine labels and data for chart
    final labelKey = timeDimension?.name ?? (dimensions.isNotEmpty ? dimensions.first.name : null);
    final valueKey = measures.isNotEmpty ? measures.first.name : null;

    if (labelKey == null || valueKey == null) {
      return const Center(child: Text('Invalid query configuration'));
    }

    // Convert result data to chart format
    final data = result!.data.take(20).toList(); // Limit to 20 points for dashboard

    final labels = data.map((row) {
      final val = row[labelKey];
      if (val == null) return '';
      if (val is String) return val;
      return val.toString();
    }).toList();

    final values = data.map((row) {
      final val = row[valueKey];
      if (val == null) return 0.0;
      if (val is num) return val.toDouble();
      return double.tryParse(val.toString()) ?? 0.0;
    }).toList();

    switch (chartType) {
      case ExplorerChartType.bar:
        return _buildBarChart(labels, values);

      case ExplorerChartType.line:
        return _buildLineChart(labels, values);

      case ExplorerChartType.pie:
        return _buildPieChart(labels, values);

      case ExplorerChartType.table:
        return _buildTableView(measures, dimensions, timeDimension);

      default:
        return _buildBarChart(labels, values);
    }
  }

  Widget _buildBarChart(List<String> labels, List<double> values) {
    return BarChart(
      BarChartData(
        barGroups: values.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value,
                color: AppColors.blueLight700,
                width: 16,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
            ],
          );
        }).toList(),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= labels.length) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    labels[index].length > 10
                        ? '${labels[index].substring(0, 8)}...'
                        : labels[index],
                    style: AppTextStyles.textXS,
                    textAlign: TextAlign.center,
                  ),
                );
              },
              reservedSize: 30,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  _formatValue(value),
                  style: AppTextStyles.textXS,
                );
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: AppColors.borderSecondary,
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  Widget _buildLineChart(List<String> labels, List<double> values) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: values.asMap().entries.map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value);
            }).toList(),
            isCurved: true,
            color: AppColors.blueLight700,
            barWidth: 2,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.blueLight700.withValues(alpha: 0.1),
            ),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= labels.length) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    labels[index].length > 10
                        ? '${labels[index].substring(0, 8)}...'
                        : labels[index],
                    style: AppTextStyles.textXS,
                    textAlign: TextAlign.center,
                  ),
                );
              },
              reservedSize: 30,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  _formatValue(value),
                  style: AppTextStyles.textXS,
                );
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: AppColors.borderSecondary,
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  Widget _buildPieChart(List<String> labels, List<double> values) {
    final colors = _generateColors(values.length);
    final total = values.fold(0.0, (sum, v) => sum + v);

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: PieChart(
            PieChartData(
              sections: values.asMap().entries.map((entry) {
                final percentage = total > 0 ? (entry.value / total * 100) : 0;
                return PieChartSectionData(
                  value: entry.value,
                  color: colors[entry.key % colors.length],
                  title: '${percentage.toStringAsFixed(0)}%',
                  titleStyle: AppTextStyles.textXS.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  radius: 60,
                );
              }).toList(),
              centerSpaceRadius: 30,
              sectionsSpace: 2,
            ),
          ),
        ),
        const SizedBox(width: AppSizes.spacingMD),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: labels.asMap().entries.take(5).map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: colors[entry.key % colors.length],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        entry.value,
                        style: AppTextStyles.textXS,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberView(List<CubeMember> measures) {
    if (result!.data.isEmpty || measures.isEmpty) {
      return const Center(child: Text('No data'));
    }

    final row = result!.data.first;
    final firstMeasure = measures.first;
    final value = row[firstMeasure.name];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatValue(value),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.spacingXS),
          Text(
            firstMeasure.displayName,
            style: AppTextStyles.textSM.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableView(
    List<CubeMember> measures,
    List<CubeMember> dimensions,
    CubeMember? timeDimension,
  ) {
    final allColumns = [
      if (timeDimension != null) timeDimension,
      ...dimensions,
      ...measures,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columnSpacing: AppSizes.spacingMD,
          dataRowMinHeight: 36,
          dataRowMaxHeight: 36,
          headingRowHeight: 40,
          columns: allColumns
              .map((col) => DataColumn(
                    label: Text(
                      col.displayName,
                      style: AppTextStyles.textXS.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ))
              .toList(),
          rows: result!.data
              .take(10)
              .map((row) => DataRow(
                    cells: allColumns
                        .map((col) => DataCell(
                              Text(
                                _formatValue(row[col.name]),
                                style: AppTextStyles.textXS,
                              ),
                            ))
                        .toList(),
                  ))
              .toList(),
        ),
      ),
    );
  }

  IconData _getChartIcon(String chartType) {
    switch (chartType.toLowerCase()) {
      case 'bar':
        return Icons.bar_chart;
      case 'line':
        return Icons.show_chart;
      case 'pie':
        return Icons.pie_chart;
      case 'number':
        return Icons.tag;
      case 'table':
        return Icons.table_chart;
      default:
        return Icons.analytics;
    }
  }

  ExplorerChartType _parseChartType(String type) {
    switch (type.toLowerCase()) {
      case 'bar':
        return ExplorerChartType.bar;
      case 'line':
        return ExplorerChartType.line;
      case 'pie':
        return ExplorerChartType.pie;
      case 'number':
        return ExplorerChartType.number;
      case 'table':
        return ExplorerChartType.table;
      default:
        return ExplorerChartType.bar;
    }
  }

  String _formatMemberTitle(String name) {
    // Convert "Cube.memberName" to "Member Name"
    final parts = name.split('.');
    final memberPart = parts.length > 1 ? parts.last : name;
    return memberPart
        .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (m) => '${m[1]} ${m[2]}')
        .replaceAll('_', ' ')
        .split(' ')
        .map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : '')
        .join(' ');
  }

  String _formatValue(dynamic value) {
    if (value == null) return '-';
    if (value is num) {
      if (value is double && value == value.roundToDouble()) {
        return value.toInt().toString();
      }
      if (value >= 1000000) {
        return '${(value / 1000000).toStringAsFixed(1)}M';
      }
      if (value >= 1000) {
        return '${(value / 1000).toStringAsFixed(1)}K';
      }
      return value is double ? value.toStringAsFixed(1) : value.toString();
    }
    return value.toString();
  }

  List<Color> _generateColors(int count) {
    final colors = [
      AppColors.blueLight700,
      AppColors.utilityGreen500,
      AppColors.utilityOrange500,
      AppColors.utilityPurple500,
      AppColors.utilityError500,
      AppColors.exploreCyan,
      AppColors.exploreTeal,
    ];
    return List.generate(count, (i) => colors[i % colors.length]);
  }
}
