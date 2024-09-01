import '../../../../home/presentation/views/widgets/custom_sized_box.dart';
import 'custom_search_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/stayles.dart';
import 'search_result.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .03),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CustomSearchTextField(
              onTextChanged: (value) {
                setState(
                  () {
                    searchText = value; // تحديث النص المدخل
                  },
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomSizedBox(precentage: .08),
          ),
          const SliverToBoxAdapter(
              child: Text(
            'Search Results',
            style: Styles.textStyle18,
          )),
          const SliverToBoxAdapter(
            child: CustomSizedBox(precentage: .08),
          ),
          SliverFillRemaining(
            child: SearchResult(
              searchedBook: searchText,
            ),
          )
        ],
      ),
    );
  }
}
