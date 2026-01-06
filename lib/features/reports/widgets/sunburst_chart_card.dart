import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

/// Represents a segment in the sunburst chart.
class SunburstSegment {
  final String code;
  final String label;
  final int value;

  SunburstSegment({
    required this.code,
    required this.label,
    required this.value,
  });
}

/// A 3-ring sunburst chart for hierarchical CSI division codes.
/// - Inner ring: Division (first 2 digits, e.g., "11" = Equipment)
/// - Middle ring: Section (first 4 digits, e.g., "1167")
/// - Outer ring: Subsection (all 6 digits, e.g., "116766")
class SunburstChartCard extends StatelessWidget {
  const SunburstChartCard({
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
  });

  final String title;
  final String totalLabel;
  final int totalValue;
  final List<SunburstSegment> data;
  final String? legendTitle;
  final String? dropdownValue;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onDropdownChanged;
  final bool showExpandIcon;

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
    // Build hierarchical structure: Division -> Section -> Subsection
    final hierarchy = <String, _DivisionNode>{};

    for (final segment in data) {
      final code = segment.code.replaceAll(' ', '');
      if (code.isEmpty) continue;

      // Parse the 3 levels from the code
      final divCode = code.length >= 2 ? code.substring(0, 2) : code.padRight(2, '0');
      final secCode = code.length >= 4 ? code.substring(2, 4) : '00';
      final subCode = code.length >= 6 ? code.substring(4, 6) : '00';

      // Build hierarchy
      hierarchy.putIfAbsent(divCode, () => _DivisionNode());
      hierarchy[divCode]!.sections.putIfAbsent(secCode, () => _SectionNode());
      hierarchy[divCode]!.sections[secCode]!.subsections[subCode] =
          (hierarchy[divCode]!.sections[secCode]!.subsections[subCode] ?? 0) + segment.value;
    }

    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(220, 220),
            painter: SunburstPainter(
              hierarchy: hierarchy,
              getColor: _getDivisionColor,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _formatNumber(totalValue),
                style: AppTextStyles.text2XLSemibold,
              ),
              Text(totalLabel, style: AppTextStyles.textXSTertiary),
            ],
          ),
        ],
      ),
    );
  }

  Color _getDivisionColor(String code) {
    final colors = [
      AppColors.utilityOrange500,
      AppColors.utilityGreen500,
      AppColors.utilityBlue500,
      AppColors.utilityYellow400,
      AppColors.utilityError500,
      AppColors.utilityPurple500,
      AppColors.utilityBlue700,
    ];
    final index = int.tryParse(code) ?? 0;
    return colors[index % colors.length];
  }


  Widget _buildLegend() {
    // Filter out "Unknown" entries and take top 10
    final filteredData = data.where((s) => s.label != 'Unknown').toList();
    final displayData = filteredData.take(10).toList();
    final remaining = filteredData.length - displayData.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (legendTitle != null) ...[
          Text(legendTitle!, style: AppTextStyles.textSMSemibold),
          const SizedBox(height: AppSizes.spacingMD),
        ],
        ...displayData.map((segment) {
          final percent = totalValue > 0
              ? (segment.value / totalValue * 100).toStringAsFixed(0)
              : '0';
          final code = segment.code.replaceAll(' ', '');
          final divCode = code.length >= 2 ? code.substring(0, 2) : (code.isNotEmpty ? code : '00');
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.spacingSM),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _getDivisionColor(divCode),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSizes.spacingSM),
                Expanded(
                  child: Text(segment.label, style: AppTextStyles.textSM),
                ),
                Text(
                  '$percent%',
                  style: AppTextStyles.textSMSecondary,
                ),
              ],
            ),
          );
        }),
        if (remaining > 0)
          Text(
            '... $remaining more',
            style: AppTextStyles.textXSTertiary,
          ),
      ],
    );
  }

  String _formatNumber(int value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toString();
  }
}


class SunburstPainter extends CustomPainter {
  final Map<String, _DivisionNode> hierarchy;
  final Color Function(String) getColor;

  SunburstPainter({required this.hierarchy, required this.getColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Ring radii
    const innerStart = 40.0;
    const innerEnd = 55.0;
    const middleStart = 57.0;
    const middleEnd = 75.0;
    const outerStart = 77.0;
    const outerEnd = 95.0;

    final total = hierarchy.values.fold<int>(0, (sum, d) => sum + d.total);
    if (total == 0) return;

    final strokePaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var divisionStartAngle = -math.pi / 2;

    // Draw each division
    for (final divEntry in hierarchy.entries) {
      final divCode = divEntry.key;
      final divNode = divEntry.value;
      final divSweep = (divNode.total / total) * 2 * math.pi;
      final divColor = getColor(divCode);

      // Draw inner ring (division)
      _drawArc(canvas, center, innerStart, innerEnd,
               divisionStartAngle, divSweep, divColor, strokePaint);

      // Draw middle ring (sections within this division)
      var sectionStartAngle = divisionStartAngle;
      for (final secEntry in divNode.sections.entries) {
        final secCode = secEntry.key;
        final secNode = secEntry.value;
        final secSweep = (secNode.total / total) * 2 * math.pi;
        final secColor = Color.lerp(divColor, AppColors.white, 0.25)!;

        _drawArc(canvas, center, middleStart, middleEnd,
                 sectionStartAngle, secSweep, secColor, strokePaint);

        // Draw outer ring (subsections within this section)
        var subStartAngle = sectionStartAngle;
        for (final subEntry in secNode.subsections.entries) {
          final subValue = subEntry.value;
          final subSweep = (subValue / total) * 2 * math.pi;
          final subColor = Color.lerp(divColor, AppColors.white, 0.45)!;

          _drawArc(canvas, center, outerStart, outerEnd,
                   subStartAngle, subSweep, subColor, strokePaint);

          subStartAngle += subSweep;
        }

        sectionStartAngle += secSweep;
      }

      divisionStartAngle += divSweep;
    }
  }

  void _drawArc(
    Canvas canvas,
    Offset center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double sweepAngle,
    Color color,
    Paint strokePaint,
  ) {
    if (sweepAngle <= 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(
        center.dx + innerRadius * math.cos(startAngle),
        center.dy + innerRadius * math.sin(startAngle),
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: outerRadius),
        startAngle,
        sweepAngle,
        false,
      )
      ..lineTo(
        center.dx + innerRadius * math.cos(startAngle + sweepAngle),
        center.dy + innerRadius * math.sin(startAngle + sweepAngle),
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: innerRadius),
        startAngle + sweepAngle,
        -sweepAngle,
        false,
      )
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant SunburstPainter oldDelegate) => true;
}

/// Hierarchical structure for sunburst chart
class _DivisionNode {
  final Map<String, _SectionNode> sections = {};
  int get total => sections.values.fold(0, (sum, s) => sum + s.total);
}

class _SectionNode {
  final Map<String, int> subsections = {};
  int get total => subsections.values.fold(0, (sum, v) => sum + v);
}
