import 'package:flutter/material.dart';
import 'package:property_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text("rout not fond"))),
      );
  }
}
