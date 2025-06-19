import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/features/main_view.dart/presentation/cubit/get_property_cubit.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPropertyCubit()..getProperties(),
      child: Scaffold(
        body: BlocBuilder<GetPropertyCubit, GetPropertyState>(
          builder: (context, state) {
            if (state is GetPropertyLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetPropertyFailure) {
              return Center(child: Text(state.error));
            }
            if (state is GetPropertySuccess) {
              return HomeViewBody(properties: state.properties);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
