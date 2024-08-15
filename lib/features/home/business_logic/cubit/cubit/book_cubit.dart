import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repository/home_repo_implementation.dart';
import 'package:equatable/equatable.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BooksState> {
  BookCubit(this.homeRepo) : super(BooksInitial());
  final HomeRepoImplementation homeRepo;
  List<Book> books = [];
  List<Book> fetchFeaturedBooks() {
    try {
      homeRepo.fetchFeaturedBooks().then((books) {
        emit(BooksSuccessState(books: books as List<Book>));
        this.books = books as List<Book>;
        return books;
      });
    } catch (e) {
      emit(BooksFailureState(errorMessage: e.toString()));
    }
    return books;
  }
}
