import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.mainAxisAlignment, required this.rating, required this.ratingCount});

  final num rating;
  final int ratingCount;

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        const SizedBox(width: 6.3,),
         Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5,),
        Text(
          '($ratingCount)',
          style: Styles.textStyle14.copyWith(color: Colors.grey,),
        )
      ],
    );
  }
}