import 'package:flutter/material.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key, required this.properties});
  static const String routeName = 'map_view';
  final List<PropertyEntity> properties;
  @override
  Widget build(BuildContext context) {
    return MapViewBody(properties: properties);
  }
}
