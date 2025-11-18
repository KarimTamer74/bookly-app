// features/home/presentation/view_models/cubits/newest_books_cubit/newest_books_cubit.dart
import 'package:bookly_app/features/home/domain/usecases/fetch_newest_books_usecase.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedNewestBooksCubit extends Cubit<FeaturedNewestBooksState> {
  FeaturedNewestBooksCubit(this.fetchNewestBooksUsecase)
      : super(const FeaturedNewestBooksState());

  final FetchNewestBooksUsecase fetchNewestBooksUsecase;

  int page = 0;
  bool isLoadingMore = false;

  Future<void> fetchNewestBooks({bool loadMore = false}) async {
    if (isLoadingMore) return;

    if (loadMore) {
      isLoadingMore = true;
      emit(state.copyWith(isPaginationLoading: true));
      page++;
    } else {
      page = 0;
      emit(state.copyWith(isLoading: true));
    }

    final result = await fetchNewestBooksUsecase(pageNum: page);

    result.fold(
      (failure) {
        if (loadMore) {
          emit(state.copyWith(
            isPaginationLoading: false,
            paginationError: failure.errorMessage,
          ));
        } else {
          emit(state.copyWith(
            isLoading: false,
            errorMessage: failure.errorMessage,
          ));
        }
        isLoadingMore = false;
      },
      (newBooks) {
        final updatedList = loadMore ? [...state.books, ...newBooks] : newBooks;

        emit(state.copyWith(
          books: updatedList,
          isLoading: false,
          isPaginationLoading: false,
        ));

        isLoadingMore = false;
      },
    );
  }
}
