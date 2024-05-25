import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/book_logo.png',
          width: 70.sp,
          height: 70.sp,
        ),
        Image.asset(AssetsData.logo),
        Text('Read more, discover more',
            textAlign: TextAlign.center,
            style: GoogleFonts.padyakkeExpandedOne()),
      ],
    );
  }
}
