import 'package:users_tomas_sarmiento/src/common/utils/shared_preferences_manager.dart';
import 'package:users_tomas_sarmiento/src/resources/repository.dart';

class Utils{

  static SharedPreferencesManager sharedPreferencesManager = SharedPreferencesManager();

  static late Repository _repository;

  static Repository get repository => _repository;

  static void inject({required Repository repository}) {
    _repository = repository;
  }
}