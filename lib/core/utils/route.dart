import 'package:bookly_app/features/home/data/api_services/api_services.dart';
import 'package:bookly_app/features/home/data/repository/home_repo.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../features/home/presentation/views/book_details.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoute {
  late FeaturedBooksCubit featuredBooksCubit;
  late HomeRepo homeRepo;
  late ApiServices apiServices;
  AppRoute() {
    apiServices = ApiServices(Dio());

    featuredBooksCubit = FeaturedBooksCubit(homeRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case homeView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => featuredBooksCubit,
                  child: const HomeView(),
                ));
      case bookDetailsView:
        return MaterialPageRoute(builder: (_) => const BookDetailsView());
    }

    return null;
  }
}
