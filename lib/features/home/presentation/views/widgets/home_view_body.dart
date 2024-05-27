import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/list_view_of_books_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 30, top: 15, bottom: 15),
      child: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const ListViewOfBooksItem(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
