import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../state/explore_state.dart';

/// Dropdown to select which cube (data source) to explore.
class CubeSelector extends StatelessWidget {
  final ExploreState state;

  const CubeSelector({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final meta = state.meta.value;
      final selected = state.selectedCube.value;

      if (meta == null) {
        return const SizedBox.shrink();
      }

      return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          border: Border.all(color: AppColors.borderSecondary),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selected?.name,
            isExpanded: true,
            dropdownColor: AppColors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.spacingMD,
              vertical: AppSizes.spacingXS,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            icon: const Icon(Icons.keyboard_arrow_down, size: 20, color: AppColors.textSecondary),
            items: meta.cubes.map((cube) {
              return DropdownMenuItem<String>(
                value: cube.name,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: _getCubeColor(cube.name).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        _getCubeIcon(cube.name),
                        size: 16,
                        color: _getCubeColor(cube.name),
                      ),
                    ),
                    const SizedBox(width: AppSizes.spacingSM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            cube.title,
                            style: AppTextStyles.textSM.copyWith(color: AppColors.textPrimary),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${cube.measures.length} measures, ${cube.dimensions.length} dimensions',
                            style: AppTextStyles.textXS
                                .copyWith(color: AppColors.textTertiary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                final cube = meta.cubes.firstWhere((c) => c.name == value);
                state.selectCube(cube);
              }
            },
          ),
        ),
      );
    });
  }

  IconData _getCubeIcon(String name) {
    switch (name.toLowerCase()) {
      case 'tasks':
        return Icons.task_outlined;
      case 'assets':
        return Icons.inventory_2_outlined;
      case 'locations':
        return Icons.location_on_outlined;
      case 'members':
        return Icons.people_outline;
      case 'task_history':
        return Icons.history;
      default:
        return Icons.table_chart_outlined;
    }
  }

  Color _getCubeColor(String name) {
    switch (name.toLowerCase()) {
      case 'tasks':
        return AppColors.utilityBlue500;
      case 'assets':
        return AppColors.utilityGreen500;
      case 'locations':
        return AppColors.utilityPurple500;
      case 'members':
        return AppColors.utilityOrange500;
      case 'task_history':
        return AppColors.utilityGray500;
      default:
        return AppColors.blueLight700;
    }
  }
}
