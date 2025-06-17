import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/helper_functions/build_snack_bar_message.dart';
import 'package:property_app/features/add_property/presentation/cubit/add_property_cubit.dart';
import 'package:property_app/features/add_property/presentation/views/widgets/add_property_view_body.dart';
import 'package:easy_localization/easy_localization.dart';

class AddPropertyView extends StatelessWidget {
  const AddPropertyView({super.key});
  static const String routeName = 'add_property';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPropertyCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("settings.add_property".tr()),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: BlocConsumer<AddPropertyCubit, AddPropertyState>(
            listener: (context, state) {
              if (state is AddPropertySuccess) {
                buildSnackBarMessage(
                  context,
                  "Property added successfully",
                  Colors.green,
                );
              }
            },
            builder: (context, state) {
              return const AddPropertyViewBody();
            },
          ),
        ),
      ),
    );
  }
}
