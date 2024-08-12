import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  @override
  Future<Either<Failure, List<Book>>> fetechBooks() {
    // TODO: implement fetechBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> fetechNewestBooks() {
    // TODO: implement fetechNewestBooks
    throw UnimplementedError();
  }
  
}