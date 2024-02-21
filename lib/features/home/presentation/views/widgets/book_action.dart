import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book_button_action.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: BookButtonAction(
            text: bookModel.saleInfo!.saleability! == 'NOT_FOR_SALE'
                ? 'FREE'
                : 'Not Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            onPressed: () async {
              Uri uri = Uri.parse(bookModel.volumeInfo!.infoLink!);
              if (!await launchUrl(uri)) {
                throw Exception('Could not launch $uri');
              }
            },
          )),
          Expanded(
              child: BookButtonAction(
            fontSize: 16,
            text: 'Free Preview',
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            onPressed: () async {
              Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
              if (!await launchUrl(uri)) {
                throw Exception('Could not launch $uri');
              }
            },
          )),
        ],
      ),
    );
  }
}
