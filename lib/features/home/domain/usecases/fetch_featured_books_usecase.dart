// features/home/domain/usecases/fetch_featured_books_usecase.dart
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUsecase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUsecase(this.homeRepo);
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
