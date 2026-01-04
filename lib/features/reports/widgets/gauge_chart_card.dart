import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class GaugeChartCard extends StatelessWidget {
  const GaugeChartCard({
    super.key,
    required this.title,
    required this.score,
    required this.changePercent,
    required this.description,
    this.secondaryDescription,
  });

  final String title;
  final int score;
  final double changePercent;
  final String description;
  final String? secondaryDescription;

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
            height: 160,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(200, 120),
                  painter: _GaugePainter(score: score),
                ),
                Positioned(
                  bottom: 20,
                  child: Text(
                    score.toString(),
                    style: AppTextStyles.displayMDSemiBold,
                  ),
                ),
                // Badge indicator positioned to the right of gauge
                Positioned(
                  top: 0,
                  right: 20,
                  child: _buildChangeBadge(),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.spacingMD),
          Text(description, style: AppTextStyles.textSMSemibold),
          if (secondaryDescription != null) ...[
            const SizedBox(height: AppSizes.spacingXS),
            Text(
              secondaryDescription!,
              style: AppTextStyles.textXSTertiary,
            ),
          ],
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

  Widget _buildChangeBadge() {
    final isPositive = changePercent >= 0;
    final color = isPositive ? AppColors.utilityGreen500 : AppColors.utilityError500;
    final bgColor = isPositive ? AppColors.utilityGreen50 : AppColors.utilityError50;
    final icon = isPositive ? Icons.trending_up : Icons.trending_down;
    final sign = isPositive ? '+' : '';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spacingSM,
        vertical: AppSizes.spacingXS,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 2),
          Text(
            '$sign${changePercent.toStringAsFixed(0)}%',
            style: AppTextStyles.textXS.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final int score;

  _GaugePainter({required this.score});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final outerRadius = size.width / 2 - 10;
    final innerRadius = outerRadius - 25;

    // Determine color based on score
    Color arcColor;
    if (score >= 80) {
      arcColor = AppColors.utilityGreen500;
    } else if (score >= 60) {
      arcColor = AppColors.utilityYellow400;
    } else if (score >= 40) {
      arcColor = AppColors.utilityOrange500;
    } else {
      arcColor = AppColors.utilityError500;
    }

    // Background arc (gray)
    final bgPaint = Paint()
      ..color = AppColors.bgQuaternary
      ..style = PaintingStyle.fill;

    final bgPath = Path()
      ..moveTo(center.dx - outerRadius, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: outerRadius),
        math.pi,
        math.pi,
        false,
      )
      ..lineTo(center.dx + innerRadius, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: innerRadius),
        0,
        -math.pi,
        false,
      )
      ..close();

    canvas.drawPath(bgPath, bgPaint);

    // Score arc (filled)
    final scorePercent = score / 100;
    final sweepAngle = math.pi * scorePercent;

    final scorePaint = Paint()
      ..color = arcColor
      ..style = PaintingStyle.fill;

    final scorePath = Path()
      ..moveTo(center.dx - outerRadius, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: outerRadius),
        math.pi,
        sweepAngle,
        false,
      )
      ..lineTo(
        center.dx + innerRadius * math.cos(math.pi + sweepAngle),
        center.dy + innerRadius * math.sin(math.pi + sweepAngle),
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: innerRadius),
        math.pi + sweepAngle,
        -sweepAngle,
        false,
      )
      ..close();

    canvas.drawPath(scorePath, scorePaint);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) {
    return oldDelegate.score != score;
  }
}
