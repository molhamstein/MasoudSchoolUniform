import 'package:almasaood_app/models/ProductModel.dart';
import 'package:almasaood_app/models/ProfileModel.dart';
import 'package:almasaood_app/models/SignModel.dart';
import 'package:almasaood_app/models/VerifyModel.dart';
import 'package:almasaood_app/models/gradesModel.dart';
import 'package:almasaood_app/models/productDetailsModel.dart';
import 'package:rxdart/rxdart.dart';

import '../ApiProvider.dart';
import '../AppConstant.dart';

class SingletonBloc {
  static final SingletonBloc _singletonBloc = new SingletonBloc._internal();

  factory SingletonBloc() {
    return _singletonBloc;
  }

  SingletonBloc._internal() {}

  final _signInController = BehaviorSubject<SignInModel>();

  get signInStream => _signInController.stream;

  final _verifyController = BehaviorSubject<VerifyModel>();

  get verifyStream => _verifyController.stream;

  final _signUpController = BehaviorSubject<ProfileModel>();

  get signUpStream => _signUpController.stream;

  final _gradesController = BehaviorSubject<List<GradesModel>>();

  get gradesStream => _gradesController.stream;

  final _productsController = BehaviorSubject<List<ProductsModel>>();

  get productsStream => _productsController.stream;





  final _productInfoController = BehaviorSubject<ProductsModel>();

  get productInfoStream => _productInfoController.stream;

  final _productSizeController = BehaviorSubject<List<Size>>();

  get productSizeStream => _productSizeController.stream;

  final _myCartController = BehaviorSubject<List<Size>>();

  get myCartStream => _myCartController.stream;

  final _cartController = BehaviorSubject<List<ProductDetailsModel>>();

  get cartStream => _cartController.stream;

  final _productsPriceController = BehaviorSubject<double>();

  get productPriceStream => _productsPriceController.stream;

  get pushEstimationCost => _productsPriceController.sink
      .add(f_estimatedPrice(true));




  final String token = "8398556d0d07527e60f9c18f0164e2656c74cf4b";

////////////////////////////////
  f_SignIn(mobileNumber) {
    mobileNumber = "+" + mobileNumber;
    print(mobileNumber);
    apiProvider.signIn(mobileNumber).then((val) {
      print(val.message);
      _signInController.sink.add(val);
    });
  }

  f_Verify(mobile, code) {
    mobile = "+" + mobile;
    apiProvider.verify(mobile, code).then((val) {
      print(val.token);
      AppConstant.token = val.token;

      _verifyController.sink.add(val);
    });
  }

  f_signUp(firstName, lastName, email) {
    apiProvider.editProfile(token, firstName, lastName, email).then((val) {
      print(val.firstName);
      _signUpController.sink.add(val);
    });
  }

  f_getProducts(id) {
    List<ProductsModel> pro = new List();
    pro = [];

    apiProvider.products().then((valPro) {
      if (id == -1) {
        for (int i = 0; i < valPro.products.length; i++) {
          pro.add(valPro.products[i]);

          _productsController.sink.add(pro);
        }
      } else {
        for (int i = 0; i < valPro.products.length; i++) {
          if (valPro.products[i].grade.id == id) {
            print(valPro.products[i].nameEn);
            pro.add(valPro.products[i]);

            _productsController.sink.add(pro);
          }
        }
      }
    });
  }

  f_grades() {
    GradesModel all = new GradesModel(id: -1, nameEn: "All");
    List<GradesModel> list = [all];
    apiProvider
        .getGrades("Bearer 5d301f006c60ce9037f171765faa0c36102b77fe")
        .then((valGrad) {
      for (int i = 0; i < valGrad.grades.length; i++) {
        list.add(valGrad.grades[i]);
        _gradesController.sink.add(list);
      }
    });
  }

  f_productDetails(ProductsModel productItem) {
    _productInfoController.sink.add(productItem);
    _productSizeController.sink.add(null);
    List<Size> sizeList = new List();
    for (int i = 0; i < productItem.products.length; i++) {
      sizeList.add(productItem.products[i].size);
      _productSizeController.sink.add(sizeList);
    }
  }

  createOrder() {
    List<Map<String, int>> productsMap = new List();
    List<K> k = new List();
    k.add(K(1, 1));
    k.add(K(2, 2));
    k.add(K(3, 3));
    for (int i = 0; i < k.length; i++) {
      Map<String, int> item = new Map();
      item['product'] = k[i].proudct;
      item['count'] = k[i].count;
      productsMap.add(item);
    }
    print(productsMap.toString());

    apiProvider.createOrder("", "", "", productsMap).then((val) {});
  }

  List<ProductDetailsModel> cartItems = new List();

  f_addToCart(ProductDetailsModel orderData) {
    print("order id out side " + orderData.id.toString());
    int count = 0;

    if (cartItems.isNotEmpty) {
      for (int i = 0; i < cartItems.length; i++) {
        print("im in the list ");
        print("order is " + orderData.id.toString());
        print("cartItems " + cartItems[i].id.toString());
        if (orderData.id == cartItems[i].id) {
          count += 1;
          print("added inside");
        }
      }

      if (count == 0) {
        cartItems.add(orderData);
        _cartController.sink.add(cartItems);
      }
    } else {
      cartItems.add(orderData);
      _cartController.sink.add(cartItems);
    }
    print("list length" + cartItems.length.toString());
  }

  f_removeItemFromCart(int count, int index) {
    double price = double.parse(cartItems[index].price);
    if (count == 1) {
      cartItems.removeAt(index);
      _cartController.sink.add(cartItems);
    } else {
      cartItems[index].count -= 1;
      price /= 2;
      cartItems[index].price = price.toString();
      _cartController.sink.add(cartItems);

      print(cartItems[index].count);
    }
  }

  f_IncreaseOrderCount(int index) {


    double price = double.parse(cartItems[index].price);
    cartItems[index].count += 1;
    price *= 2;
    cartItems[index].price = price.toString();
    _cartController.sink.add(cartItems);
    pushEstimationCost();

  }

  int f_getProductId(ProductsModel product, int sizeId) {
    for (int i = 0; i < product.products.length; i++) {
      if (product.products[i].size.id == sizeId) {
        print("productid ");
        print(product.products[i].id);
        return product.products[i].id;
      }
    }
  }

  double f_estimatedPrice(bool withDelivery) {
    double price = 0;
    for (int i = 0; i < cartItems.length; i++) {
      price += double.parse(cartItems[i].price);
      _productsPriceController.sink.add(price);
    }

    return price;
  }
}

final bloc = SingletonBloc();

class K {
  int proudct;

  int count;

  K(this.proudct, this.count);
}
