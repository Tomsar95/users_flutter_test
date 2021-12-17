import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:users_tomas_sarmiento/src/models/api_response.dart';
import 'package:users_tomas_sarmiento/src/resources/providers.dart';

class Repository {

  static final RetryClient client = RetryClient(Client(), retries: 2);

  final PHPAPIProvider php = PHPAPIProvider(client);

  Future<ApiResponse> fetchUsers() async {
    return php.Users.fetchUsers();
  }

  Future<ApiResponse> fetchUserPosts(String userId) async {
    return php.Users.fetchUserPosts(userId);
  }
}