import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_cubit/featured_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  FeaturedCubit(this.homeRepos) : super(FeaturedInitial());

  final HomeRepos homeRepos;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedLoading());
    var result = await homeRepos.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedSuccess(books));
    });

  }
}
