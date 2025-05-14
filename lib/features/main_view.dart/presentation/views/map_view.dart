import 'package:flutter/material.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});
  static const String routeName = 'map_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MapViewBody());
  }
}
