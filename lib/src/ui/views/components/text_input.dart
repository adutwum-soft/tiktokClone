import 'package:flutter/material.dart';
import 'package:tiktokclone/src/res/colors.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextStyle style;
  final bool isObscure;
  final IconData icon;

  const TextInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.style = const TextStyle(fontSize: 20),
    this.isObscure = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: style,
        enabledBorder: outlineInputeBorder(),
        focusedBorder: outlineInputeBorder(),
      ),
      obscureText: isObscure,
    );
  }

  OutlineInputBorder outlineInputeBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: AppColors.borderColor,
      ),
    );
  }
}
