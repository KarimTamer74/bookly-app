// features/home/domain/usecases/fetch_similar_books_usecase.dart
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUsecase {
  final HomeRepo homeRepo;
  FetchSimilarBooksUsecase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> call() async =>
      await homeRepo.fetechSimilarBooks();
}
