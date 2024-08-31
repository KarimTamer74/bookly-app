import '../../features/home/data/api_services/api_services.dart';
import '../../features/home/data/repository/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  
  getIt.registerLazySingleton<HomeRepoImplementation>(
      () => HomeRepoImplementation(getIt.get<ApiServices>()));

  getIt.registerLazySingleton<ApiServices>(() => ApiServices(Dio()));

}
