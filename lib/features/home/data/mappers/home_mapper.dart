// features/home/data/mappers/home_mapper.dart
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

class HomeMapper {
  static BookEntity toBookEntity(Book bookModel) {
    return BookEntity(
        id: bookModel.id,
        selfLink: bookModel.selfLink,
        title: bookModel.volumeInfo?.title ?? 'No title',
        authors: bookModel.volumeInfo?.authors ?? [],
        publishedDate: bookModel.volumeInfo?.publishedDate ?? '',
        description: bookModel.volumeInfo?.description ?? 'No description',
        pageCount: bookModel.volumeInfo?.pageCount ?? 0,
        categories: bookModel.volumeInfo?.categories ?? [],
        maturityRating: bookModel.volumeInfo?.maturityRating ?? '',
        smallThumbnail: bookModel.volumeInfo?.imageLinks?.smallThumbnail ?? '',
        thumbnail: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
        language: bookModel.volumeInfo?.language ?? '',
        previewLink: bookModel.volumeInfo?.previewLink ?? '',
        infoLink: bookModel.volumeInfo?.infoLink ?? '',
        ratingsCount: bookModel.volumeInfo?.ratingsCount ?? 0,
        averageRating: bookModel.volumeInfo?.averageRating ?? 0);
  }

  // static VolumeInfoEntity toVolumeInfoEntity(VolumeInfo volumeInfo) {
  //   return VolumeInfoEntity(
  //       title: volumeInfo.title,
  //       authors: volumeInfo.authors,
  //       publishedDate: volumeInfo.publishedDate,
  //       description: volumeInfo.description,
  //       pageCount: volumeInfo.pageCount,
  //       categories: volumeInfo.categories,
  //       maturityRating: volumeInfo.maturityRating,
  //       allowAnonLogging: volumeInfo.allowAnonLogging,
  //       imageLinks: toImageLinksEntity(volumeInfo.imageLinks ?? ImageLinks()),
  //       language: volumeInfo.language,
  //       previewLink: volumeInfo.previewLink,
  //       infoLink: volumeInfo.infoLink,
  //       ratingsCount: volumeInfo.ratingsCount,
  //       averageRating: volumeInfo.averageRating);
  // }

  // static ImageLinksEntity toImageLinksEntity(ImageLinks imageLinks) {
  //   return ImageLinksEntity(
  //       smallThumbnail: imageLinks.smallThumbnail,
  //       thumbnail: imageLinks.thumbnail);
  // }
}
