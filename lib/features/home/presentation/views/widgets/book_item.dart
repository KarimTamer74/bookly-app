import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/stayles.dart';
import 'book_rating.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.book,
  });
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, bookDetailsView,
                      arguments: book);
                },
                child: CustomBookImage(
                  aspectRatio: 2.8 / 4,
                  book: book,
                )),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .48,
                    child: Text(
                      book.volumeInfo!.title!.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kSectraFineFontFamily),
                    ),
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  Text(
                    book.volumeInfo!.authors![0].toString(),
                    style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(.7)),
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const BookRating(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
