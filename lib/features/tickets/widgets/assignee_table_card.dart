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
    // Figma design: Avatar (24px) + Name + Job Title, no chevron in table
    return Row(
      children: [
        name != null
            ? ProfileAvatar(name: name!, size: 24.0, photoUrl: photoUrl)
            : SvgPicture.asset(
              'assets/icons/icon-empty-profile.svg',
              height: 24.0,
              colorFilter: ColorFilter.mode(
                AppColors.fgQuaternary,
                BlendMode.srcIn,
              ),
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
                        ? AppTextStyles.textSMMedium
                        : AppTextStyles.textSMTertiary,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              if (jobTitle != null && jobTitle!.isNotEmpty)
                Text(
                  jobTitle!,
                  style: AppTextStyles.textXSTertiary,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
