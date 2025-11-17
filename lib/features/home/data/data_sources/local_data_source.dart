// features/home/data/data_sources/local_data_source.dart
import 'package:bookly_app/core/storage/hive_manager.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class LocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();

  List<BookEntity> fetchSimilarBooks();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    List<BookEntity> books = HiveManager.getBooks(featuredBox);
    return books;
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    List<BookEntity> books = HiveManager.getBooks(newestBox);
    return books;
  }

  @override
  List<BookEntity> fetchSimilarBooks() {
    List<BookEntity> books = HiveManager.getBooks(similarBox);
    return books;
  }
}
