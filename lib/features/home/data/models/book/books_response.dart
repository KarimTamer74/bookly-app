import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_response.g.dart';

@JsonSerializable()
class BooksResponse {
  List<Book>? books;
  BooksResponse({this.books});
  factory BooksResponse.fromJson(Map<String, dynamic> json) =>
      _$BooksResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BooksResponseToJson(this);
}
