import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: AssetsData.booksList.length, (context, index) {
        return const Text('');
        // BookItem()
      }),
    );
  }
}
