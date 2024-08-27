import 'package:bookly_app/core/errors/server_failure.dart';
import 'package:bookly_app/features/home/data/api_services/api_services.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failure.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    try {
      var response = await apiServices.getBooks();
      debugPrint(response.toString());
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
      var response = await apiServices.getBooks();
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
