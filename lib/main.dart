import 'constants.dart';
import 'core/utils/route.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BooklyApp(
    appRoute: AppRoute(),
  ));
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key, required this.appRoute});
  final AppRoute appRoute;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          home: const SplashView(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoute.generateRoute,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme:
                  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        ));
  }
}
