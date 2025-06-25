import 'package:flutter/material.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.properties});
  static const String routeName = 'home_view';
  final List<PropertyEntity> properties;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody(properties: properties));
  }
}
