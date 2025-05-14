import 'package:flutter/material.dart';

class LocationProprty extends StatelessWidget {
  const LocationProprty({super.key, required this.city, required this.county});

  final String city;
  final String county;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          ' $city : $county',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
      ],
    );
  }
}
