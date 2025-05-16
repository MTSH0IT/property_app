import 'package:flutter/material.dart';

class AdditionalFeatures extends StatelessWidget {
  const AdditionalFeatures({super.key, required this.feature});
  final String feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, size: 16, color: Colors.green),
          const SizedBox(width: 4),
          Text(
            feature,
            style: TextStyle(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
