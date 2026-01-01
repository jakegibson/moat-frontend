import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/rounded_action_button.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class FilterSearchBar extends StatefulWidget {
  const FilterSearchBar({
    super.key,
    required this.onSearch,
    this.onFilterPressed,
    this.filterCount = 0,
    this.initialValue = '',
  });

  final void Function(String query) onSearch;
  final VoidCallback? onFilterPressed;
  final int filterCount;
  final String initialValue;

  @override
  State<FilterSearchBar> createState() => _FilterSearchBarState();
}

class _FilterSearchBarState extends State<FilterSearchBar> {
  Timer? _debounceTimer;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      widget.onSearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.sizeOf(context).width < AppSizes.mobileScreenWidth;

    List<Widget> children = [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.onFilterPressed != null)
            RoundedActionButton(
              leading: const Icon(
                Icons.filter_list_sharp,
                color: AppColors.fgPrimary,
                size: 20.0,
              ),
              badgeCount: widget.filterCount,
              onPressed: widget.onFilterPressed!,
              text: 'Filters',
              borderColor: AppColors.borderPrimary,
              backgroundColor: AppColors.white,
              textStyle: AppTextStyles.textSMSemibold,
              mobileOnlyIcon: const Icon(
                Icons.filter_list_sharp,
                color: AppColors.fgPrimary,
                size: 20.0,
              ),
            ),
        ],
      ),
      Expanded(
        flex: isMobile ? 1 : 0,
        child: Theme(
          data: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              isDense: true,
            ),
          ),
          child: SizedBox(
            width: isMobile ? 250.0 : 350.0,
            child: TextFormField(
              controller: _controller,
              onChanged: _onSearchChanged,
              style: AppTextStyles.textMDMedium,
              decoration: InputDecoration(
                filled: false,
                hintText: 'Search',
                hintStyle: AppTextStyles.textMDMedium.copyWith(
                  color: AppColors.textPlaceHolder,
                ),
                prefixIconConstraints: const BoxConstraints(maxHeight: 25.0),
                prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 5.0),
                  child: SvgPicture.asset(
                    'assets/icons/icon-search.svg',
                    colorFilter: ColorFilter.mode(
                      AppColors.textTertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.all(10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: AppColors.borderPrimary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: AppColors.borderPrimary),
                ),
              ),
            ),
          ),
        ),
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: isMobile ? children.reversed.toList() : children,
    );
  }
}
