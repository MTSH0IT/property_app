import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/features/main_view.dart/presentation/cubit/get_property_cubit.dart';
import 'package:property_app/features/main_view.dart/presentation/views/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});
  static const String routeName = 'map_view';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPropertyCubit, GetPropertyState>(
      builder: (context, state) {
        if (state is GetPropertySuccess) {
          return MapViewBody(properties: state.properties);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
