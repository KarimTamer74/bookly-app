// core/utils/route.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import '../../features/home/presentation/view_models/cubits/similar_books_cubit/similar_books_cubit.dart';
import '../../features/home/presentation/views/book_details.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'service_locator.dart';

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
        BookEntity book = settings.arguments as BookEntity;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FetchSimilarBooksCubit>(),
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
