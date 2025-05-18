import 'package:bookly_app/repos/repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/book_model/book_model.dart';

part 'fetch_search_books_state.dart';

class FetchSearchBookCubit extends Cubit<FetchSearchBookState> {
  FetchSearchBookCubit(this.homeRepo) : super(FetchSearchBookStateInitial());
  final Repo homeRepo;
  Future<void> getFetchSimilarBooksCubit({required String endPoint}) async {
    emit(FetchSearchBookStateLoading());
    var result = await homeRepo.fetchSearchBooks(endPoint: endPoint);
    result.fold(
      (failure) {
        emit(FetchSearchBookStateFailure(failure.errorMessage));
      },
      (books) {
        emit(FetchSearchBookStateSuccess(books));
      },
    );
  }
}
