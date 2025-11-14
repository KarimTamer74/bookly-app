// features/home/presentation/views/widgets/featured_books_loaded.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedBooksLoaded extends StatelessWidget {
  const FeaturedBooksLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final books = BlocProvider.of<FeaturedBooksCubit>(context).books;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomBookImage(
            aspectRatio: 2.7 / 4,
            book: books[index],
          ),
        );
      },
    );
  }
}
