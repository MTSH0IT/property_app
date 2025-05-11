import 'package:property_app/features/auth/domen/entites/user_entity.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;

  LoginSuccess({required this.user});
}

class LoginFailure extends LoginState {
  String message;
  LoginFailure(this.message);
}
