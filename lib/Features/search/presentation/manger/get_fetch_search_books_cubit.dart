import '../../../home/data/models/book_model/book_model.dart';
import '../../data/repos/search_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_fetch_search_books_state.dart';

class FetchSearchBookCubit extends Cubit<FetchSearchBookState> {
  FetchSearchBookCubit(this.searchRepo) : super(FetchSearchBookStateInitial());
  final SearchRepo searchRepo;
  Future<void> getFetchSimilarBooksCubit({required String category}) async {
    emit(FetchSearchBookStateLoading());
    var result = await searchRepo.fetchSearchBooks(category: category);
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
