import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/featured_newest_books/featured_newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key});

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FeaturedNewestBooksCubit>(context).fetchNewsetBooks();
  }

  Book? book;
  List<Book> newestBooks = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedNewestBooksCubit, FeaturedNewestBooksState>(
      builder: (context, state) {
        if (state is FeaturedNewestBooksSuccess) {
          newestBooks = state.newestBooks;
          return ListView.builder(
            reverse: true,
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
}
