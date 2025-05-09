import 'package:flutter/material.dart';
import 'package:property_app/core/utils/const.dart';
import 'package:property_app/features/main_view.dart/presentation/views/home_view.dart';
import 'package:property_app/features/main_view.dart/presentation/views/map_view.dart';
import 'package:property_app/features/main_view.dart/presentation/views/settings_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kcolor,
        selectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_outlined),
            label: 'Staings',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}

List<Widget> screens = [HomeView(), MapView(), SettingsView()];
