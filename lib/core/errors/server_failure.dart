// core/errors/server_failure.dart
import 'dart:developer';

import 'package:bookly_app/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.handleError(error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.badCertificate:
          return ServerFailure('Bad Certificate');
        case DioExceptionType.badResponse:
          ServerFailure.handleBadResponse(error.response!);
        case DioExceptionType.cancel:
          return ServerFailure('Request Canceled');
        case DioExceptionType.connectionError:
          return ServerFailure('Connection Error');
        case DioExceptionType.connectionTimeout:
          return ServerFailure('Connection Timeout');
        case DioExceptionType.unknown:
          if (error.message!.contains('SocketException')) {
            return ServerFailure('No Internet Connection');
          }
          return ServerFailure('Unknown Error');
        case DioExceptionType.receiveTimeout:
          return ServerFailure('Receive Timeout');
        case DioExceptionType.sendTimeout:
          return ServerFailure('Send Timeout');
      }
    }

    return ServerFailure(error.toString());
  }

  factory ServerFailure.handleBadResponse(Response<dynamic> response) {
    int statusCode = response.statusCode!;
    if (statusCode == 404) {
      return ServerFailure('Not Found, Please Try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      final String statusMessage = response.statusMessage!;
      final String errorMessage = response.data['error']['message'];
      log("Status Message: $statusMessage, Error Message: $errorMessage");
      return ServerFailure(errorMessage);
    } else if (statusCode >= 500) {
      return ServerFailure('Internal Server Error, Please Try later');
    }

    return ServerFailure('Something went wrong, Please Try later');
  }
}
