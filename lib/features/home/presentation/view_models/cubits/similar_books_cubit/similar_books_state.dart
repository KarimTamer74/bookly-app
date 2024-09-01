part of 'similar_books_cubit.dart';

sealed class FetchSimilarBooksState extends Equatable {
  const FetchSimilarBooksState();

  @override
  List<Object> get props => [];
}

final class FetchSimilarBooksInitial extends FetchSimilarBooksState {}

final class FetchSimilarBooksSuccessfuly extends FetchSimilarBooksState {
  final List<Book> similarBooks;
  const FetchSimilarBooksSuccessfuly(this.similarBooks);
}

final class FetchSimilarBooksError extends FetchSimilarBooksState {
  final String errorMessage;
  const FetchSimilarBooksError(this.errorMessage);
}

final class FetchSimilarBooksloading extends FetchSimilarBooksState {}
