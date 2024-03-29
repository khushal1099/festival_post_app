import 'package:festival_post_app/splash_screen.dart';
import 'package:festival_post_app/text_page.dart';
import 'package:festival_post_app/util.dart';
import 'package:flutter/material.dart';
import 'background_image.dart';
import 'constant.dart';
import 'discription_page.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,

        routes:
        {
          "/":(context) => SplashScreen(),
          homepage:(context) => const MyHomePage(),
          background:(context)=> Background(),
          text:(context)=> Textpage(),
          disc:(context)=> Discpage(),
        }
    );
  }
}