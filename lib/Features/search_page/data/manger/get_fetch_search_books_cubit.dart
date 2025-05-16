import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_page/data/models/book_model/book_model.dart';
import '../repos/search_repos.dart';

part 'get_fetch_search_books_state.dart';

class FetchSearchBookCubit extends Cubit<FetchSearchBookState> {
  FetchSearchBookCubit(this.searchRepo) : super(FetchSearchBookStateInitial());
  final SearchRepo searchRepo;
  Future<void> getFetchSimilarBooksCubit({required String endPoint}) async {
    emit(FetchSearchBookStateLoading());
    var result = await searchRepo.fetchSearchBooks(endPoint: endPoint);
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
