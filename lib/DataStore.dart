import 'package:shared_preferences/shared_preferences.dart';

import 'models/ProductModel.dart';
import 'models/VerifyModel.dart';
import 'models/gradesModel.dart';

class DataStore {
  VerifyModel _user;
  String _langCode;

  List<ProductsModel> _products;

  List<GradesModel> _grades;

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

    getProducts().then((val) {
      _products = val;
    });
    getGrades().then((val) {
      _grades = val;
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

  Future<bool> setProducts(List<ProductsModel> productsList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _products = productsList;
    return prefs.setString("products", ProductsToJson(productsList));
  }

  Future<List<ProductsModel>> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var productsList = prefs.getString("products");
    List<ProductsModel> t =
        productsList != null ? ProductsFromJson(productsList) : [];
    print("t" + t.toString());
    return t;
  }



  Future<bool> setGrades(List<GradesModel> list) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _grades = list;
    return prefs.setString("grades", GradesToJson(list));
  }

  Future<List<GradesModel>> getGrades() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var gradesList = prefs.getString("grades");
    List<GradesModel> t =
    gradesList != null ? GradesFromJson(gradesList) : [];
    print("t" + t.toString());
    return t;
  }


  List<GradesModel> get grades => _grades;

  set grades(List<GradesModel> value) {
    _grades = value;
  }

  VerifyModel get user => _user;

  set user(VerifyModel value) {
    _user = value;
  }

  String get langCode => _langCode;

  set langCode(String value) {
    _langCode = value;
  }

  List<ProductsModel> get products => _products;

  set products(List<ProductsModel> value) {
    _products = value;
  }
}

final dataStore = DataStore();
