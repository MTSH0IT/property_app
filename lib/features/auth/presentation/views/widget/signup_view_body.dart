import 'package:flutter/material.dart';
import 'package:property_app/core/widgets/custom_button.dart';
import 'package:property_app/core/widgets/custom_text_form_field.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "اسم المستخدم",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "رقم الجوال",
              textInputType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "كلمة المرور",
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "تأكيد كلمة المرور",
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('هل لديك حساب؟', style: TextStyle(color: Colors.black)),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Text(
                      'سجل الآن',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            CustomButton(text: "تسجيل", ontap: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
