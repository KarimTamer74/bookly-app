import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/presentation/views/book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          home: const SplashView(),
          debugShowCheckedModeBanner: false,
          routes: {'BookDetails': (p0) => BookDetails()},
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme:
                  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        ));
  }
}
