import 'package:bookly_app/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_cubit/featured_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newese_cubit/newest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'core/utils/service_locator.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchNewestBook(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        home: const SplashView(),
      ),
    );
  }
}
