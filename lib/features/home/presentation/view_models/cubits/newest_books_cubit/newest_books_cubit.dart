import '../../../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/models/book/book.dart';
import '../../../../data/repository/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class FeaturedNewestBooksCubit extends Cubit<FeaturedNewestBooksState> {
  FeaturedNewestBooksCubit(this.homeRepo) : super(FeaturedNewestBooksInitial());
  final HomeRepo homeRepo;
  void fetchNewsetBooks() async {
    Either<Failure, List<Book>> result = await homeRepo.fetechNewestBooks();
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
