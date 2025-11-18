// features/home/data/repository_impl/home_repo_implementation.dart
import 'package:bookly_app/core/storage/hive_manager.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/home/data/data_sources/local_data_source.dart';
import 'package:bookly_app/features/home/data/mappers/home_mapper.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../domain/repo/home_repo.dart';
import '../data_sources/api_services.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiServices;
  final LocalDataSource localDataSource;

  HomeRepoImplementation(
      {required this.apiServices, required this.localDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> cachedBooks = localDataSource.fetchFeaturedBooks();
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      //* without mapper
      var response = await apiServices.fetechFeaturedBooks();
      final List<BookEntity> books = response.items!;
      await HiveManager.setBooks(boxName: featuredBox, books: books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handleError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetechNewestBooks(
      {int pageNum = 0}) async {
    try {
      // List<BookEntity> cachedBooks = localDataSource.fetchNewestBooks();
      // if (cachedBooks.isNotEmpty) {
      //   return right(cachedBooks);
      // }
      //* With Mapper
      var response = await apiServices.fetechNewestBooks(pageNum);
      final List<BookEntity> books =
          response.items!.map(HomeMapper.toBookEntity).toList();
      await HiveManager.setBooks(boxName: newestBox, books: books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handleError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetechSimilarBooks() async {
    try {
      List<BookEntity> cachedBooks = localDataSource.fetchSimilarBooks();
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      var response = await apiServices.fetechSimilarBooks();
      final List<BookEntity> books =
          response.items!.map(HomeMapper.toBookEntity).toList();
      await HiveManager.setBooks(boxName: similarBox, books: books);
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
