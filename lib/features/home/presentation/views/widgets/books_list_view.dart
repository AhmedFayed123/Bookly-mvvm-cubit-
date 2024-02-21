import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_cubit/featured_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_cubit/featured_state.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/home_repo_implement.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeaturedState>(
        builder: (BuildContext context, state) {
      if (state is FeaturedSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      BlocProvider(
                          create: (context) => SimilarBooksCubit(
                                getIt.get<HomeRepoImplement>(),
                              ),
                          child: BookDetailsView(bookModel: state.books[index])),
                    );
                  },
                  child: CustomListViewItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                )),
          ),
        );
      } else if (state is FeaturedFailure) {
        return CustomError(errorMessage: state.errorMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
