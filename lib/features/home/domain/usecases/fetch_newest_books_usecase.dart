// features/home/domain/usecases/fetch_newest_books_usecase.dart
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUsecase {
  final HomeRepo homeRepo;
  FetchNewestBooksUsecase(this.homeRepo);
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetechNewestBooks();
  }
}
