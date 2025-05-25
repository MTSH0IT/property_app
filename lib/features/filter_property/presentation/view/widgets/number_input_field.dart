import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  const NumberInputField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: hintText,
      ),
      onChanged: onChanged,
    );
  }
}
