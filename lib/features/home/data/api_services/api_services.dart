import 'package:bookly_app/features/home/data/models/book/book_response.dart';
import 'package:dio/dio.dart';

import '../../../../constants.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET('volumes?q=programming')
  Future<BookResponse> getBooks();
  @GET('volumes?Sorting=newest &q=english')
  
  Future<BookResponse> fetechNewestBooks();
}
