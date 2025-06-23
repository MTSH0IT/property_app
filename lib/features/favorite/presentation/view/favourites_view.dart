import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/helper_functions/get_user_data.dart';
import 'package:property_app/features/favorite/presentation/cubit/get_favorite_cubit.dart';
import 'package:property_app/features/favorite/presentation/view/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});
  static const String routeName = 'favourites_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GetFavoriteCubit()..getFavoriteList(userId: getUserData().uId),
      child: Scaffold(
        appBar: AppBar(title: Text('المفضلة'), centerTitle: true, elevation: 0),
        body: BlocBuilder<GetFavoriteCubit, GetFavoriteState>(
          builder: (context, state) {
            if (state is GetFavoriteLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetFavoriteSuccess) {
              return FavouritesViewBody(
                favoriteProperties: state.favoriteProperties,
              );
            } else if (state is GetFavoriteFailure) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
