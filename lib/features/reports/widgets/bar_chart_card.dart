import 'package:flutter/material.dart';
import 'package:cristalyse/cristalyse.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class BarData {
  final int year;
  final int count;

  BarData(this.year, this.count);
}

class BarChartCard extends StatelessWidget {
  const BarChartCard({
    super.key,
    required this.title,
    required this.xAxisLabel,
    required this.yAxisLabel,
    required this.data,
  });

  final String title;
  final String xAxisLabel;
  final String yAxisLabel;
  final List<BarData> data;

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
    final chartData = data.map((bar) {
      return {'year': bar.year.toString(), 'count': bar.count};
    }).toList();

    // Calculate max value, default to 100 if all zeros
    final maxCount = data.fold<int>(0, (max, bar) => bar.count > max ? bar.count : max);
    final yMax = maxCount > 0 ? null : 100.0; // Use auto-scale if data exists, else default to 100

    return CristalyseChart()
        .data(chartData)
        .mapping(x: 'year', y: 'count')
        .geomBar(
          width: 0.7,
          color: AppColors.utilityOrange500,
        )
        .scaleXOrdinal()
        .scaleYContinuous(min: 0, max: yMax, title: 'Total Assets')
        .theme(ChartTheme(
          backgroundColor: AppColors.transparent,
          plotBackgroundColor: AppColors.transparent,
          primaryColor: AppColors.utilityOrange500,
          borderColor: AppColors.borderSecondary,
          gridColor: AppColors.borderSecondary,
          axisColor: AppColors.textTertiary,
          gridWidth: 0.5,
          axisWidth: 1.0,
          pointSizeDefault: 4,
          pointSizeMin: 2,
          pointSizeMax: 12,
          colorPalette: [AppColors.utilityOrange500],
          padding: const EdgeInsets.only(left: 40, right: 10, top: 10, bottom: 30),
          axisTextStyle: AppTextStyles.textXSTertiary,
        ))
        .build();
  }
}
