import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/data/models/book/books_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET('volumes?q=programming')
  Future<BooksResponse> getBooks();
}
