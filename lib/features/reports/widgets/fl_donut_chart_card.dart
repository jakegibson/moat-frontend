import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class FlDonutSegment {
  final String label;
  final int value;
  final Color color;

  FlDonutSegment(this.label, this.value, this.color);
}

class FlDonutChartCard extends StatelessWidget {
  const FlDonutChartCard({
    super.key,
    required this.title,
    required this.totalLabel,
    required this.totalValue,
    required this.data,
    this.legendTitle,
    this.dropdownValue,
    this.dropdownItems,
    this.onDropdownChanged,
    this.showExpandIcon = false,
    this.showTotalsDropdown = false,
  });

  final String title;
  final String totalLabel;
  final int totalValue;
  final List<FlDonutSegment> data;
  final String? legendTitle;
  final String? dropdownValue;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onDropdownChanged;
  final bool showExpandIcon;
  final bool showTotalsDropdown;

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
          Row(
            children: [
              Expanded(child: _buildChart()),
              const SizedBox(width: AppSizes.spacingXL),
              Expanded(child: _buildLegend()),
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
        if (dropdownItems != null && dropdownItems!.isNotEmpty)
          _buildTitleDropdown()
        else
          Text(title, style: AppTextStyles.textMDSemiBold),
        Row(
          children: [
            if (showExpandIcon)
              IconButton(
                icon: const Icon(Icons.open_in_full, size: 18),
                onPressed: () {},
                color: AppColors.textSecondary,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            if (showExpandIcon) const SizedBox(width: AppSizes.spacingMD),
            if (showTotalsDropdown)
              _buildTotalsDropdown()
            else
              IconButton(
                icon: const Icon(Icons.more_vert, size: 18),
                onPressed: () {},
                color: AppColors.textSecondary,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildTotalsDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spacingMD,
        vertical: AppSizes.spacingXS,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderSecondary),
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Totals', style: AppTextStyles.textSM),
          const SizedBox(width: AppSizes.spacingXS),
          const Icon(Icons.keyboard_arrow_down,
              size: 16, color: AppColors.textSecondary),
        ],
      ),
    );
  }

  Widget _buildTitleDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spacingMD,
        vertical: AppSizes.spacingXS,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderSecondary),
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          items: dropdownItems!.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text('$title - $item', style: AppTextStyles.textSM),
            );
          }).toList(),
          onChanged: onDropdownChanged,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
          isDense: true,
          selectedItemBuilder: (context) {
            return dropdownItems!.map((item) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(title, style: AppTextStyles.textMDSemiBold),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  Widget _buildChart() {
    final hasData = data.isNotEmpty && data.any((s) => s.value > 0);

    if (!hasData) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(totalLabel, style: AppTextStyles.textXSTertiary),
              Text(
                _formatNumber(totalValue),
                style: AppTextStyles.text2XLSemibold,
              ),
            ],
          ),
        ),
      );
    }

    final activeSegments = data.where((s) => s.value > 0).toList();

    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 60,
              sections: activeSegments.map((segment) {
                return PieChartSectionData(
                  value: segment.value.toDouble(),
                  color: segment.color,
                  radius: 30,
                  showTitle: false,
                );
              }).toList(),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(totalLabel, style: AppTextStyles.textXSTertiary),
              Text(
                _formatNumber(totalValue),
                style: AppTextStyles.text2XLSemibold,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: AppSizes.spacingXL,
      runSpacing: AppSizes.spacingLG,
      children: data.map((segment) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: segment.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSizes.spacingSM),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(segment.label, style: AppTextStyles.textSMSecondary),
                Text(
                  _formatNumber(segment.value),
                  style: AppTextStyles.textMDSemiBold,
                ),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }

  String _formatNumber(int value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toString();
  }
}
