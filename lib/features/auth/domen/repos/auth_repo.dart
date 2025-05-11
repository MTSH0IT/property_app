import 'package:property_app/features/auth/data/models/user_model.dart';
import 'package:property_app/features/auth/domen/entites/user_entity.dart';

abstract class AuthRepo {
  Future<UserModel> createUserWithEmailAndPassword({
    required UserEntity userEntity,
  });

  Future<UserModel> signinUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> addUserData({required UserModel user});

  Future<UserModel> getUserData({required String uId});
}
