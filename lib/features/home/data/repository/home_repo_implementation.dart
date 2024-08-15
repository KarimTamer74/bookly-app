import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/api_services/api_services.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/models/book/books_response.dart';
import 'package:bookly_app/features/home/data/repository/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class HomeRepoImplementation implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    try {
      BooksResponse response = await apiServices.getBooks();

      if (response.items == null || response.items!.isEmpty) {
        debugPrint('No books found.');
        return left(Failure()); // عودة خطأ إذا لم يكن هناك بيانات
      }

      debugPrint('Data loaded successfully');
      return right(response.items!);
    } catch (e) {
      debugPrint('Error: $e');
      // debugPrint('Stack trace: $stackTrace');
      return left(Failure());
    }
  }
}
