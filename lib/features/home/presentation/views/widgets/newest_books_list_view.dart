// features/home/presentation/views/widgets/newest_books_list_view.dart
import 'package:bookly_app/features/home/presentation/view_models/cubits/newest_books_cubit/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/cubits/newest_books_cubit/newest_books_cubit.dart';
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

    context.read<FeaturedNewestBooksCubit>().fetchNewestBooks();

    _scrollController.addListener(() {
      final max = _scrollController.position.maxScrollExtent;
      final current = _scrollController.position.pixels;

      if (current >= max - 200) {
        context
            .read<FeaturedNewestBooksCubit>()
            .fetchNewestBooks(loadMore: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedNewestBooksCubit, FeaturedNewestBooksState>(
      builder: (context, state) {
        if (state.isLoading && state.books.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }

        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemCount: state.isPaginationLoading
              ? state.books.length + 1
              : state.books.length,
          itemBuilder: (context, index) {
            if (index == state.books.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return BookItem(book: state.books[index]);
          },
        );
      },
    );
  }
}
