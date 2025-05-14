import 'package:flutter/material.dart';
import 'package:property_app/core/utils/const.dart';

class FooterCardProperty extends StatelessWidget {
  const FooterCardProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '200.000 دولر',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new, size: 14),
          label: const Text('عرض التفاصيل'),
          style: TextButton.styleFrom(
            foregroundColor: kPrimaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
        ),
      ],
    );
  }
}
