import '../models/book/book_response.dart';
import 'package:dio/dio.dart';

import '../../../../constants.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET('volumes?q=english')
  Future<BookResponse> fetechFeaturedBooks();
  @GET('volumes?q=english&filtering=free')
  Future<BookResponse> fetechNewestBooks();
  @GET('volumes?q=english&filtering=free&sorting=relevance')
  Future<BookResponse> fetechSimilarBooks();

}
