// features/search/presentation/views/widgets/search_result.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/stayles.dart';
import '../../../../home/presentation/view_models/cubits/featured_books_cubit/featured_books_cubit.dart';
import '../../../../home/presentation/views/widgets/book_item.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key, required this.searchedBook});
  final String searchedBook;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<BookEntity> searchResult = [];

  @override
  void didUpdateWidget(SearchResult oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchedBook != widget.searchedBook) {
      _updateSearchResults(widget.searchedBook);
    }
    if (widget.searchedBook.isEmpty) {
      searchResult = [];
    }
  }

  void _updateSearchResults(String searched) {
    final List<BookEntity> allBooks =
        BlocProvider.of<FeaturedBooksCubit>(context).books;
    searchResult = allBooks
        .where((element) =>
            element.title?.toLowerCase().startsWith(searched.toLowerCase()) ??
            false)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return searchResult.isEmpty
        ? const Center(
            child: Text(
              'No results found',
              style: Styles.textStyle20,
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: searchResult.length,
            itemBuilder: (context, index) {
              return BookItem(book: searchResult[index]);
            },
          );
  }
}
