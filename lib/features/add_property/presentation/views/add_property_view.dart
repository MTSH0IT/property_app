import 'package:flutter/material.dart';
import 'package:property_app/features/add_property/presentation/views/widgets/add_property_view_body.dart';

class AddPropertyView extends StatelessWidget {
  const AddPropertyView({super.key});
  static const String routeName = 'add_property';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة عقار"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: const AddPropertyViewBody(),
    );
  }
}
