part of 'add_property_cubit.dart';

//@immutable
sealed class AddPropertyState {}

final class AddPropertyInitial extends AddPropertyState {}

class AddPropertyLoading extends AddPropertyState {}

class AddPropertySuccess extends AddPropertyState {}

class AddPropertyFailure extends AddPropertyState {
  final String error;

  AddPropertyFailure(this.error);
}
