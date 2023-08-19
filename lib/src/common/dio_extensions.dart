import 'dart:io';

import 'package:dio/dio.dart';
import 'package:popular_movies/src/domain/models/exceptions.dart';
import 'package:popular_movies/src/domain/models/result.dart';

extension DioExceptionExtension on DioException{
  Failure<S,AppException> handlingError<S>(){

    if (error.runtimeType == SocketException) {
      return Failure(NoConnection());
    }
    final appException = AppException.fromStatusCode(response?.statusCode?? 0);
    return Failure(appException);
  }
}