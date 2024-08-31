import 'book.dart';

class BookResponse {
  final List<Book>? items;
  final int? totalItems;
  final String? kind;

  BookResponse({this.items, this.totalItems, this.kind});
  factory BookResponse.fromJson(json) {
    return BookResponse(
      kind: json['kind'],
      totalItems: json['totalItems'],
      items: (json['items'] as List?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
