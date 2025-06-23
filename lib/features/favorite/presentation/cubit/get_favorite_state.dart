part of 'get_favorite_cubit.dart';

@immutable
sealed class GetFavoriteState {}

final class GetFavoriteInitial extends GetFavoriteState {}

final class GetFavoriteLoading extends GetFavoriteState {}

final class GetFavoriteSuccess extends GetFavoriteState {
  final List<PropertyEntity> favoriteProperties;

  GetFavoriteSuccess(this.favoriteProperties);
}

final class GetFavoriteFailure extends GetFavoriteState {
  final String message;

  GetFavoriteFailure(this.message);
}
