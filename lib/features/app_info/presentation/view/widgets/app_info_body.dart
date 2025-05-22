import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class AppInfoBody extends StatelessWidget {
  const AppInfoBody({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_info.title'.tr()),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
            _buildInfoCard(
              context,
              Icons.phone,
              'app_info.contact.phone'.tr(),
              '+966 50 000 0000',
              onTap: () => _launchURL('tel:+966500000000'),
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              context,
              Icons.email,
              'app_info.contact.email'.tr(),
              'info@propertyapp.com',
              onTap: () => _launchURL('mailto:info@propertyapp.com'),
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              context,
              Icons.language,
              'app_info.contact.address'.tr(),
              'www.propertyapp.com',
              onTap: () => _launchURL('https://www.propertyapp.com'),
            ),
            const SizedBox(height: 40),
            Text(
              '© 2025 ${'app.title'.tr()}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle, {
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
