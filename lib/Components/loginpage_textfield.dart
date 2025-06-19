import 'package:flutter/material.dart';

class LoginpageTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon;

  const LoginpageTextfield({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
