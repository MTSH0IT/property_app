import 'package:flutter/material.dart';
import 'package:property_app/features/onboardind/presentation/view/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const String routeName = 'onboarding_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const OnboardingViewBody());
  }
}
