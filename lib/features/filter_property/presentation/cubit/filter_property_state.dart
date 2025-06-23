part of 'filter_property_cubit.dart';

sealed class FilterPropertyState {}

final class FilterPropertyInitial extends FilterPropertyState {}

class FilterPropertyLoading extends FilterPropertyState {}

class FilterPropertySuccess extends FilterPropertyState {
  final List<PropertyEntity> properties;

  FilterPropertySuccess(this.properties);
}

class FilterPropertyFailure extends FilterPropertyState {
  final String error;

  FilterPropertyFailure(this.error);
}
