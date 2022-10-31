import 'package:flutter/material.dart';
import 'package:meet_n_train_task/Presentation/Screens/Schedule_screen/time_line.dart';

import '../../../Data/Models/event_model.dart';
import 'event_item.dart';

class ScheduleItem extends StatelessWidget {
  final EventModel event;
  final int index;

  const ScheduleItem({Key? key, required this.event, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///event time line
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.42,
            width: 40,
            child: DateTimeLine(
              index: index,
            )),

        ///event data
        EventCard(event: event),
      ],
    );
  }
}
