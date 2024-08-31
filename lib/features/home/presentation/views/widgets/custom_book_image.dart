import '../../../data/models/book/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.aspectRatio,
    required this.book,
  });

  final double aspectRatio;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            strokeWidth: .5,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
        ),
      ),
    );
  }
}
