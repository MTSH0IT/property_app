import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:property_app/features/add_property/presentation/views/add_property_view.dart';
import 'package:property_app/features/profile/presentation/views/profile_view.dart';
import 'package:provider/provider.dart';
import 'package:property_app/core/theme/theme_provider.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // profile Setting
        SettingsCardItem(
          icon: Icons.person,
          title: 'الملف الشخصي',
          supTitle: 'انتقل',
          onTap: () {
            Navigator.pushNamed(context, ProfileView.routeName);
          },
        ),
        const SizedBox(height: 12),
        // add property Setting
        SettingsCardItem(
          icon: Icons.add_home_work_outlined,
          title: 'اضافة عقار',
          supTitle: 'اعلن',
          onTap: () {
            Navigator.pushNamed(context, AddPropertyView.routeName);
          },
        ),
        const SizedBox(height: 12),
        // Language Setting
        SettingsCardItem(
          icon: Icons.language,
          title: 'اللغة',
          supTitle: 'العربية',
          onTap: () {
            showDialogSettings(
              context,
              title: 'اختر اللغة',
              option1: 'العربية',
              option2: 'الإنجليزية',
              iconOp1: Icons.language,
              iconOp2: Icons.language,
              onTap1: () {
                context.setLocale(const Locale('ar'));
                Navigator.of(context).pop();
              },
              onTap2: () {
                context.setLocale(const Locale('en'));
                Navigator.of(context).pop();
              },
            );
          },
        ),
        const SizedBox(height: 12),
        // Theme Setting
        SettingsCardItem(
          icon: Icons.light_mode,
          title: 'الثيم',
          supTitle: 'اختر',
          onTap: () {
            showDialogSettings(
              context,
              title: 'اختر الثيم',
              option1: 'الوضع الليلي',
              option2: 'الوضع النهاري',
              iconOp1: Icons.dark_mode,
              iconOp2: Icons.light_mode,
              onTap1: () {
                final themeProvider = Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                );
                themeProvider.toggleTheme(true);
                Navigator.pop(context);
              },
              onTap2: () {
                final themeProvider = Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                );
                themeProvider.toggleTheme(false);
                Navigator.pop(context);
              },
            );
          },
        ),
        const SizedBox(height: 12),
        // favoret Setting
        SettingsCardItem(
          icon: Icons.favorite,
          title: 'المفضلة',
          supTitle: 'انتقل',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        // app info Setting
        SettingsCardItem(
          icon: Icons.info,
          title: 'عن التطبيق',
          supTitle: 'انتقل',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        // Logout Setting
        SettingsCardItem(
          icon: Icons.logout,
          title: 'تسجيل الخروج',
          supTitle: 'مع السلامة',
          onTap: () {},
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class SettingsCardItem extends StatelessWidget {
  const SettingsCardItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.supTitle,
  });
  final String title;
  final String? supTitle;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.deepPurple.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.deepPurple),
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  supTitle ?? '',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showDialogSettings(
  BuildContext context, {
  required String title,
  required String option1,
  required String option2,
  required IconData iconOp1,
  required IconData iconOp2,
  required Function() onTap1,
  required Function() onTap2,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(iconOp1),
              title: Text(option1),
              onTap: onTap1,
            ),
            ListTile(
              leading: Icon(iconOp2),
              title: Text(option2),
              onTap: onTap2,
            ),
          ],
        ),
      );
    },
  );
}
