import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      })
      : super([name, id]);

  factory User.fromJsonPHP(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson.containsKey("id")
          ? parsedJson["id"]?.toString() ?? " "
          : " ",
      name: parsedJson.containsKey("name")
          ? parsedJson["name"] ?? "User"
          : "User",
      email: parsedJson.containsKey("email")
          ? parsedJson["email"] ?? " "
          : " ",
      phone: parsedJson.containsKey("phone")
          ? parsedJson["phone"] ?? " "
          : " ",
    );
  }

  User.fromJson(Map<String, dynamic> json,)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
  };
}
