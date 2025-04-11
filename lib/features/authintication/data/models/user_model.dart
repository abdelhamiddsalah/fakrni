import 'package:fakrni/features/authintication/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.uid});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
    };
  }

}