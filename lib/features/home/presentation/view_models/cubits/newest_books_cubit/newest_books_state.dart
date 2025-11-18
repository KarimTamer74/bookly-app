// features/home/presentation/view_models/cubits/newest_books_cubit/newest_books_state.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

class FeaturedNewestBooksState extends Equatable {
  final List<BookEntity> books;
  final bool isLoading;
  final bool isPaginationLoading;
  final String? errorMessage;
  final String? paginationError;

  const FeaturedNewestBooksState({
    this.books = const [],
    this.isLoading = false,
    this.isPaginationLoading = false,
    this.errorMessage,
    this.paginationError,
  });

  FeaturedNewestBooksState copyWith({
    List<BookEntity>? books,
    bool? isLoading,
    bool? isPaginationLoading,
    String? errorMessage,
    String? paginationError,
  }) {
    return FeaturedNewestBooksState(
      books: books ?? this.books,
      isLoading: isLoading ?? this.isLoading,
      isPaginationLoading:
          isPaginationLoading ?? this.isPaginationLoading,
      errorMessage: errorMessage,
      paginationError: paginationError,
    );
  }

  @override
  List<Object?> get props =>
      [books, isLoading, isPaginationLoading, errorMessage, paginationError];
}
