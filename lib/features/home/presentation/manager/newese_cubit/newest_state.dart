import '../../../data/models/book_model/book_model.dart';

abstract class NewestState{}

class NewestInitial extends NewestState{}
class NewestLoading extends NewestState{}
class NewestFailure extends NewestState{
  final String errorMessage;

  NewestFailure(this.errorMessage);
}
class NewestSuccess extends NewestState{
  final List<BookModel> books;

  NewestSuccess(this.books);
}
