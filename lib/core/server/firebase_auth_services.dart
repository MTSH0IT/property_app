import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:property_app/core/utils/custom_exception.dart';

class FirebaseAuthServices {

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: ' كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "لا يوجد اتصال بالانترنت");
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(message: "لا يمكن تسجيل الدخول");
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: "البريد الالكتروني غير صالح");
      } else {
        log("Exception : FirebaseAuthServices.createUserWithEmailAndPassword ====> error code: ${e.code}");
        throw CustomException(message: "حدث خطأ يرجا المحاولة لاحقا");
      }
    } catch (e) {
      log("Exception : FirebaseAuthServices.createUserWithEmailAndPassword ====> error: ${e.toString()}");
      throw CustomException(message: "حدث خطأ يرجا المحاولة لاحقا");
    }
  }

  Future<User> signinUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'user-disabled') {
        throw CustomException(message: 'الحساب المستخدم غير مفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");

        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }

 
}
