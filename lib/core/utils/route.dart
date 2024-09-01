import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repository/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/book/book.dart';
import '../../features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../features/home/presentation/views/book_details.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case homeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case bookDetailsView:
        Book book = settings.arguments as Book;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                FetchSimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
            child: BookDetailsView(book: book),
          ),
        );
      case searchView:
        return MaterialPageRoute(
          builder: (_) => const SearchView(),
        );
    }

    return null;
  }
}
