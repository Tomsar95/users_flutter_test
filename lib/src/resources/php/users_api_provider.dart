import 'dart:convert';
import 'package:http/http.dart';
import 'package:users_tomas_sarmiento/src/models/api_response.dart';
import 'package:users_tomas_sarmiento/src/models/user.dart';
import 'package:users_tomas_sarmiento/src/models/user_post.dart';
import 'package:users_tomas_sarmiento/src/resources/services/php.dart';

class PHPUsersAPIProvider extends PHPAPIService {
  PHPUsersAPIProvider(Client client) : super(client);

  Future<ApiResponse<List<User>>> fetchUsers() async {
    try {
      final response = await client.get(Uri.parse('$root/users'),  headers: headers);
      if (response.statusCode != 200) return ApiResponse(success: false, statusCode: response.statusCode);
      final parsedJson = json.decode(response.body);
      Iterable i = parsedJson;
      return ApiResponse(success: true, body: i.map((user) => User.fromJsonPHP(user)).toList());
    } catch (e) {
      print("fetchUserError: $e");
      return ApiResponse(success: false, statusCode: 500, message: e.toString());
    }
  }

  Future<ApiResponse<List<UserPost>>> fetchUserPosts(String userId) async {
    try {
      final response = await client.get(Uri.parse('$root/posts?userId=$userId'),  headers: headers);
      if (response.statusCode != 200) return ApiResponse(success: false, statusCode: response.statusCode);
      final parsedJson = json.decode(response.body);
      Iterable i = parsedJson;
      return ApiResponse(success: true, body: i.map((post) => UserPost.fromJsonPHP(post)).toList());
    } catch (e) {
      print("fetchUserPostsError: $e");
      return ApiResponse(success: false, statusCode: 500, message: e.toString());
    }
  }
}