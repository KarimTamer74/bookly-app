// features/home/data/mappers/home_mapper.dart
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/models/book/image_links.dart';
import 'package:bookly_app/features/home/data/models/book/volume_info.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/entities/image_links_entity.dart';
import 'package:bookly_app/features/home/domain/entities/volume_info_entity.dart';

class HomeMapper {
  static BookEntity toBookEntity(Book bookModel) {
    return BookEntity(
        kind: bookModel.kind,
        id: bookModel.id,
        etag: bookModel.etag,
        selfLink: bookModel.selfLink,
        volumeInfo: toVolumeInfoEntity(bookModel.volumeInfo ?? VolumeInfo()));
  }

  static VolumeInfoEntity toVolumeInfoEntity(VolumeInfo volumeInfo) {
    return VolumeInfoEntity(
        title: volumeInfo.title,
        authors: volumeInfo.authors,
        publishedDate: volumeInfo.publishedDate,
        description: volumeInfo.description,
        pageCount: volumeInfo.pageCount,
        categories: volumeInfo.categories,
        maturityRating: volumeInfo.maturityRating,
        allowAnonLogging: volumeInfo.allowAnonLogging,
        imageLinks: toImageLinksEntity(volumeInfo.imageLinks ?? ImageLinks()),
        language: volumeInfo.language,
        previewLink: volumeInfo.previewLink,
        infoLink: volumeInfo.infoLink,
        ratingsCount: volumeInfo.ratingsCount,
        averageRating: volumeInfo.averageRating);
  }

  static ImageLinksEntity toImageLinksEntity(ImageLinks imageLinks) {
    return ImageLinksEntity(
        smallThumbnail: imageLinks.smallThumbnail,
        thumbnail: imageLinks.thumbnail);
  }
}
