import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/widgets/custom_button.dart';
import 'package:property_app/core/widgets/custom_text_form_field.dart';
import 'package:property_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:property_app/features/auth/presentation/views/signup_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value!;
              },
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "كلمة المرور",
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              onSaved: (value) {
                password = value!;
              },
            ),

            SizedBox(height: 24),
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
            const SizedBox(height: 50),
            CustomButton(
              text: "تسجيل الدخول",
              ontap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<LoginCubit>().signinUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
