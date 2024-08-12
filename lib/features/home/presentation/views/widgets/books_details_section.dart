import 'package:bookly_app/core/utils/stayles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_books_details_appbar.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBooksDetailsAppBar(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const SizedBox(
          height: 230,
          child: CustomBookImage(index: 0, aspectRatio: 2 / 3),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        const Text(
          'The Jungle Book',
          style: TextStyle(fontSize: 30, fontFamily: 'GT Sectra Fine Regular'),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text('Rudyard Kipling',
            style: Styles.textStyle18.copyWith(color: const Color(0xff707070))),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const BookRating(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 48,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Center(
                  child: Text(
                    '19.99€',
                    style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 48,
                decoration: const BoxDecoration(
                    color: Color(0xffEF8262),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Center(
                  child: Text(
                    'Free preview',
                    style:
                        Styles.textStyle16.copyWith(fontFamily: 'Gilroy-Bold'),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
