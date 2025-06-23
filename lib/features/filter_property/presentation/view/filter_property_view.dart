import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/features/filter_property/presentation/cubit/filter_property_cubit.dart';
import 'package:property_app/features/filter_property/presentation/view/widgets/filter_property_view_body.dart';

class FilterPropertyView extends StatelessWidget {
  const FilterPropertyView({super.key});
  static const String routeName = 'filter-property';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterPropertyCubit(),
      child: Scaffold(body: SafeArea(child: FilterPropertyViewBody())),
    );
  }
}
