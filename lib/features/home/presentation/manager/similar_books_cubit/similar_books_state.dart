import '../../../data/models/book_model/book_model.dart';

abstract class SimilarBooksState{}

class SimilarBooksInitial extends SimilarBooksState{}
class SimilarBooksLoading extends SimilarBooksState{}
class SimilarBooksFailure extends SimilarBooksState{
  final String errorMessage;

  SimilarBooksFailure(this.errorMessage);
}
class SimilarBooksSuccess extends SimilarBooksState{
  final List<BookModel> books;

  SimilarBooksSuccess(this.books);
}