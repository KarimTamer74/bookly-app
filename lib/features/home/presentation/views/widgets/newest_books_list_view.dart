import '../../view_models/cubits/newest_books_cubit/newest_books_cubit.dart';

import '../../../data/models/book/book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'book_item.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key});

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FeaturedNewestBooksCubit>(context).fetchNewsetBooks();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedNewestBooksCubit, FeaturedNewestBooksState>(
      builder: (context, state) {
        if (state is FeaturedNewestBooksSuccess) {
          final List<Book> newestBooks = state.newestBooks;
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              _scrollToEnd();
            },
          );
          return ListView.builder(
            reverse: true,
            controller: _scrollController,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: newestBooks.length,
            itemBuilder: (context, index) {
              return BookItem(
                book: newestBooks[index],
              );
            },
          );
        } else if (state is FeaturedNewestBooksFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void _scrollToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
