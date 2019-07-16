import 'package:almasaood_app/models/ProductModel.dart';
import 'package:almasaood_app/models/ProfileModel.dart';
import 'package:almasaood_app/models/SignModel.dart';
import 'package:almasaood_app/models/VerifyModel.dart';
import 'package:almasaood_app/models/gradesModel.dart';
import 'package:rxdart/rxdart.dart';

import '../ApiProvider.dart';
import '../AppConstant.dart';

enum FilterType { ALL, FIRST_GRADE, SECOND_GRADE, THIRD_GRADE }

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
    apiProvider
        .getGrades("Bearer 5d301f006c60ce9037f171765faa0c36102b77fe")
        .then((valGrad) {
      _gradesController.sink.add(valGrad.grades);
    });
  }

//  getProductList(FilterType f) {
//    apiProvider.products().then((onVal) {
//
//      productList.value = [];
//
//      switch (f) {
//        case FilterType.ALL:
//          {
//            for (int i = 0; i < onVal.products.length; i++) {
//              productList.value.add(onVal.products[i]);
//            }
//            break;
//          }
//        case FilterType.FIRST_GRADE:
//          {
//            for (int i = 0; i < onVal.products.length; i++) {
//              if (onVal.products[i].grade.id == 1)
//                productList.value.add(onVal.products[i]);
//            }
//            break;
//          }
//        case FilterType.SECOND_GRADE:
//          {
//            for (int i = 0; i < onVal.products.length; i++) {
//              if (onVal.products[i].grade.id == 2)
//                productList.value.add(onVal.products[i]);
//            }
//            break;
//          }
//        case FilterType.THIRD_GRADE:
//          {
//            for (int i = 0; i < onVal.products.length; i++) {
//              if (onVal.products[i].grade.id == 3)
//                productList.value.add(onVal.products[i]);
//            }
//            break;
//          }
//      }
//    });
//  }

}

final bloc = SingletonBloc();
