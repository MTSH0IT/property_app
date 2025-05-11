import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/helper_functions/on_generate_routes.dart';
import 'package:property_app/core/server/shared_preferences_singleton.dart';
import 'package:property_app/core/utils/custom_bloc_observer.dart';
import 'package:property_app/features/splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  Bloc.observer = CustomBlocObserver();

  runApp(const PropertyApp());
}

class PropertyApp extends StatelessWidget {
  const PropertyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
