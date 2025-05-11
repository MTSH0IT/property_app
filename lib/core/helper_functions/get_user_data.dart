import 'dart:convert';

import 'package:property_app/core/server/shared_preferences_singleton.dart';
import 'package:property_app/features/auth/data/models/user_model.dart';
import 'package:property_app/features/auth/domen/entites/user_entity.dart';

UserEntity getUserData() {
  var jsonData = Prefs.getString("UserData");
  var userData = UserEntity.fromUserModel(
    UserModel.fromJson(jsonDecode(jsonData)),
  );
  return userData;
}
