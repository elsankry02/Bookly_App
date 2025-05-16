part of 'get_fetch_similar_books_cubit.dart';

sealed class GetFetchSimilarBooksState extends Equatable {
  const GetFetchSimilarBooksState();

  @override
  List<Object> get props => [];
}

final class GetFetchSimilarBooksInitial extends GetFetchSimilarBooksState {}

final class GetFetchSimilarBooksLoading extends GetFetchSimilarBooksState {}

final class GetFetchSimilarBooksSuccess extends GetFetchSimilarBooksState {
  final List<BookModel> books;

  const GetFetchSimilarBooksSuccess(this.books);
}

final class GetFetchSimilarBooksFailure extends GetFetchSimilarBooksState {
  final String errMessage;

  const GetFetchSimilarBooksFailure(this.errMessage);
}
