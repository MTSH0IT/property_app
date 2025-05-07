import 'package:flutter/material.dart';
import 'package:property_app/core/utils/images.dart';
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
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
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
