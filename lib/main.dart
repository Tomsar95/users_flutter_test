import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_tomas_sarmiento/src/common/utils/constants.dart';
import 'package:users_tomas_sarmiento/src/common/utils/global_variables.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_colors.dart';
import 'package:users_tomas_sarmiento/src/common/utils/utils.dart';
import 'package:users_tomas_sarmiento/src/models/user.dart';
import 'package:users_tomas_sarmiento/src/resources/repository.dart';
import 'package:users_tomas_sarmiento/src/screens/main_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {

  HttpOverrides.global = MyHttpOverrides();

  await injectDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    initDataBase();
    super.initState();
  }

  initDataBase() async {
    await dataBaseConfig();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users Ceiba Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: UserColors.backGround,
      ),
      home: const MainUsersScreen(),
    );
  }
}

injectDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = Repository();
  Utils.inject(repository: repository);

  await dataBaseConfig();

}

Future dataBaseConfig() async {
  late SharedPreferences _prefs;
  _prefs = await SharedPreferences.getInstance();
  var encodedUsersData = _prefs.getString(DataBaseConstants.usersDataBase);
  var decodedUserData;
  if (encodedUsersData != null) decodedUserData = json.decode(encodedUsersData);
  if (decodedUserData != null) {
    GlobalVariables.usersData = (decodedUserData as List)
      .map((data) => User.fromJson(data))
      .toList();
  }
}
