// features/home/presentation/views/book_details.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'widgets/book_details_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsBody(
          book: book,
        ),
      ),
    );
  }
}
