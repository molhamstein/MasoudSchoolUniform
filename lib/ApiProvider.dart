import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/OrderModel.dart';
import 'models/ProductModel.dart';
import 'models/ProfileModel.dart';
import 'models/SignModel.dart';
import 'models/VerifyModel.dart';

class ApiProvider {
  static String baseURL = "http://104.217.253.15:3034/api/v1/";
  static String signInURL = baseURL + "mobile-auth/login/";
  static String verifyURL = baseURL + "mobile-auth/verify/";
  static String productsURL = baseURL + "abstract-products/";
  static String ordersURL = baseURL + "orders/";
  static String profileURL = baseURL + "me/";

  Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<SignInModel> signIn() async {
    print(signInURL);
    final body = json.encode({"mobile": "+932448931"});
    final response = await http.post(signInURL, body: body, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return SignInModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);
    }
  }

  Future<VerifyModel> verify() async {
    print(verifyURL);
    final body = json.encode({"mobile": "+932448931", "code": "666666"});
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

//Should check it
  Future<OrderModel> createOrder() async {
    _headers['Authorization'] =
        "Bearer 8398556d0d07527e60f9c18f0164e2656c74cf4b";
    print(ordersURL);
    final body = json.encode({
      "deliveryAddress": "mazzeh 1 ",
      "delieveryLat": 20,
      "delieveryLng": 30,
      "products": [
        {"product": 1, "count": 12},
        {"product": 3, "count": 24}
      ]
    });
    final response = await http.post(ordersURL, body: body, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return OrderModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);

      return OrderModel.fromJson(json.decode(response.body));
//      throw json.decode(response.body);

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



  Future<ProfileModel> editProfile() async {
    _headers['Authorization'] =
    "Bearer 8398556d0d07527e60f9c18f0164e2656c74cf4b";
    print(profileURL);

    final body = json.encode({
      "first_name" : "Sameer" ,
      "last_name" : "Hamwei" ,
      "email" : "17zrami@gmail.com"
    });

    final response = await http.patch(profileURL, body: body, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw json.decode(response.body);

    }
  }





}

final apiProvider = ApiProvider();
