//import 'dart:ui';
//
//class ProductList {
//  final List<ProductsModel> products;
//
//  ProductList({
//    this.products,
//  });
//
//  factory ProductList.fromJson(List<dynamic> parsedJson) {
//    List<ProductsModel> products = new List<ProductsModel>();
//    products = parsedJson.map((i) => ProductsModel.fromJson(i)).toList();
//
//    return new ProductList(products: products);
//  }
//}
//
//class ProductsModel {
//  int id;
//  List<Products> products;
//  String nameEn;
//  String nameAr;
//  String descriptionAr;
//  String descriptionEn;
//  String gender;
//  String createdAt;
//  Grade grade;
//  List<Images> images;
//
//  ProductsModel(
//      {this.id,
//      this.products,
//      this.nameEn,
//      this.nameAr,
//      this.descriptionAr,
//      this.descriptionEn,
//      this.gender,
//      this.createdAt,
//      this.grade,
//      this.images});
//
//  ProductsModel.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    if (json['products'] != null) {
//      products = new List<Products>();
//      json['products'].forEach((v) {
//        products.add(new Products.fromJson(v));
//      });
//    }
//    nameEn = json['nameEn'];
//    nameAr = json['nameAr'];
//    descriptionAr = json['descriptionAr'];
//    descriptionEn = json['descriptionEn'];
//    gender = json['gender'];
//    createdAt = json['createdAt'];
//    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
//    if (json['images'] != null) {
//      images = new List<Images>();
//      json['images'].forEach((v) {
//        images.add(new Images.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    if (this.products != null) {
//      data['products'] = this.products.map((v) => v.toJson()).toList();
//    }
//    data['nameEn'] = this.nameEn;
//    data['nameAr'] = this.nameAr;
//    data['descriptionAr'] = this.descriptionAr;
//    data['descriptionEn'] = this.descriptionEn;
//    data['gender'] = this.gender;
//    data['createdAt'] = this.createdAt;
//    if (this.grade != null) {
//      data['grade'] = this.grade.toJson();
//    }
//    if (this.images != null) {
//      data['images'] = this.images.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//
//  String genderT(Locale local) {
//    if (local.languageCode == 'en') {
//      if (gender == 'male') {
//        return "male";
//      } else
//        return "female";
//    } else {
//      if (gender == 'male') {
//        return "ذكر";
//      } else
//        return "انثى";
//    }
//  }
//
//  String name(Locale locale) {
//    if (locale.languageCode == 'en') {
//      return nameEn;
//    }
//    return nameAr;
//  }
//
//  String getPrice() {
//    if (products.isNotEmpty) {
//      double p = num.parse(products[0].price);
//      return p.toStringAsFixed(1);
//    } else
//      return "0.0";
//  }
//}
//
//class Products {
//  int id;
//  String code;
//  String status;
//  String price;
//  Size size;
//  AbstractProduct abstractProduct;
//
//  Products(
//      {this.id,
//      this.code,
//      this.status,
//      this.price,
//      this.size,
//      this.abstractProduct});
//
//  Products.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    code = json['code'];
//    status = json['status'];
//    price = json['price'];
//    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
//    abstractProduct = json['abstractProduct'] != null
//        ? new AbstractProduct.fromJson(json['abstractProduct'])
//        : null;
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['code'] = this.code;
//    data['status'] = this.status;
//    data['price'] = this.price;
//    if (this.size != null) {
//      data['size'] = this.size.toJson();
//    }
//    if (this.abstractProduct != null) {
//      data['abstractProduct'] = this.abstractProduct.toJson();
//    }
//    return data;
//  }
//}
//
//class Size {
//  int id;
//  String nameAr;
//  String nameEn;
//  String code;
//  String createdAt;
//
//  Size({this.id, this.nameAr, this.nameEn, this.code, this.createdAt});
//
//  Size.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    nameAr = json['nameAr'];
//    nameEn = json['nameEn'];
//    code = json['code'];
//    createdAt = json['createdAt'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['nameAr'] = this.nameAr;
//    data['nameEn'] = this.nameEn;
//    data['code'] = this.code;
//    data['createdAt'] = this.createdAt;
//    return data;
//  }
//
//  String name(Locale locale) {
//    if (locale.languageCode == 'en') {
//      return nameEn;
//    }
//    return nameAr;
//  }
//}
//
//class AbstractProduct {
//  int id;
//  String nameEn;
//  String nameAr;
//  String descriptionAr;
//  String descriptionEn;
//  String gender;
//  String createdAt;
//  int grade;
//  List<Images> images;
//
//  AbstractProduct(
//      {this.id,
//      this.nameEn,
//      this.nameAr,
//      this.descriptionAr,
//      this.descriptionEn,
//      this.gender,
//      this.createdAt,
//      this.grade,
//      this.images});
//
//  AbstractProduct.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    nameEn = json['nameEn'];
//    nameAr = json['nameAr'];
//    descriptionAr = json['descriptionAr'];
//    descriptionEn = json['descriptionEn'];
//    gender = json['gender'];
//    createdAt = json['createdAt'];
//    grade = json['grade'];
//    if (json['images'] != null) {
//      images = new List<Images>();
//      json['images'].forEach((v) {
//        images.add(new Images.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['nameEn'] = this.nameEn;
//    data['nameAr'] = this.nameAr;
//    data['descriptionAr'] = this.descriptionAr;
//    data['descriptionEn'] = this.descriptionEn;
//    data['gender'] = this.gender;
//    data['createdAt'] = this.createdAt;
//    data['grade'] = this.grade;
//    if (this.images != null) {
//      data['images'] = this.images.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//
//  String name(Locale locale) {
//    if (locale.languageCode == 'en') {
//      return nameEn;
//    }
//    return nameAr;
//  }
//}
//
//class Images {
//  int id;
//  String file;
//  String createdAt;
//  String type;
//
//  Images({this.id, this.file, this.createdAt, this.type});
//
//  Images.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    file = json['file'];
//    createdAt = json['createdAt'];
//    type = json['type'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['file'] = this.file;
//    data['createdAt'] = this.createdAt;
//    data['type'] = this.type;
//    return data;
//  }
//}
//
//class Grade {
//  int id;
//  String nameEn;
//  String nameAr;
//  String createdAt;
//
//  Grade({this.id, this.nameEn, this.nameAr, this.createdAt});
//
//  Grade.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    nameEn = json['nameEn'];
//    nameAr = json['nameAr'];
//    createdAt = json['createdAt'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['nameEn'] = this.nameEn;
//    data['nameAr'] = this.nameAr;
//    data['createdAt'] = this.createdAt;
//    return data;
//  }
//
//  String name(Locale locale) {
//    if (locale.languageCode == 'en') {
//      return nameEn;
//    }
//    return nameAr;
//  }
//}



import 'dart:convert';
import 'dart:ui';

class ProductList {
  final List<ProductsModel> products;

  ProductList({
    this.products,
  });

  factory ProductList.fromJson(List<dynamic> parsedJson) {
    List<ProductsModel> products = new List<ProductsModel>();
    products = parsedJson.map((i) => ProductsModel.fromJson(i)).toList();

    return new ProductList(products: products);
  }
}




//List<ProductsModel> ProductsFromJson(String str) {
//  final jsonData = json.decode(str);
//  return new List<ProductsModel>.from(jsonData.map((x) => ProductsModel.fromJson(x)));
//}

List<ProductsModel> ProductsFromJson(String str) =>
    new List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));


String ProductsToJson(List<ProductsModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class ProductsModel {
  int _id;
  List<Products> _products;
  String _nameEn;
  String _nameAr;
  String _descriptionAr;
  String _descriptionEn;
  String _gender;
  String _createdAt;
  Grade _grade;
  List<Images> _images;

  ProductsModel(
      {int id,
        List<Products> products,
        String nameEn,
        String nameAr,
        String descriptionAr,
        String descriptionEn,
        String gender,
        String createdAt,
        Grade grade,
        List<Images> images}) {
    this._id = id;
    this._products = products;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
    this._descriptionAr = descriptionAr;
    this._descriptionEn = descriptionEn;
    this._gender = gender;
    this._createdAt = createdAt;
    this._grade = grade;
    this._images = images;
  }

  int get id => _id;
  set id(int id) => _id = id;
  List<Products> get products => _products;
  set products(List<Products> products) => _products = products;
  String get nameEn => _nameEn;
  set nameEn(String nameEn) => _nameEn = nameEn;
  String get nameAr => _nameAr;
  set nameAr(String nameAr) => _nameAr = nameAr;
  String get descriptionAr => _descriptionAr;
  set descriptionAr(String descriptionAr) => _descriptionAr = descriptionAr;
  String get descriptionEn => _descriptionEn;
  set descriptionEn(String descriptionEn) => _descriptionEn = descriptionEn;
  String get gender => _gender;
  set gender(String gender) => _gender = gender;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  Grade get grade => _grade;
  set grade(Grade grade) => _grade = grade;
  List<Images> get images => _images;
  set images(List<Images> images) => _images = images;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['products'] != null) {
      _products = new List<Products>();
      json['products'].forEach((v) {
        _products.add(new Products.fromJson(v));
      });
    }
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
    _descriptionAr = json['descriptionAr'];
    _descriptionEn = json['descriptionEn'];
    _gender = json['gender'];
    _createdAt = json['createdAt'];
    _grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    if (json['images'] != null) {
      _images = new List<Images>();
      json['images'].forEach((v) {
        _images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    data['nameEn'] = this._nameEn;
    data['nameAr'] = this._nameAr;
    data['descriptionAr'] = this._descriptionAr;
    data['descriptionEn'] = this._descriptionEn;
    data['gender'] = this._gender;
    data['createdAt'] = this._createdAt;
    if (this._grade != null) {
      data['grade'] = this._grade.toJson();
    }
    if (this._images != null) {
      data['images'] = this._images.map((v) => v.toJson()).toList();
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

  String name(Locale locale) {
    if (locale.languageCode == 'en') {
      return nameEn;
    }
    return nameAr;
  }

  String getPrice() {
    if (products.isNotEmpty) {
      double p = num.parse(products[0].price);
      return p.toStringAsFixed(1);
    } else
      return "0.0";
  }

}

class Products {
  int _id;
  String _code;
  String _barcode;
  String _status;
  String _price;
  Size _size;
  AbstractProduct _abstractProduct;

  Products(
      {int id,
        String code,
        String barcode,
        String status,
        String price,
        Size size,
        AbstractProduct abstractProduct}) {
    this._id = id;
    this._code = code;
    this._barcode = barcode;
    this._status = status;
    this._price = price;
    this._size = size;
    this._abstractProduct = abstractProduct;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get code => _code;
  set code(String code) => _code = code;
  String get barcode => _barcode;
  set barcode(String barcode) => _barcode = barcode;
  String get status => _status;
  set status(String status) => _status = status;
  String get price => _price;
  set price(String price) => _price = price;
  Size get size => _size;
  set size(Size size) => _size = size;
  AbstractProduct get abstractProduct => _abstractProduct;
  set abstractProduct(AbstractProduct abstractProduct) =>
      _abstractProduct = abstractProduct;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _code = json['code'];
    _barcode = json['barcode'];
    _status = json['status'];
    _price = json['price'];
    _size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    _abstractProduct = json['abstractProduct'] != null
        ? new AbstractProduct.fromJson(json['abstractProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['code'] = this._code;
    data['barcode'] = this._barcode;
    data['status'] = this._status;
    data['price'] = this._price;
    if (this._size != null) {
      data['size'] = this._size.toJson();
    }
    if (this._abstractProduct != null) {
      data['abstractProduct'] = this._abstractProduct.toJson();
    }
    return data;
  }
}

class Size {
  int _id;
  String _nameAr;
  String _nameEn;
  String _code;
  String _createdAt;

  Size({int id, String nameAr, String nameEn, String code, String createdAt}) {
    this._id = id;
    this._nameAr = nameAr;
    this._nameEn = nameEn;
    this._code = code;
    this._createdAt = createdAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get nameAr => _nameAr;
  set nameAr(String nameAr) => _nameAr = nameAr;
  String get nameEn => _nameEn;
  set nameEn(String nameEn) => _nameEn = nameEn;
  String get code => _code;
  set code(String code) => _code = code;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  Size.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameAr = json['nameAr'];
    _nameEn = json['nameEn'];
    _code = json['code'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nameAr'] = this._nameAr;
    data['nameEn'] = this._nameEn;
    data['code'] = this._code;
    data['createdAt'] = this._createdAt;
    return data;
  }


  String name(Locale locale) {
    if (locale.languageCode == 'en') {
      return nameEn;
    }
    return nameAr;
  }


}

class AbstractProduct {
  int _id;
  String _nameEn;
  String _nameAr;
  String _descriptionAr;
  String _descriptionEn;
  String _gender;
  String _createdAt;
  int _grade;
  List<int> _images;

  AbstractProduct(
      {int id,
        String nameEn,
        String nameAr,
        String descriptionAr,
        String descriptionEn,
        String gender,
        String createdAt,
        int grade,
        List<int> images}) {
    this._id = id;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
    this._descriptionAr = descriptionAr;
    this._descriptionEn = descriptionEn;
    this._gender = gender;
    this._createdAt = createdAt;
    this._grade = grade;
    this._images = images;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get nameEn => _nameEn;
  set nameEn(String nameEn) => _nameEn = nameEn;
  String get nameAr => _nameAr;
  set nameAr(String nameAr) => _nameAr = nameAr;
  String get descriptionAr => _descriptionAr;
  set descriptionAr(String descriptionAr) => _descriptionAr = descriptionAr;
  String get descriptionEn => _descriptionEn;
  set descriptionEn(String descriptionEn) => _descriptionEn = descriptionEn;
  String get gender => _gender;
  set gender(String gender) => _gender = gender;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  int get grade => _grade;
  set grade(int grade) => _grade = grade;
  List<int> get images => _images;
  set images(List<int> images) => _images = images;

  AbstractProduct.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
    _descriptionAr = json['descriptionAr'];
    _descriptionEn = json['descriptionEn'];
    _gender = json['gender'];
    _createdAt = json['createdAt'];
    _grade = json['grade'];
    _images = json['images'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nameEn'] = this._nameEn;
    data['nameAr'] = this._nameAr;
    data['descriptionAr'] = this._descriptionAr;
    data['descriptionEn'] = this._descriptionEn;
    data['gender'] = this._gender;
    data['createdAt'] = this._createdAt;
    data['grade'] = this._grade;
    data['images'] = this._images;
    return data;
  }

  String name(Locale locale) {
    if (locale.languageCode == 'en') {
      return nameEn;
    }
    return nameAr;
  }

}

class Grade {
  int _id;
  String _nameEn;
  String _nameAr;
  String _code;
  String _createdAt;

  Grade({int id, String nameEn, String nameAr, String code, String createdAt}) {
    this._id = id;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
    this._code = code;
    this._createdAt = createdAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get nameEn => _nameEn;
  set nameEn(String nameEn) => _nameEn = nameEn;
  String get nameAr => _nameAr;
  set nameAr(String nameAr) => _nameAr = nameAr;
  String get code => _code;
  set code(String code) => _code = code;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  Grade.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
    _code = json['code'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nameEn'] = this._nameEn;
    data['nameAr'] = this._nameAr;
    data['code'] = this._code;
    data['createdAt'] = this._createdAt;
    return data;
  }


  String name(Locale locale) {
    if (locale.languageCode == 'en') {
      return nameEn;
    }
    return nameAr;
  }
}

class Images {
  int _id;
  String _file;
  String _name;
  String _createdAt;
  String _type;

  Images({int id, String file, String name, String createdAt, String type}) {
    this._id = id;
    this._file = file;
    this._name = name;
    this._createdAt = createdAt;
    this._type = type;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get file => _file;
  set file(String file) => _file = file;
  String get name => _name;
  set name(String name) => _name = name;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get type => _type;
  set type(String type) => _type = type;

  Images.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _file = json['file'];
    _name = json['name'];
    _createdAt = json['createdAt'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['file'] = this._file;
    data['name'] = this._name;
    data['createdAt'] = this._createdAt;
    data['type'] = this._type;
    return data;
  }
}



