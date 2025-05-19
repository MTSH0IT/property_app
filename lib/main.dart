import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/helper_functions/on_generate_routes.dart';
import 'package:property_app/core/services/shared_preferences_singleton.dart';
import 'package:property_app/core/utils/custom_bloc_observer.dart';
import 'package:provider/provider.dart';
import 'package:property_app/core/theme/theme_provider.dart';
import 'package:property_app/features/splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(
  //   url: 'https://tziuvhulovlnohdfmboh.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR6aXV2aHVsb3Zsbm9oZGZtYm9oIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzU3MTcyNSwiZXhwIjoyMDYzMTQ3NzI1fQ.O7sFrIXOw5qqHv9Os9qtZUsMqkauT5_zvruSt3XNiCg',
  // );
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  Bloc.observer = CustomBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      child: const PropertyApp(),
    ),
  );
}

class PropertyApp extends StatelessWidget {
  const PropertyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.lightTheme,
            darkTheme: ThemeProvider.darkTheme,
            themeMode: themeProvider.themeMode,
            onGenerateRoute: onGenerateRoutes,
            initialRoute: SplashView.routeName,
          );
        },
      ),
    );
  }
}
