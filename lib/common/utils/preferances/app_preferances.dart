import 'package:shared_preferences/shared_preferences.dart';

class AppPreferances {
  static AppPreferances? _appPreferances;
  static SharedPreferences? _sharedPreferences;

  AppPreferances._();

  static Future<AppPreferances> getInstance() async {
    if (_appPreferances == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      _appPreferances = AppPreferances._();
    }
    return _appPreferances!;
  }
}
