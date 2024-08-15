import 'package:bookly_app/features/home/data/models/book/book.dart';

import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<Book>>> fetchFeaturedBooks();

 Future<Either<Failure, List<Book>>>  fetechNewestBooks();
}
