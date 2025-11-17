// core/usecases/app_use_case.dart
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<R> {
  Future<Either<Failure, R>> call();
}
