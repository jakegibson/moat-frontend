import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../state/task_list_state.dart';

class TicketFilterBar extends StatefulWidget {
  const TicketFilterBar({super.key});

  @override
  State<TicketFilterBar> createState() => _TicketFilterBarState();
}

class _TicketFilterBarState extends State<TicketFilterBar> {
  late final TaskListState _state;

  final List<String> _filterOptions = [
    'My Tickets',
    'All Tickets',
    'Unassigned',
    'My Requests',
    'Resolved',
  ];

  @override
  void initState() {
    super.initState();
    _state = getIt<TaskListState>();
    _state.loadFilterOptions();
  }

  int _quickFilterToIndex(QuickFilter filter) {
    switch (filter) {
      case QuickFilter.myTickets:
        return 0;
      case QuickFilter.all:
        return 1;
      case QuickFilter.myRequests:
        return 3;
    }
  }

  QuickFilter _indexToQuickFilter(int index) {
    switch (index) {
      case 0:
        return QuickFilter.myTickets;
      case 1:
        return QuickFilter.all;
      case 3:
        return QuickFilter.myRequests;
      default:
        return QuickFilter.all;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile =
        MediaQuery.of(context).size.width < AppSizes.mobileScreenWidth;

    return Watch((context) {
      final currentFilter = _state.quickFilter.value;
      final selectedIndex = _quickFilterToIndex(currentFilter);

      if (isMobile) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.spacingLG),
          decoration: BoxDecoration(
            color: AppColors.bgSecondary,
            borderRadius: BorderRadius.circular(AppSizes.spacingLG),
          ),
          child: DropdownButton<int>(
            padding: EdgeInsets.zero,
            underline: const SizedBox(),
            value: selectedIndex,
            isExpanded: true,
            onChanged: (int? newIndex) {
              if (newIndex != null) {
                _state.setQuickFilter(_indexToQuickFilter(newIndex));
              }
            },
            items: [0, 1, 3].map((index) {
              return DropdownMenuItem<int>(
                value: index,
                child: Text(
                  _filterOptions[index],
                  style: AppTextStyles.textSMSecondary,
                ),
              );
            }).toList(),
          ),
        );
      }

      // Desktop: segmented button style
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.spacingXS),
            decoration: BoxDecoration(
              color: AppColors.bgSecondary,
              borderRadius: BorderRadius.circular(AppSizes.spacingLG),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [0, 1, 3].map((index) {
                final isSelected = selectedIndex == index;
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.spacingMD),
                    elevation: isSelected ? 5.0 : 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                    ),
                    backgroundColor:
                        isSelected ? AppColors.white : AppColors.transparent,
                    shadowColor: isSelected
                        ? AppColors.black.withValues(alpha: 0.1)
                        : AppColors.transparent,
                  ),
                  onPressed: () {
                    _state.setQuickFilter(_indexToQuickFilter(index));
                  },
                  child: Text(
                    _filterOptions[index],
                    style: isSelected
                        ? AppTextStyles.textSMSemibold
                        : AppTextStyles.textSMSecondary,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
