import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../reports/data/cube_models.dart';
import '../state/explore_state.dart';

enum MemberType { measure, dimension }

/// Widget to pick measures or dimensions from the selected cube.
class MemberPicker extends StatelessWidget {
  final ExploreState state;
  final MemberType memberType;

  const MemberPicker({
    super.key,
    required this.state,
    required this.memberType,
  });

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final cube = state.selectedCube.value;

      if (cube == null) {
        return Container(
          padding: const EdgeInsets.all(AppSizes.spacingMD),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            border: Border.all(color: AppColors.borderSecondary),
          ),
          child: Text(
            'Select a data source first',
            style: AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
          ),
        );
      }

      final members =
          memberType == MemberType.measure ? cube.measures : cube.dimensions;

      if (members.isEmpty) {
        return Container(
          padding: const EdgeInsets.all(AppSizes.spacingMD),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            border: Border.all(color: AppColors.borderSecondary),
          ),
          child: Text(
            'No ${memberType == MemberType.measure ? 'measures' : 'dimensions'} available',
            style: AppTextStyles.textSM.copyWith(color: AppColors.textTertiary),
          ),
        );
      }

      return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          border: Border.all(color: AppColors.borderSecondary),
        ),
        child: Column(
          children: members.map((member) {
            final isSelected = memberType == MemberType.measure
                ? state.isMeasureSelected(member)
                : state.isDimensionSelected(member);

            return _MemberTile(
              member: member,
              isSelected: isSelected,
              memberType: memberType,
              onTap: () {
                if (memberType == MemberType.measure) {
                  state.toggleMeasure(member);
                } else {
                  state.toggleDimension(member);
                }
              },
              isLast: member == members.last,
            );
          }).toList(),
        ),
      );
    });
  }
}

class _MemberTile extends StatelessWidget {
  final CubeMember member;
  final bool isSelected;
  final MemberType memberType;
  final VoidCallback onTap;
  final bool isLast;

  const _MemberTile({
    required this.member,
    required this.isSelected,
    required this.memberType,
    required this.onTap,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.utilityBlue50 : AppColors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: isLast
            ? const BorderRadius.vertical(
                bottom: Radius.circular(AppSizes.radiusMD))
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.spacingMD,
            vertical: AppSizes.spacingSM,
          ),
          decoration: BoxDecoration(
            border: isLast
                ? null
                : const Border(
                    bottom: BorderSide(color: AppColors.borderSecondary),
                  ),
          ),
          child: Row(
            children: [
              // Type indicator
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getTypeColor(),
                ),
              ),
              const SizedBox(width: AppSizes.spacingSM),
              // Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.displayName,
                      style: AppTextStyles.textSM.copyWith(
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (member.description != null && member.description!.isNotEmpty)
                      Text(
                        member.description!,
                        style: AppTextStyles.textXS
                            .copyWith(color: AppColors.textTertiary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    else if (member.isTimeDimension)
                      Text(
                        'Time dimension',
                        style: AppTextStyles.textXS
                            .copyWith(color: AppColors.textTertiary),
                      ),
                  ],
                ),
              ),
              // Type badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: _getTypeColor().withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  member.type,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: _getTypeColor(),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spacingSM),
              // Checkbox
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.blueLight700 : AppColors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.blueLight700
                        : AppColors.borderSecondary,
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, size: 12, color: AppColors.white)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor() {
    if (member.isTimeDimension) {
      return AppColors.utilityPurple500;
    }

    switch (member.type) {
      case 'count':
        return AppColors.utilityBlue500;
      case 'sum':
      case 'avg':
        return AppColors.utilityGreen500;
      case 'number':
        return AppColors.utilityOrange500;
      case 'string':
        return AppColors.utilityGray500;
      case 'time':
        return AppColors.utilityPurple500;
      default:
        return AppColors.textTertiary;
    }
  }
}
