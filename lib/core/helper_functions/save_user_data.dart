import 'dart:convert';

import 'package:property_app/core/server/shared_preferences_singleton.dart';
import 'package:property_app/features/auth/data/models/user_model.dart';

Future<void> saveUserData({required UserModel user}) async {
  var jsonData = jsonEncode(user.toJson());
  await Prefs.setString("UserData", jsonData);
}
