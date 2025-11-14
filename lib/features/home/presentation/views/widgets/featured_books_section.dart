// features/home/presentation/views/widgets/featured_books_section.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'featured_books_loaded.dart';

class FeaturedBooksSection extends StatefulWidget {
  const FeaturedBooksSection({super.key, required this.height});
  final double height;

  @override
  State<FeaturedBooksSection> createState() => _FeaturedBooksSectionState();
}

class _FeaturedBooksSectionState extends State<FeaturedBooksSection> {
  List<BookEntity> books = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books = state.books;

          return SizedBox(
            height: MediaQuery.of(context).size.height * widget.height,
            child: const FeaturedBooksLoaded(),
          );
        } else if (state is FeaturedBooksFailure) {
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
