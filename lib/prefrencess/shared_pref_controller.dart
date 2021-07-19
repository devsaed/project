import 'package:budget_planner/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController{

  static SharedPrefController instance = SharedPrefController._();
  late SharedPreferences _sharedPreferences;
  SharedPrefController._();

  factory SharedPrefController(){
    return instance;
  }

  Future<void> initSharePre() async{
     _sharedPreferences = await SharedPreferences.getInstance();
  }


  Future<void> save(User user) async {
    print("PREF: ${user.id}");
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setInt('id', user.id);
    await _sharedPreferences.setString('name', user.name);
    await _sharedPreferences.setString('email', user.email);
    await _sharedPreferences.setDouble('dally_limit', user.dayLimit);
    await _sharedPreferences.setInt('currency_id', user.currencyId);
    await _sharedPreferences.setInt('pin', user.pin);
  }


  User getUser () {
    User user = User();
    user.id = _sharedPreferences.getInt('id')??0;
    user.name = _sharedPreferences.getString('name')??'';
    user.email = _sharedPreferences.getString('email')??'';
    user.dayLimit = _sharedPreferences.getDouble('dally_limit')??0;
    user.currencyId = _sharedPreferences.getInt('currency_id')??0;
    user.pin = _sharedPreferences.getInt('pin')??0;
    return user;
  }

  int get id => _sharedPreferences.getInt('id') ?? 0;

  bool get isLoggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }

  Future<bool> setLanguage(String languageCode) async {
    return await _sharedPreferences.setString('language_code', languageCode);
  }

  String get languageCode => _sharedPreferences.getString('language_code') ?? 'en';
}