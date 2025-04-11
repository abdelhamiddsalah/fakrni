import 'package:fakrni/features/authintication/domain/entities/child_entity.dart';

class ChildModel extends ChildEntity{
  ChildModel({required super.id, required super.firstname, required super.lastname, required super.age});
  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      age: json['age'] as int,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
    };
  }
}