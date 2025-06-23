import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/properaty_card.dart';

class FilterResultsViewBody extends StatelessWidget {
  final List<PropertyEntity> properties;

  const FilterResultsViewBody({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    if (properties.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'filter.no_results'.tr(),
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              'filter.try_different_filters'.tr(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${'filter.found'.tr()} ${properties.length} ${'filter.properties'.tr()}',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: properties.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: PropertyCard(property: properties[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
