import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../features/home/presentation/views/book_details.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case homeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case bookDetailsView:
        Book book = settings.arguments as Book;
        return MaterialPageRoute(
            builder: (_) =>  BookDetailsView(book: book));
      case searchView:
        return MaterialPageRoute(builder: (_) => const SearchView());
    }

    return null;
  }
}
