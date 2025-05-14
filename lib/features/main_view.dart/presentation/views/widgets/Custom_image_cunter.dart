import 'package:flutter/material.dart';

class CustomImgeCunter extends StatelessWidget {
  const CustomImgeCunter({
    super.key,
    required int current,
    required this.imageNumper,
  }) : _current = current;

  final int _current;
  final int imageNumper;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${_current + 1}/$imageNumper',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
