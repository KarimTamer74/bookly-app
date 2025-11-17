// features/home/domain/entities/book_entity.dart
import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String selfLink;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final List<String> authors;
  @HiveField(4)
  final String publishedDate;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final int pageCount;
  @HiveField(7)
  final List<String> categories;
  @HiveField(8)
  final String maturityRating;
  @HiveField(9)
  final String smallThumbnail;
  @HiveField(10)
  final String thumbnail;
  @HiveField(11)
  final String language;
  @HiveField(12)
  final String previewLink;
  @HiveField(13)
  final String infoLink;
  @HiveField(14)
  final num ratingsCount;
  @HiveField(15)
  final num averageRating;

  BookEntity({
    required this.id,
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
    required this.averageRating,
  });
}
