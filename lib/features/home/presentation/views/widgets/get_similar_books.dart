import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_loaded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSimilarBooks extends StatefulWidget {
  const GetSimilarBooks({super.key});

  @override
  State<GetSimilarBooks> createState() => _GetSimilarBooksState();
}

class _GetSimilarBooksState extends State<GetSimilarBooks> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchSimilarBooksCubit>(context).fetchSimilarBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimilarBooksCubit, FetchSimilarBooksState>(
      builder: (context, state) {
        if (state is FetchSimilarBooksSuccessfuly) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 9,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.similarBooks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 7, top: 5),
                  child: CustomBookImage(
                      aspectRatio: 2 / 3, book: state.similarBooks[index]),
                );
              },
            ),
          );
        } else if (state is FetchSimilarBooksError) {
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
