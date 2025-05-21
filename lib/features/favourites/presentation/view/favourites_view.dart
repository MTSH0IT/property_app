import 'package:flutter/material.dart';
import 'package:property_app/features/favourites/presentation/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});
  static const String routeName = 'favourites_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المفضلة'), centerTitle: true, elevation: 0),
      body: FavouritesViewBody(),
    );
  }
}
