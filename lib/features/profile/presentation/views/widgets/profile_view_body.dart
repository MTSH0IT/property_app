import 'package:flutter/material.dart';
import 'package:property_app/core/helper_functions/get_user_data.dart';
import 'package:property_app/features/profile/presentation/views/widgets/profile_info.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ProfileInfo(
            title: 'profile.name'.tr(),
            info: getUserData().name,
            icon: Icons.person,
          ),
          const SizedBox(height: 16),
          ProfileInfo(
            title: 'profile.email'.tr(),
            info: getUserData().email,
            icon: Icons.email,
          ),
          const SizedBox(height: 16),
          ProfileInfo(
            title: 'profile.phone'.tr(),
            info: getUserData().phone.toString(),
            icon: Icons.phone,
          ),
          const SizedBox(height: 16),
          ProfileInfo(
            title: 'profile.address'.tr(),
            info: '12/12/2000',
            icon: Icons.calendar_today,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'profile.edit_profile'.tr(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
