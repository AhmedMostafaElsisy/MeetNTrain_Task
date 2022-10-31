import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meet_n_train_task/Constants/base_url.dart';

import '../../../../Constants/Enums/exception_enums.dart';
import 'custom_exception.dart';
import 'dio_exception.dart';

class DioHelper {
  static late Dio dio;

  /// Initializing dio baseUrl
  static init() {
    try {
      dio = Dio(
        BaseOptions(
          baseUrl: BaseUrl.baseUrl,
          headers: {
            "Content-Type": "application/json charset=UTF-8",
            "authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE"
          },
          receiveDataWhenStatusError: true,
        ),
      );
    } on DioError catch (exception) {
      /// Get custom massage for the exception
      final errorMessage = DioExceptions.fromDioError(exception).errorType;

      /// throw custom exception
      throw CustomException(errorMessage, 'error.png');
    } catch (e) {
      throw CustomException(CustomStatusCodeErrorType.unExcepted, 'error.png');
    }
  }

  ///use this method to get data from api
  static Future<Response> getDate({required String url}) async {
    try {
      return await dio.get(url);
    } on DioError catch (exception) {
      /// Get custom massage for the exception
      debugPrint(
          "here is the error from dio get data ${exception.response!.data["message"]} ");
      final errorType = DioExceptions.fromDioError(exception).errorType;
      final errorMessage = DioExceptions.fromDioError(exception).errorMassage;

      /// throw custom exception
      throw CustomException(errorType, 'error.png', errorMassage: errorMessage);
    } catch (e) {
      throw CustomException(CustomStatusCodeErrorType.unExcepted, 'error.png');
    }
  }

  ///use this method to send data to api
  static Future<Response> postData(
      {required String url, required FormData data}) async {
    try {
      final response = await dio.post(url, data: data);

      debugPrint(response.statusCode.toString());
      debugPrint(response.statusMessage);

      return response;
    } on DioError catch (exception) {
      debugPrint(
          "here is the error from dio post data ${exception.response!.data["message"]} ");

      /// G1et custom massage for the exception
      final errorType = DioExceptions.fromDioError(exception).errorType;

      final errorMessage = DioExceptions.fromDioError(exception).errorMassage;

      /// throw custom exception
      throw CustomException(errorType, 'error.png', errorMassage: errorMessage);
    } catch (error) {
      debugPrint("this is error from CustomException exception$error");
      debugPrint(
          "this is error from CustomException exception${error.runtimeType}");

      throw CustomException(CustomStatusCodeErrorType.unExcepted, 'error.png');
    }
  }

  ///use this method to update data in api
  static Future<Response> putData(
      {required String url, required FormData data}) async {
    try {
      final response = await dio.put(url, data: data);
      debugPrint(response.statusCode.toString());
      debugPrint(response.statusMessage);

      return response;
    } on DioError catch (exception) {
      debugPrint(
          "here is the error from dio put data ${exception.response!.data["message"]} ");

      /// G1et custom massage for the exception
      final errorType = DioExceptions.fromDioError(exception).errorType;

      final errorMessage = DioExceptions.fromDioError(exception).errorMassage;

      /// throw custom exception
      throw CustomException(errorType, 'error.png', errorMassage: errorMessage);
    } catch (error) {
      debugPrint("this is error from CustomException exception$error");
      debugPrint(
          "this is error from CustomException exception${error.runtimeType}");

      throw CustomException(CustomStatusCodeErrorType.unExcepted, 'error.png');
    }
  }
}
