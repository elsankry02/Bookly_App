part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class GetFetchSimilarBooksInitial extends SimilarBooksState {}

final class GetFetchSimilarBooksLoading extends SimilarBooksState {}

final class GetFetchSimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  const GetFetchSimilarBooksSuccess(this.books);
}

final class GetFetchSimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const GetFetchSimilarBooksFailure(this.errMessage);
}
