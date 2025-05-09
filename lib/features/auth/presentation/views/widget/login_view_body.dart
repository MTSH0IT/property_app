import 'package:flutter/material.dart';
import 'package:property_app/core/widgets/custom_button.dart';
import 'package:property_app/core/widgets/custom_text_form_field.dart';
import 'package:property_app/features/auth/presentation/views/signup_view.dart';
import 'package:property_app/features/main_view.dart/presentation/views/main_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: "البريد الالكتروني",
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: "كلمة المرور",
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
          ),

          SizedBox(height: 16),
          Row(
            children: [
              Text('ليس لديك حساب؟', style: TextStyle(color: Colors.black)),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignupView.routeName);
                  },
                  child: Text(
                    'انشئ حساب جديد',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            text: "تسجيل الدخول",
            ontap: () {
              Navigator.pushReplacementNamed(context, MainView.routeName);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
