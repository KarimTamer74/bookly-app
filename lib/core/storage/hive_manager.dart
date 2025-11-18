// core/storage/hive_manager.dart
import 'dart:developer';

import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveManager {
  static bool _initialized = false;

  static late final Box<BookEntity> _featuredBox;
  static late final Box<BookEntity> _newestBox;
  static late final Box<BookEntity> _similarBox;

  /// Initialize Hive & register adapter & open boxes
  static Future<void> init() async {
    if (_initialized) return;

    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);

    log("Hive initialized at ${appDir.path}");

    // IMPORTANT: Register adapters before opening boxes
    _registerAdapters();

    _featuredBox = await Hive.openBox<BookEntity>(featuredBox);
    _newestBox = await Hive.openBox<BookEntity>(newestBox);
    _similarBox = await Hive.openBox<BookEntity>(similarBox);

    _initialized = true;
  }

  static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(BookEntityAdapter());
    }
  }

  /// Save list safely — clear the box first
  static Future<void> setBooks({
    required String boxName,
    required List<BookEntity> books,
  }) async {
    final box = Hive.box<BookEntity>(boxName);
    await box.addAll(books);

    log("Box '$boxName' saved with ${books.length} items");
  }

  /// Retrieve cached books
  static List<BookEntity> getBooks(String boxName) {
    final box = Hive.box<BookEntity>(boxName);
    final books = box.values.toList();

    log("Box '$boxName' returned ${books.length} books");

    return books;
  }

  /// Clear a specific box
  static Future<void> clearBox(String boxName) async {
    await Hive.box(boxName).clear();
    log("Box '$boxName' cleared");
  }

  /// Close Hive
  static Future<void> close() async {
    await Hive.close();
    _initialized = false;
  }
}
