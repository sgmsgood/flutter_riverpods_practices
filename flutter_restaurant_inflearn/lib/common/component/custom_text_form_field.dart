import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final ValueChanged<String>? onChange;

  const CustomTextFormField(
      {required this.onChange,
      this.hintText,
      this.errorText,
      this.obscureText = false,
      this.autoFocus = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return TextFormField(
      obscureText: true,
      autofocus: false,
      cursorColor: PRIMARY_COLOR,
      onChanged: (v) {},
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14,
        ),
        fillColor: INPUT_BG_COLOR,
        filled: true,
        border: baseBorder,
        focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(color: PRIMARY_COLOR)),
      ),
    );
  }
}
