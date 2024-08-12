import 'package:bookly_app/core/utils/stayles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/horizontal_list_view_of_books_item.dart';
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
          HorizontalListViewOfBooksItem(
            height: .12,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
