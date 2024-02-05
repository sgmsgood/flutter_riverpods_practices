import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/common/component/custom_text_form_field.dart';
import 'package:flutter_restaurant_inflearn/common/view/splash_screen.dart';
import 'package:flutter_restaurant_inflearn/user/view/login_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: SplashScreen()
    );
  }
}
