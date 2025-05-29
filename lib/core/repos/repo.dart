import 'package:dartz/dartz.dart';

import '../../features/home_page/data/book_model/book_model.dart';
import '../error/failures.dart';

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
