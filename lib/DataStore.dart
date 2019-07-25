import 'package:shared_preferences/shared_preferences.dart';

import 'models/VerifyModel.dart';

class DataStore {
  VerifyModel _user;
  String _langCode;

  factory DataStore() {
    return _DataStore;
  }

  static final DataStore _DataStore = new DataStore._internal();

  DataStore._internal() {
    getUser().then((onVal) {
      _user = onVal;
    });

    getLang().then((val) {
      _langCode = val;
    });
  }

  Future<bool> setLang(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _langCode = value;

    return prefs.setString('lang', value);
  }

  Future<String> getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lang') ?? '';
  }

    Future<bool> setUser(VerifyModel value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _user = value;

      return prefs.setString('User', VerifyModelToJson(value));
    }

    Future<VerifyModel> getUser() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var x = prefs.getString('User') ?? '';
      var u = x != '' ? VerifyModelFromJson(x) : VerifyModel();
      print("xxxxx" + x);
      return u;
    }





  VerifyModel get user => _user;

  set user(VerifyModel value) {
    _user = value;
  }

  String get langCode => _langCode;

  set langCode(String value) {
    _langCode = value;
  }

//
//  String get token => _token;
//
//  set token(String value) {
//    _token = value;
//  }
}

final dataStore = DataStore();
