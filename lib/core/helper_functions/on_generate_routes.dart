import 'package:flutter/material.dart';
import 'package:property_app/features/auth/presentation/views/login_view.dart';
import 'package:property_app/features/auth/presentation/views/signup_view.dart';
import 'package:property_app/features/main_view.dart/presentation/views/main_view.dart';
import 'package:property_app/features/onboardind/presentation/view/onboarding_view.dart';
import 'package:property_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text("route not found"))),
      );
  }
}
