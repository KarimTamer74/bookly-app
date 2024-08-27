import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/stayles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});
  
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
        const Text('4.8', style: Styles.textStyle16),
        SizedBox(
          width: 3.sp,
        ),
        Text('(2390)',
            style: Styles.textStyle14
                .copyWith(color: Colors.white.withOpacity(.5))),
      ],
    );
  }
}
