import 'package:bookly_app/features/home/presentation/view_models/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../data/models/book/book.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.height});
  final double height;

  @override
  State<FeaturedBooksListView> createState() =>
      _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState
    extends State<FeaturedBooksListView> {
  List<Book> books = [];
  @override
  void initState() {
    super.initState();

    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.height,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            books = state.books;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: AssetsData.booksList.length,
              itemBuilder: (context, index) {
                return CustomBookImage(
                  index: index,
                  aspectRatio: 2.8 / 4,
                  book: books[index],
                );
              },
            );
          } else if (state is FeaturedBooksFailure) {
            return Text(state.errorMessage);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
