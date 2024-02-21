import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'custom_list_view_item.dart';

class SimilarBooksList extends StatelessWidget {
  const SimilarBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (BuildContext context, state) {
          if (state is SimilarBooksSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomListViewItem(imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail,)),
              ),
            );
          } else if (state is SimilarBooksFailure) {
            return CustomError(errorMessage: state.errorMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        });

  }
}
