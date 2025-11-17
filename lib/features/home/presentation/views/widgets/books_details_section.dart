// features/home/presentation/views/widgets/books_details_section.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/stayles.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';
import 'custom_books_details_appbar.dart';
import 'custom_sized_box.dart';
import 'preview_section.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBooksDetailsAppBar(),
        const CustomSizedBox(precentage: 0.05),
        SizedBox(
          height: 230,
          child: CustomBookImage(aspectRatio: 1, book: book),
        ),
        const CustomSizedBox(precentage: 0.05),
        Text(
          book.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 30, fontFamily: 'GT Sectra Fine Regular'),
        ),
        const CustomSizedBox(precentage: 0.02),
        Text(book.authors![0],
            style: Styles.textStyle18.copyWith(color: const Color(0xff707070))),
        const CustomSizedBox(precentage: 0.02),
        BookRating(
          book: book,
        ),
        const CustomSizedBox(precentage: 0.03),
        PreviewSection(
          book: book,
        )
      ],
    );
  }
}
