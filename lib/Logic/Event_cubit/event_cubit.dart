import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meet_n_train_task/Constants/Enums/exception_enums.dart';
import 'package:meet_n_train_task/Data/Models/event_model.dart';
import 'package:meet_n_train_task/Data/Remote_Data/Network/Dio_Exception_Handling/custom_error.dart';

import '../../Data/Interfaces/event_interface.dart';
import 'event_cubit_states.dart';

class EventCubit extends Cubit<EventCubitStates> {
  EventCubit(this.eventRepositoryInterface) : super(EventInitState());
  EventRepositoryInterface eventRepositoryInterface;

  static EventCubit get(context) => BlocProvider.of(context);
  List<EventModel> upComingEvent = [];
  List<String> eventDateList = [];
  String currentDate = '';
  DateTime? showedDate;

  int page = 1;
  late ScrollController scrollController;
  double currentScrollOffset = 0;
  bool isHaveMore = false;

  Future onRefresh() async {
    upComingEvent.clear();
    eventDateList.clear();
    getUpComingEvent();
  }

  void setupScrollController() {
    if (scrollController.offset >
            scrollController.position.maxScrollExtent - 200 &&
        scrollController.offset <= scrollController.position.maxScrollExtent) {
      if (state is! FetchEventLoadingMoreDataState && isHaveMore) {
        getMoreEvent();
      }
    }
  }

  getMoreEvent() async {
    try {
      emit(FetchEventLoadingMoreDataState());
      page = page + 1;
      String currentDate = DateFormat('ddMMMyyyy').format(DateTime.now());
      var result = await eventRepositoryInterface.getUpComingEvent(
          page: page, date: currentDate);
      if (eventRepositoryInterface.isError) {
        emit(FetchEventLoadingMoreDataFailedState(
            eventRepositoryInterface.errorMsg!));
      } else {
        var tempList = eventListFromJson(result.data);
        isHaveMore = tempList.length == 10;
        upComingEvent.addAll(tempList);
        for (var element in tempList) {
          eventDateList.add(element.date!);
        }
        emit(FetchEventMoreDataSuccessState());
      }
    } catch (e) {
      emit(FetchEventLoadingMoreDataFailedState(CustomError(
          type: CustomStatusCodeErrorType.unExcepted,
          errorMassage: e.toString())));
    }
  }

  getUpComingEvent() async {
    try {
      page = 1;
      emit(FetchEventLoadingState());
      String currentDate = DateFormat('ddMMMyyyy').format(DateTime.now());
      var result = await eventRepositoryInterface.getUpComingEvent(
          page: page, date: currentDate);

      if (eventRepositoryInterface.isError) {
        emit(FetchEventFailedState(eventRepositoryInterface.errorMsg!));
      } else {
        log('this response data ${result.data}');

        upComingEvent = eventListFromJson(result.data);
        if (upComingEvent.isEmpty) {
          isHaveMore = false;
          emit(FetchEventEmptyState());
        } else {
          isHaveMore = upComingEvent.length == 10;
          for (var element in upComingEvent) {
            eventDateList.add(element.date!);
          }
          emit(FetchEventSuccessState());
        }
      }
    } catch (e) {
      emit(FetchEventFailedState(CustomError(
          type: CustomStatusCodeErrorType.unExcepted,
          errorMassage: e.toString())));
    }
  }
}
