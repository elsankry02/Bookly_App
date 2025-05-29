import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_page/data/book_model/book_model.dart';
import '../../../../core/repos/repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(GetFetchSimilarBooksInitial());
  final Repo homeRepo;
  Future<void> getFetchSimilarBooksCubit({required String category}) async {
    emit(GetFetchSimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(GetFetchSimilarBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(GetFetchSimilarBooksSuccess(books));
      },
    );
  }
}
