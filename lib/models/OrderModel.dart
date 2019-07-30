class OrderModel {
  int _id;
  List<Products> _products;
  String _deliveryAddress;
  double _deliveryLat;
  double _devliveryLng;
  int _center;
  bool _isDelivery;

  OrderModel(
      {int id,
      List<Products> products,
      String deliveryAddress,
      double deliveryLat,
      double devliveryLng,
      int center,
      bool isDelivery}) {
    this._id = id;
    this._products = products;
    this._deliveryAddress = deliveryAddress;
    this._deliveryLat = deliveryLat;
    this._devliveryLng = devliveryLng;
    this._center = center;
    this._isDelivery = isDelivery;
  }

  bool get isDelivery => _isDelivery;

  set isDelivery(bool value) {
    _isDelivery = value;
  }

  int get id => _id;

  set id(int id) => _id = id;

  List<Products> get products => _products;

  set products(List<Products> products) => _products = products;

  String get deliveryAddress => _deliveryAddress;

  set deliveryAddress(String deliveryAddress) =>
      _deliveryAddress = deliveryAddress;

  double get deliveryLat => _deliveryLat;

  set deliveryLat(double deliveryLat) => _deliveryLat = deliveryLat;

  double get devliveryLng => _devliveryLng;

  set devliveryLng(double devliveryLng) => _devliveryLng = devliveryLng;

  int get center => _center;

  set center(int center) => _center = center;

  OrderModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['products'] != null) {
      _products = new List<Products>();
      json['products'].forEach((v) {
        _products.add(new Products.fromJson(v));
      });
    }
    _deliveryAddress = json['deliveryAddress'];
    _deliveryLat = json['deliveryLat'];
    _devliveryLng = json['devliveryLng'];
    _center = json['center'];
    _isDelivery = json['isDelivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    data['deliveryAddress'] = this._deliveryAddress;
    data['deliveryLat'] = this._deliveryLat;
    data['devliveryLng'] = this._devliveryLng;
    data['center'] = this._center;
    data['isDelivery'] = this._isDelivery;
    return data;
  }
}

class Products {
  int _id;
  int _count;
  int _product;

  Products({int id, int count, int product}) {
    this._id = id;
    this._count = count;
    this._product = product;
  }

  int get id => _id;

  set id(int id) => _id = id;

  int get count => _count;

  set count(int count) => _count = count;

  int get product => _product;

  set product(int product) => _product = product;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _count = json['count'];
    _product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['count'] = this._count;
    data['product'] = this._product;
    return data;
  }
}
