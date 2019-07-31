// To parse this JSON data, do
//
//     final VerifyModel = VerifyModelFromJson(jsonString);

import 'dart:convert';

//
VerifyModel VerifyModelFromJson(String str) =>
VerifyModel.fromJson(json.decode(str));

String VerifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  String token;
  User user;

  VerifyModel({
    this.token,
    this.user,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) => new VerifyModel(
        token: json["token"] == null ? null : json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "user": user == null ? null : user.toJson(),
      };
}

class User {
  String firstName;
  String lastName;
  dynamic email;

  User({
    this.firstName,
    this.lastName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email,
      };
}
