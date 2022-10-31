import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Constants/app_constants.dart';
import '../../../Helpers/shared.dart';
import '../../Widgets/common_icon_widget.dart';
import '../../Widgets/common_title_text.dart';

class ScheduleDate extends StatelessWidget {
  final DateTime? showDate;
  const ScheduleDate({Key? key, this.showDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///calender icon
        Container(
            width: getWidgetWidth(30),
            height: getWidgetHeight(30),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppConstants.containerBorderRadius),
                color: AppConstants.lightWhiteColor,
                border: Border.all(color: AppConstants.primaryColor)),
            child: commonIcon(
                Icons.calendar_today, AppConstants.primaryColor, 20)),

        ///spacer
        getSpaceWidth(12),
        CommonTitleText(
          textKey: showDate == null
              ? DateFormat('dd').format(DateTime.now())
              : DateFormat('dd').format(
                  showDate!,
                ),
          textColor: AppConstants.lightBlackColor,
          textFontSize: AppConstants.titleFontSize,
          textWeight: FontWeight.w700,
        ),
        getSpaceWidth(4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTitleText(
              textKey: showDate == null
                  ? DateFormat('EEEE').format(DateTime.now())
                  : DateFormat('EEEE').format(
                      showDate!,
                    ),
              textColor: AppConstants.greyColor,
              textFontSize: AppConstants.xSmallFontSize,
              textWeight: FontWeight.w400,
            ),
            CommonTitleText(
              textKey: showDate == null
                  ? DateFormat('MMM yyyy').format(DateTime.now())
                  : DateFormat('MMM yyyy').format(
                      showDate!,
                    ),
              textColor: AppConstants.lightBlackColor,
              textFontSize: AppConstants.xSmallFontSize,
              textWeight: FontWeight.w400,
            ),
          ],
        )
      ],
    );
  }
}
