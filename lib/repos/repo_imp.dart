import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../core/error/failures.dart';
import '../models/book_model/book_model.dart';
import '../services/api_service.dart';
import 'repo.dart';

class RepoImp implements Repo {
  final ApiService apiService;

  RepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewSetBooks() async {
    try {
      final data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=Computer science&Sorting=newest",
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=subject:Programming",
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=$category",
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String endPoint,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=$endPoint",
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
