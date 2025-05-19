import 'package:flutter/material.dart';
import 'package:property_app/features/profile/presentation/views/widgets/profile_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ProfileInfo(
            title: 'اسم المستخدم',
            info: 'mohammad',
            icon: Icons.person,
          ),
          SizedBox(height: 16),
          ProfileInfo(
            title: 'البريد الالكتروني',
            info: 'mohammad@gmail.com',
            icon: Icons.email,
          ),
          SizedBox(height: 16),
          ProfileInfo(
            title: 'رقم الهاتف',
            info: '0123456789',
            icon: Icons.phone,
          ),
          SizedBox(height: 16),
          ProfileInfo(
            title: 'تاريخ الميلاد',
            info: '12/12/2000',
            icon: Icons.calendar_today,
          ),
          SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('تعديل', style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
