import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../reports/data/cube_models.dart';
import '../state/explore_state.dart';

/// Widget to select chart visualization type.
class ChartTypePicker extends StatelessWidget {
  final ExploreState state;

  const ChartTypePicker({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final selected = state.chartType.value;

      return Wrap(
        spacing: AppSizes.spacingSM,
        runSpacing: AppSizes.spacingSM,
        children: ExplorerChartType.values.map((type) {
          final isSelected = type == selected;
          return _ChartTypeChip(
            type: type,
            isSelected: isSelected,
            onTap: () => state.setChartType(type),
          );
        }).toList(),
      );
    });
  }
}

class _ChartTypeChip extends StatelessWidget {
  final ExplorerChartType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChartTypeChip({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.blueLight700 : AppColors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.spacingMD,
            vertical: AppSizes.spacingSM,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            border: Border.all(
              color: isSelected
                  ? AppColors.blueLight700
                  : AppColors.borderSecondary,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getIcon(type),
                size: 16,
                color: isSelected ? AppColors.white : AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                type.displayName,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? AppColors.white : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon(ExplorerChartType type) {
    switch (type) {
      case ExplorerChartType.bar:
        return Icons.bar_chart;
      case ExplorerChartType.line:
        return Icons.show_chart;
      case ExplorerChartType.pie:
        return Icons.pie_chart;
      case ExplorerChartType.table:
        return Icons.table_chart;
      case ExplorerChartType.number:
        return Icons.pin;
    }
  }
}
