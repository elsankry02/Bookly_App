part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuceess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuceess(this.books);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksFailure(this.errMessage);
}
