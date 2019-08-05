import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/OrderModel.dart';
import 'package:almasaood_app/models/ProductModel.dart';
import 'package:almasaood_app/models/ProfileModel.dart';
import 'package:almasaood_app/models/SignModel.dart';
import 'package:almasaood_app/models/StatesModel.dart';
import 'package:almasaood_app/models/VerifyModel.dart';
import 'package:almasaood_app/models/gradesModel.dart';
import 'package:almasaood_app/models/productDetailsModel.dart';
import 'package:rxdart/rxdart.dart';

import '../ApiProvider.dart';
import '../DataStore.dart';

class SingletonBloc {
  static final SingletonBloc _singletonBloc = new SingletonBloc._internal();

  factory SingletonBloc() {
    return _singletonBloc;
  }

  SingletonBloc._internal() {
    _shouldRotateController.sink.add(false);
    _cartController.sink.add(dataStore.cartList ?? null);
    for(int i =0 ; i<dataStore.price.length ;i++ ){
      price.add(double.parse( dataStore.price[i]));
    }


    withDelivery = false;
  }

  double priceCost;
  final _signInController = PublishSubject<SignInModel>();

  get signInStream => _signInController.stream;

  final _verifyController = PublishSubject<VerifyModel>();

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

  get pushEstimationCost =>
      _productsPriceController.sink.add(f_estimatedPrice(withDelivery));

  final _shouldRotateController = BehaviorSubject<bool>();

  get shouldRotateStream => _shouldRotateController.stream;

  bool showFeedback;
  bool withDelivery;

  final _feedbackController = BehaviorSubject<String>();

  get feedbackStream => _feedbackController.stream;

  final _statesController = BehaviorSubject<List<StatesModel>>();

  get statesStream => _statesController.stream;
  final _orderController = PublishSubject<OrderModel>();

  get orderStream => _orderController.stream;
  final _cartCountController = PublishSubject<int>();

  get cartCountStream => _cartCountController.stream;

////////////////////////////////
  f_SignIn({String mobileNumber, bool fromVerification}) {
    print(mobileNumber);
    print(fromVerification);
    showFeedback = true;

    if (!fromVerification) {
      _shouldRotateController.sink.add(true);
    }

    apiProvider.signIn(mobileNumber).then((val) {
      _shouldRotateController.sink.add(false);
      print(val.message);
      _signInController.sink.add(val);
    }).catchError((e) {
      showFeedback = true;
      _shouldRotateController.sink.add(false);

      _signInController.sink.addError(e);
    });
  }

  f_Verify(mobile, code) {
    _shouldRotateController.sink.add(true);
    apiProvider.verify(mobile, code).then((val) {
      _shouldRotateController.sink.add(false);
      _verifyController.sink.add(val);
    }).catchError((e) {
      showFeedback = true;
      _shouldRotateController.sink.add(false);
      _verifyController.sink.addError(e);
    });
  }

  f_signUp(firstName, lastName) {
    _shouldRotateController.sink.add(true);
    apiProvider
        .editProfile(dataStore.user.token, firstName, lastName)
        .then((val) {
      _shouldRotateController.sink.add(false);
      _signUpController.sink.add(val);
    }).catchError((e) {
      showFeedback = true;
      _shouldRotateController.sink.add(false);
      _signUpController.sink.addError(e);
    });
  }

  List<ProductsModel> pro = new List();

  f_sortProduct(id) {
    List<ProductsModel> sortedItems = new List();

    if (id == -1) {
      for (int i = 0; i < pro.length; i++) {
        sortedItems.add(pro[i]);
        _productsController.sink.add(sortedItems);
      }
    } else {
      for (int i = 0; i < pro.length; i++) {
        if (pro[i].grade.id == id) {
          sortedItems.add(pro[i]);

          _productsController.sink.add(sortedItems);
        }
      }
    }
  }

//
//  f_getProducts() {
//    pro = [];
//    apiProvider.products().then((valPro) {
//      for (int i = 0; i < valPro.products.length; i++) {
//        pro.add(valPro.products[i]);
//        _productsController.sink.add(pro);
//      }
//    }).catchError((e) {
//      _productsController.sink.addError(e);
//    });
//  }

  f_grades() {
    _gradesController.sink.add(dataStore.grades ?? null);
    GradesModel all = new GradesModel(id: -1, nameEn: "All", nameAr: "الكل");
    List<GradesModel> list = [all];
    apiProvider.getGrades(dataStore.user.token).then((valGrad) {
      for (int i = 0; i < valGrad.grades.length; i++) {
        list.add(valGrad.grades[i]);
        _gradesController.sink.add(list);
      }
      dataStore.setGrades(list);
    }).catchError((e) {
      _gradesController.sink.addError(e);

      _gradesController.sink.add(dataStore.grades ?? null);
    });
  }

  f_getProducts() {

    f_loadCartData();

    _productsController.sink.add(dataStore.products ?? null);
    pro = dataStore.products ?? [];
//    pro = [];
    apiProvider.products(dataStore.user.token).then((valPro) {


      print(pro.length);
      for (int i = 0; i < valPro.products.length; i++) {
        print("in");
        if (pro.length != 0) {
          bool isExist = false;
          for (int j = 0; j < pro.length; j++) {
            if (valPro.products[i].id == pro[j].id) {
              isExist = true;
              break;
            }
          }

          if (!isExist) {
            pro.add(valPro.products[i]);
            _productsController.sink.add(pro);
          }
        } else {
          pro.add(valPro.products[i]);
          _productsController.sink.add(pro);
        }
      }
      dataStore.setProducts(pro);
      print(pro.length.toString() + "prooooo lenght ouuuuuuuut");
    }).catchError((e) {
      _productsController.sink.addError(e);
      _productsController.sink.add(dataStore.products ?? null);
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

  createOrder(
      {deliveryAddress,
      delieveryLat,
      delieveryLng,
      List<ProductDetailsModel> data,
      centerId}) {
    _shouldRotateController.sink.add(true);

    List<Map<String, int>> productsMap = new List();
    for (int i = 0; i < data.length; i++) {
      Map<String, int> item = new Map();
      item['product'] = data[i].id;
      item['count'] = data[i].count;
      productsMap.add(item);
    }
    apiProvider
        .createOrder(dataStore.user.token, deliveryAddress, delieveryLat,
            delieveryLng, productsMap, centerId)
        .then((val) {
      cartItems = [];
      dataStore.setPrice([]);
      dataStore.setCart([]);
      _cartController.sink.add(cartItems);
      _shouldRotateController.sink.add(false);

      _orderController.sink.add(val);
    }).catchError((e) {
      print("eeeeeeeeeeeeeeeeeeee" + e.toString());
      _shouldRotateController.sink.add(false);

      showFeedback = true;

      _orderController.sink.addError(e);
    });
  }

  List<ProductDetailsModel> cartItems = new List();

  f_loadCartData() {
    print("loadCartData price" + dataStore.price.length.toString() ??"0");
    print("loadCartData cartList" + dataStore.cartList.length.toString());

    for(int i =0 ; i<dataStore.price.length ;i++ ){
      price.add(double.parse( dataStore.price[i]));
    }
    cartItems = dataStore.cartList ?? null;


    _cartController.sink.add(cartItems);
  }

  f_getCartCount() {

    print("in" + cartItems.length.toString());
    int count = 0;

    for (int i = 0; i < cartItems.length; i++) {
      count += cartItems[i].count;
    }
    print("f_getCartCount  " + dataStore.price.length.toString() ??"0");
    _cartCountController.sink.add(count);

    return count;
  }

  f_addToCart(ProductDetailsModel orderData, context) {
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
        _feedbackController.sink
            .add(AppLocalizations.of(context).trans('added_successfully'));
        _cartController.sink.add(cartItems);
        bloc.price.add(double.parse(orderData.price));
        showFeedback = true;
      } else {
        print("Already exist");
        _feedbackController.sink
            .addError(AppLocalizations.of(context).trans('already_exist'));
        showFeedback = true;
      }
    } else {
      cartItems.add(orderData);
      _cartController.sink.add(cartItems);
      bloc.price.add(double.parse(orderData.price));
      _feedbackController.sink
          .add(AppLocalizations.of(context).trans('added_successfully'));
      showFeedback = true;
    }
    dataStore.setCart(cartItems);

    List<String> tempPrice = [];
    for (int i = 0; i < price.length; i++) {
//      dataStore.setPrice();
      tempPrice.add(price[i].toString());
    }
          dataStore.setPrice(tempPrice);


    print(dataStore.cartList[0].price);

    print("list length" + cartItems.length.toString());
  }

  f_removeItemFromCart(int count, int index) {



    if (count == 1) {
      cartItems.removeAt(index);
      price.removeAt(index);
      _cartController.sink.add(cartItems);
      dataStore.setCart(null);
      dataStore.setCart(cartItems);
      withDelivery = false;
      pushEstimationCost();
    } else {
      cartItems[index].count -= 1;
      cartItems[index].price =
          (double.parse(cartItems[index].price) - price[index]).toString();
      _cartController.sink.add(cartItems);
      dataStore.setCart(null);
      dataStore.setCart(cartItems);
      pushEstimationCost();

      print(cartItems[index].count);
    }
  }

  List<double> price = List();

  f_IncreaseOrderCount(int index) {
    print(price[index]);

    cartItems[index].count += 1;
    cartItems[index].price =
        (double.parse(cartItems[index].price) + price[index]).toString();
    _cartController.sink.add(cartItems);
    dataStore.setCart(null);
    dataStore.setCart(cartItems);
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

  f_getProductPrice(ProductsModel product, int sizeId) {
    for (int i = 0; i < product.products.length; i++) {
      if (product.products[i].size.id == sizeId) {
        print(product.products[i].id);

        double p = num.parse(product.products[0].price);
        return p.toStringAsFixed(1);

//        return product.products[i].price;
      }
    }
  }

  double f_estimatedPrice(bool withDelivery) {
    double price = 0;
    for (int i = 0; i < cartItems.length; i++) {
      price += double.parse(cartItems[i].price);
    }

    if (withDelivery == true) {
      price += 10;
      _productsPriceController.sink.add(price);
    } else {
      _productsPriceController.sink.add(price);
    }

    return price;
  }

  List<StatesModel> states = new List();

  f_getStates() {
    states = [];
    apiProvider.getStates(dataStore.user.token).then((onVal) {
      for (int i = 0; i < onVal.states.length; i++) {
        states.add(onVal.states[i]);
        _statesController.sink.add(states);
      }
    }).catchError((e) {
      print(e);
    });
  }

  List<Centers> centers = new List();

  f_getMarkers(int id) {
    centers = [];
    for (int i = 0; i < states.length; i++) {
      if (states[i].id == id) {
        for (int j = 0; j < states[i].centers.length; j++) {
          centers.add(states[i].centers[j]);
        }
      }
    }
  }
}

final bloc = SingletonBloc();
