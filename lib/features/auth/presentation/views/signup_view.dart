import 'package:flutter/material.dart';
import 'package:property_app/features/auth/presentation/views/widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignupViewBody());
  }
}
