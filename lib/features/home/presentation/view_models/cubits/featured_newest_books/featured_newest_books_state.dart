part of 'featured_newest_books_cubit.dart';

sealed class FeaturedNewestBooksState extends Equatable {
  const FeaturedNewestBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedNewestBooksInitial extends FeaturedNewestBooksState {}

final class FeaturedNewestBooksLoading extends FeaturedNewestBooksState {}

final class FeaturedNewestBooksFailure extends FeaturedNewestBooksState {
  final String errorMessage;
  const FeaturedNewestBooksFailure(this.errorMessage);
}

final class FeaturedNewestBooksSuccess extends FeaturedNewestBooksState {
  final List<Book> newestBooks;
  const FeaturedNewestBooksSuccess(this.newestBooks);
}
