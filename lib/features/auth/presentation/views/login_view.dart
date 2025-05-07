import 'package:flutter/material.dart';
import 'package:property_app/features/auth/presentation/views/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginViewBody());
  }
}
