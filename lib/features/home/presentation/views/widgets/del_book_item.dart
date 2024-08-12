import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomBookImage(
      index: index,
      aspectRatio: 2.8 / 4,
    );
  }
}
