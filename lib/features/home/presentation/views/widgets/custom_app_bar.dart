import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/assets_data.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:40,bottom: 20 ),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 20,
            color: Colors.white,
          ),
          const Spacer(),
          IconButton(
            onPressed: ()=>Get.to(const SearchView()),
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
