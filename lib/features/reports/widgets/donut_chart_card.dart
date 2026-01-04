import 'package:flutter/material.dart';
import 'package:cristalyse/cristalyse.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class DonutSegment {
  final String label;
  final int value;
  final Color color;

  DonutSegment(this.label, this.value, this.color);
}

class DonutChartCard extends StatelessWidget {
  const DonutChartCard({
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
  final List<DonutSegment> data;
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
        // Left side: Title with optional dropdown
        if (dropdownItems != null && dropdownItems!.isNotEmpty)
          _buildTitleDropdown()
        else
          Text(title, style: AppTextStyles.textMDSemiBold),
        // Right side: Expand icon, 3-dot menu, or Totals dropdown
        Row(
          children: [
            if (showExpandIcon)
              IconButton(
                icon: const Icon(Icons.open_in_full, size: 18),
                onPressed: () {}, // TODO: Implement expand
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
                onPressed: () {}, // TODO: Implement menu
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
          const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textSecondary),
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
    // Ensure we have data with non-zero total
    final hasData = data.isNotEmpty && data.any((s) => s.value > 0);

    if (!hasData) {
      // Show empty state
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

    // Filter to segments with value > 0
    final activeSegments = data.where((s) => s.value > 0).toList();

    // For single segment, use a simple ring painter instead of CristalyseChart
    // (CristalyseChart may not render single-segment pies properly)
    if (activeSegments.length == 1) {
      return SizedBox(
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(180, 180),
              painter: _SingleSegmentDonutPainter(
                color: activeSegments.first.color,
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

    final chartData = activeSegments.map((segment) {
      return {'category': segment.label, 'value': segment.value};
    }).toList();

    final colors = activeSegments.map((s) => s.color).toList();

    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CristalyseChart()
              .data(chartData)
              .mappingPie(value: 'value', category: 'category')
              .geomPie(
                innerRadius: 60.0,
                outerRadius: 90.0,
                showLabels: false,
                showPercentages: false,
                strokeWidth: 2.0,
                strokeColor: Colors.white,
              )
              .theme(ChartTheme(
                backgroundColor: Colors.transparent,
                plotBackgroundColor: Colors.transparent,
                primaryColor: colors.isNotEmpty ? colors.first : AppColors.blueLight,
                borderColor: Colors.transparent,
                gridColor: Colors.transparent,
                axisColor: Colors.transparent,
                gridWidth: 0,
                axisWidth: 0,
                pointSizeDefault: 4,
                pointSizeMin: 2,
                pointSizeMax: 12,
                colorPalette: colors,
                padding: EdgeInsets.zero,
                axisTextStyle: AppTextStyles.textXS,
              ))
              .build(),
          // Center label - "Total" above number like Figma
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
    // Use horizontal layout with counts (like Figma design)
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

/// Custom painter for single-segment donut chart
class _SingleSegmentDonutPainter extends CustomPainter {
  final Color color;

  _SingleSegmentDonutPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius * 0.67; // Same ratio as geomPie (60/90)

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerRadius - innerRadius;

    canvas.drawCircle(
      center,
      innerRadius + (outerRadius - innerRadius) / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _SingleSegmentDonutPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
