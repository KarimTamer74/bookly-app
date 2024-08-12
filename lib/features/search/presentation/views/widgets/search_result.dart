import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: AssetsData.booksList.length, (context, index) {
        return BookItem(index: index);
      }),
    );
    ;
  }
}