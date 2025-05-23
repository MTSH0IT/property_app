import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:property_app/core/services/firebase_auth_services.dart';
import 'package:property_app/core/widgets/card_item.dart';
import 'package:property_app/features/add_property/presentation/views/add_property_view.dart';
import 'package:property_app/features/app_info/presentation/view/app_info_view.dart';
import 'package:property_app/features/favourites/presentation/view/favourites_view.dart';
import 'package:property_app/features/profile/presentation/views/profile_view.dart';
import 'package:property_app/features/splash/presentation/views/splash_view.dart';
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
        CardItem(
          icon: Icons.person,
          title: 'settings.profile'.tr(),
          trailingTitle: 'settings.go'.tr(),
          onTap: () {
            Navigator.pushNamed(context, ProfileView.routeName);
          },
        ),
        const SizedBox(height: 12),
        // add property Setting
        CardItem(
          icon: Icons.add_home_work_outlined,
          title: 'settings.add_property'.tr(),
          trailingTitle: 'settings.advertise'.tr(),
          onTap: () {
            Navigator.pushNamed(context, AddPropertyView.routeName);
          },
        ),
        const SizedBox(height: 12),
        // Language Setting
        CardItem(
          icon: Icons.language,
          title: 'settings.language'.tr(),
          trailingTitle:
              context.locale.languageCode == 'ar'
                  ? 'settings.arabic'.tr()
                  : 'settings.english'.tr(),
          onTap: () {
            showDialogSettings(
              context,
              title: 'settings.choose_language'.tr(),
              option1: 'settings.arabic'.tr(),
              option2: 'settings.english'.tr(),
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
        CardItem(
          icon: Icons.light_mode,
          title: 'settings.theme'.tr(),
          trailingTitle: 'settings.choose'.tr(),
          onTap: () {
            showDialogSettings(
              context,
              title: 'settings.choose_theme'.tr(),
              option1: 'settings.dark_mode'.tr(),
              option2: 'settings.light_mode'.tr(),
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
        CardItem(
          icon: Icons.favorite,
          title: 'settings.favorites'.tr(),
          trailingTitle: 'settings.go'.tr(),
          onTap: () {
            Navigator.pushNamed(context, FavouritesView.routeName);
          },
        ),
        const SizedBox(height: 12),
        // app info Setting
        CardItem(
          icon: Icons.info,
          title: 'settings.app_info'.tr(),
          trailingTitle: 'settings.go'.tr(),
          onTap: () {
            Navigator.pushNamed(context, AppInfoView.routeName);
          },
        ),
        const SizedBox(height: 12),
        // Logout Setting
        CardItem(
          icon: Icons.logout,
          title: 'settings.logout'.tr(),
          trailingTitle: 'settings.goodbye'.tr(),
          onTap: () {
            FirebaseAuthServices().signOut();
            Navigator.pushReplacementNamed(context, SplashView.routeName);
          },
        ),
        const SizedBox(height: 12),
      ],
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
