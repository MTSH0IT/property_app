import 'package:flutter/material.dart';
import 'package:property_app/features/filter_property/presentation/view/widgets/filter_property_view_body.dart';

class FilterPropertyView extends StatelessWidget {
  const FilterPropertyView({super.key});
  static const String routeName = 'filter-property';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: FilterPropertyViewBody()));
  }
}
