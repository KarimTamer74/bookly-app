// features/home/presentation/view_models/cubits/newest_books_cubit/newest_books_cubit.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_newest_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failure.dart';

part 'newest_books_state.dart';

class FeaturedNewestBooksCubit extends Cubit<FeaturedNewestBooksState> {
  FeaturedNewestBooksCubit(this.fetchNewestBooksUsecase)
      : super(FeaturedNewestBooksInitial());
  final FetchNewestBooksUsecase fetchNewestBooksUsecase;
  void fetchNewsetBooks() async {
    Either<Failure, List<BookEntity>> result =
        await fetchNewestBooksUsecase.call();
    result.fold(
      (failure) {
        emit(FeaturedNewestBooksFailure(failure.errorMessage));
      },
      (newestBooks) {
        emit(FeaturedNewestBooksSuccess(newestBooks));
      },
    );
  }
}
