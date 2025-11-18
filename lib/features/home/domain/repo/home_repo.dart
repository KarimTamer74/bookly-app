// features/home/domain/repo/home_repo.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();

  Future<Either<Failure, List<BookEntity>>> fetechNewestBooks({int pageNum = 0});
  Future<Either<Failure, List<BookEntity>>> fetechSimilarBooks();
}
