import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:property_app/core/helper_functions/launchURL.dart';

class CardCall extends StatelessWidget {
  const CardCall({super.key, required this.phone, required this.price});
  final String phone;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'property_details.price'.tr(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '$price'
                r"$",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.deepPurple,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                buildlaunchURL(context, 'tel:$phone');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'property_details.call'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
