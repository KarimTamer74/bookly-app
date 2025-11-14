// features/home/presentation/views/widgets/book_rating.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/stayles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          size: 24,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 1.sp,
        ),
        Text(
            book.volumeInfo!.averageRating != null
                ? '${book.volumeInfo!.averageRating!}'
                : '4.8',
            style: Styles.textStyle16
                .copyWith(color: Colors.white.withOpacity(.5))),
        SizedBox(
          width: 3.sp,
        ),
        Text(
          book.volumeInfo!.averageRating != null
              ? '(${book.volumeInfo!.ratingsCount!})'
              : '(3200)',
          style: Styles.textStyle16.copyWith(
              color: Colors.white.withOpacity(
            .5,
          )),
        ),
      ],
    );
  }
}
