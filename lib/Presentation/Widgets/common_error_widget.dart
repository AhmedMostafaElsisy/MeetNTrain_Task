import 'package:flutter/material.dart';

import '../../Constants/app_constants.dart';
import '../../Helpers/shared.dart';
import 'common_global_button.dart';
import 'common_title_text.dart';

class CommonError extends StatelessWidget {
  final String? errorMassage;
  final bool? withButton;
  final Function()? onTap;

  const CommonError(
      {Key? key, this.errorMassage, this.withButton = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: CommonTitleText(
                textKey: errorMassage ?? 'Some thing wrong happen',
                textFontSize: 15,
                textWeight: FontWeight.w400,
                textColor: AppConstants.primaryColor,
                textOverflow: TextOverflow.ellipsis,
                textAlignment: TextAlign.center,
              ),
            ),
          ],
        ),
        if (withButton!) ...[
          getSpaceHeight(20),
          CommonGlobalButton(
              buttonBackgroundColor: AppConstants.mainColor,
              onPressedFunction: onTap,
              buttonText: 'Retry',
              withIcon: false,
              buttonTextColor: AppConstants.lightWhiteColor)
        ]
      ],
    );
  }
}
