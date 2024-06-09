import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/stayles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.index});
  final int index;
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
                  Navigator.pushNamed(context, 'BookDetails');
                },
                child: CustomBookImage(index: index, aspectRatio: 2.8 / 3.5)),
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
                      'Harry Potter and the Goblet of Fire',
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
                    'J.K. Rowling',
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
                        '19.99 €',
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
