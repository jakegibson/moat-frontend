import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_sizes.dart';

class RoundedActionButton extends StatelessWidget {
  const RoundedActionButton({
    super.key,
    required this.onPressed,
    this.text,
    required this.backgroundColor,
    required this.textStyle,
    this.isDisabled = false,
    this.leading,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderColor,
    this.badgeCount = 0,
    this.mobileOnlyIcon,
    this.xOffset,
  });

  final Function onPressed;
  final String? text;
  final Color backgroundColor;
  final TextStyle textStyle;
  final bool isDisabled;
  final Widget? leading;
  final Widget? mobileOnlyIcon;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? borderColor;
  final int badgeCount;
  final double? xOffset;

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.sizeOf(context).width <= AppSizes.mobileScreenWidth;
    bool showMobileVersion = isMobile && mobileOnlyIcon != null;
    return Transform.translate(
      offset: Offset(xOffset ?? 0, 0),
      child: Badge.count(
        isLabelVisible: badgeCount > 0,
        backgroundColor: AppColors.black,
        textColor: AppColors.white,
        count: badgeCount,
        alignment: AlignmentDirectional.topEnd,
        child:
            showMobileVersion
                ? IconButton(
                  icon: mobileOnlyIcon!,
                  onPressed: isDisabled ? null : () => onPressed(),
                  style: IconButton.styleFrom(
                    backgroundColor:
                        isDisabled ? AppColors.white : backgroundColor,
                    shape: CircleBorder().copyWith(
                      side: BorderSide(
                        color: borderColor ?? Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                )
                : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    overlayColor:
                        backgroundColor == AppColors.white
                            ? AppColors.black
                            : AppColors.grayLight,
                    backgroundColor:
                        isDisabled ? AppColors.white : backgroundColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding ?? 14.0,
                      vertical: verticalPadding ?? 14.0,
                    ),
                    shape:
                        leading != null && text == null
                            ? CircleBorder(
                              side: BorderSide(
                                color: borderColor ?? Colors.transparent,
                                width: 1.0,
                              ),
                            )
                            : RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: borderColor ?? Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                  ),
                  onPressed: () {
                    if (!isDisabled) {
                      onPressed();
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (leading != null) ...[
                        leading!,
                        if (text != null) SizedBox(width: 4.0),
                      ],
                      if (text != null)
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            text!,
                            style:
                                isDisabled
                                    ? textStyle.copyWith(color: AppColors.gray)
                                    : textStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
      ),
    );
  }
}
