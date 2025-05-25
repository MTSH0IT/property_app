import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TypeProperty extends StatefulWidget {
  const TypeProperty({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  State<TypeProperty> createState() => _TypePropertyState();
}

class _TypePropertyState extends State<TypeProperty> {
  String selectedType = 'add_property.type.sale'.tr();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = 'add_property.type.sale'.tr();
                  widget.onChanged(selectedType);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color:
                      selectedType == 'add_property.type.sale'.tr()
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'add_property.type.sale'.tr(),
                    style: TextStyle(
                      color:
                          selectedType == 'add_property.type.sale'.tr()
                              ? Colors.white
                              : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = 'add_property.type.rent'.tr();
                  widget.onChanged(selectedType);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color:
                      selectedType == 'add_property.type.rent'.tr()
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'add_property.type.rent'.tr(),
                    style: TextStyle(
                      color:
                          selectedType == 'add_property.type.rent'.tr()
                              ? Colors.white
                              : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
