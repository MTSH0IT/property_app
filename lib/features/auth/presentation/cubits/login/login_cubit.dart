import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/utils/custom_exception.dart';
import 'package:property_app/features/auth/domen/entites/user_entity.dart';
import 'package:property_app/features/auth/domen/repos/auth_repo.dart';
import 'package:property_app/features/auth/presentation/cubits/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepoImp) : super(LoginInitial());

  final AuthRepo authRepoImp;
  Future<void> signinUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      var result = await authRepoImp.signinUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess(user: UserEntity.fromUserModel(result)));
    } on CustomException catch (e) {
      emit(LoginFailure(e.message));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
