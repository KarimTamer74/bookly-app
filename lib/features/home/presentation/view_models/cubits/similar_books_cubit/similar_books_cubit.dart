import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repository/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit(this.homeRepo) : super(FetchSimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks() async {
    Either<Failure, List<Book>> result = await homeRepo.fetechSimilarBooks();
    result.fold(
      (failure) {
        emit(
          FetchSimilarBooksError(failure.toString()),
        );
      },
      (books) {
        emit(FetchSimilarBooksSuccessfuly(books));
      },
    );
  }
}
