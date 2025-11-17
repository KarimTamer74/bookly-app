// features/home/data/repository_impl/home_repo_implementation.dart
import 'dart:developer';

import 'package:bookly_app/features/home/data/mappers/home_mapper.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../domain/repo/home_repo.dart';
import '../remote_data_source/api_services.dart';

class HomeRepoImplementation implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      //* without mapper
      var response = await apiServices.fetechFeaturedBooks();
      final List<BookEntity> books =
          response.items!;
      return right(books);
    } // Check the raw response

    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handleError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetechNewestBooks() async {
    try {
      //* With Mapper
      var response = await apiServices.fetechNewestBooks();
      final List<BookEntity> books =
          response.items!.map(HomeMapper.toBookEntity).toList();
      log(books.toString(), name: 'fetechNewestBooks');
      return right(books);
    } // Check the raw response

    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handleError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetechSimilarBooks() async {
    try {
      var response = await apiServices.fetechSimilarBooks();
      final List<BookEntity> books =
          response.items!.map(HomeMapper.toBookEntity).toList();
      return right(books);
    } // Check the raw response

    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handleError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
