import '../../Data/Remote_Data/Network/Dio_Exception_Handling/custom_error.dart';

abstract class EventCubitStates {}

class EventInitState extends EventCubitStates {}

class FetchEventLoadingState extends EventCubitStates {}

class FetchEventEmptyState extends EventCubitStates {}

class FetchEventSuccessState extends EventCubitStates {}

class FetchEventFailedState extends EventCubitStates {
  final CustomError customError;

  FetchEventFailedState(this.customError);
}

class FetchEventUpDateDateState extends EventCubitStates {}

class FetchEventLoadingMoreDataState extends EventCubitStates {}

class FetchEventMoreDataSuccessState extends EventCubitStates {}

class FetchEventLoadingMoreDataFailedState extends EventCubitStates {
  final CustomError customError;

  FetchEventLoadingMoreDataFailedState(this.customError);
}
