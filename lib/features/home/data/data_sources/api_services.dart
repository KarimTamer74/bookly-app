// features/home/data/remote_data_source/api_services.dart
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/utils/constants.dart';
import '../models/book/book_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET('volumes?q=programming')
  Future<BookResponse> fetechFeaturedBooks();
  @GET('volumes?q=english&filtering=free')
  Future<BookResponse> fetechNewestBooks();
  @GET('volumes?q=english&filtering=free&sorting=relevance')
  Future<BookResponse> fetechSimilarBooks();
}
