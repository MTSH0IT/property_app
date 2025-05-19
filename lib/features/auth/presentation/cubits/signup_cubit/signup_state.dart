import 'package:property_app/features/auth/domain/entites/user_entity.dart';

class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntity user;

  SignupSuccess({required this.user});
}

class SignupFailure extends SignupState {
  final String message;
  SignupFailure(this.message);
}
