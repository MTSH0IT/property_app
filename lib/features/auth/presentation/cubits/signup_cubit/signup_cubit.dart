import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/utils/custom_exception.dart';
import 'package:property_app/features/auth/domain/entites/user_entity.dart';
import 'package:property_app/features/auth/domain/repos/auth_repo.dart';
import 'package:property_app/features/auth/presentation/cubits/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepoImp) : super(SignupInitial());

  final AuthRepo authRepoImp;

  Future<void> createUserWithEmailAndPassword(UserEntity userEntity) async {
    try {
      emit(SignupLoading());
      final result = await authRepoImp.createUserWithEmailAndPassword(
        userEntity: userEntity,
      );
      emit(SignupSuccess(user: UserEntity.fromUserModel(result)));
    } on CustomException catch (e) {
      emit(SignupFailure(e.message));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
