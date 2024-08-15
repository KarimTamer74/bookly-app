import '../../../../../core/utils/stayles.dart';
import 'custom_search_text_field.dart';
import 'search_result.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .03),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomSearchTextField(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
          ),
          const SliverToBoxAdapter(
              child: Text(
            'Search Results',
            style: Styles.textStyle18,
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
          ),
          const SearchResult()
        ],
      ),
    );
  }
}
