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
  int _id;
  List<Products> _products;
  String _nameEn;
  String _nameAr;
  String _descriptionAr;
  String _descriptionEn;
  String _gender;
  String _createdAt;
  Images _image;
  Grade _grade;

  ProductsModel(
      {int id,
      List<Products> products,
      String nameEn,
      String nameAr,
      String descriptionAr,
      String descriptionEn,
      String gender,
      String createdAt,
      Images image,
      Grade grade}) {
    this._id = id;
    this._products = products;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
    this._descriptionAr = descriptionAr;
    this._descriptionEn = descriptionEn;
    this._gender = gender;
    this._createdAt = createdAt;
    this._image = image;
    this._grade = grade;
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

  Images get image => _image;

  set image(Images image) => _image = image;

  Grade get grade => _grade;

  set grade(Grade grade) => _grade = grade;

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
    _image = json['image'] != null ? new Images.fromJson(json['image']) : null;
    _grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
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
    if (this._image != null) {
      data['image'] = this._image.toJson();
    }
    if (this._grade != null) {
      data['grade'] = this._grade.toJson();
    }
    return data;
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
  String _status;
  String _price;
  Size _size;
  AbstractProduct _abstractProduct;

  Products(
      {int id,
      String code,
      String status,
      String price,
      Size size,
      AbstractProduct abstractProduct}) {
    this._id = id;
    this._code = code;
    this._status = status;
    this._price = price;
    this._size = size;
    this._abstractProduct = abstractProduct;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get code => _code;

  set code(String code) => _code = code;

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
}

class AbstractProduct {
  int _id;
  String _nameEn;
  String _nameAr;
  String _descriptionAr;
  String _descriptionEn;
  String _gender;
  String _createdAt;
  int _image;
  int _grade;

  AbstractProduct(
      {int id,
      String nameEn,
      String nameAr,
      String descriptionAr,
      String descriptionEn,
      String gender,
      String createdAt,
      int image,
      int grade}) {
    this._id = id;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
    this._descriptionAr = descriptionAr;
    this._descriptionEn = descriptionEn;
    this._gender = gender;
    this._createdAt = createdAt;
    this._image = image;
    this._grade = grade;
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

  int get image => _image;

  set image(int image) => _image = image;

  int get grade => _grade;

  set grade(int grade) => _grade = grade;

  AbstractProduct.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
    _descriptionAr = json['descriptionAr'];
    _descriptionEn = json['descriptionEn'];
    _gender = json['gender'];
    _createdAt = json['createdAt'];
    _image = json['image'];
    _grade = json['grade'];
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
    data['image'] = this._image;
    data['grade'] = this._grade;
    return data;
  }
}

class Images {
  int _id;
  String _file;
  String _createdAt;

  Images({int id, String file, String createdAt}) {
    this._id = id;
    this._file = file;
    this._createdAt = createdAt;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get file => _file;

  set file(String file) => _file = file;

  String get createdAt => _createdAt;

  set createdAt(String createdAt) => _createdAt = createdAt;

  Images.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _file = json['file'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['file'] = this._file;
    data['createdAt'] = this._createdAt;
    return data;
  }
}

class Grade {
  int _id;
  String _nameEn;
  String _nameAr;
  String _createdAt;

  Grade({int id, String nameEn, String nameAr, String createdAt}) {
    this._id = id;
    this._nameEn = nameEn;
    this._nameAr = nameAr;
    this._createdAt = createdAt;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get nameEn => _nameEn;

  set nameEn(String nameEn) => _nameEn = nameEn;

  String get nameAr => _nameAr;

  set nameAr(String nameAr) => _nameAr = nameAr;

  String get createdAt => _createdAt;

  set createdAt(String createdAt) => _createdAt = createdAt;

  Grade.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameEn = json['nameEn'];
    _nameAr = json['nameAr'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nameEn'] = this._nameEn;
    data['nameAr'] = this._nameAr;
    data['createdAt'] = this._createdAt;
    return data;
  }
}
