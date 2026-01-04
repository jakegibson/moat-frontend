import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.changePercent,
    required this.sparklineData,
  });

  final String title;
  final String value;
  final double changePercent;
  final List<double> sparklineData;

  bool get isPositive => changePercent >= 0;

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
          Text(title, style: AppTextStyles.textSMSecondary),
          const SizedBox(height: AppSizes.spacingMD),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value, style: AppTextStyles.displaySMSemiBold),
                    const SizedBox(height: AppSizes.spacingXS),
                    _buildChangeIndicator(),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                height: 40,
                child: _buildSparkline(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChangeIndicator() {
    final color = isPositive ? AppColors.utilityGreen500 : AppColors.utilityError500;
    final icon = isPositive ? Icons.arrow_upward : Icons.arrow_downward;
    final sign = isPositive ? '+' : '';

    return Wrap(
      spacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(icon, size: 14, color: color),
        Text(
          '$sign${changePercent.toStringAsFixed(1)}%',
          style: AppTextStyles.textXS.copyWith(color: color),
        ),
        Text(
          'vs last month',
          style: AppTextStyles.textXSTertiary,
        ),
      ],
    );
  }

  Widget _buildSparkline() {
    final color = isPositive ? AppColors.utilityGreen500 : AppColors.utilityError500;

    return CustomPaint(
      size: const Size(80, 40),
      painter: _SparklinePainter(
        data: sparklineData,
        lineColor: color,
        fillColor: color.withValues(alpha: 0.15),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> data;
  final Color lineColor;
  final Color fillColor;

  _SparklinePainter({
    required this.data,
    required this.lineColor,
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final minVal = data.reduce((a, b) => a < b ? a : b);
    final maxVal = data.reduce((a, b) => a > b ? a : b);
    final range = maxVal - minVal;

    // Calculate points
    final points = <Offset>[];
    for (var i = 0; i < data.length; i++) {
      final x = (i / (data.length - 1)) * size.width;
      final normalizedY = range > 0 ? (data[i] - minVal) / range : 0.5;
      final y = size.height - (normalizedY * size.height);
      points.add(Offset(x, y));
    }

    // Draw filled area
    final fillPath = Path();
    fillPath.moveTo(0, size.height);
    for (final point in points) {
      fillPath.lineTo(point.dx, point.dy);
    }
    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(fillPath, fillPaint);

    // Draw line
    final linePath = Path();
    for (var i = 0; i < points.length; i++) {
      if (i == 0) {
        linePath.moveTo(points[i].dx, points[i].dy);
      } else {
        linePath.lineTo(points[i].dx, points[i].dy);
      }
    }

    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.fillColor != fillColor;
  }
}
