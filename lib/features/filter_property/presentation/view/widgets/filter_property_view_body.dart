import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:property_app/core/entites/filter_entity.dart';
import 'package:property_app/core/helper_functions/build_snack_bar_message.dart';
import 'package:property_app/features/add_property/presentation/views/widgets/type_property.dart';
import 'package:property_app/features/filter_property/presentation/cubit/filter_property_cubit.dart';
import 'package:property_app/features/filter_property/presentation/view/filter_results_view.dart';
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
  int minPrice = 0;
  int maxPrice = 1000000;
  String? selectedCity;
  int minRooms = 0;
  int minBedrooms = 0;
  int minBathrooms = 0;
  int minArea = 0;
  int? maxArea;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilterPropertyCubit, FilterPropertyState>(
      listener: (context, state) {
        if (state is FilterPropertySuccess) {
          Navigator.pushNamed(
            context,
            FilterResultsView.routeName,
            arguments: state.properties,
          );
        } else if (state is FilterPropertyFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      child: SingleChildScrollView(
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
                  minRooms = int.tryParse(value) ?? 0;
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
                  minBedrooms = int.tryParse(value) ?? 0;
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
                        minArea = int.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: NumberInputField(
                      hintText: 'filter.max_area'.tr(),
                      onChanged: (value) {
                        maxArea = int.tryParse(value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // زر البحث
              BlocBuilder<FilterPropertyCubit, FilterPropertyState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          state is FilterPropertyLoading
                              ? null
                              : () {
                                if (selectedCity == null) {
                                  buildSnackBarMessage(
                                    context,
                                    "اختر المدينة",
                                    Colors.orange,
                                  );
                                  return;
                                }
                                final filter = FilterEntity(
                                  type: selectedType,
                                  minPrice: minPrice,
                                  maxPrice: maxPrice,
                                  city: selectedCity,
                                  minRooms: minRooms,
                                  minBedrooms: minBedrooms,
                                  minArea: minArea,
                                  maxArea: maxArea,
                                );
                                log(filter.toString());
                                context
                                    .read<FilterPropertyCubit>()
                                    .filterProperties(filter);
                              },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child:
                          state is FilterPropertyLoading
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : Text(
                                'filter.search'.tr(),
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
