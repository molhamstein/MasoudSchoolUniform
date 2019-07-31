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
//  static String baseURL = "http://104.217.253.15:3434/api/v1/";
  static String baseURL = "http://174.138.28.26:3434/api/v1/";
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

      return SignInModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
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

      return VerifyModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      throw jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

  Future<ProductList> products(token) async {
    _headers['Authorization'] = "Bearer " + token;

    print(productsURL);
    final response = await http.get(productsURL, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return ProductList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      throw jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

  Future<OrderModel> createOrder(token, deliveryAddress, delieveryLat,
      delieveryLng, List<Map<String, int>> array, centerId) async {
    print(ordersURL);
    _headers['Authorization'] = "Bearer " + token;

    var body;
    if (centerId != null)
      body = json.encode({
        "deliveryLat": delieveryLat,
        "devliveryLng": delieveryLng,
        "products": array,
        "centerId": centerId,
      });
    else
      body = json.encode({
        "deliveryLat": delieveryLat,
        "devliveryLng": delieveryLng,
        "products": array,
      });
    print(body);

    final response = await http.post(ordersURL, body: body, headers: _headers);
    if (response.statusCode < 400) {
      print(response.body);

      return OrderModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      throw jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

  Future<ProfileModel> getProfile(token) async {
    _headers['Authorization'] = "Bearer " + token;

    print(profileURL);
    final response = await http.get(profileURL, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return ProfileModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      throw jsonDecode(utf8.decode(response.bodyBytes));
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

      return ProfileModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      throw jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

  Future<GradesList> getGrades(token) async {
    _headers['Authorization'] = "Bearer " + token;
    print(gradesURL);
    final response = await http.get(gradesURL, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return GradesList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      throw jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

  Future<StatesList> getStates(token) async {
    _headers['Authorization'] = "Bearer " + token;

    print(statesURL);
    final response = await http.get(statesURL, headers: _headers);
    if (response.statusCode == 200) {
      print(response.body);

      return StatesList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      throw jsonDecode(utf8.decode(response.bodyBytes));
    }
  }
}

final apiProvider = ApiProvider();
