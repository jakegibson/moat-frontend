import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/profile_avatar.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';

class AssigneeTableCard extends StatelessWidget {
  const AssigneeTableCard({
    super.key,
    this.name,
    this.jobTitle,
    this.photoUrl,
  });

  final String? name;
  final String? jobTitle;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingLG),
      child: Row(
        children: [
          name != null
              ? ProfileAvatar(name: name!, size: 32.0, photoUrl: photoUrl)
              : SvgPicture.asset(
                'assets/icons/icon-empty-profile.svg',
                height: 32.0,
              ),
          SizedBox(width: AppSizes.spacingLG),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? 'Unassigned',
                  style:
                      name != null
                          ? AppTextStyles.body
                          : AppTextStyles.textXSSecondary,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (jobTitle != null)
                  Text(
                    jobTitle!,
                    style: AppTextStyles.textXSTertiary,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.fgQuaternary, size: 18.0),
        ],
      ),
    );
  }
}
