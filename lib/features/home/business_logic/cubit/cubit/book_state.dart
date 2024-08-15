part of 'book_cubit.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class BooksLoadingState extends BooksState {}

final class BooksSuccessState extends BooksState {
  final List<Book> books;

  const BooksSuccessState({required this.books});
}

final class BooksFailureState extends BooksState {
  final String errorMessage;

  const BooksFailureState({required this.errorMessage });

}
