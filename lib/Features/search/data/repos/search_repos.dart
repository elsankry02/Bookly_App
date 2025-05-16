import '../../../../core/errora/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../home/data/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String category,
  });
}
