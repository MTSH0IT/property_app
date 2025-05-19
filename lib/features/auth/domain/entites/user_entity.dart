import 'package:property_app/features/auth/data/models/user_model.dart';

class UserEntity {
  final String name;
  final String email;
  final int phone;
  final String uId;

  UserEntity({
    required this.uId,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserEntity.fromUserModel(UserModel userModel) {
    return UserEntity(
      uId: userModel.uId,
      name: userModel.name,
      email: userModel.email,
      phone: userModel.phone,
    );
  }
}
