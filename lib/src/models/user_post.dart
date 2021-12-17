import 'package:equatable/equatable.dart';

class UserPost extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;

  UserPost(
      {required this.id,
        required this.userId,
        required this.title,
        required this.body,
      })
      : super([id, userId, title, body]);

  factory UserPost.fromJsonPHP(Map<String, dynamic> parsedJson) {
    return UserPost(
      id: parsedJson.containsKey("id")
          ? parsedJson["id"] ?? 0
          : 0,
      userId: parsedJson.containsKey("userId")
          ? parsedJson["userId"] ?? 0
          : 0,
      title: parsedJson.containsKey("title")
          ? parsedJson["title"] ?? " "
          : " ",
      body: parsedJson.containsKey("body")
          ? parsedJson["body"] ?? " "
          : " ",
    );
  }
}