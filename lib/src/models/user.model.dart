import 'dart:convert';

class UsersModel {
  List<UserModel> items = List();
  UsersModel();
  UsersModel.fromJsonList(List<dynamic> list) {
    if (list == null) return;
    for (var item in list) {
      final user = UserModel.fromJson(item);
      items.add(user);
    }
  }
}

class UserModel {
  int id;
  String firstName;
  String lastName;
  String email;
  int roleId;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.roleId,
    this.createdAt,
    this.updatedAt,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        roleId: json["role_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
