import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.name,
    this.photoUrl,
    this.selected = false,
    this.onTap,
    this.size = 40,
    this.textStyle,
  });

  final bool selected;
  final VoidCallback? onTap;
  final double size;
  final String name;
  final String? photoUrl;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    String initials = '';

    List<String> names = name.split(' ');
    names.removeWhere((element) => element.isEmpty);

    if (names.isEmpty) {
      initials = '?';
    } else {
      initials =
          names.length > 1 ? '${names[0][0]}${names[1][0]}' : names[0][0];
    }

    TextStyle? initialsTextStyle =
        textStyle ??
        (size > 30
            ? AppTextStyles.textMDBoldTertiary
            : AppTextStyles.textSMSemiboldTertiary);
    final initialsWidget = SelectionContainer.disabled(
      child: Text(initials.toUpperCase(), style: initialsTextStyle),
    );

    final profileCircle = Container(
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.white : AppColors.avatarBorder,
          width: selected ? 4.0 : 1.0,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        boxShadow:
            selected
                ? [
                  BoxShadow(
                    color: AppColors.black.withAlpha(100),
                    offset: const Offset(-1, 2),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                ]
                : [],
      ),
      width: size,
      height: size,
      child: Center(
        child:
            photoUrl != null
                ? ClipOval(
                  child: Image.network(
                    photoUrl!,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                    cacheWidth: 200,
                    cacheHeight: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return initialsWidget;
                    },
                  ),
                )
                : initialsWidget,
      ),
    );

    if (onTap != null) {
      return InkWell(onTap: onTap, child: profileCircle);
    }

    return profileCircle;
  }
}
