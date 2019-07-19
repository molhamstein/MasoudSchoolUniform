import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/models/SignModel.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'VerificationCode.dart';

class CheckNumber extends StatefulWidget {
  @override
  _CheckNumberState createState() => _CheckNumberState();
}

class _CheckNumberState extends State<CheckNumber>
    with SingleTickerProviderStateMixin {
  TextEditingController numberController = new TextEditingController();

  AnimationController animationController;
  Animation logoAnimation;
  Animation logoAnimationFade;

  Animation textFieldAnimation;

  Animation buttonAnimation;

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
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

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SignInModel>(
        stream: bloc.signInStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (context) => VerificationCode(
                      numberController.text, snapshot.data.created)));
            });
          }

          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AlmasaoodColors.primaryColor,
                    ),
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        Container(
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
                                  Image.asset(
                                    "assets/images/needle.png",
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 130.0),
                                    child: Image.asset(
                                      "assets/images/string1.png",
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
//                                    width:
//                                        MediaQuery.of(context).size.width / 2,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/string2.png",
                                    height:
                                        MediaQuery.of(context).size.width / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/needles.png",
//                                    width:
//                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                  ),
                                  Stack(children: <Widget>[
                                    Image.asset(
                                      "assets/images/sce_white.png",
                                      height:
                                          MediaQuery.of(context).size.width / 4,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                    ),
                                    Image.asset(
                                      "assets/images/sce_white_2.png",
                                      height:
                                          MediaQuery.of(context).size.width / 4,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                    )
                                  ])
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
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
                                      child: AuthTextField(
                                        textEditingController: numberController,
                                        hint: "Mobile Number",
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
                                child: MainButton(
                                  textColor: AlmasaoodColors.black,
                                  dashColor: AlmasaoodColors.primaryColor,
                                  onPressed: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => SignUp()),
//                        );

//                        bloc.getProductList(FilterType.ALL);
                                    bloc.f_SignIn(numberController.text);
                                  },
                                  text: "Submit",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
