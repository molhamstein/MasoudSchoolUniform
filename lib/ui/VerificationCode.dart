import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/models/VerifyModel.dart';
import 'package:almasaood_app/ui/signUp.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'Home.dart';

class VerificationCode extends StatefulWidget {
  bool created;
  String num;

  VerificationCode(this.num, this.created);

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode>
    with SingleTickerProviderStateMixin {
  TextEditingController verificationCodeController =
      new TextEditingController();

  AnimationController animationController;
  Animation logoAnimation;
  Animation logoAnimationFade;

  Animation didnotReciveAnimation;
  Animation resebdAnimation;
  Animation textFieldAnimation;

  Animation buttonAnimation;

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 6));
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
        curve: Interval(0.60, 1.0, curve: ElasticOutCurve(0.8))));
    didnotReciveAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: ElasticOutCurve(0.8))));
    resebdAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: ElasticOutCurve(0.8))));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<VerifyModel>(
        stream: bloc.verifyStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            if (widget.created == true) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder: (context) => Home()));
              });
            } else if (widget.created == false) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder: (context) => SignUp()));
              });
            }
          }
          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Scaffold(
                body: Container(
                  color: AlmasaoodColors.pink,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AlmasaoodColors.pink,

                      ),
                      child: Stack(
                        children: <Widget>[

                          Container(height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,
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

                                  ],
                                ),

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[

                                    Stack(children: <Widget>[
                                      Image.asset(
                                        "assets/images/sce_gary.png",
                                        height:
                                        MediaQuery.of(context).size.width / 4,
                                        width:
                                        MediaQuery.of(context).size.width / 4,
                                      ),
                                      Image.asset(
                                        "assets/images/sce_gray2.png",
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
                                child: FadeTransition(opacity: logoAnimationFade,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 100),
                                    child: Image.asset(
                                      "assets/images/logo.png",
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
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(50)),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 25.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: AuthTextField(
                                          textEditingController:
                                              verificationCodeController,
                                          hint: "Verification Code",
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
                                    color: AlmasaoodColors.primaryColor,
                                    textColor: AlmasaoodColors.white,
                                    onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => Home()),
//                          );
                                      bloc.f_Verify(widget.num,
                                          verificationCodeController.text);
                                    },
                                    text: "Submit",
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    0.0,
                                    didnotReciveAnimation.value *
                                        MediaQuery.of(context).size.height,
                                    0.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 75.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 32,
                                    child: Text(
                                      "Didn't Recive the SMS ?",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AlmasaoodColors.textDark),
                                    ),
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    0.0,
                                    resebdAnimation.value *
                                        MediaQuery.of(context).size.height,
                                    0.0),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16.0, bottom: 32),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 32,
                                    child: Text(
                                      "Resend Code",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AlmasaoodColors.text),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
