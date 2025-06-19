import 'package:flutter/material.dart';

class AddEventTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final IconData? prefixIcon;

  const AddEventTextfield({
    super.key,
    required this.textEditingController,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "Add new event",
          prefixIcon: Icon(prefixIcon),
        ),
      ),
    );
  }
}
