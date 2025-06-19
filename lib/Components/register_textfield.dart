import 'package:flutter/material.dart';

class RegisterTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinText;
  final bool obscureText;
  final IconData? prefixIcon;

  const RegisterTextfield({
    super.key,
    required this.textEditingController,
    required this.hinText,
    required this.obscureText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          hintText: hinText,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(prefixIcon),
        ),
      ),
    );
  }
}
