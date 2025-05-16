import 'package:flutter/material.dart';
import 'package:property_app/features/property_details/presentation/views/widgets/property_details_view_body.dart';

class PropertyDetailsView extends StatelessWidget {
  const PropertyDetailsView({super.key});
  static const String routeName = 'property_details_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(top: false, child: PropertyDetailsViewBody()),
    );
  }
}
