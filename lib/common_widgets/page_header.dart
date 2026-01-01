import 'package:flutter/material.dart';

import '../core/styles/app_sizes.dart';
import '../core/styles/app_text_styles.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showSearchBar = false,
    this.actions = const [],
    this.actionBar,
    this.middleWidget,
    this.searchWidget,
  });

  final String title;
  final String subtitle;
  final List<Widget> actions;
  final bool showSearchBar;
  final Widget? actionBar;
  final Widget? middleWidget;
  final Widget? searchWidget;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    bool isMobile = screenWidth < AppSizes.mobileScreenWidth;
    bool isTablet = screenWidth < AppSizes.tabletScreenWidth;

    return Padding(
      padding:
          isMobile
              ? EdgeInsets.only(bottom: AppSizes.spacing2XL)
              : EdgeInsets.symmetric(vertical: AppSizes.spacing2XL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(title, style: AppTextStyles.text2XLSemibold),
              ),
              if (!isMobile) Row(children: actions),
            ],
          ),
          if (!isMobile) ...[
            SizedBox(height: AppSizes.spacingXS),
            Text(subtitle, style: AppTextStyles.textMDTertiary),
          ],
          if (middleWidget != null) ...[
            SizedBox(height: AppSizes.spacingXL),
            middleWidget!,
          ],
          if (showSearchBar && searchWidget != null) ...[
            SizedBox(height: AppSizes.spacing2XL),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (actionBar != null && !isTablet) actionBar!,
                Expanded(child: searchWidget!),
                if (isMobile && actions.isNotEmpty) ...[
                  const SizedBox(width: AppSizes.spacingLG),
                  ...actions,
                ],
              ],
            ),
          ],
          if (actionBar != null && isTablet)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: actionBar!,
            ),
        ],
      ),
    );
  }
}
