import 'dart:async';
import 'package:flutter/material.dart';
import 'constant.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, homepage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.grey,
            Color(0xffde2f2f),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Image.asset("images/logo.webp", width: 200, height: 200),
        ),
      ),
    );
  }
}