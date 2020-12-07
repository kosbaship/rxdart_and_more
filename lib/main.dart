import 'package:first_blog_post/blocs/bloc.dart';
import 'package:first_blog_post/screens/home/home_screen.dart';
import 'package:first_blog_post/shared/colors/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// create instance when we use it for first time
void setupLocator() {
  GetIt.I.registerLazySingleton(() => BlocPostModel());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Post',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: kColorWhite,
          displayColor: kColorWhite,
        ),
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.dark,
        primaryColor: kColorThree,
        accentColor: kColorOne,
        backgroundColor: kColorTwo,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: HomeScreen(),
    );
  }
}
