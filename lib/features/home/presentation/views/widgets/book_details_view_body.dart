import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list.dart';
import 'package:flutter/material.dart';

import 'book_action.dart';
import 'book_details_app_bar.dart';
import 'custom_list_view_item.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const BookDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .2),
              child: CustomListViewItem(
                imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              bookModel.volumeInfo.title!,
              style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Opacity(
              opacity: .7,
              child: Text(
                bookModel.volumeInfo.authors![0],
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
              rating: bookModel.volumeInfo.averageRating??0,
              ratingCount: bookModel.volumeInfo.ratingsCount??0,
            ),
            const SizedBox(
              height: 15,
            ),
            BooksAction(bookModel: bookModel,),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'you can also like',
                style: Styles.textStyle14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SimilarBooksList(),
          ],
        ),
      ),
    );
  }
}
