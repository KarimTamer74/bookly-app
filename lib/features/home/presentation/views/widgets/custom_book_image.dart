import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.index,
    required this.aspectRatio,
    required this.book,
  });
  final int index;
  final double aspectRatio;
  final Book book;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(book.volumeInfo!.imageLinks!.thumbnail!),
            ),
          ),
        ));
  }
}
