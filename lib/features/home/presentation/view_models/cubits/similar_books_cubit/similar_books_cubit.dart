// features/home/presentation/view_models/cubits/similar_books_cubit/similar_books_cubit.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_similar_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failure.dart';

part 'similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit(this.fetchSimilarBooksUsecase)
      : super(FetchSimilarBooksInitial());
  final FetchSimilarBooksUsecase fetchSimilarBooksUsecase;

  Future<void> fetchSimilarBooks() async {
    Either<Failure, List<BookEntity>> result =
        await fetchSimilarBooksUsecase.call();
    result.fold(
      (failure) {
        emit(
          FetchSimilarBooksError(failure.errorMessage),
        );
      },
      (books) {
        emit(FetchSimilarBooksSuccessfuly(books));
      },
    );
  }
}
