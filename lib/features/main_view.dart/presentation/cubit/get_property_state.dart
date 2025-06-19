part of 'get_property_cubit.dart';

sealed class GetPropertyState {}

final class GetPropertyInitial extends GetPropertyState {}

class GetPropertyLoading extends GetPropertyState {}

class GetPropertySuccess extends GetPropertyState {
  final List<PropertyEntity> properties;

  GetPropertySuccess(this.properties);
}

class GetPropertyFailure extends GetPropertyState {
  final String error;

  GetPropertyFailure(this.error);
}
