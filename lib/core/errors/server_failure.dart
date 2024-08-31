import 'failure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure('Bad response');
      case DioExceptionType.cancel:
        return ServerFailure('Request cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error, Please try again!');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error occurred');
    }
  }
}
