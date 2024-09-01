import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repository/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/get_similar_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book/book.dart';
import 'custom_sized_box.dart';
import 'featured_books_section.dart';

import '../../../../../core/utils/stayles.dart';
import 'books_details_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          BooksDetailsSection(book: book),
          const CustomSizedBox(precentage: 0.05),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Other Category Books',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const CustomSizedBox(
              precentage: 0.025), // ignore: prefer_const_constructors
          const GetSimilarBooks(),
          const CustomSizedBox(precentage: 0.05),
        ],
      ),
    );
  }
}
