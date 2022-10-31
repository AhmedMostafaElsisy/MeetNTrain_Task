import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train_task/Constants/app_constants.dart';
import 'package:meet_n_train_task/Helpers/shared.dart';
import 'package:meet_n_train_task/Logic/Event_cubit/event_cubit.dart';
import 'package:meet_n_train_task/Logic/Event_cubit/event_cubit_states.dart';
import 'package:meet_n_train_task/Presentation/Screens/Schedule_screen/schedule_date.dart';
import 'package:meet_n_train_task/Presentation/Screens/Schedule_screen/schedule_item.dart';
import 'package:meet_n_train_task/Presentation/Widgets/common_app_bar_widget.dart';
import 'package:meet_n_train_task/Presentation/Widgets/common_error_widget.dart';
import 'package:meet_n_train_task/Presentation/Widgets/common_title_text.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late EventCubit _eventCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eventCubit = BlocProvider.of<EventCubit>(context);
    _eventCubit.getUpComingEvent();
    _eventCubit.scrollController = ScrollController();
    _eventCubit.scrollController.addListener(
      () {
        _eventCubit.setupScrollController();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.lightWhiteColor,
      appBar: const CommonAppBar(
        withLogo: false,
        withBack: true,
        titleWidget: CommonTitleText(
          textKey: "Schedule",
          textColor: AppConstants.lightBlackColor,
          textFontSize: AppConstants.normalFontSize,
          textWeight: FontWeight.w400,
        ),
      ),
      body: BlocConsumer<EventCubit, EventCubitStates>(
        listener: (eventCtx, eventStates) {},
        builder: (eventCtx, eventStates) {
          if (eventStates is FetchEventLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (eventStates is FetchEventFailedState) {
            return CommonError(
              errorMassage: eventStates.customError.errorMassage,
              withButton: true,
              onTap: () => _eventCubit.getUpComingEvent(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.pagePadding - 4),
            child: Column(children: [
              ///Date
              ScheduleDate(
                showDate: eventCtx.read<EventCubit>().showedDate,
              ),
              getSpaceHeight(AppConstants.pagePadding),
              Expanded(
                child: RefreshIndicator(
                  color: AppConstants.primaryColor,
                  onRefresh: eventCtx.read<EventCubit>().onRefresh,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      controller: _eventCubit.scrollController,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index >=
                                eventCtx
                                    .read<EventCubit>()
                                    .upComingEvent
                                    .length &&
                            eventStates is FetchEventLoadingMoreDataState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (index >=
                                eventCtx
                                    .read<EventCubit>()
                                    .upComingEvent
                                    .length &&
                            eventStates is! FetchEventLoadingMoreDataState) {
                          return const SizedBox();
                        } else {
                          return ScheduleItem(
                            index: index,
                            event: eventCtx
                                .read<EventCubit>()
                                .upComingEvent[index],
                          );
                        }
                      },
                      itemCount:
                          eventCtx.read<EventCubit>().upComingEvent.length + 1),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
