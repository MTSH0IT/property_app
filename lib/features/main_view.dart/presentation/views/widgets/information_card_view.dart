import 'package:flutter/material.dart';

class InformationCardView extends StatelessWidget {
  const InformationCardView({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });
  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueGrey),
        SizedBox(width: 8),
        Text(title),
        Text(" : "),
        SizedBox(width: 8),
        Text(data),
      ],
    );
  }
}
