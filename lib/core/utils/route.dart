import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repository/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/featured_newest_books/featured_newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())),
              BlocProvider(
                  create: (context) => FeaturedNewestBooksCubit(getIt.get<HomeRepoImplementation>())),
            ],
            child: const HomeView(),
          ),
        );
      case bookDetailsView:
        return MaterialPageRoute(builder: (_) => const BookDetailsView());
    }

    return null;
  }
}
