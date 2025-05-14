import 'package:flutter/material.dart';
import 'package:property_app/core/server/firebase_auth_services.dart';
import 'package:property_app/core/server/shared_preferences_singleton.dart';
import 'package:property_app/core/utils/images.dart';
import 'package:property_app/features/auth/presentation/views/login_view.dart';
import 'package:property_app/features/main_view.dart/presentation/views/main_view.dart';
import 'package:property_app/features/onboardind/presentation/view/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuthServices().isLoggedIn()) {
        Navigator.pushReplacementNamed(context, MainView.routeName);
      } else if (Prefs.getBool("isOnboarded")) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xFF7886F3),
      child: Center(
        child: Image.asset(Assets.assetsImagesLogo, width: 250, height: 250),
      ),
    );
  }
}
