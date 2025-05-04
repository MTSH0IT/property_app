import 'package:flutter/material.dart';
import 'package:property_app/core/helper_functions/on_generate_routes.dart';
import 'package:property_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const PropertyApp());
}

class PropertyApp extends StatelessWidget {
  const PropertyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
