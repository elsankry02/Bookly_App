import '../../models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/home_repo.dart';

part 'newest_books_state.dart';

class NewsetBooksCubit extends Cubit<NewestBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> getFetchNewsetBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewSetBooks();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(NewestBooksSuceess(books));
      },
    );
  }
}
