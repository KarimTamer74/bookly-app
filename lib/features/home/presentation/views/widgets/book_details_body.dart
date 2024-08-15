import '../../../../../core/utils/stayles.dart';
import 'books_details_section.dart';
import 'horizontal_list_view_of_books_item.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 15),
      child: ListView(
        children: [
          const BooksDetailsSection(),
          Expanded(
              child:
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1)),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          // ignore: prefer_const_constructors
          FeaturedBooksListView(
            height: .12,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
