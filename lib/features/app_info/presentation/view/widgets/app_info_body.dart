import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:property_app/core/helper_functions/launchURL.dart';
import 'package:property_app/core/widgets/card_item.dart';

class AppInfoBody extends StatelessWidget {
  const AppInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // App Logo Placeholder
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.apartment_rounded,
              size: 60,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'app.title'.tr(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '${'app_info.version'.tr()} 1.0.0',
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'app_info.description'.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
          ),
          const SizedBox(height: 40),
          CardItem(
            icon: Icons.phone,
            title: 'app_info.contact.phone'.tr(),
            supTitle: '09123456789',
            onTap: () => launchURL('tel:09123456789'),
          ),
          const SizedBox(height: 16),
          CardItem(
            icon: Icons.email,
            title: 'app_info.contact.email'.tr(),
            supTitle: 'info@propertyapp.com',
            onTap: () => launchURL('mailto:info@propertyapp.com'),
          ),
          const SizedBox(height: 16),
          CardItem(
            icon: Icons.language,
            title: 'app_info.contact.address'.tr(),
            supTitle: 'www.propertyapp.com',
            onTap: () => launchURL('https://www.propertyapp.com'),
          ),
          const SizedBox(height: 40),
          Text(
            '© 2025 ${'app.title'.tr()}',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
