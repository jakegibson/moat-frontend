import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class TicketsStatCard extends StatelessWidget {
  const TicketsStatCard({
    super.key,
    required this.title,
    this.value,
    this.changeValue = 0,
    this.valueLabel,
    this.width,
    this.decimalPlaces = 0,
    this.chartValues,
  });

  final String title;
  final double? value;
  final String? valueLabel;
  final double? changeValue;
  final double? width;
  final int decimalPlaces;
  final List<double>? chartValues;

  @override
  Widget build(BuildContext context) {
    double percentChange = 0;
    if (changeValue != null && value != null) {
      percentChange = (changeValue! / (value! - changeValue!)) * 100;
      if (changeValue == value) {
        percentChange = 0;
      } else if (changeValue == 0 || value == 0) {
        percentChange = 100;
      }

      if (changeValue! > value!) {
        percentChange *= -1;
      }
    }
    Color chartColor =
        percentChange < 0
            ? AppColors.success
            : percentChange != 0
            ? AppColors.error
            : AppColors.textTertiary;
    bool isMobile =
        MediaQuery.of(context).size.width < AppSizes.mobileScreenWidth;
    return Container(
      width: width,
      padding: EdgeInsets.all(AppSizes.spacingXL),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        border: Border.all(color: AppColors.borderSecondary, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.textSMMediumTertiary),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value != null
                        ? valueLabel != null
                            ? '${value!.toStringAsFixed(value! > 0 ? decimalPlaces : 0)} $valueLabel'
                            : '${value!.toInt()}'
                        : '-',
                    style: AppTextStyles.displaySMSemiBold,
                  ),
                ],
              ),
              if (isMobile)
                PercentChangeValue(
                  percentChange: percentChange,
                  isMobile: isMobile,
                  chartColor: chartColor,
                ),
              if (!isMobile)
                SizedBox(
                  width: 70,
                  height: 35,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots:
                              chartValues != null
                                  ? List.generate(
                                    chartValues!.length,
                                    (index) => FlSpot(
                                      index.toDouble(),
                                      chartValues![index],
                                    ),
                                  )
                                  : [],
                          isCurved: true,
                          color: chartColor,
                          barWidth: 2,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: chartColor.withAlpha(25),
                          ),
                        ),
                      ],
                      titlesData: FlTitlesData(show: false),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      lineTouchData: LineTouchData(enabled: false),
                    ),
                  ),
                ),
            ],
          ),
          if (!isMobile)
            PercentChangeValue(
              percentChange: percentChange,
              isMobile: isMobile,
              chartColor: chartColor,
            ),
        ],
      ),
    );
  }
}

class PercentChangeValue extends StatelessWidget {
  const PercentChangeValue({
    super.key,
    required this.percentChange,
    required this.isMobile,
    required this.chartColor,
  });

  final double percentChange;
  final bool isMobile;
  final Color chartColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          percentChange > 0
              ? Icons.arrow_upward
              : percentChange != 0
              ? Icons.arrow_downward
              : Icons.remove,
          size: 16,
          color: chartColor,
        ),
        SizedBox(width: AppSizes.spacingXS),
        Text(
          '${percentChange.abs().toStringAsFixed(1)}%',
          style: AppTextStyles.textSMMedium.copyWith(color: chartColor),
        ),
        if (!isMobile) ...[
          SizedBox(width: AppSizes.spacingSM),
          Text('vs last month', style: AppTextStyles.textSMMediumTertiary),
        ],
      ],
    );
  }
}
