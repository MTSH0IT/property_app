import 'package:flutter/material.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/properaty_card.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key, required this.favoriteProperties});
  final List<PropertyEntity> favoriteProperties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: favoriteProperties.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: PropertyCard(property: favoriteProperties[index]),
          );
        },
      ),
    );
  }
}
