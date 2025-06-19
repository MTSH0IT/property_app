import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/utils/const.dart';
import 'package:property_app/features/property_details/presentation/views/property_details_view.dart';

class FooterCardProperty extends StatelessWidget {
  const FooterCardProperty({super.key, required this.property});

  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${'property_details.price'.tr()}  ${property.price}'
          r" $",
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
            Navigator.pushNamed(
              context,
              PropertyDetailsView.routeName,
              arguments: property,
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new, size: 14),
          label: Text('property_details.details'.tr()),
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
            ),
            foregroundColor: kPrimaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
        ),
      ],
    );
  }
}
