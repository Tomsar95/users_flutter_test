import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_tomas_sarmiento/src/common/utils/constants.dart';
import 'package:users_tomas_sarmiento/src/models/user.dart';

class SharedPreferencesManager {
  late SharedPreferences _preferences;

  SharedPreferencesManager(){
    initPreferences();
  }

  initPreferences() async => _preferences = await SharedPreferences.getInstance();

  Future<void> setUsersData(List<User> list) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setString(_sharedPreferencesFields.usersData, json.encode(list));
  }

  Future<List<User>> get getNoSeenAssistantJokes async {
    _preferences = await SharedPreferences.getInstance();
    return jsonDecode(_preferences.getString(_sharedPreferencesFields.usersData) ?? '') ?? [];
  }

}

mixin _sharedPreferencesFields {
  static String usersData = DataBaseConstants.usersDataBase;
}