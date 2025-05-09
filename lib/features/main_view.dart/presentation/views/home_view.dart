import 'package:flutter/material.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}
