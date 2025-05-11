import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/helper_functions/build_snack_bar_message.dart';
import 'package:property_app/core/widgets/custom_button.dart';
import 'package:property_app/core/widgets/custom_text_form_field.dart';
import 'package:property_app/features/auth/domen/entites/user_entity.dart';
import 'package:property_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  late String name;

  late String email;

  late int phone;

  late String password;

  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: "اسم المستخدم",
                textInputType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: "رقم الجوال",
                textInputType: TextInputType.phone,
                onSaved: (value) {
                  phone = int.parse(value!);
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
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: "تأكيد كلمة المرور",
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                onSaved: (value) {
                  confirmPassword = value!;
                },
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Text('هل لديك حساب؟', style: TextStyle(color: Colors.black)),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Text(
                      'سجل الآن',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              CustomButton(
                text: "تسجيل",
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (password == confirmPassword) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            UserEntity(
                              name: name,
                              email: email,
                              phone: phone,
                              uId: password,
                            ),
                          );
                    } else {
                      buildSnackBarMessage(
                        context,
                        "كلمة المرور غير متطابقة",
                        Colors.red,
                      );
                    }
                  } else {
                    _autoValidateMode = AutovalidateMode.onUserInteraction;
                    buildSnackBarMessage(
                      context,
                      "Please fill all fields",
                      Colors.red,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
