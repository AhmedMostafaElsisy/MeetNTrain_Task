import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../Interfaces/event_interface.dart';
import '../../Models/base_model.dart';
import '../Network/Dio_Exception_Handling/custom_error.dart';
import '../Network/Dio_Exception_Handling/custom_exception.dart';
import '../Network/Dio_Exception_Handling/dio_helper.dart';

class EventRepository extends EventRepositoryInterface {
  @override
  Future<BaseModel> getUpComingEvent({
    required int page,
    required String date,
  }) async {
    isError = false;

    try {
      String _pathUrl =
          '/profile/events/upcoming/8357/?page=$page&date_gte=$date';
      debugPrint("here is url of get events ${_pathUrl}");
      Response response = await DioHelper.getDate(url: _pathUrl);
      if (response.statusCode == 200) {
        /// parsing response to user model
        baseModel.data = response.data;
        return baseModel;
      } else {
        return baseModel;
      }
    } on CustomException catch (ex) {
      isError = true;
      errorMsg = CustomError(
          type: ex.type, errorMassage: ex.errorMassage, imgPath: ex.imgPath);
      return baseModel;
    }
  }
}
