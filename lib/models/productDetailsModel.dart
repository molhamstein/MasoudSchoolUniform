import 'dart:ui';

import 'ProductModel.dart';

class ProductDetailsModel {
  int _id;
  Images _image;
  String _nameEn;
  String _nameAr;
  String _price;
  Grade _grade;
  String _gender;
  Size _size;

  int _count;

  ProductDetailsModel(this._id, this._image, this._nameEn, this._nameAr,
      this._price, this._grade, this._gender, this._size, this._count);

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
      double p =num.parse( price) ;
      return p.toStringAsFixed(1);

}}
