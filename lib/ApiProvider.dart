import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/OrderModel.dart';
import 'models/ProductModel.dart';
import 'models/ProfileModel.dart';
import 'models/SignModel.dart';
import 'models/StatesModel.dart';
import 'models/VerifyModel.dart';
import 'models/gradesModel.dart';

class ApiProvider {
  static String baseURL = "http://104.217.253.15:3434/api/v1/";
  static String signInURL = baseURL + "mobile-auth/login/";
  static String verifyURL = baseURL + "mobile-auth/verify/";
  static String productsURL = baseURL + "abstract-products/";
  static String ordersURL = baseURL + "me/orders/";
  static String profileURL = baseURL + "me/";
  static String gradesURL = baseURL + "grades/";
  static String statesURL = baseURL + "states/";

  Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<SignInModel> signIn(mobileNumber) async {
    print(signInURL);
    final body = json.encode({"mobile": mobileNumber});
    print(body);
    final response = await http.post(signInURL, body: body, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return SignInModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }

  Future<VerifyModel> verify(mobile, code) async {
    print(verifyURL);
    final body = json.encode({"mobile": mobile, "code": code});
    print(body);

    final response = await http.post(verifyURL, body: body, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return VerifyModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }

  Future<ProductList> products() async {
    print(productsURL);
    final response = await http.get(productsURL, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return ProductList.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }

  Future<OrderModel> createOrder(deliveryAddress, delieveryLat, delieveryLng,
      List<Map<String, int>> array) async {
    _headers['Authorization'] =
        "Bearer 5d301f006c60ce9037f171765faa0c36102b77fe";
    print(ordersURL);

    final body = json.encode({
      "delieveryLat": delieveryLat,
      "delieveryLng": delieveryLng,
      "products": array
    });
    print(body);

    final response = await http.post(ordersURL, body: body, headers: _headers);
    if (response.statusCode < 400) {
      print(response.body);

      return OrderModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }

  Future<ProfileModel> getProfile() async {
    _headers['Authorization'] =
        "Bearer 8398556d0d07527e60f9c18f0164e2656c74cf4b";
    print(profileURL);
    final response = await http.get(profileURL, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }

  Future<ProfileModel> editProfile(token, firstName, lastName) async {
    print(token);
    _headers['Authorization'] = "Bearer " + token;
    print(profileURL);

    final body = json.encode({"first_name": firstName, "last_name": lastName});

    print(body);

    final response =
        await http.patch(profileURL, body: body, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }

  Future<GradesList> getGrades(token) async {
    _headers['Authorization'] = token;
    print(gradesURL);
    final response = await http.get(gradesURL, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return GradesList.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }

  Future<StatesList> getStates() async {
    print(statesURL);
    final response = await http.get(statesURL, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return StatesList.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }
}

final apiProvider = ApiProvider();
