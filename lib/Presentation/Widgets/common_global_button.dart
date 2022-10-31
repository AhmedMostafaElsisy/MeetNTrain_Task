import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/app_constants.dart';
import '../../Helpers/shared.dart';
import 'common_icon_widget.dart';
import 'common_title_text.dart';

class CommonGlobalButton extends StatelessWidget {
  final bool withIcon;
  final String buttonText;
  final Function()? onPressedFunction;
  final Color? buttonBackgroundColor;
  final Color? borderColor;
  final Color? onPressedColor;
  final Color? shadowBackgroundColor;
  final double? elevation;
  final double? width;
  final double? height;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final FontWeight? buttonTextFontWeight;
  final Color? iconColor;
  final double? radius;
  final double? iconSize;
  final Widget? iconData;
  final double? spaceSize;
  final bool isLoading;
  final bool isEnable;

  const CommonGlobalButton({
    Key? key,
    required this.buttonText,
    this.onPressedFunction,
    required this.withIcon,
    this.buttonBackgroundColor,
    this.borderColor,
    this.onPressedColor,
    this.shadowBackgroundColor,
    this.elevation = 5.0,
    this.width = 216,
    this.height = 40,
    this.iconColor = AppConstants.lightWhiteColor,
    this.buttonTextColor = AppConstants.lightWhiteColor,
    this.buttonTextFontWeight = FontWeight.w500,
    this.buttonTextSize = 16,
    this.iconData,
    this.radius = 5.0,
    this.iconSize = 13.0,
    this.spaceSize = 13.0,
    this.isLoading = false,
    this.isEnable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = getWidgetWidth(width!);
    double buttonHeight = getWidgetHeight(height!);

    return ElevatedButton(
      onPressed: isLoading || !isEnable ? null : onPressedFunction,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(elevation!),
        shadowColor: MaterialStateProperty.all(
          shadowBackgroundColor ?? AppConstants.greyColor.withOpacity(.3),
        ),
        overlayColor: MaterialStateProperty.all(
          onPressedColor ?? AppConstants.greyColor.withOpacity(.25),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        fixedSize:
            MaterialStateProperty.all<Size>(Size(buttonWidth, buttonHeight)),
        backgroundColor: isLoading || !isEnable
            ? MaterialStateProperty.all(AppConstants.lightWhiteColor)
            : MaterialStateProperty.all(
                buttonBackgroundColor ?? AppConstants.mainColor),
      ),
      child: withIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CommonTitleText(
                    textKey: isLoading
                        ? AppLocalizations.of(context)!.lblLoading
                        : buttonText,
                    textColor: isEnable
                        ? buttonTextColor!
                        : AppConstants.lightWhiteColor,
                    textFontSize: buttonTextSize!,
                    textWeight: buttonTextFontWeight!,
                  ),
                ),
                getSpaceWidth(spaceSize!),
                iconData ??
                    commonIcon(
                      Icons.arrow_forward,
                      iconColor!,
                      iconSize!,
                    ),
              ],
            )
          : CommonTitleText(
              textKey: isLoading
                  ? AppLocalizations.of(context)!.lblLoading
                  : buttonText,
              textColor: isEnable
                  ? isLoading
                      ? AppConstants.lightWhiteColor
                      : buttonTextColor!
                  : AppConstants.lightWhiteColor,
              textFontSize: buttonTextSize!,
              textWeight: buttonTextFontWeight!,
            ),
    );
  }
}
