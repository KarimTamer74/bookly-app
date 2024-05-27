import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class ListViewOfBooksItem extends StatelessWidget {
  const ListViewOfBooksItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .28,
      child: ListView.builder(
          physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: AssetsData.booksList.length,
          itemBuilder: (context, index) {
            return BookItem(index: index);
          }),
    );
  }
}
