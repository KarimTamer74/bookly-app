import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/presentation/views/book_details.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case bookDetailsView:
        return MaterialPageRoute(builder: (_) => const BookDetailsView());
    }

    return null;
  }
}
