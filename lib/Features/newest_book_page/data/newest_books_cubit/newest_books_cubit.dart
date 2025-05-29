import 'package:bookly_app/core/repos/repo.dart';
import 'package:bookly_app/features/home_page/data/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewsetBooksCubit extends Cubit<NewestBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final Repo homeRepo;
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
