part of 'fetch_search_books_cubit.dart';

sealed class FetchSearchBookState extends Equatable {
  const FetchSearchBookState();

  @override
  List<Object> get props => [];
}

final class FetchSearchBookStateInitial extends FetchSearchBookState {}

final class FetchSearchBookStateLoading extends FetchSearchBookState {}

final class FetchSearchBookStateSuccess extends FetchSearchBookState {
  final List<BookModel> bookModel;
  const FetchSearchBookStateSuccess(this.bookModel);
}

final class FetchSearchBookStateFailure extends FetchSearchBookState {
  final String errMessage;

  const FetchSearchBookStateFailure(this.errMessage);
}
