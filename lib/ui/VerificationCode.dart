import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/SignModel.dart';
import 'package:almasaood_app/models/VerifyModel.dart';
import 'package:almasaood_app/ui/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../AlmasaoodColors.dart';
import '../DataStore.dart';
import '../UserFeedBack.dart';
import 'Home.dart';

class VerificationCode extends StatefulWidget {
  bool created;
  String num;

  VerificationCode(this.num, this.created);

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode>
    with TickerProviderStateMixin, UserFeedback {
  TextEditingController verificationCodeController =
      new TextEditingController();

  AnimationController animationController;
  AnimationController hidingResendController;
  Animation logoAnimation;
  Animation logoAnimationFade;

  Animation didnotReciveAnimation;

  Animation _hideResendCodeAnimation;
  Animation resebdAnimation;
  Animation textFieldAnimation;

  Animation buttonAnimation;

  double fade = 0.85;

  double relativeDuration = 0.40;

  _hideResendCode() {

    bloc.f_SignIn(mobileNumber: widget.num  ,fromVerification: true);
//// if(hidingResendController.status ==AnimationStatus.completed){
//////   hidingResendController.repeat();
////
//// }else
//    _hideResendCodeAnimation = Tween(begin: 0.0, end: 1.0).animate(
//        CurvedAnimation(
//            parent: hidingResendController, curve: Interval(0.9, 1.0)));
//
//    if (hidingResendController.status == AnimationStatus.completed) {
//      hidingResendController.reverse();
//    } else if (hidingResendController.status == AnimationStatus.dismissed) {
//      hidingResendController.forward();
//    }
  }

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));

    hidingResendController =
        new AnimationController(vsync: this, duration: Duration(seconds: 5));
    _hideResendCodeAnimation = Tween(begin: 1.0, end: 1.0).animate(
        CurvedAnimation(
            parent: hidingResendController, curve: Interval(0.9, 1.0)));

    logoAnimation = Tween(begin: -1.30, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.30, 1.0, curve: ElasticOutCurve(fade))));
    logoAnimationFade = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.5, 1.0)));
    textFieldAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.35, relativeDuration + 0.35,
            curve: ElasticOutCurve(fade))));
    buttonAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.40, relativeDuration + 0.40,
            curve: ElasticOutCurve(fade))));
    didnotReciveAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, relativeDuration + 0.45,
            curve: ElasticOutCurve(fade))));
    resebdAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.50, relativeDuration + 0.50,
            curve: ElasticOutCurve(fade))));
    animationController.forward();
    hidingResendController.forward();
  }

  @override
  Widget build(BuildContext context) {
    print(hidingResendController.status);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          body: StreamBuilder<VerifyModel>(
              stream: bloc.verifyStream,
              builder: (context, snapshot) {
                if (snapshot.hasError && bloc.showFeedback == true) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showInSnackBar(
                        AppLocalizations.of(context)
                            .trans('something_went_wrong'),
                        context);
                    bloc.showFeedback = false;
                  });
                } else if (snapshot.hasData && snapshot.data != null) {
                  if (widget.created == true) {
                    dataStore.setUser(snapshot.data);

                    animationController.reverse().then((e) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => Home()));
                      });
                    });
                  } else if (widget.created == false) {
                    dataStore.setUser(snapshot.data);

                    animationController.reverse().then((e) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => SignUp()));
                      });
                    });
                  }
                }
                return Container(
                  color: AlmasaoodColors.pink,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AlmasaoodColors.pink,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Localizations(
                            delegates: [
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                            ],
                            locale: Locale('en', ''),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/ic_needleGray.png",
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width / 2,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Stack(children: <Widget>[
                                        Image.asset(
                                          "assets/images/sce_gary.png",
                                          height:
                                              MediaQuery.of(context).size.width /
                                                  4,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  4,
                                        ),
                                        Image.asset(
                                          "assets/images/sce_gray2.png",
                                          height:
                                              MediaQuery.of(context).size.width /
                                                  4,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  4,
                                        )
                                      ])
                                    ],
                                  ),
                                ],
                              ),
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
                                        child: Localizations(
                                          delegates: [
                                            GlobalMaterialLocalizations.delegate,
                                            GlobalWidgetsLocalizations.delegate,
                                          ],
                                          locale: Locale('en', ''),
                                          child: AuthTextField(image: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.verified_user,size: 35,),
                                          ),
                                            textEditingController:
                                                verificationCodeController,
                                            hint: AppLocalizations.of(context)
                                                .trans('verification_code'),
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
                                  child: MainButton(
                                    color: AlmasaoodColors.primaryColor,
                                    textColor: AlmasaoodColors.white,
                                    onPressed: () {
                                      if (verificationCodeController
                                          .text.isEmpty) {


                                        showInSnackBar(
                                            AppLocalizations.of(context).trans(
                                                'please_enter_valid_code'),
                                            context);
                                      } else {
                                        bloc.f_Verify(widget.num,
                                            verificationCodeController.text);
                                      }
                                    },
                                    text: AppLocalizations.of(context)
                                        .trans('Submit'),
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
                                    width:
                                        MediaQuery.of(context).size.width - 32,
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .trans('did_not_receive_the_sms'),
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
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 32),
                                  child: StreamBuilder<SignInModel>(
                                    stream: bloc.signInStream,
                                    builder: (context, snapshot) {
                                      if(snapshot.hasData && bloc.showFeedback){

                                        WidgetsBinding.instance.addPostFrameCallback((_) {
                                          showInSnackBar(
                                              AppLocalizations.of(context)
                                                  .trans('sent_successfully'),
                                              context,color: AlmasaoodColors.primaryColor);
                                        });


                                        bloc.showFeedback = false ;
                                      }

                                      return InkWell(
                                        onTap: () {
                                          _hideResendCode();
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width -
                                              32,
                                          child: FadeTransition(
                                            opacity: _hideResendCodeAnimation,
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .trans('resend_code'),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: AlmasaoodColors.text),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
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
              }),
        );
      },
    );
  }
}
