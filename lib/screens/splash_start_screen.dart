import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/main.dart';

class SplashStatrScreen extends StatelessWidget {
  const SplashStatrScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EasySplashScreen(
          logo: Image.asset("assets/image/mi.jpg"),
          logoSize: 280,
          showLoader: true,
          navigator:const MyApp(),
          durationInSeconds: 5,
          loadingText: const Text('Loading ...'),
        ),
      ),
    );
  }
}