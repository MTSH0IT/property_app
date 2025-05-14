import 'package:easy_localization/easy_localization.dart';
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
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;
  bool _visiblePassword = true;
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
              hintText: "auth.email".tr(),
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value!;
              },
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "auth.password".tr(),
              textInputType: TextInputType.visiblePassword,
              obscureText: _visiblePassword,
              onSaved: (value) {
                password = value!;
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _visiblePassword = !_visiblePassword;
                  });
                },
                child:
                    _visiblePassword == true
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
              ),
            ),

            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "auth.no_account".tr(),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignupView.routeName);
                    },
                    child: Text(
                      'auth.sign_up'.tr(),
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: "auth.login".tr(),
              ontap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<LoginCubit>().signinUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                } else {
                  _autoValidateMode = AutovalidateMode.always;
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
