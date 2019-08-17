import 'dart:async';
import 'dart:math';

import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/SignModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../AlmasaoodColors.dart';
import '../ApiProvider.dart';
import '../UserFeedBack.dart';
import '../Utils.dart';
import 'VerificationCode.dart';

class CheckNumber extends StatefulWidget {
  @override
  _CheckNumberState createState() => _CheckNumberState();
}

class _CheckNumberState extends State<CheckNumber>
    with TickerProviderStateMixin, UserFeedback,ErrorCodes {
  TextEditingController numberController = new TextEditingController();

  AnimationController animationController;
  AnimationController sce_Animationcontroller;
  Animation sce_Animation;

  Animation logoAnimation;
  Animation logoAnimationFade;
  Animation textFieldAnimation;
  Animation buttonAnimation;

  Animation needleAnimation;
  Animation stringOneAnimation;
  Animation stringTwoAnimation;
  Animation needlesAnimationX;
  Animation needlesAnimationY;

  Animation secsAnimationX;
  Animation secsAnimationY;

  Animation firstSceAnimation;

  Animation secondSceAnimation;

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3,milliseconds: 500));

    sce_Animationcontroller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));

    logoAnimation = Tween(begin: -1.30, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.30, 1.0, curve: ElasticOutCurve(0.8))));
    logoAnimationFade = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.5, 1.0)));

    textFieldAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));

    buttonAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.65, 1.0, curve: ElasticOutCurve(0.8))));

    needleAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));

    stringOneAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));

    stringTwoAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));

    needlesAnimationX = Tween(begin: -1, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));

    needlesAnimationY = Tween(begin: 3 / 4, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));

    secsAnimationX = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));
    secsAnimationY = Tween(begin: 3 / 4, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));

    firstSceAnimation = Tween(begin: 0.0, end: pi / 8).animate(
        CurvedAnimation(parent: sce_Animationcontroller, curve: Curves.linear));
    secondSceAnimation = Tween(begin: 0.0, end: -pi / 8).animate(
        CurvedAnimation(parent: sce_Animationcontroller, curve: Curves.linear));

    sce_Animationcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        sce_Animationcontroller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        sce_Animationcontroller.forward();
      }
    });

    sce_Animationcontroller.forward();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Scaffold(
            body: StreamBuilder<SignInModel>(
                stream: bloc.signInStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError && bloc.showFeedback == true) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
//                      if(snapshot.error == ErrorCodes.SERVICE_UNAVAILABLE)
                        print(
                        snapshot.error
                      );
//else
                      if(snapshot.error.toString() == "SERVICE_UNAVAILABLE"){
                        showInSnackBar(
                            AppLocalizations.of(context)
                                .trans('service_unavailable'),
                            context);
                      }else
                      showInSnackBar(
                          AppLocalizations.of(context)
                              .trans('something_went_wrong'),
                          context);
                      bloc.showFeedback = false;
                    });
                  } else if (snapshot.hasData && snapshot.data != null) {
                    animationController.reverse().then((e) {


                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => VerificationCode(
                                    numberController.text,
                                    snapshot.data.created , snapshot.data.code)));
                      });
                    });
                  }

                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AlmasaoodColors.primaryColor,
                      ),
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: <Widget>[
                          Localizations(delegates: [
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                          ],
                            locale: Locale('en', ''),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Transform(
                                        transform: Matrix4.translationValues(
                                            0.0,
                                            needleAnimation.value *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            0.0),
                                        child: Image.asset(
                                          "assets/images/needle.png",
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  3,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  2,
                                        ),
                                      ),
                                      Transform(
                                        transform: Matrix4.translationValues(
                                            stringOneAnimation.value *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            0.0,
                                            0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 130.0),
                                          child: Image.asset(
                                            "assets/images/string1.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3,
//                                    width:
//                                        MediaQuery.of(context).size.width / 2,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Transform(
                                        transform: Matrix4.translationValues(
                                            stringTwoAnimation.value *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            0.0,
                                            0.0),
                                        child: Image.asset(
                                          "assets/images/string2.png",
                                          height:
                                              MediaQuery.of(context).size.width /
                                                  4,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  4,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Transform(
                                        transform: Matrix4.translationValues(
                                            needlesAnimationX.value *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            needlesAnimationY.value *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            0.0),
                                        child: Image.asset(
                                          "assets/images/needles.png",
//                                    width:
//                                        MediaQuery.of(context).size.width / 3,
                                          height:
                                              MediaQuery.of(context).size.width /
                                                  3,
                                        ),
                                      ),
                                      Transform(
                                          transform: Matrix4.translationValues(
                                              secsAnimationX.value *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                              secsAnimationY.value *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                              0.0),
                                          child: Stack(children: <Widget>[
                                            AnimatedBuilder(
                                              animation: sce_Animationcontroller,
                                              builder: (context, child) {
                                                return Transform.rotate(
                                                    angle:
                                                        firstSceAnimation.value,
                                                    child: child);
                                              },
                                              child: Image.asset(
                                                "assets/images/sce_white.png",
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                              ),
                                            ),
                                            AnimatedBuilder(
                                              animation: sce_Animationcontroller,
                                              builder: (context, child) {
                                                return Transform.rotate(
                                                    angle:
                                                        secondSceAnimation.value,
                                                    child: child);
                                              },
                                              child: Image.asset(
                                                "assets/images/sce_white_2.png",
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                              ),
                                            )
                                          ]))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: Column(
                              children: <Widget>[
                                Transform(
                                  transform: Matrix4.translationValues(
                                      0.0,
                                      logoAnimation.value *
                                          MediaQuery.of(context).size.height,
                                      0.0),
                                  child: FadeTransition(
                                    opacity: logoAnimationFade,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 110),
                                      child: Image.asset(
                                        "assets/images/logo_white.png",
                                        height: 180,
                                        width: 180,
                                      ),
                                    ),
                                  ),
                                ),
                                Transform(
                                  transform: Matrix4.translationValues(
                                      0.0,
                                      textFieldAnimation.value *
                                          MediaQuery.of(context).size.height,
                                      0.0),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 32.0, left: 16, right: 16),
                                      child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Colors.black45,
                                                blurRadius: 25.0,
                                                offset: Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          child: Localizations(delegates: [
                                            GlobalMaterialLocalizations.delegate,
                                            GlobalWidgetsLocalizations.delegate,
                                          ],
                                            locale: Locale('en', ''),
                                            child: AuthTextField(
                                              textEditingController:
                                                  numberController,image: Image.asset("assets/images/phoneIcon.png",scale: 1.5,),
                                              hint: AppLocalizations.of(context)
                                                  .trans('mobile_number'),
                                            ),
                                          ))),
                                ),
                                Transform(
                                  transform: Matrix4.translationValues(
                                      0.0,
                                      buttonAnimation.value *
                                          MediaQuery.of(context).size.height,
                                      0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 64.0),
                                    child: StreamBuilder<bool>(
                                        stream: bloc.shouldRotateStream,
                                        builder: (context, snapshot) {
                                          return MainButton(
                                            shouldRotate: snapshot.data,
                                            textColor: AlmasaoodColors.black,
                                            dashColor:
                                                AlmasaoodColors.primaryColor,
                                            onPressed: () {
                                              if (Utils.isValidNumber(
                                                  numberController.text)) {
                                                String tempMobile;
//                                                if (numberController.text
//                                                    .startsWith("09")) {
//                                                  tempMobile = numberController
//                                                      .text
//                                                      .split("0")[1];
//                                                  numberController.text =
//                                                      "00971" + tempMobile;
//                                                  print(tempMobile);
//                                                  print(true);
//
//                                                  bloc.f_SignIn(
//                                                      numberController.text);
//                                                } else if (numberController.text
//                                                    .startsWith("00")) {
//                                                  numberController.text =
//                                                      numberController.text;
//
//                                                  bloc.f_SignIn(
//                                                      numberController.text);
//                                                } else {

                                                if (numberController.text
                                                    .startsWith("+971")) {
                                                  bloc.f_SignIn(
                                                      mobileNumber: numberController.text,fromVerification: false);
                                                } else if (numberController.text
                                                    .startsWith("00971")) {
                                                  tempMobile = numberController
                                                      .text
                                                      .split("00")[1];
                                                  numberController.text =
                                                      "+" + tempMobile;
                                                  bloc.f_SignIn(
                                                     mobileNumber:  numberController.text,fromVerification: false);
                                                } else if (numberController.text
                                                    .startsWith("0")) {
                                                  print(numberController.text);
                                                  tempMobile = numberController
                                                      .text
                                                      .replaceFirst(
                                                          "0", "+971");

                                                  print(tempMobile);
                                                  numberController.text =
                                                      tempMobile;
                                                  bloc.f_SignIn(
                                                     mobileNumber:  numberController.text,fromVerification: false);
                                                } else {
                                                  print("Not valid");
                                                  showInSnackBar(
                                                      AppLocalizations.of(
                                                              context)
                                                          .trans(
                                                              'please_enter_valid_nam'),
                                                      context);
                                                }
                                              } else {
                                                showInSnackBar(
                                                    AppLocalizations.of(context)
                                                        .trans(
                                                            'please_enter_valid_nam'),
                                                    context);
                                              }
                                              ;
                                            },
                                            text: AppLocalizations.of(context)
                                                .trans('Submit'),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }

  Future<bool> onWillPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
