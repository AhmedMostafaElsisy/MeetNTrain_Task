import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_n_train_task/Constants/app_constants.dart';
import 'package:meet_n_train_task/Logic/Event_cubit/event_cubit.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../Logic/Event_cubit/event_cubit_states.dart';
import '../../Widgets/common_title_text.dart';

class DateTimeLine extends StatelessWidget {
  const DateTimeLine({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    EventCubit eventCubit = EventCubit.get(context);
    eventCubit.currentDate = DateFormat('dd MMM')
        .format(DateTime.parse(eventCubit.eventDateList[index]));
    eventCubit.showedDate = DateTime.parse(eventCubit.eventDateList[index]);
    eventCubit.emit(FetchEventUpDateDateState());

    return TimelineTile(
      afterLineStyle:
          const LineStyle(color: AppConstants.greyColor, thickness: 1),
      beforeLineStyle:
          const LineStyle(color: AppConstants.greyColor, thickness: 1),
      indicatorStyle: IndicatorStyle(
          width: 28,
          height: 60,
          drawGap: false,
          padding: EdgeInsets.zero,
          indicator: Container(
            width: 28,
            decoration: BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    CommonTitleText(
                      textKey: DateFormat('dd').format(
                          DateTime.parse(eventCubit.eventDateList[index])),
                      textColor: AppConstants.lightWhiteColor,
                      textFontSize: AppConstants.smallFontSize,
                    ),
                    CommonTitleText(
                      textKey: DateFormat('EEE').format(
                          DateTime.parse(eventCubit.eventDateList[index])),
                      textColor: AppConstants.lightWhiteColor,
                      textFontSize: AppConstants.smallFontSize,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
