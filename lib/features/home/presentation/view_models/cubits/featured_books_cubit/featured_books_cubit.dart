import '../../../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/models/book/book.dart';
import '../../../../data/repository/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  late List<Book> getBooks = [];
  Future<List<Book>> fetchFeaturedBooks() async {
    Either<Failure, List<Book>> result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailure(
            errorMessage: failure.toString(),
          ),
        );
      },
      (books) {
        emit(
          FeaturedBooksSuccess(books: books),
        );
        getBooks = books;
      },
    );
    return getBooks;
  }
}
