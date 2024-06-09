import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/stayles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/horizontal_list_view_of_books_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cartIcon;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 15),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_sharp,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {}, icon: Image.asset(AssetsData.cartIcon)),
            ],
          ),
          SizedBox(
            height: 33.sp,
          ),
          const SizedBox(
              height: 230,
              child: CustomBookImage(index: 0, aspectRatio: 2 / 3)),
          SizedBox(
            height: 33.sp,
          ),
          const Text(
            'The Jungle Book',
            style:
                TextStyle(fontSize: 30, fontFamily: 'GT Sectra Fine Regular'),
          ),
          SizedBox(
            height: 4.sp,
          ),
          Text('Rudyard Kipling',
              style:
                  Styles.textStyle18.copyWith(color: const Color(0xff707070))),
          SizedBox(
            height: 4.sp,
          ),
          const BookRating(),
          SizedBox(
            height: 25.sp,
          ),
          Row(
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
          SizedBox(
            height: 20.sp,
          ),
          Text(
            'You can also like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10.sp,
          ),
          // ignore: prefer_const_constructors
          HorizontalListViewOfBooksItem(
            height: .12,
          )
        ],
      ),
    );
  }
}
