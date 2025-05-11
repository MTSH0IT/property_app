import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:property_app/core/helper_functions/save_user_data.dart';
import 'package:property_app/core/server/database_service.dart';
import 'package:property_app/core/server/firebase_auth_services.dart';
import 'package:property_app/core/utils/custom_exception.dart';
import 'package:property_app/features/auth/data/models/user_model.dart';
import 'package:property_app/features/auth/domen/entites/user_entity.dart';
import 'package:property_app/features/auth/domen/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService firestoreServices;
  AuthRepoImplementation({
    required this.firebaseAuthServices,
    required this.firestoreServices,
  });
  @override
  Future<UserModel> createUserWithEmailAndPassword({
    required UserEntity userEntity,
  }) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: userEntity.email,
        password: userEntity.uId,
      );

      var usermodel = UserModel(
        name: userEntity.name,
        email: userEntity.email,
        uId: user.uid,
        phone: userEntity.phone,
      );
      await addUserData(user: usermodel);
      return usermodel;
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      throw CustomException(message: e.message);
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log(
        "Exception : AuthRepoImplementation.createUserWithEmailAndPassword ====> error :${e.toString()} ",
      );
      throw CustomException(message: "please try again");
    }
  }

  @override
  Future<UserModel> signinUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthServices.signinUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var usermodel = await getUserData(uId: user.uid);
      saveUserData(user: usermodel);

      usermodel.toPrintmodel();
      return usermodel;
    } on CustomException catch (e) {
      log(
        "Exception : AuthRepoImplementation.signinUserWithEmailAndPassword ====> error :${e.toString()} ",
      );
      throw CustomException(message: "please try again");
    } catch (e) {
      log(
        "Exception : AuthRepoImplementation.signinUserWithEmailAndPassword ====> error :${e.toString()} ",
      );
      throw CustomException(message: "please try again");
    }
  }

  @override
  Future addUserData({required UserModel user}) async {
    await firestoreServices.addData(
      path: "users",
      data: user.toJson(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserModel> getUserData({required String uId}) async {
    var user = await firestoreServices.getData(path: "users", documentId: uId);
    return UserModel.fromJson(user);
  }
}
