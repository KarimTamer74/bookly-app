// features/home/domain/entities/volume_info_entity.dart

import 'package:bookly_app/features/home/domain/entities/image_links_entity.dart';

class VolumeInfoEntity {
  final String? title;
  final List<String>? authors;
  final String? publishedDate;
  final String? description;

  final int? pageCount;
  final List<String>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;

  final ImageLinksEntity? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;

  final num? ratingsCount;
  final num? averageRating;

  const VolumeInfoEntity(
      {required this.title,
      required this.authors,
      required this.publishedDate,
      required this.description,
      required this.pageCount,
      required this.categories,
      required this.maturityRating,
      required this.allowAnonLogging,
      required this.imageLinks,
      required this.language,
      required this.previewLink,
      required this.infoLink,
      required this.ratingsCount,
      required this.averageRating});
}
