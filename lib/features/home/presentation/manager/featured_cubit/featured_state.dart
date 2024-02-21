import '../../../data/models/book_model/book_model.dart';

abstract class FeaturedState{}

class FeaturedInitial extends FeaturedState{}
class FeaturedLoading extends FeaturedState{}
class FeaturedFailure extends FeaturedState{
  final String errorMessage;

  FeaturedFailure(this.errorMessage);
}
class FeaturedSuccess extends FeaturedState{
  final List<BookModel> books;

  FeaturedSuccess(this.books);
}
