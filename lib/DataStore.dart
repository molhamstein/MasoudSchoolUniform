import 'package:shared_preferences/shared_preferences.dart';


class DataStore{

  static Future<bool> setGender(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString('Gender', value);
  }

  static Future<String> getGender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
//      print("lang is "+   prefs.getString(_kLanguageCode)) ;
    return prefs.getString('Gender') ?? '';
  }

}