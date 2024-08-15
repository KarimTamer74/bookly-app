import '../../../../../core/utils/assets.dart';
import 'book_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: AssetsData.booksList.length, (context, index) {
        return BookItem(index: index);
      }),
    );
  }
}
