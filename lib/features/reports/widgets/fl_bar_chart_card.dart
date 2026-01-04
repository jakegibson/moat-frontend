import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class FlBarData {
  final int year;
  final int count;

  FlBarData(this.year, this.count);
}

class FlBarChartCard extends StatelessWidget {
  const FlBarChartCard({
    super.key,
    required this.title,
    required this.xAxisLabel,
    required this.yAxisLabel,
    required this.data,
  });

  final String title;
  final String xAxisLabel;
  final String yAxisLabel;
  final List<FlBarData> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.spacingXL),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: AppSizes.spacingXL),
          SizedBox(
            height: 200,
            child: _buildChart(),
          ),
          const SizedBox(height: AppSizes.spacingMD),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(xAxisLabel, style: AppTextStyles.textXSTertiary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.textMDSemiBold),
        IconButton(
          icon: const Icon(Icons.more_vert, size: 18),
          onPressed: () {},
          color: AppColors.textSecondary,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }

  Widget _buildChart() {
    if (data.isEmpty) {
      return const Center(
        child: Text('No data available'),
      );
    }

    final maxCount =
        data.fold<int>(0, (max, bar) => bar.count > max ? bar.count : max);
    final maxY = maxCount > 0 ? (maxCount * 1.2).ceilToDouble() : 100.0;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 16, top: 16, bottom: 8),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY,
          minY: 0,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => AppColors.textPrimary,
              tooltipPadding: const EdgeInsets.all(8),
              tooltipMargin: 8,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${data[group.x.toInt()].count}',
                  AppTextStyles.textXS.copyWith(color: AppColors.white),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < data.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        data[index].year.toString(),
                        style: AppTextStyles.textXSTertiary,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              axisNameWidget: Text(yAxisLabel, style: AppTextStyles.textXSTertiary),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  if (value == meta.max || value == meta.min) {
                    return const SizedBox.shrink();
                  }
                  return Text(
                    value.toInt().toString(),
                    style: AppTextStyles.textXSTertiary,
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: maxY / 5,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: AppColors.borderSecondary,
                strokeWidth: 0.5,
              );
            },
          ),
          borderData: FlBorderData(show: false),
          barGroups: data.asMap().entries.map((entry) {
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value.count.toDouble(),
                  color: AppColors.utilityOrange500,
                  width: 20,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
