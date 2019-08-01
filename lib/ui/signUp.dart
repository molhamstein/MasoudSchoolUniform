import 'package:almasaood_app/Widgets/AuthTextField.dart';
import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/ProfileModel.dart';
import 'package:almasaood_app/models/VerifyModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../AlmasaoodColors.dart';
import '../DataStore.dart';
import '../UserFeedBack.dart';
import 'CheckNumber.dart';
import 'Home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>
    with SingleTickerProviderStateMixin, UserFeedback {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController eMailController = new TextEditingController();

  AnimationController animationController;
  Animation logoAnimation;
  Animation logoAnimationFade;

  Animation areYouNewAnimation;
  Animation firstNameAnimation;
  Animation lastNameAnimation;
  Animation eMailAnimation;

  Animation buttonAnimation;

  double fade = 0.85;

  double relativeDuration = 0.40;

  @override
  void initState() {
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    logoAnimation = Tween(begin: -1.30, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.30, relativeDuration + 0.30,
            curve: ElasticOutCurve(fade))));
    logoAnimationFade = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.5, 1.0)));

    areYouNewAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.35, relativeDuration + 0.35,
            curve: ElasticOutCurve(fade))));

    firstNameAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.40, relativeDuration + 0.40,
            curve: ElasticOutCurve(fade))));

    lastNameAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, relativeDuration + 0.45,
            curve: ElasticOutCurve(fade))));

    buttonAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.50, relativeDuration + 0.50,
            curve: ElasticOutCurve(fade))));
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
            body: StreamBuilder<ProfileModel>(
                stream: bloc.signUpStream,
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
                    dataStore.setUser(VerifyModel(
                        token: dataStore.user.token,
                        user: User(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text)));
                    animationController.reverse().then((e) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => Home()));
                      });
                    });
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
                            Stack(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/images/ic_needleGray.png",
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Stack(children: <Widget>[
                                              Image.asset(
                                                "assets/images/sce_gary.png",
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                              ),
                                              Image.asset(
                                                "assets/images/sce_gray2.png",
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
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
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          0.0),
                                      child: FadeTransition(
                                        opacity: logoAnimationFade,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 110),
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
                                          areYouNewAnimation.value *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          0.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32.0, left: 16, right: 16),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .trans('are_you_new_here'),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: AlmasaoodColors.textDark),
                                        ),
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.translationValues(
                                          0.0,
                                          firstNameAnimation.value *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          0.0),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 50.0, left: 16, right: 16),
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
                                              child: AuthTextField(image: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(Icons.person,size: 35,),
                                              ) ,
                                                type: TextInputType.text,
                                                textEditingController:
                                                    firstNameController,
                                                hint:
                                                    AppLocalizations.of(context)
                                                        .trans('first_name'),
                                              ))),
                                    ),
                                    Transform(
                                      transform: Matrix4.translationValues(
                                          0.0,
                                          lastNameAnimation.value *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          0.0),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0, left: 16, right: 16),
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
                                              child: AuthTextField(image: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(Icons.person,size: 35,),
                                              ),
                                                type: TextInputType.text,
                                                textEditingController:
                                                    lastNameController,
                                                hint:
                                                    AppLocalizations.of(context)
                                                        .trans('last_name'),
                                              ))),
                                    ),
                                    Transform(
                                      transform: Matrix4.translationValues(
                                          0.0,
                                          buttonAnimation.value *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          0.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 64.0, bottom: 32),
                                        child: MainButton(
                                          color: AlmasaoodColors.primaryColor,
                                          textColor: AlmasaoodColors.white,
                                          onPressed: () {
                                            if (firstNameController
                                                .text.isEmpty) {
                                              showInSnackBar(
                                                  AppLocalizations.of(context)
                                                      .trans(
                                                          'first_name_is_required'),
                                                  context);
                                            } else
                                              bloc.f_signUp(
                                                  firstNameController.text,
                                                  lastNameController.text);
                                          },
                                          text: AppLocalizations.of(context)
                                              .trans('Submit'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40.0, left: 16, right: 16),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CheckNumber()));

                                    print("tappede");
                                  },
                                  child: Icon(Icons.arrow_back)),
                            ),
                          ],
                        ),
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
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CheckNumber()));
  }
}
