import 'package:shared_preferences/shared_preferences.dart';

import 'models/VerifyModel.dart';

class DataStore {
  String token;
  VerifyModel _user;

  factory DataStore() {
    return _DataStore;
  }

  static final DataStore _DataStore = new DataStore._internal();

  DataStore._internal() {
    getUser().then((onVal) {
      _user = onVal;
    });
  }

//  Future<bool> setToken(String value) async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    _token = value;
//
//    return prefs.setString('Token', value);
//  }
//
//  Future<String> getToken() async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.getString('Token') ?? '';
//  }

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
//   var user=  ;
    return u;
  }

  VerifyModel get user => _user;

  set user(VerifyModel value) {
    _user = value;
  }

//
//  String get token => _token;
//
//  set token(String value) {
//    _token = value;
//  }
}

final dataStore = DataStore();
