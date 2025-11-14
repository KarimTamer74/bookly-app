// features/home/presentation/view_models/cubits/featured_books_cubit/featured_books_cubit.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failure.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUsecase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUsecase featuredBooksUsecase;
  List<BookEntity> books = [];

  Future<void> fetchFeaturedBooks() async {
    Either<Failure, List<BookEntity>> result =
        await featuredBooksUsecase.call();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailure(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (books) {
        this.books = books;
        emit(
          FeaturedBooksSuccess(books: books),
        );
      },
    );
  }
}
