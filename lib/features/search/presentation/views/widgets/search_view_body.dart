import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(
          30,
        ),
        child: Column(
          children: [
            SearchTextField(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search Results : ',
                  style: Styles.textStyle30,
                ),
              ),
            ),
            SearchResult(),
          ],
        ),
      ),
    );
  }
}
