import 'dart:convert';
import 'dart:ui';

import 'ProductModel.dart';


List<ProductDetailsModel> ProductDetailsFromJson(String str) =>
    new List<ProductDetailsModel>.from(json.decode(str).map((x) => ProductDetailsModel.fromJson(x)));


String ProductDetailsToJson(List<ProductDetailsModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}


class ProductDetailsModel {
  int _id;
  Images _image;
  String _nameEn;
  String _nameAr;
  String _price;
  String _gender;
  Grade _grade;
  Size _size;

  int _count;

  ProductDetailsModel(this._id, this._image, this._nameEn, this._nameAr,
      this._price, this._grade, this._gender, this._size, this._count);

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'] != null ? new Images.fromJson(json['image']) : null;
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
    _price = json['price'];
    _gender = json['gender'];
    _count= json['count'];
    _grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    _size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['price'] = this.price;
    data['gender'] = this.gender;
    data['count']= this._count;
    if (this._grade != null) {
      data['grade'] = this._grade.toJson();
    }
    if (this._image != null) {
      data['image'] = this._image.toJson();
    }
    if (this._size != null) {
      data['size'] = this._size.toJson();
    }
    return data;
  }

  String genderT(Locale local) {
    if (local.languageCode == 'en') {
      if (gender == 'male') {
        return "male";
      } else
        return "female";
    } else {
      if (gender == 'male') {
        return "ذكر";
      } else
        return "انثى";
    }
  }

  int get count => _count;

  set count(int value) {
    _count = value;
  }

  Size get size => _size;

  set size(Size value) {
    _size = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  Grade get grade => _grade;

  set grade(Grade value) {
    _grade = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get nameAr => _nameAr;

  set nameAr(String value) {
    _nameAr = value;
  }

  String get nameEn => _nameEn;

  set nameEn(String value) {
    _nameEn = value;
  }

  Images get image => _image;

  set image(Images value) {
    _image = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String name(Locale locale) {
    if (locale.languageCode == 'en') {
      return nameEn;
    }
    return nameAr;
  }

  String getPrice() {
    double p = num.parse(price);
    return p.toStringAsFixed(1);
  }
}
