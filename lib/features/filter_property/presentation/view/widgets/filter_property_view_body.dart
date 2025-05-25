import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:property_app/features/add_property/presentation/views/widgets/type_property.dart';
import 'package:property_app/features/filter_property/presentation/view/widgets/city_dropdown_field.dart';
import 'package:property_app/features/filter_property/presentation/view/widgets/number_input_field.dart';

class FilterPropertyViewBody extends StatefulWidget {
  const FilterPropertyViewBody({super.key});

  @override
  State<FilterPropertyViewBody> createState() => _FilterPropertyViewBodyState();
}

class _FilterPropertyViewBodyState extends State<FilterPropertyViewBody> {
  String selectedType = 'للبيع';
  RangeValues priceRange = const RangeValues(0, 1000000);
  int? minPrice;
  int? maxPrice;
  String? selectedCity;
  int? minRooms;
  int? minBedrooms;
  int? minBathrooms;
  int? minArea;
  int? maxArea;
  final TextEditingController minRoomsController = TextEditingController();
  final TextEditingController minBedroomsController = TextEditingController();
  final TextEditingController minBathroomsController = TextEditingController();
  final TextEditingController minAreaController = TextEditingController();
  final TextEditingController maxAreaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'filter.title'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),

            // نوع العقار
            Text(
              'filter.property_type'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            TypeProperty(
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // نطاق السعر
            Text(
              'filter.price_range'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            RangeSlider(
              values: priceRange,
              min: 0,
              max: 1000000,
              divisions: 100,
              labels: RangeLabels(
                '${priceRange.start.round()} \$',
                '${priceRange.end.round()} \$',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  priceRange = values;
                  minPrice = priceRange.start.round();
                  maxPrice = priceRange.end.round();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${priceRange.start.round()} \$',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${priceRange.end.round()} \$',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // المدينة
            Text(
              'filter.city'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            CityDropdownField(
              selectedCity: selectedCity,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue;
                });
              },
            ),
            const SizedBox(height: 24),

            // عدد الغرف
            Text(
              'filter.rooms'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            NumberInputField(
              hintText: 'filter.min_rooms'.tr(),
              onChanged: (value) {
                setState(() {
                  minRoomsController.text = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // عدد غرف النوم
            Text(
              'filter.bedrooms'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            NumberInputField(
              hintText: 'filter.min_bedrooms'.tr(),
              onChanged: (value) {
                setState(() {
                  minBedroomsController.text = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // عدد الحمامات
            Text(
              'filter.bathrooms'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            NumberInputField(
              hintText: 'filter.min_bathrooms'.tr(),
              onChanged: (value) {
                setState(() {
                  minBathroomsController.text = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // المساحة
            Text(
              'filter.area'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: NumberInputField(
                    hintText: 'filter.min_area'.tr(),
                    onChanged: (value) {
                      setState(() {
                        minAreaController.text = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: NumberInputField(
                    hintText: 'filter.max_area'.tr(),
                    onChanged: (value) {
                      setState(() {
                        maxAreaController.text = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // زر البحث
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'city': selectedCity,
                    'minBathrooms': minBathrooms,
                    'minArea': minArea,
                    'maxArea': maxArea,
                    'minRooms': minRooms,
                    'minBedrooms': minBedrooms,
                    'minPrice': minPrice,
                    'maxPrice': maxPrice,
                    'type': selectedType,
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'filter.search'.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    minRoomsController.dispose();
    minBedroomsController.dispose();
    minBathroomsController.dispose();
    minAreaController.dispose();
    maxAreaController.dispose();
    super.dispose();
  }
}
