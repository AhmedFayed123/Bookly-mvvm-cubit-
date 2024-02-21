import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context,index)=> const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text('data'),
        // child: BestSellerListViewItem(),
      ),
    );;
  }
}
