// features/home/domain/usecases/fetch_featured_books_usecase.dart
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/usecases/app_use_case.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUsecase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUsecase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return homeRepo.fetchFeaturedBooks();
  }
}
