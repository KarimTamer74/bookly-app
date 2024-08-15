import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repository/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_newest_books_state.dart';

class FeaturedNewestBooksCubit extends Cubit<FeaturedNewestBooksState> {
  FeaturedNewestBooksCubit(this.homeRepo) : super(FeaturedNewestBooksInitial());
  final HomeRepo homeRepo;
  void fetchNewsetBooks() async {
    var result = await homeRepo.fetechNewestBooks();
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
