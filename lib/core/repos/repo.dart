import 'package:bookly_app/Features/data/book_model/book_model.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

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
