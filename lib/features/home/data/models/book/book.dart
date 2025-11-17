// features/home/data/models/book/book.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends BookEntity {
  String? kind;
  String? bookId;
  String? etag;
  String? bookSelfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;
  Book(
      {this.kind,
      this.bookId,
      this.etag,
      this.bookSelfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.searchInfo})
      : super(
            id: bookId ?? '',
            selfLink: bookSelfLink ?? '',
            title: volumeInfo?.title ?? 'No title',
            authors: volumeInfo?.authors ?? [],
            publishedDate: volumeInfo?.publishedDate ?? '',
            description: volumeInfo?.description ?? 'No description',
            pageCount: volumeInfo?.pageCount ?? 0,
            categories: volumeInfo?.categories ?? [],
            maturityRating: volumeInfo?.maturityRating ?? '',
            smallThumbnail: volumeInfo?.imageLinks?.smallThumbnail ?? '',
            thumbnail: volumeInfo?.imageLinks?.thumbnail ?? '',
            language: volumeInfo?.language ?? '',
            previewLink: volumeInfo?.previewLink ?? '',
            infoLink: volumeInfo?.infoLink ?? '',
            ratingsCount: volumeInfo?.ratingsCount ?? 0,
            averageRating: volumeInfo?.averageRating ?? 0);
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
