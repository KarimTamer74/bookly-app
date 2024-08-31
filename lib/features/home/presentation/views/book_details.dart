import '../../data/models/book/book.dart';

import 'widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final Book book;
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
