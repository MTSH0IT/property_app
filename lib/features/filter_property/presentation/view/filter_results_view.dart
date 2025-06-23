import 'package:flutter/material.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/features/filter_property/presentation/view/widgets/filter_results_view_body.dart';
import 'package:easy_localization/easy_localization.dart';

class FilterResultsView extends StatelessWidget {
  const FilterResultsView({super.key, required this.properties});
  static const String routeName = 'filter_results_view';
  final List<PropertyEntity> properties;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filter.results'.tr()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FilterResultsViewBody(properties: properties),
    );
  }
}
