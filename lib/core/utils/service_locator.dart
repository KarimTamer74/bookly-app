// core/utils/service_locator.dart
import 'package:bookly_app/core/network/dio_factory.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_newest_books_usecase.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_similar_books_usecase.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/remote_data_source/api_services.dart';
import '../../features/home/data/repository_impl/home_repo_implementation.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => DioFactory().dio);
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));

  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepoImplementation(getIt<ApiServices>()));

  getIt.registerLazySingleton<FetchFeaturedBooksUsecase>(
      () => (FetchFeaturedBooksUsecase(
            getIt<HomeRepo>(),
          )));

  getIt.registerLazySingleton<FetchSimilarBooksUsecase>(
      () => (FetchSimilarBooksUsecase(
            getIt<HomeRepo>(),
          )));

  getIt.registerLazySingleton<FetchNewestBooksUsecase>(
      () => (FetchNewestBooksUsecase(
            getIt<HomeRepo>(),
          )));

  getIt.registerLazySingleton<FeaturedBooksCubit>(
      () => (FeaturedBooksCubit(getIt<FetchFeaturedBooksUsecase>())));

  getIt.registerLazySingleton<FetchSimilarBooksCubit>(
      () => (FetchSimilarBooksCubit(
            getIt<FetchSimilarBooksUsecase>(),
          )));

  getIt.registerLazySingleton<FeaturedNewestBooksCubit>(
      () => (FeaturedNewestBooksCubit(
            getIt<FetchNewestBooksUsecase>(),
          )));
}
