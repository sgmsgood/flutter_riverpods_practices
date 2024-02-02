import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/common/component/custom_text_form_field.dart';

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
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                hintText: '이메일을 입력해주세요',
                onChange: (String value) {},
              ),
              CustomTextFormField(
                hintText: '비밀번호를 입력해주세요',
                onChange: (String value) {},
                obscureText: true,
              ),
            ],
          )),
    );
  }
}
