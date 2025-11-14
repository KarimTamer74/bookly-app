// features/home/domain/entities/book_entity.dart
import 'package:bookly_app/features/home/domain/entities/volume_info_entity.dart';

class BookEntity {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfoEntity? volumeInfo;

  BookEntity(
      {required this.kind,
      required this.id,
      required this.etag,
      required this.selfLink,
      required this.volumeInfo});
}
