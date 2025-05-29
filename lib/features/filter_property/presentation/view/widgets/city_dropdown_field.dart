import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CityDropdownField extends StatelessWidget {
  const CityDropdownField({
    super.key,
    required this.selectedCity,
    required this.onChanged,
  });

  final String? selectedCity;
  final ValueChanged<String?> onChanged;

  static const List<String> cities = [
    'دمشق',
    'حلب',
    'حمص',
    'حماة',
    'اللاذقية',
    'طرطوس',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCity,
      hint: Text(
        'add_property.chooseCity'.tr(),
        style: const TextStyle(color: Colors.black),
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      items:
          cities.map((String city) {
            return DropdownMenuItem<String>(value: city, child: Text(city));
          }).toList(),
      onChanged: onChanged,
    );
  }
}
