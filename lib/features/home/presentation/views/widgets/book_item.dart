// features/home/presentation/views/widgets/book_item.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/stayles.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.book,
  });
  final BookEntity book;
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
                Navigator.pushNamed(context, bookDetailsView, arguments: book);
              },
              child: CustomBookImage(
                aspectRatio: 2.8 / 4,
                book: book,
              ),
            ),
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                      BookRating(book: book),
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
