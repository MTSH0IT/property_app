import 'package:flutter/material.dart';
import 'package:property_app/features/add_property/data/service/feature_managment.dart';

class GridViewFeatures extends StatefulWidget {
  const GridViewFeatures({super.key, required this.items});
  final List items;

  @override
  State<GridViewFeatures> createState() => _GridViewFeaturesState();
}

class _GridViewFeaturesState extends State<GridViewFeatures> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 1,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder:
          (context, index) => Card(
            child: ListTile(
              contentPadding: EdgeInsets.only(right: 16),
              title: Text(widget.items[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    FeatureManagment.removeItem(index, widget.items);
                  });
                },
              ),
            ),
          ),
    );
  }
}
