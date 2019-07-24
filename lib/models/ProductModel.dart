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

class ProductsModel {
  int id;
  List<Products> products;
  String nameEn;
  String nameAr;
  String descriptionAr;
  String descriptionEn;
  String gender;
  String createdAt;
  Grade grade;
  List<Images> images;

  ProductsModel(
      {this.id,
        this.products,
        this.nameEn,
        this.nameAr,
        this.descriptionAr,
        this.descriptionEn,
        this.gender,
        this.createdAt,
        this.grade,
        this.images});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    descriptionAr = json['descriptionAr'];
    descriptionEn = json['descriptionEn'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['descriptionAr'] = this.descriptionAr;
    data['descriptionEn'] = this.descriptionEn;
    data['gender'] = this.gender;
    data['createdAt'] = this.createdAt;
    if (this.grade != null) {
      data['grade'] = this.grade.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
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
  int id;
  String code;
  String status;
  String price;
  Size size;
  AbstractProduct abstractProduct;

  Products(
      {this.id,
        this.code,
        this.status,
        this.price,
        this.size,
        this.abstractProduct});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    status = json['status'];
    price = json['price'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    abstractProduct = json['abstractProduct'] != null
        ? new AbstractProduct.fromJson(json['abstractProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['status'] = this.status;
    data['price'] = this.price;
    if (this.size != null) {
      data['size'] = this.size.toJson();
    }
    if (this.abstractProduct != null) {
      data['abstractProduct'] = this.abstractProduct.toJson();
    }
    return data;
  }
}

class Size {
  int id;
  String nameAr;
  String nameEn;
  String code;
  String createdAt;

  Size({this.id, this.nameAr, this.nameEn, this.code, this.createdAt});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    code = json['code'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['code'] = this.code;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class AbstractProduct {
  int id;
  String nameEn;
  String nameAr;
  String descriptionAr;
  String descriptionEn;
  String gender;
  String createdAt;
  int grade;
  List<Images> images;

  AbstractProduct(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.descriptionAr,
        this.descriptionEn,
        this.gender,
        this.createdAt,
        this.grade,
        this.images});

  AbstractProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    descriptionAr = json['descriptionAr'];
    descriptionEn = json['descriptionEn'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    grade = json['grade'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['descriptionAr'] = this.descriptionAr;
    data['descriptionEn'] = this.descriptionEn;
    data['gender'] = this.gender;
    data['createdAt'] = this.createdAt;
    data['grade'] = this.grade;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int id;
  String file;
  String createdAt;
  String type;

  Images({this.id, this.file, this.createdAt, this.type});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    createdAt = json['createdAt'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file'] = this.file;
    data['createdAt'] = this.createdAt;
    data['type'] = this.type;
    return data;
  }
}

class Grade {
  int id;
  String nameEn;
  String nameAr;
  String createdAt;

  Grade({this.id, this.nameEn, this.nameAr, this.createdAt});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['createdAt'] = this.createdAt;
    return data;
  }
}






