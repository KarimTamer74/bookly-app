// features/home/domain/entities/book_entity.dart

class BookEntity {
  final String? id;
  final String? selfLink;
  final String? title;
  final List<String>? authors;
  final String? publishedDate;
  final String? description;

  final int? pageCount;
  final List<String>? categories;
  final String? maturityRating;
  final String? smallThumbnail;
  final String? thumbnail;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final num? ratingsCount;
  final num? averageRating;

  BookEntity(
      {required this.id,
      required this.selfLink,
      required this.title,
      required this.authors,
      required this.publishedDate,
      required this.description,
      required this.pageCount,
      required this.categories,
      required this.maturityRating,
      required this.smallThumbnail,
      required this.thumbnail,
      required this.language,
      required this.previewLink,
      required this.infoLink,
      required this.ratingsCount,
      required this.averageRating});
}
