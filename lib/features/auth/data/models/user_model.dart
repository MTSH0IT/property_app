import 'dart:developer';

import 'package:property_app/features/auth/domen/entites/user_entity.dart';

class UserModel {
  final String uId;
  final String name;
  final String email;
  final int phone;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      uId: userEntity.uId,
      name: userEntity.name,
      email: userEntity.email,
      phone: userEntity.phone,
    );
  }
  Map<String, dynamic> toJson() {
    return {'uId': uId, 'name': name, 'email': email, 'phone': phone};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
  toPrintmodel() {
    log("UserModel : $name");
    log("UserModel : $email");
    log("UserModel : $phone");
    log("UserModel : $uId");
  }
}
