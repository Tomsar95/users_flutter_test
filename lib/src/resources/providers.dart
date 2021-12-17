import 'package:http/http.dart';
import 'package:users_tomas_sarmiento/src/resources/php/users_api_provider.dart';

class PHPAPIProvider {
  final Client client;
  late PHPUsersAPIProvider Users;

  PHPAPIProvider(this.client) {
    Users = PHPUsersAPIProvider(client);
  }

}