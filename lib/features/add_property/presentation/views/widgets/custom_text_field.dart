import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onPressed,
    required this.title,
  });
  final TextEditingController? controller;
  final Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
        hintText: title,
        suffixIcon: IconButton(icon: Icon(Icons.add), onPressed: onPressed),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),

      borderSide: const BorderSide(width: 1, color: Colors.blue),
    );
  }
}
