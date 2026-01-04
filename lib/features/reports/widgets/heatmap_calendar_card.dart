import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

enum HeatmapColorScheme { blue, purple }

class HeatmapCalendarCard extends StatelessWidget {
  const HeatmapCalendarCard({
    super.key,
    required this.title,
    required this.totalCount,
    required this.data,
    this.colorScheme = HeatmapColorScheme.blue,
  });

  final String title;
  final int totalCount;
  final Map<DateTime, int> data;
  final HeatmapColorScheme colorScheme;

  // Color gradients for heatmap (0-4 intensity levels)
  List<Color> get _heatmapColors => colorScheme == HeatmapColorScheme.purple
      ? [
          AppColors.utilityPurple50,
          AppColors.utilityPurple200,
          AppColors.utilityPurple300,
          AppColors.utilityPurple500,
          AppColors.utilityPurple700,
        ]
      : [
          AppColors.utilityBlue50,
          AppColors.utilityBlue200,
          AppColors.utilityBlue300,
          AppColors.utilityBlue500,
          AppColors.utilityBlue700,
        ];

  Color get _dotColor => colorScheme == HeatmapColorScheme.purple
      ? AppColors.utilityPurple500
      : AppColors.utilityBlue500;

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
          const SizedBox(height: AppSizes.spacingMD),
          // Large total number
          Text(
            _formatNumber(totalCount),
            style: AppTextStyles.displaySMSemiBold,
          ),
          const SizedBox(height: AppSizes.spacingXL),
          _buildCalendar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Colored dot indicator
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: _dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSizes.spacingSM),
            Text(title, style: AppTextStyles.textMDSemiBold),
          ],
        ),
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

  String _formatNumber(int value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toString();
  }

  Widget _buildCalendar() {
    // Get 13 weeks of data (about 3 months) - showing FUTURE dates
    final now = DateTime.now();
    // Start from the beginning of current month
    final startOfMonth = DateTime(now.year, now.month, 1);
    // Find the Monday of the week containing the start of month
    final startOfWeek = startOfMonth.subtract(Duration(days: (startOfMonth.weekday - 1) % 7));
    final weeks = <List<DateTime?>>[];

    // Build 13 weeks forward (3 months into the future)
    for (var week = 0; week < 13; week++) {
      final weekStart = startOfWeek.add(Duration(days: week * 7));
      final weekDays = <DateTime?>[];
      for (var day = 0; day < 7; day++) {
        final date = weekStart.add(Duration(days: day));
        weekDays.add(date);
      }
      weeks.add(weekDays);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Legend at top right
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Month labels
            Row(
              children: _buildMonthLabels(weeks),
            ),
            _buildLegend(),
          ],
        ),
        const SizedBox(height: AppSizes.spacingSM),
        // Calendar grid
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day labels
            Column(
              children: [
                _dayLabel('Mon'),
                _dayLabel(''),
                _dayLabel('Wed'),
                _dayLabel(''),
                _dayLabel('Fri'),
                _dayLabel(''),
                _dayLabel('Sun'),
              ],
            ),
            const SizedBox(width: AppSizes.spacingSM),
            // Week columns
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: weeks.map((week) => _buildWeekColumn(week)).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildMonthLabels(List<List<DateTime?>> weeks) {
    final labels = <Widget>[];
    String? lastMonth;

    for (final week in weeks) {
      final firstDay = week.firstWhere((d) => d != null, orElse: () => null);
      if (firstDay != null) {
        final monthName = _getMonthName(firstDay.month);
        if (monthName != lastMonth) {
          if (labels.isNotEmpty) {
            labels.add(const SizedBox(width: AppSizes.spacingXL));
          }
          labels.add(Text(monthName, style: AppTextStyles.textXSTertiary));
          lastMonth = monthName;
        }
      }
    }
    return labels;
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  Widget _dayLabel(String label) {
    return SizedBox(
      height: 14,
      width: 24,
      child: Text(label, style: AppTextStyles.text3XSTertiary),
    );
  }

  Widget _buildWeekColumn(List<DateTime?> week) {
    return Column(
      children: week.map((date) {
        if (date == null) {
          return const SizedBox(width: 12, height: 12);
        }
        final intensity = _getIntensity(date);
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: _heatmapColors[intensity],
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }).toList(),
    );
  }

  int _getIntensity(DateTime date) {
    // Normalize date to start of day for comparison
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final value = data[normalizedDate] ?? 0;
    return value.clamp(0, 4);
  }

  Widget _buildLegend() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Less', style: AppTextStyles.text3XSTertiary),
        const SizedBox(width: AppSizes.spacingXS),
        ...List.generate(5, (index) {
          return Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              color: _heatmapColors[index],
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }),
        const SizedBox(width: AppSizes.spacingXS),
        Text('More', style: AppTextStyles.text3XSTertiary),
      ],
    );
  }
}
