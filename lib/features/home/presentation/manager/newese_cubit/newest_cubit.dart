import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repos.dart';
import 'newest_state.dart';

class NewestCubit extends Cubit<NewestState> {
  NewestCubit(this.homeRepos) : super(NewestInitial());

  final HomeRepos homeRepos;

  Future<void> fetchNewestBook() async {
    emit(NewestLoading());
    var result = await homeRepos.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestFailure(failure.errMessage));
    }, (books){
      emit(NewestSuccess(books));
    });

  }
}
