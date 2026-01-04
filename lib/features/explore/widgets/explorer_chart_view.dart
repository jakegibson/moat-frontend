import 'package:cristalyse/cristalyse.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../reports/data/cube_models.dart';

/// Chart visualization for explorer results using Cristalyse.
class ExplorerChartView extends StatelessWidget {
  final CubeResponse result;
  final ExplorerChartType chartType;
  final List<CubeMember> measures;
  final List<CubeMember> dimensions;
  final CubeMember? timeDimension;

  const ExplorerChartView({
    super.key,
    required this.result,
    required this.chartType,
    required this.measures,
    required this.dimensions,
    this.timeDimension,
  });

  @override
  Widget build(BuildContext context) {
    // Single number display
    if (chartType == ExplorerChartType.number) {
      return _buildNumberView();
    }

    // Chart visualizations
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      padding: const EdgeInsets.all(AppSizes.spacingXL),
      child: _buildChart(),
    );
  }

  Widget _buildNumberView() {
    if (result.data.isEmpty || measures.isEmpty) {
      return const Center(child: Text('No data'));
    }

    final row = result.data.first;
    final firstMeasure = measures.first;
    final value = row[firstMeasure.name];

    return Center(
      child: Container(
        padding: const EdgeInsets.all(AppSizes.spacing3XL),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusLG),
          border: Border.all(color: AppColors.borderSecondary),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _formatValue(value),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSizes.spacingSM),
            Text(
              firstMeasure.displayName,
              style: AppTextStyles.textMD.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    if (result.data.isEmpty) {
      return const Center(child: Text('No data to display'));
    }

    // Prepare data for Cristalyse
    final chartData = _prepareChartData();

    if (chartData.isEmpty) {
      return const Center(child: Text('Unable to prepare chart data'));
    }

    // Determine x and y fields
    final xField = _getXField();
    final yField = measures.isNotEmpty ? measures.first.name : null;

    if (xField == null || yField == null) {
      return const Center(child: Text('Select measures and dimensions'));
    }

    switch (chartType) {
      case ExplorerChartType.bar:
        return _buildBarChart(chartData, xField, yField);
      case ExplorerChartType.line:
        return _buildLineChart(chartData, xField, yField);
      case ExplorerChartType.pie:
        return _buildPieChart(chartData, xField, yField);
      default:
        return const Center(child: Text('Unsupported chart type'));
    }
  }

  Widget _buildBarChart(
    List<Map<String, dynamic>> data,
    String xField,
    String yField,
  ) {
    return SizedBox(
      height: 400,
      child: CristalyseChart()
          .data(data)
          .mapping(x: xField, y: yField)
          .geomBar(
            alpha: 0.85,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(4),
            ),
          )
          .scaleXOrdinal()
          .scaleYContinuous(min: 0)
          .theme(ChartTheme.defaultTheme().copyWith(
            primaryColor: AppColors.blueLight700,
            colorPalette: [
              AppColors.blueLight700,
              AppColors.utilityGreen500,
              AppColors.utilityPurple500,
              AppColors.utilityOrange500,
            ],
          ))
          .animate(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
          )
          .build(),
    );
  }

  Widget _buildLineChart(
    List<Map<String, dynamic>> data,
    String xField,
    String yField,
  ) {
    return SizedBox(
      height: 400,
      child: CristalyseChart()
          .data(data)
          .mapping(x: xField, y: yField)
          .geomLine(strokeWidth: 2.5)
          .geomPoint(size: 5.0)
          .scaleXOrdinal()
          .scaleYContinuous(min: 0)
          .theme(ChartTheme.defaultTheme().copyWith(
            primaryColor: AppColors.blueLight700,
            colorPalette: [
              AppColors.blueLight700,
              AppColors.utilityGreen500,
              AppColors.utilityPurple500,
              AppColors.utilityOrange500,
            ],
          ))
          .animate(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
          )
          .build(),
    );
  }

  Widget _buildPieChart(
    List<Map<String, dynamic>> data,
    String xField,
    String yField,
  ) {
    return SizedBox(
      height: 400,
      child: CristalyseChart()
          .data(data)
          .mappingPie(value: yField, category: xField)
          .geomPie(
            outerRadius: 140,
            innerRadius: 60,
            strokeWidth: 2,
            strokeColor: Colors.white,
            showLabels: true,
            showPercentages: true,
          )
          .theme(ChartTheme.defaultTheme().copyWith(
            primaryColor: AppColors.blueLight700,
            colorPalette: [
              AppColors.blueLight700,
              AppColors.utilityGreen500,
              AppColors.utilityPurple500,
              AppColors.utilityOrange500,
              AppColors.utilityError500,
              AppColors.utilityWarning500,
            ],
          ))
          .animate(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
          )
          .build(),
    );
  }

  List<Map<String, dynamic>> _prepareChartData() {
    // Transform Cube.js response to chart-friendly format
    return result.data.map((row) {
      final chartRow = <String, dynamic>{};

      // Add dimension values
      for (final dim in dimensions) {
        var value = row[dim.name];
        // Truncate long labels for display
        if (value is String && value.length > 20) {
          value = '${value.substring(0, 17)}...';
        }
        chartRow[dim.name] = value ?? 'N/A';
      }

      // Add time dimension value
      if (timeDimension != null) {
        final timeValue = row[timeDimension!.name];
        if (timeValue != null) {
          // Format date for display
          try {
            final date = DateTime.parse(timeValue.toString());
            chartRow[timeDimension!.name] = _formatDate(date);
          } catch (_) {
            chartRow[timeDimension!.name] = timeValue.toString();
          }
        }
      }

      // Add measure values
      for (final measure in measures) {
        final value = row[measure.name];
        chartRow[measure.name] = _parseNumber(value);
      }

      return chartRow;
    }).toList();
  }

  String? _getXField() {
    // Prefer time dimension, then regular dimensions
    if (timeDimension != null) {
      return timeDimension!.name;
    }
    if (dimensions.isNotEmpty) {
      return dimensions.first.name;
    }
    return null;
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  String _formatValue(dynamic value) {
    if (value == null) return '0';

    final num = _parseNumber(value);
    if (num >= 1000000) {
      return '${(num / 1000000).toStringAsFixed(1)}M';
    } else if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(1)}K';
    } else if (num == num.roundToDouble()) {
      return num.round().toString();
    }
    return num.toStringAsFixed(2);
  }

  double _parseNumber(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0;
  }
}
