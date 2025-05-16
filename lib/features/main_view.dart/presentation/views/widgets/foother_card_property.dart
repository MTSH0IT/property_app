import 'package:flutter/material.dart';
import 'package:property_app/core/utils/const.dart';
import 'package:property_app/features/property_details/presentation/views/property_details_view.dart';

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
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.deepPurple,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, PropertyDetailsView.routeName);
          },
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
