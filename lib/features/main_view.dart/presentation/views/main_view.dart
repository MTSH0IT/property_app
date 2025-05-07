import 'package:flutter/material.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/main_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'main_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MainViewBody());
  }
}
