import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../api_services/api_services.dart';
import '../models/book/book.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    try {
      var response = await apiServices.fetechFeaturedBooks();
      return right(response.items!);
    } // Check the raw response

    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetechNewestBooks() async {
    try {
      var response = await apiServices.fetechNewestBooks();
      return right(response.items!);
    } // Check the raw response

    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetechSimilarBooks() async {
    try {
      var response = await apiServices.fetechSimilarBooks();
      return right(response.items!);
    } // Check the raw response

    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
