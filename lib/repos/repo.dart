import 'package:dartz/dartz.dart';

import '../core/error/failures.dart';
import '../models/book_model/book_model.dart';

abstract class Repo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewSetBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String endPoint,
  });
}
