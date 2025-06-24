import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/utils/const.dart';
import 'package:property_app/features/main_view.dart/presentation/cubit/get_property_cubit.dart';
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
    return BlocProvider(
      create: (context) => GetPropertyCubit()..getProperties(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor:
              Theme.of(context).brightness == Brightness.dark
                  ? kSecondaryColor
                  : kcolor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts_outlined),
              label: 'Settings',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
        body: BlocBuilder<GetPropertyCubit, GetPropertyState>(
          builder: (context, state) {
            if (state is GetPropertyLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetPropertyFailure) {
              return Center(child: Text(state.error));
            }
            if (state is GetPropertySuccess) {
              return screens[currentIndex];
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

List<Widget> screens = [HomeView(), MapView(), SettingsView()];
