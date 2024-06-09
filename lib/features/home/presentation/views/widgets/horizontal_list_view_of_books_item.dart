import 'package:bookly_app/core/utils/assets.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class HorizontalListViewOfBooksItem extends StatelessWidget {
  const HorizontalListViewOfBooksItem({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: AssetsData.booksList.length,
          itemBuilder: (context, index) {
            return CustomBookImage(
              index: index,
              aspectRatio: 2.8 / 4,
            );
          }),
    );
  }
}
