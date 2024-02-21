import 'package:bookly_app/features/home/presentation/manager/newese_cubit/newest_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newese_cubit/newest_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<NewestCubit,NewestState>(
      builder: (BuildContext context, state) {  
        if(state is NewestSuccess){
          return ListView.builder(
            shrinkWrap: true,
            physics:  const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context,index)=>  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: BestSellerListViewItem(bookModel: state.books[index],),
            ),
          );
        }else if(state is NewestFailure){
          return CustomError(errorMessage: state.errorMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
