import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_fetch_similar_books_state.dart';

class GetFetchSimilarBooksCubit extends Cubit<GetFetchSimilarBooksState> {
  GetFetchSimilarBooksCubit(this.homeRepo)
    : super(GetFetchSimilarBooksInitial());
  final HomeRepo homeRepo;
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
