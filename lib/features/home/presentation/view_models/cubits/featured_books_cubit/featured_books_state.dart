// features/home/presentation/view_models/cubits/featured_books_cubit/featured_books_state.dart
part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBooksFailure({required this.errorMessage});
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
 final List<BookEntity> books;
 const FeaturedBooksSuccess({required this.books});
}
