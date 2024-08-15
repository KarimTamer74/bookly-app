import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/business_logic/cubit/cubit/book_cubit.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorizontalListViewOfBooksItem extends StatefulWidget {
  const HorizontalListViewOfBooksItem({super.key, required this.height});
  final double height;

  @override
  State<HorizontalListViewOfBooksItem> createState() =>
      _HorizontalListViewOfBooksItemState();
}

class _HorizontalListViewOfBooksItemState
    extends State<HorizontalListViewOfBooksItem> {
  List<Book> books = [];
  @override
  void initState() {
    super.initState();

    BlocProvider.of<BookCubit>(context).fetchFeaturedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.height,
      child: BlocBuilder<BookCubit, BooksState>(
        builder: (context, state) {
          if (state is BooksSuccessState) {
            books = state.books;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: AssetsData.booksList.length,
              itemBuilder: (context, index) {
                return CustomBookImage(
                  index: index,
                  aspectRatio: 2.8 / 4,
                );
              },
            );
          } else if (state is BooksFailureState) {
            return Text(state.errorMessage);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
